function [prdData, info] = predict_Silurus_meridionalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); % -, scaled length at birth at f
  if info == 0
    prdData = []; return
  end

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% univariate data
  
  % feeding rate-spec growth rate
  Er = zeros(4,5); 
  for i=1:5; for j = 1:4
    Ww0 = str2num(treat.jXr{2}{i}); 
    f = jXr(j,1) * (1 + ome)^(2/3) * kap_X * mu_X * d_X * Ww0^(1/3)/ p_Am/ w_X;
    [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f); 
    l = (Ww0/ (1+f*ome))^(1/3)/ L_m; Er(j,i) = 3 * kT_M * rho_B * (l_i/ l - 1);    
  end;end
  %
  Er_T = zeros(4,4); Ww0 = 44; TC = tempcorr(C2K([15 20 25 30]), T_ref, T_A);
  for i=1:4; for j = 1:4
    f = feedingRate.jXr_T(j,i) * (1 + ome)^(2/3) * kap_X * mu_X * d_X * Ww0^(1/3)/ p_Am/ w_X;
    [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f); 
    l = (Ww0/ (1+f*ome))^(1/3)/ L_m; Er_T(j,i) = 3 * TC(i) * k_M * rho_B * (l_i/ l - 1);    
  end;end
    
  % pack to output
  prdData.jXr = Er;
  prdData.jXr_T = Er_T;


