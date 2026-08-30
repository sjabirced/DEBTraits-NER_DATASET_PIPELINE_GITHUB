function [prdData, info] = predict_Corynorhinus_rafinesquii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  pars_tR = [g; k; l_T; v_Hb; v_Hx; v_Hp; t_N * k_M * TC];  % compose parameter vector
  [t_R, t_p, t_x, t_b, l_R, l_p, l_x, l_b, info] = get_tR(pars_tR, f); % -, scaled times & lengths at f
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, forearm length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning at f and T
  
  % puberty
  tT_R = (t_R - t_b)/ kT_M;         % d, time since birth at first litter

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate forearm length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_R;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tp(pars_tp, f_tL, [], tL_m(:,1)*kT_M);
  ELw_m = L_m * tvel(:,4)/ del_M;

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
end
