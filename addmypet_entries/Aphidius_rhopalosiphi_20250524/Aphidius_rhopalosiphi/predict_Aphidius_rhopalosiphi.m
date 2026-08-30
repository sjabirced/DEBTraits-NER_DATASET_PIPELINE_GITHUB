function [prdData, info] = predict_Aphidius_rhopalosiphi(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

filterChecks = E_Hp < E_Hb || ...
    t_0 < 0 || hatchrate < 0 || hatchrate > 1;

if filterChecks
    prdData = []; info = 0; return
end

% compute temperature correction factors
TC_10 = tempcorr(C2K(10), T_ref, T_A);
TC_195 = tempcorr(C2K(19.5), T_ref, T_A);
TC_18 = tempcorr(C2K(18), T_ref, T_A);
TC_20 = tempcorr(C2K(20), T_ref, T_A);
TC_23 = tempcorr(C2K(23), T_ref, T_A);
TC_T_aj = tempcorr(C2K(Taj(:,1)), T_ref, T_A);
TC_T_te = tempcorr(C2K(Tte(:,1)), T_ref, T_A);
TC_T_N5h = tempcorr(C2K(TN5h(:,1)), T_ref, T_A);
TC_T_aj2 = tempcorr(C2K(Taj2(:,1)), T_ref, T_A);
TC_T_te2 = tempcorr(C2K(Tte2(:,1)), T_ref, T_A);

% zero-variate data

% life cycle
pars_tj = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
[tau_j, tau_e, tau_p, tau_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj, f);
if ~info; prdData = []; return; end

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy
Ww_0 = E_0 * w_E/ mu_E/ d_E; % g, initial wet weight

% birth (hatch from cellular trophamnion inside host)
L_b  = L_m * l_b;                      % cm, structural length at birth
a_b  = tau_b/ k_M + t_0;  aT_b  = a_b/ TC_195; % d, age at birth
Ww_Ej = L_b^3 * f * w;                 % g, wet weight reserve at birth
Ww_b = L_b^3 + Ww_Ej;                  % g, total wet weight at birth

% pupation (mummification)
L_j  = L_m * l_j;                  % cm, structural length at pupation
aT_j = (tau_j/ k_M + t_0)/ TC_23;    % d, age at pupation

Ww_Ej = L_j^3 * f * w;                 % g, wet weight reserve at pupation
Ww_Rj = E_Rj * L_j^3 * w_E/ mu_E/ d_E; % g, wet weight repod buffer at pupation
Ww_j = L_j^3 + Ww_Ej + Ww_Rj;          % g, total wet weight at pupation
Wd_j = L_j^3 * d_V + Ww_Ej * d_E + Ww_Rj * d_E; % g, total dry weight at pupation

% emergence
L_e = L_m * l_e;                     % cm, structural length at emergence
Lw_e = L_e/ del_M;                   % cm, length at emergence
tT_e = (tau_e - tau_j)/ k_M/ TC_23;  % d, time since pupation at emergence
aT_e = (tau_e/ k_M + t_0)/ TC_10;    % d, age at emergence

E_e = u_Ee * g * E_m * L_m^3;          % J, reserve at emergence
Ww_Ee = E_e * w_E/ mu_E/ d_E;          % g, wet weight reserve at emergence
Ww_Re = Ww_Rj;                         % g, wet weight repod buffer at emergence (unchanged since pupation)
Ww_e = L_e^3 + Ww_Ee + Ww_Re;          % g, total wet weight at emergence
Wd_e = L_e^3 * d_V + Ww_Ee * d_E + Ww_Re * d_E; % g, total dry weight at emergence

% reproduction
N_i = E_Rj * L_j^3 * kap_R / E_0;  % #, total theoretical reproduction (eggs deposited)
N_ih = N_i * hatchrate;    % #, total successful reproduction (eggs hatched)

% 24 h parasitization success with 100 aphids offered
H3X = (100^H3_k) / (H3_Khs^H3_k + (100^H3_k)); % Holling type III with 100 aphids
% successfully parasitized aphids per day during the linear phase (later declining):
drc = @(x) declinefunction(x, repro_b, repro_e, H3X * TC_20 * afRp);
R1d_lin = (E_Rj * L_j^3 * kap_R / E_0 * hatchrate) ./ integral(drc, 0, Inf, 'ArrayValued', true);
% compute cumulative parasitization during 24 h after 48 h
R24h = R1d_lin * integral(drc, 2, 3, 'ArrayValued', true);

prdData.N24h = R24h;

% respiration at (and after) emergence at 20 C
pTG_e = 0;                                             % J/d, growth flux at emergence = 0
pTs_e = TC_20 * p_M * L_e^3;                           % J/d, somatic maintenance flux at emergence
pTJ_e = TC_20 * k_J * E_He;                            % J/d, maturity maintenance flux at emergence
pTD_e = pTs_e + pTJ_e;                                 % J/d, dissipation flux at emergence
pTA_e = pTD_e;                                         % J/d, assimilation flux at emergence
JT_M_e = -(n_M\ n_O) * eta_O * [pTA_e, pTD_e, pTG_e]'; % mol/d, mineral fluxes (J_C, J_H, J_O, J_N in rows)
JT_C_e = JT_M_e(1) * 24.4 * 1e6/ 24;                   % muL CO2/h, CO2 production (with 24.4 L CO2/mol)

% life span
% this may produce error warnings if h_a is fitted together with the other parameters in unrealistic ranges.
% if so, first fit all parameters except h_a and then fix all except h_a and fit only h_a.
% in the first step, it helps to comment out the life span data and predictions to save on computational time.
pars_tm = [g; k; v_Hb; v_Hp; v_Rj; v_He; kap; kap_V; h_a/ k_M^2; s_G];
tau_jm = get_tm_mod('hax', pars_tm, f); % -, scaled mean life span since pupation at T_ref
tau_em = tau_jm - (tau_e - tau_j); % -, scaled mean life span since emergence at T_ref
tT_em = tau_em/ k_M/ TC_18; % d, Mean life span since emergence at 18 C

% pack to output
prdData.ab = aT_b;
prdData.aj = aT_j;
prdData.te = tT_e;
prdData.ae = aT_e;
prdData.Le = Lw_e;
prdData.Ww0 = Ww_0;
prdData.Wdj = Wd_j;
prdData.Wwj = Ww_j;
prdData.Wdj2 = Wd_j;
prdData.Wwe = Ww_e;
prdData.Wde = Wd_e;
prdData.Ni = N_i;
prdData.Nih = N_ih;
prdData.am = tT_em;
prdData.JCe = JT_C_e;

% univariate data
% Note: potentially different f-values needed for different studies

% time - wet weight
% ode simulations to obtain wet weights of individual compartments
pars_tj = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
[tau_j, tau_e, tau_p, tau_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj, f);
% E_b = p_Am/ v * L_b^3; L_b = L_m * l_b; L_p = L_m * l_p;
% LEHR_0 = [L_b; E_b; E_Hb; 0]; % pack initial conditions (birth)
LEHR_0 = [0.000001; E_0; 0; 0]; % pack initial conditions (embryo)
par_LEHR = [TC_195, f, L_b, L_m * l_p, p_Am, v, kap, p_M, k_J, E_G, E_Hb, E_Hp, kap_G]; % pack parameters
[t, LEHR] = ode45(@get_LEHR, [0 50], LEHR_0, odeset, par_LEHR); % ODE simulation
Ww_L3 = (interp1(t(:), LEHR(:,1), tWw(:,1) - t_0/TC_195)).^3; % g, wet weight structure over time
Ww_E = (interp1(t(:), LEHR(:,2), tWw(:,1) - t_0/TC_195)) .* w_E/ mu_E/ d_E; % g, wet weight reserve over time
Ww_R = (interp1(t(:), LEHR(:,4), tWw(:,1) - t_0/TC_195)) .* w_E/ mu_E/ d_E; % g, wet weight reproduction buffer over time
EWw = Ww_L3 + Ww_E + Ww_R; % g, total wet weight over time

% temperature - development time & reproduction
pars_tj = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
[tau_j, tau_e, tau_p, tau_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj, f);

% development times at different temperatures
T_a_j = (tau_j ./ k_M + t_0)./ TC_T_aj; % d, age at mummification
T_t_e = (tau_e - tau_j) ./ k_M ./ TC_T_te; % d, time from mummy to adult
T_a_j2 = (tau_j ./ k_M + t_0)./ TC_T_aj2; % d, age at mummification (different study)
T_t_e2 = (tau_e - tau_j) ./ k_M ./ TC_T_te2; % d, time from mummy to adult (different study)

% 5 h parasitization success at different temperatures with 100 aphids offered
L_j  = L_m * l_j; % cm, structural length at pupation
E_Rj_abs = v_Rj * (1 - kap) * g * E_m * L_j^3; % J, reproduction buffer at pupation
H3X = (100^H3_k) / (H3_Khs^H3_k + (100^H3_k)); % Holling type III with 100 aphids
% successfully parasitized aphids per day during the linear phase (later declining):
drc = @(x) declinefunction(x, repro_b, repro_e, H3X * TC_T_N5h);
R1d_lin_T = (E_Rj_abs * kap_R / E_0 * hatchrate) ./ integral(drc, 0, Inf, 'ArrayValued', true);
% compute cumulative parasitization during first 5h
N5h_T = R1d_lin_T .* integral(drc, 0, 5/24, 'ArrayValued', true); 

% reproduction

% Holling type III functional response of 24h successful parasitization number at different host abundances X
H3X = (XN24h(:,1).^H3_k) ./ (H3_Khs^H3_k + (XN24h(:,1).^H3_k)); % Holling type III with 5, 10 ,20, 40, 100 aphids
% successfully parasitized aphids per day during the linear phase (later declining):
drc = @(x) declinefunction(x, repro_b, repro_e, H3X * TC_18);
R1d_lin_X = (E_Rj_abs * kap_R / E_0 * hatchrate) ./ integral(drc, 0, Inf, 'ArrayValued', true);
% compute cumulative parasitization for 24 h
N24h_X = R1d_lin_X .* integral(drc, 0, 1, 'ArrayValued', true);

% successful parasitization over time at 40 aphids per day in 1 d intervals
H3X = (40^H3_k) / (H3_Khs^H3_k + (40^H3_k)); % Holling type III with 40 aphids
% successfully parasitized aphids per day during the linear phase (later declining):
drc = @(x) declinefunction(x, repro_b, repro_e, H3X * TC_18);
R1d_lin = (E_Rj_abs * kap_R / E_0 * hatchrate) ./ integral(drc, 0, Inf);
% cumulative successful reproduction over time
EN = zeros(length(tN(:,1)), 1); % preallocation of output vector
for i = 1:length(tN(:,1))
    t = tN(i,1);
    EN(i) = integral(drc, 0, t) * R1d_lin;
end

% pack to output
prdData.Taj = T_a_j;
prdData.Tte = T_t_e;
prdData.Taj2 = T_a_j2;
prdData.Tte2 = T_t_e2;
prdData.tWw = EWw;
prdData.TN5h = N5h_T;
prdData.XN24h = N24h_X;
prdData.tN = EN;

end

%% subfunctions

%%
% ODE system of the hax model egg and larval stage (behaves like abj)
function [dLEHRS] = get_LEHR(t, LEHRS, par_LEHRS)

% Read parameters
TC    = par_LEHRS(1); % -, Temperature correction
f     = par_LEHRS(2); % -, Functional response
L_b   = par_LEHRS(3); % cm, Structural length at birth
L_p   = par_LEHRS(4); % cm, Structural length at puberty
p_Am  = par_LEHRS(5); % J / d.cm^2, Surface-area specific maximum assimilation rate
v     = par_LEHRS(6); % cm/d, Energy conductance
kap   = par_LEHRS(7); % -, Allocation fraction to soma
p_M   = par_LEHRS(8); % J/d.cm^3, Vol-spec somatic maint
k_J   = par_LEHRS(9); % 1/d, Maturity maint rate coefficient
E_G   = par_LEHRS(10); % J/cm^3, Spec cost for structure
E_Hb  = par_LEHRS(11); % J, Maturity at birth
E_Hp  = par_LEHRS(12); % J, Maturity at puberty
kap_G = par_LEHRS(13); % -, Growth efficiency

% Initialize state variables
L       = LEHRS(1); % cm, Structural length
E       = LEHRS(2); % J, Energy in reserve
E_H     = LEHRS(3); % # J, Energy invested in maturity
E_R     = LEHRS(4); % # J, Cumulative energy in reproduction buffer

% Metabolic acceleration (Type M)
s_M = max(1, (min(L, L_p) / L_b)); % Acceleration factor
p_Am_M = p_Am * s_M; % Metabolic acceleration affects p_Am
v_M = v * s_M; % Metabolic acceleration affects v

% Scaled reserve density (to check for starvation)
e = E * v / (L^3 * p_Am);

% Scaled structural length (to check for starvation)
l = L * p_M / (kap * p_Am);

% Assimilation flux (from birth until pupation)
if (E_H < E_Hb)
    p_A = 0; % J/d increase in maturation
else
    p_A = f * p_Am_M * L^2; % DEB Book 3rd ed. Eq. 2.3
end

% Somatic maintenance flux
p_S = p_M * L^3;

% Maturity maintenance flux
p_J = k_J * E_H; % DEB Book 3rd ed. Eq. 2.19

% Growth rate
if E*v_M/L > p_S/kap
    r = (E / L^3 * v_M / L - (p_S / L^3 / kap)) / (E / L^3 + E_G / kap);
else
    r = (E / L^3 * v_M / L - (p_S / L^3 / kap)) / (E / L^3 + E_G * kap_G^2 / kap);
end

% Mobilization flux
p_C = E * (v_M / L - r); % DEB Book 3rd ed. Eq. 2.12

% Reproduction flux
p_R = (1 - kap) * p_C - p_J; % DEB Book 3rd ed. Eq. 2.18

% Changes in state variables
dL = L * r / 3; % DEB Book 3rd ed. Chap. 2.6.1
dE = p_A - p_C; % DEB Book 3rd ed. Chap. 2.3

if E_H < E_Hp
    dE_H = p_R;
    dE_R = 0;
else
    dE_H = 0;
    dE_R = p_R;
end

dLEHRS = [dL; dE; dE_H; dE_R] * TC; % collect derivatives
end

function drc = declinefunction(x, repro_b, repro_e, H3XTC)
% computes log-logistic curve to model decline of reproduction over time
drc = (1 ./ (1 + exp(repro_b * (log10(x * H3XTC) - log10(repro_e)))));
end

