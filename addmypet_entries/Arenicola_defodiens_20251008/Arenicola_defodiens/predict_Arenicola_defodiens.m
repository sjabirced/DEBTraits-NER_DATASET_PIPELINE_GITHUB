function [prdData, info] = predict_Arenicola_defodiens(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % customized filters 
  if T_H < 0 || T_AH < 0 || E_Hh >= E_Hb || E_Hh < 0; info = 0; prdData = []; return; end
          
  % compute temperature correction factors
  pars_T = [T_A; T_H; T_AH];
  TC_10 = tempcorr(C2K(10), T_ref, pars_T);
  TC_11 = tempcorr(C2K(11), T_ref, pars_T);
  TC_12 = tempcorr(C2K(12), T_ref, pars_T);
  TC_13 = tempcorr(C2K(13), T_ref, pars_T);
  TC_16 = tempcorr(C2K(16), T_ref, pars_T);
  TC_20 = tempcorr(C2K(20), T_ref, pars_T);
  TC_24 = tempcorr(C2K(24), T_ref, pars_T);
    
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j , t_p, t_b, l_j , l_p, l_b, l_i, rho_j , rho_b , info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
 
  % initial scaled reserve
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = U_E0 * p_Am * w_E/ mu_E; % g, egg dry weight
  EWw_0 = Wd_0/ d_E;  % g, egg wet weight

  % egg diameter
  ELw_0 = (6 *  EWw_0/ pi)^(1/3);  % cm, egg diameter
  
  % hatching   
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); 
  EaT_h = a_h/ TC_13; 
  ELw_h = aUL(2,3)/ del_Me; % physical length at hatch

  % puberty 
  TL_p = L_m * l_p;                  % cm, structural length at puberty at f
  ELw_p = TL_p/ del_MTL;                % cm, trunc length at puberty at f
 
  % metamorphosis
  %ELw_j = L_j/ del_MTL;    % cm, physical length at metam at f
  EaT_j = t_j/ k_M/ TC_12;   % d, time since birth at metam

  % ultimate
  L_i = L_m * l_i;  % cm, ultimate structural length at f
  ELw_i = L_i/ del_MTL;  % cm, trunc physical length at f
  EWw_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
 
  % reproduction
  % pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
%   [R_i, ~, ~, ~, ~, info]  =  reprod_rate_j(L_i, f, pars_R);
%   RT_i = TC_13 * R_i;% #/d, max reprod rate
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  EaT_m = t_m/ k_M/ TC_11;              % d, mean life span at T
  
 
  % pack to output
 
  prdData.ah = EaT_h; 
  prdData.aj = EaT_j;
  prdData.am = EaT_m;
  prdData.L0 = ELw_0;
  prdData.Lh = ELw_h;
  prdData.Lp = ELw_p;
  prdData.Li = ELw_i;
  prdData.Ww0 = EWw_0;
  prdData.Wwi = EWw_i;
  
% univaried data
 
% trunk length-weight
EWw  = (LW(:,1) * del_MTL).^3 * (1 + f_field * w); % g, wet weight

% length-reproduction
pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
ER  = reprod_rate_j(LR(:,1) * del_MTL, f, pars_R) * TC_13; 
     
% weight-oxygen consumption 
 pars_tj = [g k l_T v_Hb v_Hj v_Hp];
 pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
 p_ref = p_Am * L_m^2; % max assimilation power at max size
 O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
 [~, ~, ~, l_j, l_p, l_b, ~, ~, ~, info] = get_tj(pars_tj, f_field);
 %
 L = (data.WJO_10(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJO_10 = -JM(:,3) .* TC_10 * 1e6 / 24; % conversion to mumol 02 
 % 
 L = (data.WJO_13(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJO_13 = -JM(:,3) .* TC_13 * 1e6 / 24; % conversion to mumol 02 ? 
 % 
 L = (data.WJO_16(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJO_16 = -JM(:,3) .* TC_16 * 1e6 / 24; % conversion to mumol 02 ? 
 %
 L = (data.WJO_20(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJO_20 = -JM(:,3) .* TC_20 * 1e6 / 24; % conversion to mumol 02 ? 
 % 
 L = (data.WJO_24(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJO_24 = -JM(:,3) .* TC_24 * 1e6 / 24; % conversion to mumol 02 ? 

% pack to output
prdData.WJO_10 = EJO_10;
prdData.WJO_13 = EJO_13;
prdData.WJO_16 = EJO_16;
prdData.WJO_20 = EJO_20;
prdData.WJO_24 = EJO_24;
prdData.LR = ER; 
prdData.LW = EWw;

