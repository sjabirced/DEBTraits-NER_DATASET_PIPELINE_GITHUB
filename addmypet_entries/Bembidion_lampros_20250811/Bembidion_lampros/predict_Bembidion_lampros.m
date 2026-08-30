
function [prdData, info] = predict_Bembidion_lampros(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if  (E_Hp < E_Hb) || T_L > T_ref || T_H < T_ref || h_a < 0 || s_G < 0 || k_E < 0
    prdData = []; info=0;  return;
end

% Compute temperature correction factors
pars_T = [T_A, T_L, T_H, T_AL, T_AH];

TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC_t1 = tempcorr(temp.t1, T_ref, pars_T);
TC_t2 = tempcorr(temp.t2, T_ref, pars_T);
TC_t3 = tempcorr(temp.t3, T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);

TC_T_tj = tempcorr(C2K(data.T_tj(:,1)), T_ref, pars_T); TC_T_tj = TC_T_tj(:);
TC_T_ab = tempcorr(C2K(data.T_ab(:,1)), T_ref, pars_T); TC_T_ab = TC_T_ab(:);
TC_T_te = tempcorr(C2K(data.T_te(:,1)), T_ref, pars_T); TC_T_te = TC_T_te(:);
TC_T_Ri = tempcorr(temp.Ri, T_ref, pars_T);

% zero-variate data

% life cycle
pars_tj = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
[tau_j, tau_e, tau_p, tau_b, l_j, l_e, l_p, l_b, l_i, rho_j, r_B, u_Ee, info] = get_tj_hax(pars_tj, f);
if info == 0 || any(isnan([tau_j, tau_e, tau_b, l_b, l_j, l_e, l_i]))
    prdData = []; info = 0; return;
end

% initial
 u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
 E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content
 Ww_0 = E_0 * w_E/ mu_E/ d_E*1000;          % ug, initial wet weight  
%Lw_0 = (E_0 * w_E/ mu_E/ d_E)/^(1/3) del_Y; % cm, egg diameter
 Vw_0 = (E_0 * w_E/ mu_E/ d_E); % cm^3, egg volume with density of 1g/cm3

% birth
a_b = tau_b/k_M/TC_ab; % d, age at birth
L_b = L_m * l_b;  % cm, structural length at birth

% larvae
L_1 = L_b * s_1^0.5; % cm, structural length at 1st instar
L_2 = L_1 * s_2^0.5; % cm, structural length at 2nd instar
L_3 = L_2 * s_3^0.5; % cm, structural length at 3rd insta
Lw_1 = L_1/del_M_L; % cm, physical length at 1st instar
Lw_2 = L_2/del_M_L; % cm, physical length at 2nd instar
Lw_3 = L_3/del_M_L; % cm, physical length at 3rd instar
s_M = l_j/ l_b; % -, acceleration factor
r_j = g * k_M * (f/ l_b - 1)/ (f + g); % 1/d, specific growth rate
t_1 = log(L_1 / L_b) * 3 / r_j / TC_t1; % d, time since birth at 1st instar
t_2 = log(L_2 / L_1) * 3 / r_j / TC_t2; % d, time since 1st instar at 2nd instar
t_3 = log(L_3 / L_2) * 3 / r_j / TC_t3; % d, time since 2nd instar at 3rd instar
Ww_L = L_3^3 * (1 + f * w) * 1000; % mg, wet weight of 3rd instar larva



% pupa
%L_e = L_m * l_e; % cm, structural length of pupa
%Lw_e = L_e / del_M_P;       % Pupa -> shape factor del_M_P
%Ww_P = L_e^3 * (1 + f * w) * 1000; % mg, wet weight of pupa

% imago
L_i = L_m * l_i; % cm, structural length of imago
Lw_i = L_m * l_i / del_M_I; % Imago (Adult) -> shape factor del_M_I
Ww_i = L_i^3 * (1 + f * w)*1000;       % mg, ultimate wet weight

%if del_M_L <= 0 || del_M_P <= 0 || del_M_I <= 0
if del_M_L <= 0 || del_M_I <= 0
prdData = []; info = 0; return;
end

% life span
pars_tm = [g; k; l_T; v_Hb; v_Hp; h_a/k_M^2; s_G]; % compose parameter vector 
tau_m = get_tm(pars_tm, f); % -, scaled mean life span
a_m = tau_m/ k_M/ TC_am; % d, mean life span

% pack to output zero-variate data
prdData.ab = a_b;
prdData.t1 = t_1;
prdData.t2 = t_2;
prdData.t3 = t_3;
prdData.am = a_m;
prdData.L1 = Lw_1;
prdData.L2 = Lw_2;
prdData.L3 = Lw_3;
prdData.Li = Lw_i;
%prdData.Le = Lw_e;
prdData.V0 = Vw_0;
prdData.Wwi = Ww_i; 
prdData.Ww0 = Ww_0;
prdData.WwL = Ww_L;
%prdData.WwP = Ww_P;

% uni-variate data

% development time (larva to imago) at multiple temperatures
prdData.T_tj = (tau_e - tau_b) ./ (k_M .* TC_T_tj(:));

% egg development at multiple temperatures
prdData.T_ab = tau_b ./ (k_M .* TC_T_ab(:));

% pupal development at multiple temperatures
prdData.T_te = (tau_e - tau_j) ./ (k_M .* TC_T_te(:));

% Reproduction over time
if isfield(data, 't_Ri')
    t = data.t_Ri(:,1); % Time points of egg laying (e.g. 0–60 days after reproduction start see Pete1998)
   
    % Calculate E_m and scaled maturities
    p_Am = z * p_M / kap;
    E_m = p_Am / v;
    U_Hb = E_Hb / E_m;
    U_Hp = E_Hp / E_m;

    % Parameters for reproduction
    pars_R = [kap; kap_R; g; k_J; k_M; 0; v; U_Hb; U_Hp]; % L_T = 0

    % Cumulative reproduction without aging
    TC = TC_T_Ri;
    EN_raw = cum_reprod(t, f, pars_R) * TC;

    % Daily reproduction rate
    R_daily = diff([0; EN_raw]);

    % Gompertz + Weibull aging effect
    S_g = exp(-s_G * (exp(k_J * t) - 1) / k_J);  % Gompertz
    S_w = exp(-h_a * t.^2);                     % Weibull
    S_combined = S_g .* S_w;                    % Combined survival

    % Adjusted daily reproduction rate
    R_adj = R_daily .* S_combined;

    % Cumulative reproduction with aging
    EN = cumsum(R_adj);

    % Output
    prdData.t_Ri = EN;

    if isfield(data, 'Ri')
        prdData.Ri = EN(end);
    end
end
end
