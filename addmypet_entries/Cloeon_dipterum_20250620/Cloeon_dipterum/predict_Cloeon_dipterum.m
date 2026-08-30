function [prdData, info] = predict_Cloeon_dipterum(par, data, auxData)

global tT_c tT_w tT_g

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if  f_LFT > f_MFT || f_MFT > f_HFT || z_m > z || f_HFT > 1 || k >1% constraint required for reaching birth
    prdData = []; info = 0; return
 end
pars_T_c = [T_A; T_L; T_AL];

%% temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, pars_T_c);
TC_am = tempcorr(temp.am, T_ref, pars_T_c);
TC_cian = tempcorr(temp.tp_c, T_ref, pars_T_c);
TC_tL_f1 = tempcorr(temp.tL_f1, T_ref, pars_T_c);
% 
tTC_c  = [tT_c(:,1), tempcorr((tT_c(:,2)), T_ref, pars_T_c)]; % vector of T in time
tTC_w  = [tT_w(:,1), tempcorr((tT_w(:,2)), T_ref, pars_T_c)]; % vector of T in time
tTC_g  = [tT_g(:,1), tempcorr((tT_g(:,2)), T_ref, pars_T_c)]; % vector of T in time
% 
TC_tL_h1 = tempcorr(temp.tL_h1, T_ref, pars_T_c);
TC_tL_h2 = tempcorr(temp.tL_h2, T_ref, pars_T_c);
TC_tL_h3 = tempcorr(temp.tL_h3, T_ref, pars_T_c);
TC_tL_h4 = tempcorr(temp.tL_h4, T_ref, pars_T_c);
TC_tL_h5 = tempcorr(temp.tL_h5, T_ref, pars_T_c);
TC_tS = tempcorr(temp.tS, T_ref, pars_T_c);

TC_B = tempcorr(temp.t5, T_ref, pars_T_c);
TC_22 = tempcorr(C2K(22), T_ref, pars_T_c);
TC_19_5 = tempcorr(C2K(19.5), T_ref, pars_T_c);
TC_24_5 = tempcorr(C2K(24.5), T_ref, pars_T_c);
TC_17 = tempcorr(C2K(17), T_ref, pars_T_c);
TC_27 = tempcorr(C2K(27), T_ref, pars_T_c);

%% zero-variate data

% life cycle
v_Rj = kap/ (1 - kap) * E_Rj/ E_G;
pars_tj = [g k v_Hb v_Hp v_Rj tau_1];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f);

% initial
u_E0 = get_ue0([g k v_Hb], f, l_b);         % -, scaled initial reserve
E_0 = g * E_m * L_m^3 * u_E0;               % J, initial energy content
Wd_0 = 1e3 * w_E * E_0/ mu_E;               % mg, initial dry weight
Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg diameter

% birth
a_b = t_b/ k_M; aT_b = a_b/ TC_ab;         % d, age at birth at f and T
L_b = L_m * l_b;                           % cm, structural length at birth at f
Lw_b = L_b / del_M;                        % cm, length at birth
Wd_b = 1e3 * L_b^3 * dV * (1 + f * w);    % mg, dry weight birth (remove d_V for wet weight)

% puberty
L_p = L_m * l_p;                           % cm, structural length at puberty at f

% emergence (corresponds to ultimate)
tT_j = (t_j - t_b)/ k_M/ TC_ab;      % d, time since birth at emergence
L_j = l_j * L_m;                     % cm, structural length at emergence (imago)
Lw_j = L_j/ del_M;                   % cm, length (sub)imago at f
Ww_j = 1e3 * L_j^3 * (1 + f * w);    % mg, wet weight subimago (excluding eggs); reproduction buffer added below
Lw_jw = L_j / del_Mw;                % cm, ultimate wing length female imago

% life span
pars_tm = [g;k;v_Hb;v_Hp;v_Rj;h_a/k_M^2;s_G];
t_m = get_tm_mod('hep',pars_tm, f);  % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

tpj = (t_j - t_p)/ k_M/ TC_ab;  % time at emergence since puberty, duration of adult stage
tp = (t_p-t_b)/ k_M/ TC_ab;           % time at puberty since birth, duration of adult stage

% cianciara zero variate data 
% females
[t_jc, t_pc, t_bc, l_jc, l_pc, l_bc, l_ic, rho_jc, rho_Bc, infoc] = get_tj_hep_reduced_feeding(pars_tj, f_c);
tT_p_c = (t_pc - t_bc)/ k_M/ TC_cian;      % d, time since birth at puberty
tT_j_c = (t_jc - t_bc)/ k_M/ TC_cian;      % d, time since birth at emergence
Lw_jc = l_jc * L_m/ del_M;                  % cm, length (sub)imago at f
Lw_pc = l_pc * L_m/ del_M;                  % cm, length (sub)imago at f
Ww_j = 1e3 * ((l_jc * L_m)^3 * (1 + f_c * w) + E_Rj * (l_jc*L_m)^3*w_E/mu_E/d_E); % mg, wet weight subimago (including reproduction buffer);

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap * E_m_m);            % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity
w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
pars_tjm = [g_m k v_Hb v_Hp v_Rj tau_1];   % pars for male
[t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj_hep_reduced_feeding(pars_tjm, f_c);
L_jm = l_jm * L_mm; Lw_jm = L_jm/ del_M;  % cm, length at emergence
Ww_jm = 1e3 * (L_jm^3 * (1 + f_c * w_m) + E_Rj * (l_jm*L_mm)^3*w_E/mu_E/d_E); % mg, ultimate wet weight
% (assuming that sperm contributes like eggs)

% body length per instar, cm
Lw_1 = Lw_b * s_1^0.5;
Lw_2 = Lw_1 * s_2^0.5;
Lw_3 = Lw_2 * s_3^0.5;
Lw_4 = Lw_3 * s_4^0.5;
Lw_5 = Lw_4 * s_5^0.5;
Lw_6 = Lw_5 * s_6^0.5;
Lw_7 = Lw_6 * s_7^0.5;
Lw_8 = Lw_7 * s_8^0.5;
Lw_9 = Lw_j;

% dry weight per instar, mg
% structural lengths
L_1 = Lw_1 * del_M; L_2 = Lw_2 * del_M; L_3 = Lw_3 * del_M;
L_4 = Lw_4 * del_M; L_5 = Lw_5 * del_M; L_6 = Lw_6 * del_M;
L_7 = Lw_7 * del_M; L_8 = Lw_8 * del_M; L_9 = Lw_9 * del_M;
% dry weights
EWd_1 = L_1.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_2 = L_2.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_3 = L_3.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_4 = L_4.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_5 = L_5.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_6 = L_6.^3 * dV * (1 + f * w) * 1e3 ; % mg, dry weight not including the reproduction buffer
EWd_7 = (L_7.^3 * dV * (1 + f_7 * w) + dV*E_Rj * L_7^3 * w_E/mu_E) * 1e3; % mg, dry weight including the reproduction buffer
EWd_8 = (L_8.^3 * dV * (1 + f_8 * w) + dV*E_Rj * L_8^3 * w_E/mu_E) * 1e3; % mg, dry weight including the reproduction buffer
EWd_9 = (L_9.^3 * dV * (1 + f_9 * w) + dV*E_Rj * L_9^3 * w_E/mu_E) * 1e3; % mg, dry weight including the reproduction buffer

% head length per instar, cm
Lh_1 = L_1 / del_Mh; Lh_2 = L_2 / del_Mh; Lh_3 = L_3 / del_Mh;
Lh_4 = L_4 / del_Mh; Lh_5 = L_5 / del_Mh; Lh_6 = L_6 / del_Mh;
Lh_7 = L_7 / del_Mh; Lh_8 = L_8 / del_Mh; Lh_9 = L_9 / del_Mh;

% instar durations and  food uptake
p = [p_M; k_J; E_G; E_Hp; E_Rj; kap_X; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2; s_3; s_4; s_5; s_6; s_7; s_8; E_m; k_starv; e_critical;h_b; L_ini_W * del_M];
ELHES0 = [E_m*L_b^3; L_b; E_Hb; 0; 0;1];
% juvenile
opts56 = odeset('Events',@instars56, 'RelTol', 1e-4, 'AbsTol', 1e-8);
[t56 ELHE56 te ye] = ode45(@dget_ELHES, [0; 100], ELHES0,opts56 ,p, f, TC_B, L_b, L_p, L_j, g, 0);
if  length(te)<3
    prdData = []; info = 0; return
end
if  sqrt(s_1*s_2*s_3*s_4*s_5*s_6*s_7*s_8)*L_b > L_j || sqrt(s_1*s_2*s_3*s_4*s_5*s_6*s_7)*L_b > L_j || sqrt(s_1*s_2*s_3*s_4*s_5*s_6)*L_b > L_j
    prdData = []; info = 0; return
 end
tT_5 = te(2) - te(1); % duration of instar 5 at T
tT_6 = te(3) - te(2); % duration of instar 6 at T
EWwJX_T5 = y_cl * (ye(2,5)-ye(1,5));  % g Clorophyll-a, ingested food instar 5
EWwJX_T6 = y_cl * (ye(3,5)-ye(2,5));  % g Clorophyll-a, ingested food instar 6
% adult
opts7 = odeset('Events',@instar7, 'RelTol', 1e-4, 'AbsTol', 1e-8);
[t7 ELHE7] = ode45(@dget_ELHES, linspace(t56(end), 100,100), ye(end,:) ,opts7 ,p, f_7, TC_B, L_b, L_p, L_j, g, 0);
tT_7 = t7(end)-te(3);  % duration of instar 7 at T
EWwJX_T7 = y_cl * (ELHE7(end,5)-ye(3,5));  % g Clorophyll-a, ingested food instar 7
opts8 = odeset('Events',@instar8, 'RelTol', 1e-4, 'AbsTol', 1e-8);
[t8 ELHE8] = ode45(@dget_ELHES, linspace(t7(end), 100,100), ELHE7(end,:) ,opts8 ,p, f_8, TC_B, L_b, L_p, L_j, g, 0);
tT_8 = t8(end)-t7(end);  % duration of instar 8 at T
EWwJX_T8 = y_cl * (ELHE8(end,5)-ELHE7(end,5));  % g Clorophyll-a, ingested food instar 8
opts9 = odeset('Events',@instar9, 'RelTol', 1e-4, 'AbsTol', 1e-8);
[t9 ELHE9] = ode45(@dget_ELHES, linspace(t8(end), 100,100), ELHE8(end,:) ,opts9 ,p, f_9, TC_B, L_b, L_p, L_j, g, 0);
tT_9 = t9(end)-t8(end);  % duration of instar 9 at T
EWwJX_T9 = y_cl * (ELHE9(end,5)-ELHE8(end,5));  % g Clorophyll-a, ingested food instar 9

% number of eggs/female (l_b at f=1)
[t_j, t_p, t_b, l_j, l_p, l_b_n, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_HFT);
N_HFT   = kap_R * E_Rj * (l_j*L_m)^3 /E_0;   % #, eggs per female at f
%
[t_j, t_p, t_b, l_j, l_p, l_b_n, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_MFT);
N_MFT   = kap_R * E_Rj * (l_j*L_m)^3 / E_0;  % #, eggs per female at f
%
[t_j, t_p, t_b, l_j, l_p, l_b_n, rho_j, rho_B,info] = get_tj_hep_reduced_feeding(pars_tj, f_LFT);
N_LFT   = kap_R * E_Rj * (l_j*L_m)^3 / E_0;  % #, eggs per female at f
% 
if  N_LFT > N_MFT || N_MFT > N_HFT
    prdData = []; info = 0; return
 end

% pack to output
prdData.ab = aT_b;
prdData.tj = tT_j;
prdData.am = aT_m;
prdData.tp = tp;
prdData.tpj = tpj;
prdData.tj_c = tT_j_c;
prdData.tp_c = tT_p_c;
prdData.L0 = Lw_0;
prdData.Lb = Lw_b;
prdData.Lp = Lw_pc;
prdData.Lj = Lw_jc;
prdData.Lj_m = Lw_jm;
prdData.Lj_w = Lw_jw;
prdData.Wd0 = Wd_0;
prdData.Wdb = Wd_b;
prdData.Wwj = Ww_j;
prdData.Wwj_m = Ww_jm;
prdData.L1 = Lw_1;
prdData.L2 = Lw_2;
prdData.L3 = Lw_3;
prdData.L4 = Lw_4;
prdData.L5 = Lw_5;
prdData.L6 = Lw_6;
prdData.L7 = Lw_7;
prdData.L8 = Lw_8;
prdData.L9 = Lw_9;
prdData.Wd1 = EWd_1;
prdData.Wd2 = EWd_2;
prdData.Wd3 = EWd_3;
prdData.Wd4 = EWd_4;
prdData.Wd5 = EWd_5;
prdData.Wd6 = EWd_6;
prdData.Wd7 = EWd_7;
prdData.Wd8 = EWd_8;
prdData.Wd9 = EWd_9;
prdData.Lh1 = Lh_1;
prdData.Lh2 = Lh_2;
prdData.Lh3 = Lh_3;
prdData.Lh4 = Lh_4;
prdData.Lh5 = Lh_5;
prdData.Lh6 = Lh_6;
prdData.Lh7 = Lh_7;
prdData.Lh8 = Lh_8;
prdData.Lh9 = Lh_9;
prdData.t5 = tT_5;
prdData.t6 = tT_6;
prdData.t7 = tT_7;
prdData.t8 = tT_8;
prdData.t9 = tT_9;
prdData.JX5 = EWwJX_T5;
prdData.JX6 = EWwJX_T6;
prdData.JX7 = EWwJX_T7;
prdData.JX8 = EWwJX_T8;
prdData.JX9 = EWwJX_T9;
prdData.N_HFT = N_HFT;
prdData.N_MFT = N_MFT;
prdData.N_LFT = N_LFT;

%% uni-variate data ------------------------------------------------------
% Cian1979
% time-length, time-weight
opts = odeset('RelTol', 1e-4, 'AbsTol', 1e-8);
[t_j, t_p, t_b, l_j, l_p, l_b_c, rho_j, rho_B,info] = get_tj_hep_reduced_feeding(pars_tj, f_c);
L_p_c = l_p * L_m; L_j_c = l_j * L_m;
tf = [0 f_c; (t_p-t_b)/k_M/TC_cian f_c; (t_p + tau_1-t_b)/k_M/TC_cian 0];
%females
[t ELHE_f] = ode45(@dget_ELHES, [0; tL_f(:,1)], ELHES0,opts ,p, tf, TC_cian, L_b, L_p_c, L_j_c, g, 0);
t(1) = [];ELHE_f(1,:) = [];
ELw_f = ELHE_f(:,2)/del_M;
EWw_f = 1e3 * (ELHE_f(:,2).^3 + ELHE_f(:,1)* (w_E/mu_E/d_E) + ELHE_f(:,4)* (w_E/mu_E)); % mg, wet weight females, including eggs

%males
p_m = [p_M; k_J; E_G; E_Hp; E_Rj; kap_X; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2; s_3; s_4; s_5; s_6; s_7; s_8; E_m; k_starv; e_critical;h_b;L_ini_W * del_M];
[t ELHE_m] = ode45(@dget_ELHES, [0; tL_m(:,1)], ELHES0,[] ,p_m, tf, TC_cian, L_b, L_p_c, L_j_c, g_m, 0);
ELHE_m(1,:) = []; t(1)=[];
ELw_m = ELHE_m(:,2)/del_M;
EWw_m = 1e3 * (ELHE_m(:,2).^3 + ELHE_m(:,1)* (w_E/mu_E/d_E) + ELHE_m(:,4)* (w_E/mu_E)); % mg, wet weight males (assuming that sperm contributes like eggs)

% length-respiration
% females
p_ref = TC_cian * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
p_ACSJGRD = p_ref * scaled_power_j(LJO_f(:,1)*del_M, f_c, pars_power, l_b, l_p, l_p);
X_gas = 1/ 24.4;       % M, mol of gas per litre at T_ref (= 20 C) and 1 bar
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_f = - 1e6 * J_M(3,:)'/ X_gas/ 24; % mul/h, O2 consumption for females
% males
p_ref = TC_cian * p_Am_m * L_mm^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
p_ACSJGRD = p_ref * scaled_power_j(LJO_m(:,1)*del_M, f_c, pars_power, l_bm, l_pm, l_pm);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_m = - 1e6 * J_M(3,:)'/ X_gas/ 24; % mul/h, O2 consumption for males 

% length-weight
L_f_c = LWw_f(:,1) * del_M; % cm, structural length
ELWw_f  = L_f_c.^3 .* (1 + f_c * w + E_Rj* w_E/mu_E*(L_f_c>L_p_c))  * 1e3; % mg (-> 1e3), wet weight including reproduction buffer
L_m_c = LWw_m(:,1) * del_M; % cm, structural length
ELWw_m  = L_m_c.^3 .* (1 + f_c * w_m + E_Rj* w_E/mu_E*(L_f_c>L_p_c)) * 1e3; % mg (-> 1e3), wet weight including reproduction buffer

% gaiac2016, females
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_fm1);
L_p_fm = L_m * l_p; L_j_fm = L_m * l_j;
tf = [tL_f1(1,1) f_fm1; (t_p-t_b)/k_M/TC_tL_f1 f_fm1; (t_p-t_b + tau_1)/k_M/TC_tL_f1 0];
[t L] = ode45(@dget_L, tL_f1(:,1), L_0_f*del_M, [], TC_tL_f1, L_b, L_p_fm, L_j_fm, L_m, v, g, tf, 0);
ELw_f1 = L/ del_M; % body length in cm females

% gaiac2016, males
tf = [tL_m1(1,1) f_fm1; (t_p-t_b)/k_M/TC_tL_f1 f_fm1; (t_p+tau_1-t_b)/k_M/TC_tL_f1 0];
[t L] = ode45(@dget_L, tL_m1(:,1), L_0_m*del_M, [], TC_tL_f1, L_b, L_p_fm, L_j_fm, L_mm, v, g_m, tf, 0);
ELw_m1 = L/ del_M; % body length in cm males
% 
% % time-length data gaiac2016 (varying temperature)
L_0_c = L_ini_c * del_M; % cm, structural length
L_0_w = L_ini_w * del_M; % cm, structural length
L_0_g = L_ini_g * del_M; % cm, structural length
pars_tj = [g k v_Hb v_Hp v_Rj tau_1];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_tL_w);
L_p_tL_w = L_m * l_p; L_j_tL_w = L_m * l_j; 
[t L] = ode45(@dget_L, tL_w(:,1), L_0_w, [], tTC_w, L_b, L_p_tL_w, L_j_tL_w, L_m, v, g, f_tL_w, 1);
ELw_w = L(:,1)/ del_M; % body length in cm
%
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_tL_c);
L_p_tL_c = L_m * l_p; L_j_tL_c = L_m * l_j; 
[t L] = ode45(@dget_L, tL_c(:,1), L_0_c, [], tTC_c, L_b, L_p_tL_c, L_j_tL_c, L_m, v, g, f_tL_c, 1);
ELw_c = L(:,1)/ del_M; % body length in cm
%
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_tL_g);
L_p_tL_g= L_m * l_p; L_j_tL_g = L_m * l_j; 
[t L] = ode45(@dget_L, tL_g(:,1), L_0_g, [], tTC_g, L_b, L_p_tL_g, L_j_tL_g, L_m, v, g, f_tL_g, 1);
ELw_g = L(:,1)/ del_M; % body length in cm

% temperaure - time since birth at emergence (gaiac2019)
TC_Ttj_g = tempcorr(C2K(Ttj_g(:,1)), T_ref, pars_T_c);
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g);
Etj_g = (t_j - t_b) /k_M ./ TC_Ttj_g;
% 
% gaiac2019 - head width
pars_tj = [g k v_Hb v_Hp v_Rj tau_1];
% 26°C
f_g8 = f_g26; f_g13 = f_g26; f_g18 = f_g26; f_g22 = f_g26; 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g26);
L_p26 = L_m * l_p;  L_j26 = L_m * l_j;
pars_R = [kap; kap_R; g; TC_tL_h1 * k_J; TC_tL_h1 * k_M; 0; TC_tL_h1 * v; U_Hb/ TC_tL_h1; U_Hp/ TC_tL_h1; U_Hp/ TC_tL_h1 + 1e-8];
tf = [0 f_g26; (t_p-t_b)/k_M/TC_tL_h1 f_g26; (t_p + tau_1-t_b)/k_M/TC_tL_h1 0];
[t L] = ode45(@dget_L, tL_h1(:,1), L_0*del_Mh, [], TC_tL_h1, L_b, L_p26, L_j26, L_m, v, g, tf, 0);
EL_h1 = L/ del_Mh;

% 22°C
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g22);
L_p22 = L_m * l_p;  L_j22 = L_m * l_j;
pars_R = [kap; kap_R; g; TC_tL_h2 * k_J; TC_tL_h2 * k_M; 0; TC_tL_h2 * v; U_Hb/ TC_tL_h2; U_Hp/ TC_tL_h2; U_Hp/ TC_tL_h2 + 1e-8];
tf = [0 f_g22; (t_p-t_b)/k_M/TC_tL_h2 f_g22; (t_p+tau_1-t_b)/k_M/TC_tL_h2 0];
[t L] = ode45(@dget_L, tL_h2(:,1), L_0*del_Mh , [], TC_tL_h2, L_b, L_p22, L_j22, L_m, v, g,tf, 0);
EL_h2 = L/ del_Mh;

% 18°C
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g18);
L_p18 = L_m * l_p; L_j18 = L_m * l_j;
pars_R = [kap; kap_R; g; TC_tL_h3 * k_J; TC_tL_h3 * k_M; 0; TC_tL_h3 * v; U_Hb/ TC_tL_h3; U_Hp/ TC_tL_h3; U_Hp/ TC_tL_h3 + 1e-8];
tf = [0 f_g18; (t_p-t_b)/k_M/TC_tL_h3 f_g18; (t_p+tau_1-t_b)/k_M/TC_tL_h3 0];
[t L] = ode45(@dget_L, tL_h3(:,1), L_0*del_Mh, [], TC_tL_h3, L_b, L_p18, L_j18, L_m, v, g,tf, 0);
EL_h3 = L/ del_Mh;

% 13°C
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g13);
L_p13 = L_m * l_p; L_j13 = L_m * l_j;
pars_R = [kap; kap_R; g; TC_tL_h4 * k_J; TC_tL_h4 * k_M; 0; TC_tL_h4 * v; U_Hb/ TC_tL_h4; U_Hp/ TC_tL_h4; U_Hp/ TC_tL_h4 + 1e-8];
tf = [0 f_g13; (t_p-t_b)/k_M/TC_tL_h4 f_g13; (t_p+tau_1-t_b)/k_M/TC_tL_h4 0];
[t L] = ode45(@dget_L, tL_h4(:,1), L_0*del_Mh, [], TC_tL_h4,L_b, L_p13, L_j13, L_m, v, g,tf, 0);
EL_h4 = L/ del_Mh;

% 8°C
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_g8);
L_p8 = L_m * l_p; L_j8 = L_m * l_j;
pars_R = [kap; kap_R; g; TC_tL_h5 * k_J; TC_tL_h5 * k_M; 0; TC_tL_h5 * v; U_Hb/ TC_tL_h5; U_Hp/ TC_tL_h5; U_Hp/ TC_tL_h5 + 1e-8];
tf = [0 f_g8; (t_p-t_b)/k_M/TC_tL_h5 f_g8; (t_p+tau_1-t_b)/k_M/TC_tL_h5 0];
[t L] = ode45(@dget_L, tL_h5(:,1), L_0*del_Mh , [], TC_tL_h5,L_b, L_p8, L_j8, L_m, v, g,tf, 0);
EL_h5 = L/ del_Mh;
% 
% Wing length - dry weight Lw-Wd (Swee2018)
L = Lw_Wd(:,1) * del_Mw; % cm, structural length
ELwWd  = L.^3 * (1 + f_S * w + E_Rj * w_E/mu_E)* dV * 1e3; % mg (-> 1e3), dry weight with reproduction buffer

% wing length - fecundity (number of hatchlings per female) (Swee2018)
L_w_N  = Lw_N(:,1);
LN_j = (L_w_N * del_Mw);
EN   = kap_R * E_Rj * LN_j.^3/ E_0;

% temperaure - time since birth at emergence (Swee2018)
TC_Ttj = tempcorr(C2K(Ttj(:,1)), T_ref, pars_T_c);
[t_j_S, t_p_S, t_b_S, l_j_S, l_p_S, l_b_S, l_i_S, rho_j_S, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_S);
Etj = (t_j_S - t_b_S) /k_M ./ TC_Ttj;
% 
% Starvation t-S data (Wagenführ, 20°C)
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep_reduced_feeding(pars_tj, f_W);
L_pS = L_m * l_p; L_jS = L_m * l_j;
tf = [0 f_W; (t_p-t_b)/k_M/TC_tS f_W; (t_p+tau_1-t_b)/k_M/TC_tS 0];

opts = odeset('Events',@starv,'RelTol', 1e-4, 'AbsTol', 1e-8);
[t ELHE] = ode45(@dget_ELHES, [0; 100], ELHES0, opts ,p, tf, TC_tS, L_b, L_pS, L_jS, g, 0);
ELHES_acl = ELHE(end,:); t0 = t(end); 

ELHES0 = [ELHES_acl(1); ELHES_acl(2); ELHES_acl(3); ELHES_acl(4);ELHES_acl(5);1];
[t ELHES] = ode45(@dget_ELHES, tS(:,1), ELHES0,[] ,p, 0, TC_tS, L_b, L_p_c, L_j_c, g, 0);
[t ELHES3] = ode45(@dget_ELHES, tS(:,1), ELHES0,[] ,p, tf, TC_tS, L_b, L_p_c, L_j_c, g, 0);


% oxygen consumption for different temperatures
p_ref = TC_22 * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
L_p_S = l_p_S * L_m; L_j_S = l_j_S * L_m; Wd_p_S = L_p_S^3*(1+f_S*w); % g, dry weight at puberty
L_T1 = (WJO_T1(:,1)./1000./ (1 + f_S * w + E_Rj * w_E/mu_E * (WJO_T1(:,1)>=Wd_p_S))) .^ (1/3);
for i=1:length(L_T1)
      if L_T1(i) > L_j_S
          L_T1(i) = L_j_S;
      end
end
p_ACSJGRD = p_ref * scaled_power_j(L_T1, f_S, pars_power, l_b, l_p, l_p);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_T1 = - 1e6 * 2 * 16 * J_M(3,:)' / 24; % ìg/h, O2 consumption for females

p_ref = TC_19_5 * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
L_T2 = (WJO_T2(:,1)./1000./ (1 + f_S * w + E_Rj * w_E/mu_E * (WJO_T2(:,1)>=Wd_p_S))) .^ (1/3);
for i=1:length(L_T2)
      if L_T2(i) > L_j_S
          L_T2(i) = L_j_S;
      end
end
p_ACSJGRD = p_ref * scaled_power_j(L_T2, f_S, pars_power, l_b, l_p, l_p);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_T2 = - 1e6 * 2 * 16 * J_M(3,:)' / 24; % ìg/h, O2 consumption for females

p_ref = TC_24_5 * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
L_T3 = (WJO_T3(:,1)./1000./ (1 + f_S * w + E_Rj * w_E/mu_E * (WJO_T3(:,1)>=Wd_p_S))) .^ (1/3);
for i=1:length(L_T3)
      if L_T3(i) > L_j_S
          L_T3(i) = L_j_S;
      end
end
p_ACSJGRD = p_ref * scaled_power_j(L_T3, f_S, pars_power, l_b, l_p, l_p);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_T3 = - 1e6 * 2 * 16 * J_M(3,:)' / 24; % ìg/h, O2 consumption for females

p_ref = TC_17 * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
L_T4 = (WJO_T4(:,1)./1000./ (1 + f_S * w + E_Rj * w_E/mu_E * (WJO_T4(:,1)>=Wd_p_S))) .^ (1/3);
for i=1:length(L_T4)
      if L_T4(i) > L_j_S
          L_T4(i) = L_j_S;
      end
end
p_ACSJGRD = p_ref * scaled_power_j(L_T4, f_S, pars_power, l_b, l_p, l_p);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_T4 = - 1e6 * 2 * 16 * J_M(3,:)' / 24; % ìg/h, O2 consumption for females

p_ref = TC_27 * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
L_T5 = (WJO_T5(:,1)./1000./ (1 + f_S * w + E_Rj * w_E/mu_E * (WJO_T5(:,1)>=Wd_p_S))) .^ (1/3);
for i=1:length(L_T5)
      if L_T5(i) > L_j_S
          L_T5(i) = L_j_S;
      end
end
p_ACSJGRD = p_ref * scaled_power_j(L_T5, f_S, pars_power, l_b, l_p, l_p);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_T5 = - 1e6 * 2 * 16 * J_M(3,:)' / 24; % ìg/h, O2 consumption for females

% 
% Body length - dry weight Lw-Wd (Swee2018)
L = L_Wd(:,1) * del_M; % cm, structural length
ELWd  = L.^3 .* (1 + f * w + E_Rj *(L>L_p)* w_E/mu_E) * dV * 1e3; % mg (-> 1e3), dry weight including reproduction buffer

% pack to output
prdData.tL_f = ELw_f;
prdData.tL_m = ELw_m;
prdData.tW_f = EWw_f;
prdData.tW_m = EWw_m;
prdData.LJO_f = EJO_f;
prdData.LJO_m = EJO_m;
prdData.tL_f1 = ELw_f1;
prdData.tL_m1 = ELw_m1;
prdData.tL_c = ELw_c;
prdData.tL_w = ELw_w;
prdData.tL_g = ELw_g;
prdData.Ttj = Etj;
prdData.tL_h1 = EL_h1;
prdData.tL_h2 = EL_h2;
prdData.tL_h3 = EL_h3;
prdData.tL_h4 = EL_h4;
prdData.tL_h5 = EL_h5;
prdData.Lw_Wd = ELwWd;
prdData.L_Wd = ELWd;
prdData.LWw_f = ELWw_f;
prdData.LWw_m = ELWw_m;
prdData.Lw_N = EN;
prdData.Ttj_g = Etj_g;
prdData.tS = ELHES(:,6);
prdData.tS_2 = ELHES(:,6);
prdData.tS_3 = ELHES3(:,6);
% prdData.tS = elS(:,3);
% prdData.tS_2 = elS(:,3);
% prdData.tS_3 = elS_3(:,3);
prdData.WJO_T1 = EJO_T1;
prdData.WJO_T2 = EJO_T2;
prdData.WJO_T3 = EJO_T3;
prdData.WJO_T4 = EJO_T4;
prdData.WJO_T5 = EJO_T5;
end

%% subfunctions:
function dELHES = dget_ELHES(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
      % larval development
      % t: time since birth

      % unpack variables    
      E  = ELHE(1); % J, reserve
      L  = ELHE(2); % cm, structural length
      EH = ELHE(3); % J, maturity
      E_R = ELHE(4); % J, reproduction buffer
      S = ELHE(6);
      
      p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); E_Rj = p(5); v = p(7); p_Am = p(8); kap = p(9);
      kap_G = p(10); J_X_Am = p(11);
      E_m = p(20); k_starv = p(21); e_critical = p(22); hb = p(23); L_S = p(24);

      if ~eVar
          p_M = p_M * TC; k_J = k_J * TC; v = v * TC; p_Am = p_Am * TC; J_X_Am = J_X_Am * TC;
      else
          tTC = spline1(t, TC);
          p_M = p_M * tTC; k_J = k_J * tTC; v = v * tTC; p_Am = p_Am * tTC; J_X_Am = J_X_Am * TC;
      end
            
      s_M = min(L, Lp)/Lb;

if length(tf) == 1
    f = tf;
else
    f = spline1(t, tf);
end
      
      % --- starvation module! ----
  if  kap * E  * v * s_M >= p_M * L^4 % section 4.1.5 comments to Kooy2010
    r = (L<Lj)* (E * v* s_M/ L - p_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
  else 
    r = (L<Lj)*(E * v* s_M/ L - p_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
  end
  % --- end starvation module! ----

      e = E/L^3/E_m;
      p_C = E * ( v * s_M/L - r);  % J/d, mobilisation rate

      dE = f * p_Am * s_M * L^2 - p_C;  % J/d, change in reserve
      dL = r * L/ 3 *(L<Lj);                    % cm/d, change in length
      dEH = ((1 - kap) * p_C - k_J * EH) * (EH < E_Hp);   % J/d, change in maturity  
      dE_R = ((1 - kap) * p_C - k_J * EH) * (EH >= E_Hp);      % J/d, change in reprod buffer
      dX = J_X_Am * s_M * f * L^2; % J/d; food consumption
      h_sh = k_starv * max(0, e_critical - e)/e_critical;
      dS = - S * (h_sh + hb); % 1/d, survival fraction
      dELHES = [dE; dL; dEH; dE_R; dX; dS];
end

%
function dL = dget_L(t, L, tTC, L_b, L_p, L_j, L_m, v, g, tf, eVar)
% computes changes in volumetric structural length in constant (eVar = 0)
% and variable environment (eVar = 1)

if ~eVar
    vT = v * tTC;
else
    vT = v * spline1(t, tTC);
end
if length(tf) == 1
    f = tf;
else
    f = spline1(t, tf);
end
s_M = min(L, L_p)/ L_b; % -, acceleration factor
r = vT *  (s_M *f/L - 1/ L_m)/ (f + g); % 1/d, spec growth rate

dL = L * r/3*(L < L_j); % cm/d, change in length 
end

function [value,isterminal,direction] = instars56(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
s1 = p(12); s2 = p(13); s3 = p(14); s4=p(15); s5 = p(16); s6 = p(17); s7 = p(18);
 value = [ELHE(2)-sqrt(s1*s2*s3*s4)*Lb; ELHE(2)-sqrt(s1*s2*s3*s4*s5)*Lb; ...
          ELHE(2)-sqrt(s1*s2*s3*s4*s5*s6)*Lb];
 isterminal = [0; 0; 1];
 direction = 0;
end

function [value,isterminal,direction] = instar7(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
s1 = p(12); s2 = p(13); s3 = p(14); s4=p(15); s5 = p(16); s6 = p(17); s7 = p(18);
value = ELHE(2)-sqrt(s1*s2*s3*s4*s5*s6*s7)*Lb;
 isterminal = 1;
 direction = 0;
end

function [value,isterminal,direction] = instar8(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
s1 = p(12); s2 = p(13); s3 = p(14); s4=p(15); s5 = p(16); s6 = p(17); s7 = p(18); s8 = p(19);
value = ELHE(2)-sqrt(s1*s2*s3*s4*s5*s6*s7*s8)*Lb;
 isterminal = 1;
 direction = 0;
end

function [value,isterminal,direction] = instar9(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
  % event function to detect emergence
 value = ELHE(2)-Lj;
 isterminal = 1;
 direction = 0;
end

function [value,isterminal,direction] = starv(t, ELHE, p, tf, TC, Lb, Lp, Lj, g, eVar)
  LS = p(24);
 value = ELHE(2)-LS;
 isterminal = 1;
 direction = 0;
end

%%
function [tj, tp, tb, lj, lp, lb, li, rj, rB, info] = get_tj_hep_reduced_feeding(p, f)
  % modified version get_tj_hep to include the decrease in feeding during the last instars  
  
   
  %% Description
  % Obtains scaled ages at emerence, puberty, birth and the scaled lengths at these ages for hep model of e.g. ephemeropterans;
  % Food density is assumed to be constant.
  % Multiply the result with the somatic maintenance rate coefficient to arrive at unscaled ages. 
  % Metabolic acceleration occurs between b and p; isomorphy between p and j ( = emergence, e.g. transition from nymph to sub-imago). 
  % Notice j-p-b sequence in output, due to the name of the routine
  %
  % Input
  %
  % * p: 5 with parameters: g, k, v_H^b, v_H^p, v_R^j 
  % * f: optional scalar with functional response (default f = 1)
  %  
  % Output
  %
  % * tj: scaled age at emergence \tau_j = a_j k_M
  % * tp: scaled age at puberty \tau_p = a_p k_M
  % * tb: scaled age at birth \tau_b = a_b k_M
  % * lj: scaled length at emergence
  % * lp: scaled length at puberty = end of acceleration
  % * lb: scaled length at birth = start of acceleration
  % * li: ultimate scaled length
  % * rj: scaled exponential growth rate between b and p
  % * rB: scaled von Bertalanffy growth rate between p  between j
  % * info: indicator equals 1 if successful, 0 otherwise
  
  % unpack pars
  g   = p(1); % energy investment ratio
  k   = p(2); % k_J/ k_M, ratio of maturity and somatic maintenance rate coeff
  vHb = p(3); % v_H^b = U_H^b g^2 kM^3/ (1 - kap) v^2; U_H^b = E_H^b/ {p_Am} start acceleration
  vHp = p(4); % v_H^p = U_H^p g^2 kM^3/ (1 - kap) v^2; U_H^p = E_H^p/ {p_Am} end acceleration
  vRj = p(5); % (kap/(1 - kap)) [E_R^j]/ [E_G] scaled reprod buffer density at emergence 
  tau_1 = p(6); % -, scaled time since puberty when f_min is reached

  if ~exist('f', 'var')
    f = 1;
  elseif isempty(f)
    f = 1;
  end

  pars_tj = [g k 0 vHb vHp vHp + 1e-8]; % vHp functions as vHj in get_tj
  [tp, tpp, tb, lp, lpp, lb, li, rj, rB, info] = get_tj(pars_tj, f);
  sM = lp/ lb; % -, acceleration factor
  
  tf = [tp f; tp+tau_1 0];
  options = odeset('Events', @density, 'RelTol', 1e-08, 'AbsTol', 1e-08);
  [t, lvRe] = ode45(@dget_tj_hep, [tp; 50], [lp; 0; f], options, tf, sM, rB, li, g, k, vHp, vRj);
  lj = lvRe(end,1);  % -, scaled length at pupation
  tj = t(end);       % -, scaled age at pupation

        
end

%% subfunction
function dlvRe = dget_tj_hep(t, lvRe, tf, sM, rB, li, g, k, vHp, vRj)
  l = lvRe(1); % -, scaled length
  vR = lvRe(2);
  e = lvRe(3); % -, scaled reserve

  f = spline1(t, tf);
  r = g * (e*sM/l-1)/(e+g);       % 1/d, specific growth rate 

  dl = r*l/3;

  dvR = (e * g * sM/ l + e)/ (g + e) - k * vHp/ l^3 - r * vR;
  de = (f-e)*g*sM/l;

  dlvRe = [dl; dvR; de]; % pack output
end

function [value,isterminal,direction] = density(t, lvRe, tf, sM, rB, li, g, k, vHp, vRj)
 value = vRj - lvRe(2); 
 isterminal = 1;
 direction = 0;
end
