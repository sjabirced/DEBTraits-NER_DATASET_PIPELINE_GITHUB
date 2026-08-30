function [prdData, info] = predict_Acinonyx_jubatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp];
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  if info == 0
    prdData = []; return
  end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + tau_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning at f
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning at f 
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
          
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-weight
  tvel = get_tx(pars_tx, f_tW, [], tW(:,1)*kT_M); 
  EWw = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3));
  
  tvel = get_tx(pars_tx, f_tW1, [], tW1(:,1)*kT_M); 
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3));

  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  