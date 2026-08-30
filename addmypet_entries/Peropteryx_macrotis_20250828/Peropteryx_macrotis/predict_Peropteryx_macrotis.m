function [prdData, info] = predict_Peropteryx_macrotis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_00 > 1.5
    info = 0; prdData = []; return
  end
 
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tR = [g; k; l_T; v_Hb; v_Hx; v_Hp; t_N * k_M * TC];  % compose parameter vector
  [t_R, t_p, t_x, t_b, l_R, l_p, l_x, l_b, info] = get_tR(pars_tR, f); % -, scaled times & lengths at f
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at weaning at f and T
  
  % pubert
  tT_R = (t_R - t_b)/ k_M/ TC;      % d, time since birth at first litter

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
  pT_ref = TC * p_Am * L_m^2;        % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = (weight.JOi/ (1 + f * w)).^(1/3);    % cm, structural length
  pACSJGRD = pT_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM =  - pADG * eta_O' * O2M;       % mineral fluxes
  J_O = 1e3 * JM(:,3)/ 24/ X_gas;    % ml/h, oxygen consumption rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_R;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.JOi = J_O;
  