function [prdData, info] = predict_Albula_glossodonta(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % birth
  pars_lb = [g; k; v_Hb];        % compose parameter vector
  [t_b, l_b, info] = get_tb(pars_lb, f); % -, scaled age and length at birth at f
  L_b = L_m * l_b;     % cm, structural length at birth at f
  Lw_b = L_b/ del_M;   % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth at f 
  aT_b = t_b/ kT_M; % d, age at birth at f and T
  
  % S1/S2 transition
  pars_ts = [g; k; l_T; v_Hb; v_Hs];    % compose parameter vector
  [t_s t_b l_s l_b info] = get_tp(pars_ts, f, l_b); % -, scaled length at birth at f
  L_s = L_m * l_s;              % cm, structural length at S1/S2 transition
  Lw_s = L_s/ del_M;            % cm, physical length at S1/S2 transition
  aT_s = t_s/ kT_M;             % d, age at S1/S2 transition
  
  % S2/S3 transition to no-feeding
  [t eLH] = ode45 (@dget_eLH, [0; t_sj], [1; L_s; E_Hs], [], kap, TC * v, g, L_m, TC * k_J, E_m);
  L_j = eLH(end,2); Lw_j = L_j/ del_M; l_j = L_j/ L_m; 
  E_Hj = eLH(end,3);
  U_Hj = E_Hj/ p_Am;               % cm^2 d, scaled maturity at S3/juv transition
  u_Hj = U_Hj * g^2 * k_M^3/ v^2;  % -, scaled maturity at S3/juv transition
  V_Hj = U_Hj/ (1 - kap);          % cm^2 d, scaled maturity at S3/juv transition
  v_Hj = V_Hj * g^2 * k_M^3/ v^2;  % -, scaled maturity at S3/juv transition
  aT_j = aT_s + t_sj;              % d, age at end of stage 3
 
  % puberty 
  pars_tp = [g; k; l_T; v_Hj; v_Hp]; % compose parameter vector
  [t_p t_j l_p l_j info] = get_tp(pars_tp, f, l_j); % -, scaled length at birth at f
  L_p = L_m * l_p;              % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;            % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);   % g, wet weight at puberty 
  aT_p = aT_j + (t_p - t_j)/ kT_M; % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                % -, scaled ultimate length at f
  L_i = L_m * l_i;              % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;            % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);   % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];     % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);         % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                        % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struc length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  %% pack to output
  prdData.am = aT_m;
  prdData.Ls = Lw_s;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length
  pars_tp = [g; k; l_T; v_Hb; v_Hp];    % compose parameter vector
  tvel = get_tp(pars_tp, f_tL, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/del_M;
  %
  tvel = get_tp(pars_tjm, f_tL, [], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/del_M;

   
  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];

end

%% subfunction
function deLH = dget_eLH(t, eLH, kap, v, g, Lm, kJ, Em)
  % growth while f = 0
  % unpack state vars
  e = eLH(1);   % -, scaled reserve density
  L = eLH(2);   % cm, structural length
  EH = eLH(3); % J, maturity
  
  de = - e * v/ L;

  r = v * (e/ L - 1/ Lm)/ (e + g);
  dL = L * r/ 3;

  pC = - (de + e * r) * Em * L^3;
  dH = (1 - kap) * pC - kJ * EH;

  % pack derivatives
  deLH = [de; dL; dH];

end