function [prdData, info] = predict_Sarcocheilichthys_nigripinnis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth of foetus at f and T
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

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
  prdData.GSI = GSI;

  % univariate data

  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tLW(:,1)*kT_M); 
  L = L_m * tvel(:,4); ELw = L/ del_M;
  EWw = L.^3 .* (1 + ome * tvel(:,3));
  
  % pack to output  
  prdData.tLW = [ELw EWw];
end

