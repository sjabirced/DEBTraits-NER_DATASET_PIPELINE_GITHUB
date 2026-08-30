function [prdData, info] = predict_Ostrea_chilensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
                
  if f_Vide >1 ||  f_Chap >1 || f_Wils >1 || f_Rich1 >1 || f_Rich2 >1 || f_Wint1 > 1 || f_Wint2 > 1 || E_Hr < E_Hb
    info = 0; prdData = {}; return;
  end  

  % compute temperature correction factors
  TC_Wint = tempcorr(temp.LWd1, T_ref, T_A);
  TC_Wils = tempcorr(temp.tL2, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_Rich = tempcorr(temp.tL3, T_ref, T_A);
  TC_Vide = tempcorr(temp.tL, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info ~= 1 % numerical procedure failed
     info = 0; prdData = []; return
  end
  pars_tr = [g k l_T v_Hb v_Hr]; % v_Hr replaces v_Hp in call to get_tp
  [tau_r, ~, l_r] = get_tp(pars_tr, f); % scaled age, length at release

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = U_E0 * p_Am;                  % J, initial energy in egg
  Ww_0 = E0 * w_E/ mu_E/ d_E;        % g, initial wet weight = initial egg volume
  
  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;                % cm, physical length at birth at f

  % release and settlement
  L_r = L_m * l_r;                   % cm, structural length at release at f
  Lw_r = L_r/ del_Mb;          % cm, physical length at settlement at f
  Wd_r = (L_r^3 * (1 + f * ome)) * d_V; % g, wet weight at settlement

  % metamorphosis
  s_M = l_j / l_b;                  % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.Ww0 = Ww_0;
  prdData.Lb = Lw_b;
  prdData.Lr = Lw_r;
  prdData.Wdr = Wd_r;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Li = Lw_i;
  prdData.am = aT_m;
  
  
  %% uni-variate data

%% Winter 1984
  
 % length-dry weight
  EWd1 = (LWd1(:,1) .* del_M).^3 * (1 + f_Wint1 * ome) * d_V; % g, dry weight
  EWd2 = (LWd2(:,1) .* del_M).^3 * (1 + f_Wint2 * ome) * d_V; % g, dry weight
  
 % length-filtering rate
  ELF_f1 = (LF_f1(:,1) .* del_M).^2 * F_m * (1 - f_Wint1) * TC_Wint * s_M;   %ml/h, filtration rate           
  ELF_f2 = (LF_f2(:,1) .* del_M).^2 * F_m * (1 - f_Wint2) * TC_Wint * s_M;   %ml/h, filtration rate 
  
 % dry weight-respiration
  p_ref    = p_Am * L_m^2;                               % J/d,   max assimilation power at max size and T_ref
  L        = (WdJO(:,1)/ d_V / (1 + f_Wint2 * w)).^(1/3);
  pars_p   = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_j(L, f_Wint2, pars_p, l_b, l_j, l_p);
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  O2M      = (- n_M \ n_O)';                             % -,     matrix that converts organic to mineral fluxes. O2M is prepared for post-multiplication (eq. 4.35)
  J_M      = pADG * eta_O' * O2M;                        %        mineral fluxes
  X_gas    = 1/ 24.4;                                    % mol/L, mol of gas per litre at 20 C and 1 bar
  EWdJO    = - TC_Wint * J_M(:,3) * 1e3/ 24/ X_gas;      % mL/h,  oxygen consumption rate
  
  % dry weight-ammonium production
  L = (WdJN(:,1)/ d_V/ (1 + f_Wint2 * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_Wint2, pars_p, l_b, l_j, l_p); % J/d, powers
  pACSJGRD(:,1) = 0 * pACSJGRD(:,1); % exclude contribution from assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJN = J_M(4,:)' * TC_Wint / 24 * 14 * 1e6;             % ug NH4-N/h 
  
% Chaperro 2006 - 2008
  % length-dry weight
  EWd3 = ((LWd3(:,1) .* del_Mb).^3 * (1 + f_Chap * ome))*d_V; % g, dry weight
  
  % length-fecundity
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  EN = 365 * TC_LN * reprod_rate_j((LN(:,1)) .* del_M, f_Chap, pars_R); % #, number of offspring per year
 
% Videla 1998
  % time-length
  tvel = get_tj(pars_tj, f_Vide, [], tL(:,1)*k_M*TC_Vide);
  ELw = L_m * tvel(:,4)/ del_M;
  % ime-dry weight
  tvel = get_tj(pars_tj, f_Vide, [], tWd(:,1)*k_M*TC_Vide);
  EWd = (L_m * tvel(:,4)).^3 * d_V .* (1 + ome * tvel(:,3));
  %
 
% Wilson 1996
  % time-length
  tvel = get_tj(pars_tj, f_Wils, [], tL2(:,1)*k_M*TC_Wils);
  ELw_2 = L_m * tvel(:,4)/ del_M;
  
%Richardson 1993
  % time-length
  tvel = get_tj(pars_tj, f_Rich1, [], tL3(:,1)*k_M*TC_Rich);
  ELw_3 = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tj(pars_tj, f_Rich2, [], tL4(:,1)*k_M*TC_Rich);
  ELw_4 = L_m * tvel(:,4)/ del_M;
  
  % pack to output
  %Winter
   prdData.LWd1 = EWd1;
   prdData.LWd2 = EWd2;
   prdData.LF_f1 = ELF_f1;
   prdData.LF_f2 = ELF_f2;
   prdData.WdJO = EWdJO;
   prdData.WdJN = EWdJN;
  %Chaperro
   prdData.LWd3 = EWd3;
   prdData.LN = EN;
  %Videla
   prdData.tL = ELw;
   prdData.tWd = EWd;
  %Wilson 
   prdData.tL2 = ELw_2;
  %Richardson
   prdData.tL3 = ELw_3;
   prdData.tL4 = ELw_4;
   
end

