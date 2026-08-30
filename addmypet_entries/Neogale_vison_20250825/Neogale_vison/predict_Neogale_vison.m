function [prdData, info] = predict_Neogale_vison(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; 
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  if ~info
    prdData = []; return
  end

  [tau_p, tau_x, tau_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + tau_b/ kT_M;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning at f
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning at f 
  tT_x = (tau_x - tau_b)/ kT_M;      % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % respiration
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35  
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4;    % M, mol of gas per litre at 20 C and 1 bar 
  f = 1;
  pT_ref = TC * p_Am * L_m^2;        % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = (weight.JOi/ (1 + f * w)).^(1/3);    % cm, structural length
  pACSJGRD = pT_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM =  - pADG * eta_O' * O2M;       % mineral fluxes
  J_O = 1e3 * JM(:,3)/ 24/ X_gas;    % ml/h, oxygen consumption rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = (f - l_T) * L_mm;             % cm, ultimate structural length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm]; 
  [tau_pm, tau_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  if ~info
    prdData = []; return
  end
  tT_pm = (tau_pm - tau_bm)/ kT_M;      % d, time since birth at puberty

  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  prdData.JOi = J_O;
  
  % univariate data
  % time-weight
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tp(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % female 0
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW0, [], tW_0f(:,1)*kT_M);
  EWw_0f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %  0
  tvel = get_tp(pars_tpm, f_tW0, [t_b, f_tW0*z/z_m, l_b*z/z_m], tW_0m(:,1)*kT_M);
  EWw_0m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tW_0f = EWw_0f;
  prdData.tW_0m = EWw_0m;
  
