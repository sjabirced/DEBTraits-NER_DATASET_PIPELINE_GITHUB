function [prdData, info] = predict_Chrysoperla_carnea(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % constraint on ome_j
  if 1 < ome_j * kap * E_G/ M_V/ mu_V | v < 0.01; info = 0; prdData = []; return; end % kap_V > 1
  if 1 < kap_X + kap_P; info = 0; prdData = []; return; end
  
  % temperature correction factors
  TC_23 = tempcorr(C2K(23), T_ref, T_A); 
  TC_25 = tempcorr(C2K(25), T_ref, T_A);
  TC_27 = tempcorr(C2K(27), T_ref, T_A);
  TC_32 = tempcorr(C2K(32), T_ref, T_A);
  

  % zero-variate data  
  pars_tj = [g, k, v_Hb, v_He, ome_j]; % compose par vector
  [tau_j, tau_e, tau_b, l_j, l_e, l_b, rho_j, v_Hj, u_Ej, info] = get_tj_holo(pars_tj, 1);
  if ~info; prdData = []; return; end
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];    % compose parameter vector
  [U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0); % d.cm^2 , initial energy content
  E_0 = p_Am * U_E0;                    % J, initial energy content
  
  % birth
  aT_b = tau_b/ k_M/ TC_23;             % d, age at birth
  L_b = L_m * l_b;                      % cm, sruc length at birth
  Ww_b = L_b^3 * (1 + f * ome);         % g, wet weight at birth
  
  % pupation  (end of acceleration)
  s_M = l_j/ l_b;                       % -, acceleration factor
  t23_j = (tau_j - tau_b)/ k_M/ TC_23;  % d, time since birth at pupation
  t25_j = (tau_j - tau_b)/ k_M/ TC_25;  % d, time since birth at pupation
  L_j = L_m * l_j;                      % cm, structural length at pupation
  Ww_j = L_j^3 * (1 + f * ome);         % g, wet weight at pupation
  % g, total wet weight at pupation with different food types
  [~, ~, ~, l_j_Bt, ~, ~, ~, ~, info_f_Bt] = get_tj_holo(pars_tj, f_Bt);
  [~, ~, ~, l_j_Sg, ~, ~, ~, ~, info_f_Sg] = get_tj_holo(pars_tj, f_Sg);
  [~, ~, ~, l_j_art, ~, ~, ~, ~, info_f_art] = get_tj_holo(pars_tj, f_art);
  if ~info_f_Bt | ~info_f_Sg | ~info_f_art
    prdData = []; return
  end
  Wwj_Bt = (L_m * l_j_Bt)^3 * (1 + f_Bt * ome); % g, wet weight at pupation with aphid food
  Wwj_Sg = (L_m * l_j_Sg)^3 * (1 + f_Sg * ome); % g, wet weight at pupation with whitefly food
  Wwj_art = (L_m * l_j_art)^3 * (1 + f_art * ome); % g, wet weight at pupation with artificial food
  
  % emergence (end of growth)
  t23_e = (tau_e - tau_b)/ k_M/ TC_23;    % d, time since birth at emergence
  t23_je = (tau_e - tau_j)/ k_M/ TC_23;   % d, time since pupation at emergence
  t25_je = (tau_e - tau_j)/ k_M/ TC_25;   % d, time since pupation at emergence
  
  L_e = L_m * l_e;                        % cm, structural length at emergence
  Ww_e = L_e^3 * (1 + f * ome);           % g, wet weight at emergence
  Wd_e = Ww_e * d_V;                      % g, dry weight at emergence
  Ww_i = Ww_e;                            % g, wet weight after emergence when reserve has been refilled to e = f
  Ww_asym = s_M^3 * L_m^3 * (1 + f * ome); % g, asymptotic wet weight if growth would not cease at puberty
  
  % puberty
  v_Hi = l_e^2/ k/ (1 - kap) * (f * s_M - kap * l_e); % -, scaled max maturity
  if v_Hp > v_Hi; info = 0; prdData = []; return; end
  tau_ep = log((v_Hi - v_He)/(v_Hi - v_Hp))/ k; % -, scaled time since emergence at puberty
  t23_ep = tau_ep/ k_M/ TC_23; % d, time since emergence at puberty
    
  % reproduction
  R_i = kap_R * ((1-kap) * f * s_M * v * E_m * L_e^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate
  R23_i = TC_23 * R_i; R25_i = TC_25 * R_i; R32_i = TC_32 * R_i; % #/d, temp corrected values
  
  % life span
  h3_W = h_a * f * k_M * g/ 6 / l_e;
  tT_ei = gamma(4/3)/ h3_W^(1/3)/ TC_23;
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj_23 = t23_j;
  prdData.tj_25 = t25_j;
  prdData.tj_25a = t25_j;
  prdData.tje_23 = t23_je;
  prdData.tje_25 = t25_je;
  prdData.te_23 = t23_e;
  prdData.tep_23 = t23_ep;
  prdData.tei = tT_ei;
  prdData.teia = tT_ei;
  prdData.Lb = L_b/del_M_larva;
  prdData.Lj = L_j/del_M_pupa;
  prdData.Le = L_e/del_M_imago;
  prdData.Wwb = Ww_b;
  prdData.Wwj_1 = Ww_j;
  prdData.Wwj_aphid = Wwj_Bt;
  prdData.Wwj_whitefly = Wwj_Sg;
  prdData.Wwj_artificial = Wwj_art;
  prdData.Wwe_1 = Ww_e;
  prdData.Wwe_2 = Ww_e;
  prdData.Wwi_1 = Ww_i;
  prdData.Wwi_2 = Ww_i;
  prdData.Wde = Wd_e;
  prdData.Ww_asym = Ww_asym;
  prdData.Ri_1 = R23_i;
  prdData.Ri_2 = R23_i;
  prdData.Ri_3 = R25_i;
  prdData.Ri_4 = R25_i;
  prdData.Ri_5 = R32_i;
  
  % uni-variate data
   
  % temperature - age at birth
  EaT_b = tau_b/ k_M ./ tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
  % temperature - time since birth to pupation
  EtT_j_1 = (tau_j - tau_b)/ k_M ./ tempcorr(C2K(Ttj_AN20(:,1)), T_ref, T_A);
  EtT_j_2 = (tau_j - tau_b)/ k_M ./ tempcorr(C2K(Ttj_S23(:,1)), T_ref, T_A); 
  
  % temperature - time since pupation to emergence
  EtT_e_1 = (tau_e - tau_j)/ k_M ./ tempcorr(C2K(Tte_AN20(:,1)), T_ref, T_A);
  EtT_e_2 = (tau_e - tau_j)/ k_M ./ tempcorr(C2K(Tte_S23(:,1)), T_ref, T_A);
   
  % time - length
  r25_j = TC_25 * g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T
  EL25 = L_b * exp(tL(:,1) * r25_j/ 3)/ del_M_larva; % cm, larval body length over time
  EL25_2 = L_b * exp(tL2(:,1) * r25_j/ 3)/ del_M_larva; % cm, larval body length over time
  
  % time - weight
  % 25 C
  EWw1 = (L_b * exp(tWw1(:,1) * r25_j/ 3)).^3 * (1 + ome * f); % g, total wet weight over time
  EWw2 = (L_b * exp(tWw2(:,1) * r25_j/ 3)).^3 * (1 + ome * f); % g, total wet weight over time
  % 27 C
  r27_j = TC_27 * g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T
  EWw = (L_b * exp(tWw(:,1) * r27_j/ 3)).^3 * (1 + ome * f); % g, total wet weight over time
  EWd = (L_b * exp(tWd(:,1) * r27_j/ 3)).^3 * (1 * d_V + ome * f * d_E); % g, total wet weight over time
    
  % time - cumulative food consumption during larve-stage
  rT_j = TC_23 * g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate during accelleration at T
  EX = f_tX * p_Am/ kap_X/ mu_X * w_X/ d_X * L_b * L_j * (exp(tX(:,1) * rT_j)-1);  
  
  % time - cumulative egg deposition
  R27_i = TC_27 * kap_R * ((1 - kap) * f_tN * s_M * v * E_m * L_e^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
  EN = R27_i * tN(:,1); % #, cumulative number of eggs
  
  % larval food - wet weight at pupation
  n = size(fWw_j, 1); EWw_j = zeros(n,1); % preallocate output vector
  for i = 1:n % scan all f's
      [~, ~, ~, l_j_fi, ~, ~, ~, ~, info_fi] = get_tj_holo(pars_tj, fWw_j(i,1));
      if ~info_fi; prdData = []; return; end
      EWw_j(i) = (L_m * l_j_fi)^3 * (1 + fWw_j(i,1) * ome); % g, total wet weight at pupation
  end
  
  % pack to output
  prdData.tL = EL25;
  prdData.tL2 = EL25_2;
  prdData.tWw = EWw;
  prdData.tWw1 = EWw1;
  prdData.tWw2 = EWw2;
  prdData.tWd = EWd;
  prdData.fWw_j = EWw_j;
  prdData.Tab = EaT_b;
  prdData.Ttj_AN20 = EtT_j_1;
  prdData.Ttj_S23 = EtT_j_2;
  prdData.Tte_AN20 = EtT_e_1;
  prdData.Tte_S23 = EtT_e_2;  
  prdData.tN = EN;
  prdData.tX = EX;
  
end

