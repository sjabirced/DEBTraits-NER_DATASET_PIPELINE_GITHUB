function [prdData, info] = predict_Pinna_nobilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%   % customized filters for allowable parameters of the standard DEB model (std)
%   % for other models consult the appropriate filter function.
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %f_tL
  if info ~= 1 % numerical procedure failed
      fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  s_M = l_j / l_b;
  
  filterChecks = k * v_Hp >= f_tL1^3 * s_M^3 || ...         % constraint required for reaching puberty with f_tL1
                 ~reach_birth(g, k, v_Hb, f_tL1) || ...  % constraint required for reaching birth with f_tL1
                 k * v_Hp >= f_tL2^3 * s_M^3 || ...         % constraint required for reaching puberty with f_tL2
                 ~reach_birth(g, k, v_Hb, f_tL2)|| ...  % constraint required for reaching birth with f_tL2
                del_M1 > 1 || f_tLT > 1; %filter for constraining shape coeficients under 1      
  filterChecks = filterChecks || T_H < T_ref || T_L > T_ref; % constraint T_H to be larger than T_ref and T_L below T_ref

  if filterChecks
    info = 0;
    prdData = {};
    return;
  end  

  % compute temperature correction factors
     %Correction factors including upper and lower tolerance limit
  parsT = [T_A, T_L, T_H, T_AL, T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, parsT);
  TC_am = tempcorr(temp.am, T_ref, parsT);
  TC_aj = tempcorr(temp.aj, T_ref, parsT);
  TC_tp = tempcorr(temp.tp, T_ref, parsT);
  TC_GSI = tempcorr(temp.GSI, T_ref, parsT);  

  TC_tL1 = tempcorr(temp.tL1, T_ref, parsT);
  TC_tL2 = tempcorr(temp.tL2, T_ref, parsT);
  tTC1 = [temp.tL1_T(:,1), tempcorr(C2K(temp.tL1_T(:,2)), T_ref, parsT)]; % vector of T in time for Pinna1
  tTC2 = [temp.tL2_T(:,1), tempcorr(C2K(temp.tL2_T(:,2)), T_ref, parsT)]; % vector of T in time for Pinna2
  TC_TdL1 = tempcorr(C2K(data.TdL1(:,1)), T_ref, parsT);
  TC_TdL2 = tempcorr(C2K(data.TdL2(:,1)), T_ref, parsT);
  
  TC_LdL = tempcorr(temp.LdL, T_ref, parsT);
  TC_LN = tempcorr(temp.LN, T_ref, parsT);
  
  tTC_A_small = [temp.tL_A_small(:,1), tempcorr(temp.tL_A_small(:,2), T_ref, parsT)]; % vector of T in time for Acarli et al small group
  tTC_A_large = [temp.tL_A_large(:,1), tempcorr(temp.tL_A_large(:,2), T_ref, parsT)]; % vector of T in time for Acarli et al large group
  
  TC_H = tempcorr( C2K(data.TCR_H(:,1)), T_ref, parsT); %this TC is the same for both clearance rates and O2 consumption

  %% zero-variate data
 
%   F = f_w; %set for wild populations, 0.8
   F = f;
  % life cycle
   pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F); %zamijenjen t_b sa tau_b
   if info ~= 1 % numerical procedure failed
        fprintf('warning: invalid parameter value combination for get_tj \n')
   end
 
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(F, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap and v constant
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f_w
  Lw_b = L_b/ del_M1;                % cm, physical length at birth at f_w
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f_w and T %t_b =tau_b

  % metamorphosis
  L_j = L_m * l_j;      % cm, structural length at metam
  Lw_j = L_j/ del_M2;    % cm, physical length at metam at f_w
  aT_j = tau_j / k_M/ TC_aj;   % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f_w
  Lw_p = L_p/ del_M2;                % cm, physical length at puberty at f_w
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f_w and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f_w
  Lw_i_w = L_i/ del_M2;                % cm, ultimate physical length at f_w
 
  % reproduction
  GSI = 365 * TC_GSI * k_M * g/ F^3/ (F + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * F^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); %equation taken from Litophaga_litophaga* *curated by Bas

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, F, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.tp = tT_p;
  prdData.aj = aT_j;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i_w;
  prdData.Lp = Lw_p;
  prdData.Lj  = Lw_j;
  prdData.GSI = GSI;
  prdData.E0 = E_0;
 
  %% uni-variate data
  
  % time-length (adults), t-L, at diferent f
  F = f_tL1; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  kT_M= TC_tL1 * k_M;
  rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate   
  rT_j = rho_j * kT_M;  % 1/d, exponential growth rate
  aT_b = tau_b/ kT_M; aT_j = tau_j/ kT_M;   
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL1(tL1(:,1) < t_j,1); % select times between birth & metamorphosis   
  Lw_b = L0.tL1; %deleted Lw_b = L_m * l_b / del_Mb; 
  Lw_j = l_j * L_m/ del_M2; 
  Lw_i = l_i * L_m/ del_M2;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL1(tL1(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw1 = [EL_bj; EL_ji]; % catenate lengths
  
  F = f_tL2; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  kT_M= TC_tL2 * k_M;
  rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M;  % 1/d, exponential growth rate
  aT_b = tau_b/ kT_M; aT_j = tau_j/ kT_M;   % /kT_M = /k_M/TC
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL2(tL2(:,1) < t_j,1); % select times between birth & metamorphosis   
  Lw_b = L0.tL2; %deleted Lw_b = L_m * l_b / del_Mb; 
  Lw_j = l_j * L_m/ del_M2;
  Lw_i = l_i * L_m/ del_M2;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL2(tL2(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw2 = [EL_bj; EL_ji]; % catenate lengths

  %%%%  novo %%%%%%
  % time-length (post metam), at diferent T
  F = f_tLT;
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj,F);
  r_j = rho_j * k_M; r_B = rho_B * k_M; Lw_i = L_m * l_i/del_M2; % 1/d, exponential, von Bert growth rate
  [t L] = ode45(@dget_L, tL1_T(:,1), L0.tL1_T, [], tTC1, r_B, Lw_i); % <-- promijeni f! 
  ELw1_T = L; % cm, shell length
  
  [t L] = ode45(@dget_L, tL2_T(:,1), L0.tL2_T, [], tTC2, r_B, Lw_i); % <-- promijeni f! 
  ELw2_T = L; % cm, shell length
  
  % Temperature vs. growth rate, T-dL
  F = f_tLT; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  rT_B = TC_TdL1 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;  % del_M2 because adult
  ETdL1 = rT_B * (Lw_i - L0.TdL1); % smaller Pinna at Villaricos
 
  rT_B = TC_TdL2 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;  % del_M2 because adult
  ETdL2 = rT_B * (Lw_i - L0.TdL2); % larger Pinna at Villaricos

  % Length vs. growth rate, L-dL
  F = f_LdL; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  rT_B = TC_LdL * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;
  ELdL = rT_B * (Lw_i - LdL(:,1));   

  % Length- #oocytes       % code taken from Placopecten_magellanicus
%   F = f_w;
  F = f;
  pars_R = [kap, kap_R, g, TC_LN * k_J, TC_LN * k_M, L_T, TC_LN * v, U_Hb/ TC_LN, U_Hj/ TC_LN, U_Hp/ TC_LN];
  EN = 365*reprod_rate_j(data.LN(:,1) * del_M2, F, pars_R); % #, number of oocytes per year

 %% mod_1    
  % time - total weight - length (data from Izmir)
  pars_EL = [v, p_M ,kap ,E_G, s_M, p_Am];
        
  % Large group
  L0_large = L0_A_large*del_M2; % get initial structural length for ODE
  LE0 = [L0_large, E_m*L0_large^3]; %initial conditions vector
  [t LE] = ode45(@dget_LE_const_food, tL_A_large(:,1), LE0, [], pars_EL, tTC_A_large, f_A);  %solve ode
  ELw_A_large = LE(:,1)/del_M2;  % cm, physical length 
  EWw_A_large = lambda * (LE(:,1).^3 + LE(:,2) * (w_E/mu_E/d_E)); % g, wet weight
        
  % Small group
  L0_small = L0_A_small*del_M2; %initial structural length  
  LE0 = [L0_small, E_m*L0_small^3]; %initial condition vector for ODE.
  [t LE] = ode45(@dget_LE_const_food, tL_A_small(:,1)  , LE0, [], pars_EL, tTC_A_small, f_A); % food for large and small groups is the same for all Acarli data.   
  ELw_A_small = LE(:,1)/del_M2;  % cm, physical length
  EWw_A_small = lambda*(LE(:,1).^3 + LE(:,2) * (w_E/mu_E/d_E)); % g, wet weight

  % Hernandis et al. 2023 physiological rates
  L = L0.TCR_H * del_M2; % cm, average structural length
  p_ref = p_Am * L_m^2;      % J/d, max assimilation power at max size
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; %parameter vector at Tref?
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, ~, info] = get_tj(pars_tj, f_H); 
    if info ~= 1 % numerical procedure failed
        fprintf('warning: invalid parameter value combination for get_tj \n')
    end
   pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % parameter vector for scaled_power_j function
   pACSJGRD = p_ref * scaled_power_j(L, f_H, pars_R, l_b, l_j, l_p);  % J/d, powers 
   J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows 
   % VO2 data predictions
   EJO_H = -TC_H *J_M(3) * 32e3; % mg O2/d,  convert O2 rate from mol/d to mg O2 / d and multiply with appropriate TC factor.
   % clearance rates 
   ECR_H = TC_H * F_m * s_M * (1-f_H) * L^2; % L/d, clearance rate

  % pack to output
  prdData.tL1 = ELw1;
  prdData.tL2 = ELw2;
  prdData.tL1_T = ELw1_T;
  prdData.tL2_T = ELw2_T;
  prdData.TdL1 = ETdL1;
  prdData.TdL2 = ETdL2;
  prdData.LdL = ELdL;
  prdData.LN  = EN;
% mod_1
  prdData.tL_A_large = ELw_A_large;
  prdData.tWw_A_large = EWw_A_large;
  prdData.tL_A_small = ELw_A_small;
  prdData.tWw_A_small = EWw_A_small;
  prdData.TJO_H = EJO_H;
  prdData.TCR_H = ECR_H;

end

% subfunction taken from Mastigias_papua , version 2018/01/06
function dLP = dget_L(t, L, tTC, r_B, Lw_i)
%   s_M = min(L, L_j)/ L_b; % -, acceleration factor
%   r = v * s_M * (f/ L - 1/ L_i)/ (f + g); % 1/d, spec growth rate
%   p_C = L^3 * E_m * f * (s_M * v/ L - r); % J/d, mobilisation rate
%   dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity at T_ref
%   if E_H < E_Hj
%     dL = L * r_j/3; % cm/d, change in length before metam at T_ref
%   else
%     dL = r_B * (L_i - L); % cm/d, change in length after metam at T_ref
%   end
%   dLH = spline1(t, tTC) * [dL; dE_H]; % cm/d, J/d: changes at T
  
  dL = r_B * (Lw_i - L); % cm/d, change in length after metam at T_ref
  dLP = spline1(t, tTC) * dL; % cm/d: changes at T
  
end

function dLE = dget_LE_const_food(t, LE, p, tTC,f)
  % change in state variables during juvenile/adult stage
  % unpack state variables
  L = LE(1); % structural length
  E = LE(2); % reserve energy

  v = p(1);  p_M = p(2); kap = p(3); E_G = p(4); s_M = p(5); p_Am = p(6);

  TC = spline1(t, tTC);
  f = ones(size(TC))*f; %create an array of constant f values of appropriate size.
  % correct for temperature
  vT = s_M * v * TC;  pT_M = p_M * TC; pT_Am = s_M * p_Am * TC;

  V = L^3;  % cm^3, structural volume
  r = (E * vT / L - pT_M * V/kap)/(E + E_G * V/kap);   % 1/d, specific growth rate
  p_C = E * (E_G * vT / L  + pT_M)/ (kap*E/V + E_G);% J/d, mobilisation rate

  % generate derivatives
  dL = r * L/ 3; % cm/d, change in length
  dE = f * pT_Am * L^2 - p_C;  % J/d, change in reserve
    
  dLE = [dL; dE];
end