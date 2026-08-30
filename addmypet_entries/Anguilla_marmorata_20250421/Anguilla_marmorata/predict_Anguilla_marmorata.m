function [prdData, info] = predict_Anguilla_marmorata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_ts = [g k l_T v_Hb v_Hs];
  [tau_s, tau_b, l_s, l_b] = get_tp(pars_ts, f);
  pars_tp = [g k l_T v_Hs v_Hp];
  [tau_p, tau_ss, l_p, l_ss, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam: for leptocephus to glass eel
  L_s = L_m * l_s;                  % cm, structural length at birth 
  Lw_s = L_s/ del_M;               % cm, total length at end of leptocephalus stage
  tT_s = (tau_s - tau_b)/ kT_M;     % d, time since birth at metam
  s_M = 1;                          % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction GSI
  GSI = TC * 365 * k_M * g/ f.^3./ (f + kap * g * y_V_E);  % see eqn 2 LikaKooy2014
  GSI = GSI .* ((1 - kap) * f.^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W, gonado-somatic index
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  %males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for male
  J_E_Am_m = p_Am_m/ mu_E;         % mol/d.cm^2, {J_EAm}, max surface-spec assimilation flux for male
  E_m_m = p_Am_m/ v;               % J/cm^3, [E_m] reserve capacity for male
  g_m = E_G/ kap/ E_m_m;           % -, energy investment ratio for male
  L_mm = v/ k_M/ g_m; Lw_im = f * L_mm/ del_M; % cm, maximum structural length for male
  pars_tpm = [g_m k l_T v_Hs v_Hp];

  %% pack to output
  prdData.ts = tT_s;
  prdData.am = aT_m;
  prdData.Ls = Lw_s;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  % uni-variate data
  
  % time-length
  % post metam
  [t_p, t_ss, l_p, l_ss] = get_tp(pars_tp, f_tL);
  L_s = l_ss * L_m; L_i = f_tL * L_m; 
  rT_B = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_s) * exp( - rT_B * (tL_f(:,1) - t_sj)); % cm, struct length 
  ELw_f = L/ del_M; % cm, total length
  %
  [t_pm, t_ssm, l_pm, l_ssm] = get_tp(pars_tpm, f_tL);
  L_sm = l_ssm * L_mm; L_im = f_tL * L_mm; 
  rT_Bm = kT_M/ 3/ (1 + f_tL/ g_m); % 1/d, von Bert growth rate
  L = L_im - (L_im - L_sm) * exp( - rT_Bm * (tL_m(:,1) - t_sj)); % cm, struct length 
  ELw_m = L/ del_M; % cm, total length

  

  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
     