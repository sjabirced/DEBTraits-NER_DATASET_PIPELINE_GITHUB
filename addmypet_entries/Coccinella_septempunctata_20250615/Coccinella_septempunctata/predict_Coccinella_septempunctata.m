function [prdData, info] = predict_Coccinella_septempunctata (par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % constraint on ome_j
  if 1 < ome_j * kap * E_G/ M_V/ mu_V | v < 0.01; info = 0; prdData = []; return; end % kap_V > 1
  if kap < 0.3; info = 0; return; end
  
  % compute temperature correction factors
  TC_20 = tempcorr(C2K(20), T_ref, T_A);     % data at 20 C
  TC_21 = tempcorr(C2K(21), T_ref, T_A);     % data at 21 C
  TC_23 = tempcorr(C2K(23), T_ref, T_A);     % data at 23 C
  TC_24 = tempcorr(C2K(24), T_ref, T_A);     % data at 24 C
  TC_25 = tempcorr(C2K(25), T_ref, T_A);     % most data at 25 C
  TC_27 = tempcorr(C2K(27), T_ref, T_A);     % data at 27 C
  TC_28 = tempcorr(C2K(28), T_ref, T_A);     % data at 28 C
  
  % zero-variate data
  
  % life cycle
  pars_tj = [g, k, v_Hb, v_He, ome_j];
  [tau_j, tau_e, tau_b, l_j, l_e, l_b, rho_j, v_Hj, u_Ej, info] = get_tj_holo(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = u_E0 * g * E_m * L_m^3;       % J, initial energy content
  Ww_0 = E_0 * w_E/ mu_E/ d_E;        % g, initial wet weight

  % birth
  a_b = tau_b/ k_M;                   % d, age at birth at f and T_ref
  L_b = L_m * l_b;                    % cm, structural length at birth
    
  % pupation
  L_j = L_m * l_j;                    % cm, struc length at pupation
  Ww_j = L_j^3 * (1 + f * w);         % g, total wet weight at pupation
  tT_j = (tau_j - tau_b)/ k_M/ TC_25; % d, time since birth at pupation at T

  % larval instars lengths
  L_1 = L_b;           % struc length at start 1st inst
  L_2 = L_1 * s_1^0.5; % struc length at start 2nd inst
  L_3 = L_2 * s_2^0.5; % struc length at start 3rd inst
  L_4 = L_3 * s_3^0.5; % struc length at start 4th inst
  % larval instars wet weights
  Ww_1 = L_1^3 * (1 + f * ome); % g, wet weight at start 1st inst
  Ww_2 = L_2^3 * (1 + f * ome); % g, wet weight at start 2nd inst
  Ww_3 = L_3^3 * (1 + f * ome); % g, wet weight at start 3rd inst
  Ww_4 = L_4^3 * (1 + f * ome); % g, wet weight at start 4th inst
  % intermediate wet weights (assumed to be closer to what was experimentally measured)
  Ww_12 = mean([Ww_1 Ww_2]); % g, wet weight halfway between hatch and 2nd inst
  Ww_23 = mean([Ww_2 Ww_3]); % g, wet weight halfway between 2nd and 3rd inst
  Ww_34 = mean([Ww_3 Ww_4]); % g, wet weight halfway between 3rd and 4th inst
  Ww_4j = mean([Ww_4 Ww_j]); % g, wet weight halfway between 4th inst and pupation
  % larval dry weight spec assimilation rates
  pA_1 = f * L_1.^2 .* (L_1/L_b) .* p_Am/ Ww_1/ d_V; % J/g.d, dry weight spec assimilation rate at start 1st inst
  pA_2 = f * L_2.^2 .* (L_2/L_b) .* p_Am/ Ww_2/ d_V; % J/g.d, dry weight spec assimilation rate at start 2nd inst
  pA_3 = f * L_3.^2 .* (L_3/L_b) .* p_Am/ Ww_3/ d_V; % J/g.d, dry weight spec assimilation rate at start 3rd inst
  pA_4 = f * L_4.^2 .* (L_4/L_b) .* p_Am/ Ww_4/ d_V; % J/g.d, dry weight spec assimilation rate at start 4th inst
  % larval instars development times
  r_j = g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T_ref
  t_01 = log(s_1^0.5) * 3/ r_j; % d, time from 1st to 2nd inst at at T_ref
  t_12 = log(s_2^0.5) * 3/ r_j; % d, time from 2nd to 3rd inst at T_ref
  t_23 = log(s_3^0.5) * 3/ r_j; % d, time from 3rd to 4th inst at T_ref
  t_34 = (tau_j - tau_b)/ k_M - (t_01 + t_12 + t_23); % d, time from 4th inst to pupation at T_ref
 
  % emergence
  s_M = l_j/ l_b; % -, acceleration factor at and after pupation
  L_e = L_m * l_e; % cm, struct length at emergence
  Lw1_e = L_e/ del_M_al;    % cm, body length at emergence
  Lw2_e = L_e/ del_M_aw;   % cm, body width at emergence
  t_je = (tau_e - tau_j)/ k_M; % d, time since pupation et emergence at T_ref
  Ww_e = L_e^3 * (1 + f * ome); % g, wet weight at emergence
  pA_e = f * L_e^2 * s_M * p_Am/ Ww_e * d_V; % dry weight specific assimilation rate at T_Ref
 
  % hypothetical asymptotic wet weight
  Ww_asym = s_M^3 * L_m^3 * (1 + f * ome); % g, asymptotic wet weight if growth would not cease at puberty
  
  % emergence to puberty (pre-oviposition phase: feeding, maturation, no growth)
  v_Hi = l_e^2/ k/ (1 - kap) * (f * s_M - kap * l_e); % -, scaled max maturity
  if v_Hp > v_Hi; info = 0; prdData = []; return; end
  tau_ep = log((v_Hi - v_He)/(v_Hi - v_Hp))/ k; % -, scaled time since emergence at puberty
  t_ep = tau_ep/ k_M; % d, time since emergence at puberty at T_ref
  
  % reproduction (oviposition phase)
  R_i = kap_R * ((1 - kap) * f * s_M * v * E_m * L_e^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T_ref
  
  % life span
  h3_W = h_a * f * k_M * g/ 6 / l_e; % 1/d^3, cubed Weibull ageing rate
  t_ei = gamma(4/3)/ h3_W^(1/3); % d, life span as imago at T_ref
  
  % pack to output
  prdData.tbj_25 = tT_j;
  prdData.t01_23 = t_01/ TC_23;
  prdData.t12_23 = t_12/ TC_23;
  prdData.t23_23 = t_23/ TC_23;
  prdData.t34_23 = t_34/ TC_23;
  prdData.t01_24 = t_01/ TC_24;
  prdData.t12_24 = t_12/ TC_24;
  prdData.t23_24 = t_23/ TC_24;
  prdData.t34_24 = t_34/ TC_24;
  prdData.t01_25 = t_01/ TC_25;
  prdData.t12_25 = t_12/ TC_25;
  prdData.t23_25 = t_23/ TC_25;
  prdData.t34_25 = t_34/ TC_25;
  prdData.t01_28 = t_01/ TC_28;
  prdData.t12_28 = t_12/ TC_28;
  prdData.t23_28 = t_23/ TC_28;
  prdData.t34_28 = t_34/ TC_28;
  prdData.tei_24 = t_ei/ TC_24;
  prdData.tei_28 = t_ei/ TC_28;
  prdData.L1e = Lw1_e;
  prdData.L1e_14 = Lw1_e;
  prdData.L1e_14a = Lw1_e;
  prdData.L1e_24 = Lw1_e;
  prdData.L2e = Lw2_e;
  prdData.L2e_14 = Lw2_e;
  prdData.L2e_14a = Lw2_e;
  prdData.L2e_24 = Lw2_e; 
  prdData.Ww0 = Ww_0;
  prdData.Ww01 = Ww_12;
  prdData.Ww12 = Ww_23;
  prdData.Ww23 = Ww_34;
  prdData.Ww34 = Ww_4j;
  prdData.Wwj = Ww_j;
  prdData.Wwe_21 = Ww_e;
  prdData.Wwe_23 = Ww_e;
  prdData.Wwe_24 = Ww_e;
  prdData.Wwe_25 = Ww_e;
  prdData.Wwe2_25 = Ww_e;
  prdData.Wwj = Ww_j;
  prdData.Wwj2 = Ww_j;
  prdData.Wwe_14 = Ww_e;
  prdData.Ww_asym = Ww_asym;
  prdData.pA1 = pA_1 * TC_27;
  prdData.pA2 = pA_2 * TC_27;
  prdData.pA3 = pA_3 * TC_27;
  prdData.pA4 = pA_4 * TC_27;
  prdData.pAe = pA_e * TC_27;
  
  % uni-variate data
  
  % time-weight at f1 = f2 = f3 = f4 = f, f5, and f6 at 20 C
  rT_j_f = TC_20 * g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T
  rT_j_f5 = TC_20 * g * k_M * (f5/ l_b - 1)/ (f5 + g); % 1/d, specific growth rate during accelleration at T
  rT_j_f6 = TC_20 * g * k_M * (f6/ l_b - 1)/ (f6 + g); % 1/d, specific growth rate during accelleration at T
  EWw_f1 = (L_b * exp(tWwf1(:,1) * rT_j_f/ 3)).^3 * (1 + f * ome); % g, total wet weight
  EWw_f2 = (L_b * exp(tWwf2(:,1) * rT_j_f/ 3)).^3 * (1 + f * ome); % g, total wet weight
  EWw_f3 = (L_b * exp(tWwf3(:,1) * rT_j_f/ 3)).^3 * (1 + f * ome); % g, total wet weight
  EWw_f4 = (L_b * exp(tWwf4(:,1) * rT_j_f/ 3)).^3 * (1 + f * ome); % g, total wet weight
  EWw_f5 = (L_b * exp(tWwf5(:,1) * rT_j_f5/ 3)).^3 * (1 + f5 * ome); % g, total wet weight
  EWw_f6 = (L_b * exp(tWwf6(:,1) * rT_j_f6/ 3)).^3 * (1 + f6 * ome); % g, total wet weight
  
  % time-length and time-weight data from dedicated Bayer study
  r25_j = TC_25 * g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T
  EWw = (L_b * exp(tWwB1(:,1) * r25_j/ 3)).^3 * (1 + f * ome); % g, total wet weight over time
  ELw1 = L_b * exp(tL1(:,1) * r25_j/ 3)/ del_M_ll; % cm, larval body length over time
  ELw2 = L_b * exp(tL2(:,1) * r25_j/ 3)/ del_M_lw; % cm, larval body width over time
  
  % development times at different temperatures
  Ea_b = tau_b/ k_M ./ tempcorr(C2K(Tab(:,1)), T_ref, T_A); % d, age at hatch
  Ea_b1 = tau_b/ k_M ./ tempcorr(C2K(Tab1(:,1)), T_ref, T_A); % d, age at hatch
  Et_bj = (tau_j - tau_b)/ k_M ./ tempcorr(C2K(Ttbj(:,1)), T_ref, T_A); % d, larval development time
  Et_je = (tau_e - tau_j)/ k_M ./ tempcorr(C2K(Ttje(:,1)), T_ref, T_A); % d, pupal development time
  Et_je1 = (tau_e - tau_j)/ k_M ./ tempcorr(C2K(Ttje1(:,1)), T_ref, T_A);
  Et_ep = t_ep ./ tempcorr(C2K(Ttep(:,1)), T_ref, T_A);
  
  % life cycle at f7 (Aphis gossypii) 
  [tau_j, tau_e, tau_b, l_j, l_e, l_b, rho_j, u_Ej, v_Hj, info] = get_tj_holo(pars_tj, f7);
  if ~info; prdData = []; return; end
  L_e = L_m * l_e;     % cm, structural length at emergence  
  % reproduction rate at different temperatures at f = f7
  ER_i = tempcorr(C2K(TRi(:,1)), T_ref, T_A) * kap_R * ((1 - kap) * f7 * s_M * v * E_m * L_e^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
  ER_i1 = tempcorr(C2K(TRi1(:,1)), T_ref, T_A) * kap_R * ((1 - kap) * f7 * s_M * v * E_m * L_e^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
  % life span at different temperatures
  Et_ei =  t_ei ./ tempcorr(C2K(Ttei(:,1)), T_ref, T_A);
  
  % pack to output
  prdData.Tab = Ea_b;
  prdData.Tab1 = Ea_b1;
  prdData.Ttbj = Et_bj;
  prdData.Ttje = Et_je;
  prdData.Ttje1 = Et_je1;
  prdData.Ttep = Et_ep;
  prdData.Ttei = Et_ei;
  prdData.TRi = ER_i;
  prdData.TRi1 = ER_i1;
  prdData.Ttei = Et_ei;
  prdData.tWwf1 = EWw_f1;
  prdData.tWwf2 = EWw_f2;
  prdData.tWwf3 = EWw_f3;
  prdData.tWwf4 = EWw_f4;
  prdData.tWwf5 = EWw_f5;
  prdData.tWwf6 = EWw_f6;
  prdData.tWwB1 = EWw;
  prdData.tWwB2 = EWw;
  prdData.tL1 = ELw1;
  prdData.tL12 = ELw1;
  prdData.tL2 = ELw2;
  prdData.tL22 = ELw2;
end






