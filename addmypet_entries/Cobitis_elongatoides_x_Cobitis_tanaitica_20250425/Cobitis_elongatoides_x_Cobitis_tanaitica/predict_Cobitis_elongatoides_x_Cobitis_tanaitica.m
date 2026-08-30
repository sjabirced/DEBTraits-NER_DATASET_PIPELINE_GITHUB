function [prdData, info] = predict_Cobitis_elongatoides_x_Cobitis_tanaitica(par, data, auxData)
  
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
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth of foetus at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  Ri = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, reprod rate at max length

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, age at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty

  % triploid females
  p_Am_t = z_t * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_t = p_Am_t/ v;                   % J/cm^3, reserve capacity [E_m]
  g_t = E_G/ (kap* E_m_t);             % -, energy investment ratio
  m_Em_t = y_E_V * E_m_t/ E_G;         % mol/mol, reserve capacity 
  w_t = m_Em_t * w_E/ w_V;             % -, contribution of reserve to weight
  L_mt = v/ k_M/ g_t;                  % cm, max struct length
  pars_tjt = [g_t k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = Ri;

  % time-length
  % females 2n
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % females 3n
  tvel = get_tj(pars_tjt, f_tL, [], tL(:,1)*kT_M);
  ELw_ft = L_mt * tvel(:,4)/ del_M;   % cm, length 
  % 
  tvel = get_tj(pars_tjm, f_tL, [], tL(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 
  
  
%% pack to output
  prdData.tL = [ELw_f ELw_ft ELw_m];

