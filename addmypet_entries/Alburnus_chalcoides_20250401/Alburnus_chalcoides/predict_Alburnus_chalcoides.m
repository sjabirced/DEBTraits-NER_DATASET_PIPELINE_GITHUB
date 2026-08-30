function [prdData, info] = predict_Alburnus_chalcoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M   ;              % d, age at birth 
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, TL at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at pubert
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, ultimate standard length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

%   % males
%   p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
%   E_m_m = p_Amm/ v;                    % J/cm^3, [E_m] reserve capacity for males
%   g_m = E_G/ kap/ E_m_m;               % -, energy investment ratio for males
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
%   pars_tjm = [g k l_T v_Hb v_Hj v_Hp];
%   [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
%   tT_pm = (t_pm - t_bm)/ kT_M;       % d, time since birth at puberty
%   L_pm = L_m * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
%   Ww_pm = L_pm^3 * (1 + f * w);      % g, wet weight at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  % univariate data

  % time-length post metam
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw = L/ del_M;
  %EWw = L.^3 .* (1 + ome*tvel(:,3));

  % length-weight
  EWw_L = (LW(:,1)*del_M).^3 * (1 + f_tL * ome);
  
  prdData.tL = ELw;
  prdData.LW = EWw_L;
  end