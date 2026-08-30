function [prdData, info] = predict_Homarus_gammarus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  T_pars = [T_A, T_L, T_H, T_AL, T_AH ];
  TC_ab = tempcorr(temp.ab, T_ref, T_pars);
  TC_15 = tempcorr(temp.tj_15, T_ref, T_pars);
  TC = tempcorr(temp.tp, T_ref, T_pars);
  TC_tL = tempcorr(temp.tL, T_ref, T_pars);
  TC_WwJO = tempcorr(temp.WwJO, T_ref, T_pars);
  TC_WwJN = tempcorr(temp.WwJN, T_ref, T_pars);

  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];   % for females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  par_M = par; % parameter for males
  par_M.z = z_male; % z for males
  cPar_M = parscomp_st(par_M); % cPar for males
  pars_tjM = [cPar_M.g cPar_M.k cPar_M.l_T cPar_M.v_Hb cPar_M.v_Hj cPar_M.v_Hp];  % for males
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am;                % J, initial energy content

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_0 +t_b/ k_M/ TC_ab;      % d, age at birth

  % metam
  tT_j15 = (t_j - t_b)/ k_M/ TC_15; % d, time since birth at metam
  tT_j20 = (t_j - t_b)/ k_M;        % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  rT_B = rho_B * k_M;               % 1/d, von Bert growth rate 
  L_2 = L_i - (L_i - L_b) * exp(- rT_B * 2 * 365); % cm, struct length at 2 yr
  Lw_2 = L_2/ del_M;                % cm, carapace length at 2 yr
  Ww_2 = L_2^3 * (1 + f * w);       % g, wet weight at 2 yr
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj_15 = tT_j15;
  prdData.tj_20 = tT_j20;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L2 = Lw_2;
  prdData.Wdb = Wd_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ww2 = Ww_2;
  prdData.E0 = E_0;
  prdData.Ri = RT_i;
    

  % Uni-variate
  % time-length Aqua
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_aq);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; 
  ELw = L./ del_M;                                % cm, length

  % time-length Wild F
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_wild);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tLF((tLF(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tLF((tLF(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; 
  ELwF = L./ del_M;                                % cm, length

    % time-length Wild M  
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjM, f_wild);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = cPar_M.L_m * l_b;  L_j = cPar_M.L_m * l_j; L_i = cPar_M.L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tLM((tLM(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tLM((tLM(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; 
  ELwM = L./ del_M;                                % cm, length

  % time-weight Wild
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_wild);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tWwF((tWwF(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWwF((tWwF(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; 
  EWwF = L.^3*(1+f*ome);                                % g, wet weight

  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjM, f_wild);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = cPar_M.L_m * l_b;  L_j = cPar_M.L_m * l_j; L_i = cPar_M.L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tWwM((tWwM(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWwM((tWwM(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; 
  EWwM = L.^3*(1+f*ome);                                % g, wet weight


  % length-wet weight
  EWw_L = (LWw(:,1)*del_M).^3*(1+f*ome); % wet weight

  % length-respiration
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_WwJO * p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WwJO(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = - J_M(3,:)' ./(WwJO/1000);                                % mol/d, O2 consumption 

  % length-Nexcretion
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_WwJN * p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WwJN(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_N = J_M(4,:)'./(WwJN/1000);                                % mol/d, N production 

  % length-eggs
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = 365 * TC_tL * reprod_rate(LN(:,1) * del_M, f, pars_R); % #/d, reprod rate

  prdData.tL = ELw;
  prdData.tLF = ELwF;
  prdData.tLM = ELwM;
  prdData.tWwF = EWwF;
  prdData.tWwM = EWwM;
  prdData.LWw = EWw_L;
  prdData.WwJO = EJT_O;
  prdData.WwJN = EJT_N;
  prdData.LN = EN;
  