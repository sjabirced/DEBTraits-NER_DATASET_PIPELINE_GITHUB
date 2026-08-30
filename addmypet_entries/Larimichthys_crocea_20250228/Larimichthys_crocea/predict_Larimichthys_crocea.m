function [prdData, info] = predict_Larimichthys_crocea(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
   
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = tau_b/ kT_M;                 % d, age at birth at f and T
  
  % metamorphosis
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  GSI = TC * 365 * k_M * g/ f.^3./ (f + kap * g * y_V_E);  % see eqn 2 LikaKooy2014
  GSI = GSI .* ((1 - kap) * f.^3 - ...
  k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W, gonado-somatic index at fsub
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length-weight
  tf_X = [150 f_X150; 200 f_X200; 300 f_X300; 400 f_X400; 450 f_X450]; tf_X(:,1) =  tf_X(:,1) * kT_M;
  tvel = get_tj(pars_tj, tf_X, [], tL(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_X = L/ del_M; EWw_X = L.^3 .* (1 + ome * tvel(:,3));
  %
  tf_S = [150 f_X150; 200 f_S200; 300 f_S300; 400 f_S400; 450 f_S450]; tf_S(:,1) =  tf_S(:,1) * kT_M;
  tvel = get_tj(pars_tj, tf_S, [], tL(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_S = L/ del_M; EWw_S = L.^3 .* (1 + ome * tvel(:,3));
  
  % pack to output
  prdData.tL = [ELw_X ELw_S];  
  prdData.tW = [EWw_X EWw_S];  

