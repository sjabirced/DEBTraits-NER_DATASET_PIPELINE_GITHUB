function [prdData, info] = predict_Neosalanx_taihuensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3*(1 + f *w);          % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * (f - l_T);            % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J*TC; k_M*TC; L_T; v*TC; U_Hb/TC; U_Hp/TC]; % compose parameter vector
  N_i = TC * cum_reprod(365, f, pars_R);  % #, total fecundity

  % life span
  pars_tm = [pars_tp; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = N_i;

  %% uni-variate data
  
  % time - length
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp,f_2009);
  L_b = L_m * l_b * f_2009; L_i = L_m * f_2009; r_B = k_M/ 3/ (1 + f_2009*ome);
  [t, L] = ode45(@get_L, [0;tL_2009fm(:,1)], L_b, [], T_ref, T_A, t_0, L_i, r_B); 
  L(1) = []; ELw_2009f = L/ del_M; % cm, total length
  %
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm,f_2009);
  L_bm = L_mm * l_bm * f_2009; L_im = L_mm * f_2009; r_Bm = k_M/ 3/ (1 + f_2009*ome_m);
  [t, L] = ode45(@get_L, [0;tL_2009fm(:,1)], L_bm, [], T_ref, T_A, t_0, L_im, r_Bm); 
  L(1) = []; ELw_2009m = L/ del_M; % cm, total length
  %
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp,f_2010);
  L_b = L_m * l_b * f_2010; L_i = L_m * f_2010; r_B = k_M/ 3/ (1 + f_2010*ome);
  [t, L] = ode45(@get_L, [0;tL_2010fm(:,1)], L_b, [], T_ref, T_A, t_0, L_i, r_B); 
  L(1) = []; ELw_2010f = L/ del_M; % cm, total length
  %
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm,f_2010);
  L_bm = L_mm * l_bm * f_2010; L_im = L_mm * f_2010; r_Bm = k_M/ 3/ (1 + f_2010*ome_m);
  [t, L] = ode45(@get_L, [0;tL_2010fm(:,1)], L_bm, [], T_ref, T_A, t_0, L_im, r_Bm); 
  L(1) = []; ELw_2010m = L/ del_M; % cm, total length

  
  % pack to output
  prdData.tL_2009fm = [ELw_2009f ELw_2009m];
  prdData.tL_2010fm = [ELw_2010f ELw_2010m];
end

function dL = get_L(t, L, T_ref, T_A, t_0, L_i, r_B)
  TC = tempcorr(C2K(16.9+6*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
     