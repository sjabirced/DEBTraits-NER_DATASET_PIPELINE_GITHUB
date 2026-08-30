function [prdData, info] = predict_Zacco_platypus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info == 0
      prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth
  
  % metam
  s_M = l_j/ l_b; % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length 
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  GSI = (365 * TC * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);    % -, GSI

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%   % males
%   p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
%   E_m_m = p_Amm/ v;                    % J/cm^3, [E_m] reserve capacity for males
%   g_m = E_G/ kap/ E_m_m;               % -, energy investment ratio for males
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
%   L_im = L_mm * f; Lw_im = L_im/ del_M;% cm,  ult total length
%   Ww_im = L_im^3 * (1 + f * ome_m);      % g, ult wet weight
%   pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hp];% compose parameter vector

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  % univariate data

  EWw = (LW(:,1)*del_M).^3*(1+f*ome);
  EWw_1 = (LW1(:,1)*del_M).^3*(1+f*ome);
  
  % pack to output
  prdData.LW = EWw;
  prdData.LW1 = EWw_1;