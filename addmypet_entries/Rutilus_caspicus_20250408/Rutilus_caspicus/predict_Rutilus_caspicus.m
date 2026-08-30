function [prdData, info] = predict_Rutilus_caspicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M   ;              % d, age at birth of foetus at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  R22 = TC * reprod_rate_j(22 * del_M, f, pars_R);                 % #/d, reprod rate at 22 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

%   % males
%   pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
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
  prdData.R22 = R22;

  % univariate data

  % time-length
  % Gomishan wetland','
  tvel = get_tj(pars_tj, f_tL1, [], tL(:,1)*kT_M);
  ELw_1 = L_m * tvel(:,4)/ del_M; % cm, total length
  % Anzali wetland
  tvel = get_tj(pars_tj, f_tL2, [], tL(:,1)*kT_M);
  ELw_2 = L_m * tvel(:,4)/ del_M; % cm, total length

  
  prdData.tL = [ELw_1 ELw_2];
end