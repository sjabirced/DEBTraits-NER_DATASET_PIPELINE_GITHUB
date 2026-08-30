function [prdData, info] = predict_Pelecus_cultratus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  tT_j = (tau_j - tau_b)/ kT_M;     % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % reproduction 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-length-weight
  TC = tempcorr(C2K([30 26 22 18 14]), T_ref, T_A);
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(1));
  L = L_m * tvel(:,4); ELw_30 = L/ del_M;   % cm, length
  EWw_30 = L.^3 .* (1 + ome * tvel(:,3));
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(2));
  L = L_m * tvel(:,4); ELw_26 = L/ del_M;   % cm, length
  EWw_26 = L.^3 .* (1 + ome * tvel(:,3));
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(3));
  L = L_m * tvel(:,4); ELw_22 = L/ del_M;   % cm, length
  EWw_22 = L.^3 .* (1 + ome * tvel(:,3));
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(4));
  L = L_m * tvel(:,4); ELw_18 = L/ del_M;   % cm, length
  EWw_18 = L.^3 .* (1 + ome * tvel(:,3));
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(5));
  L = L_m * tvel(:,4); ELw_14 = L/ del_M;   % cm, length
  EWw_14 = L.^3 .* (1 + ome * tvel(:,3));
  
  % length-fecundity

  %% pack to output
  prdData.tL = [ELw_30 ELw_26 ELw_22 ELw_18 ELw_14];
  prdData.tW = [EWw_30 EWw_26 EWw_22 EWw_18 EWw_14];

