function [prdData, info] = predict_Lucania_goodei(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

%% zero-variate data   
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% initial
U_E0 = initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v], L_m * l_b); % d.cm^2, initial scaled reserve

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, total length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
aT_b = tau_b/ kT_M;               % d, age at birth

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, total length at puberty at f
Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at metam

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate total length at f
Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % #/d, max reproduction rate

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ kT_M;                     % d, mean life span at T

% % males
% p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
% E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
% g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
% m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
% w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
% L_mm = v/ k_M/ g_m;                  % cm, max struct length
% pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
% [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
% L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
% Ww_im = L_im^3*(1 + f * w_m);        % g, ultimate wet weight

% pack to output
prdData.ab = aT_b;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i; 
prdData.Wwb = Ww_b;
prdData.Wwp = Ww_p;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;

%% uni-variate data

% time-length
[a, LUH] = ode45(@dget_LUH, [0;tL(:,1)], [1e-3; U_E0/TC; 1e-3], [], kap, v*TC, k_J*TC, g, L_m);
a(1) = []; LUH(1,:) = []; LUH_b = spline1(7.8, [a,LUH]); % LUH at birth
t_b = 7.8*kT_M; e_b = LUH_b(2) * p_Am/ E_m; l_b = LUH_b(1)/ L_m; 
tvel = get_tj(pars_tj, f_tL, [t_b, e_b, l_b], [0; tL(tL(:,1)>7.8,1)-7.17]*kT_M);
tvel(1,:)= []; L_bi = L_m * tvel(:,4); L = LUH(:,1); L(tL(:,1)>7.8) = L_bi; ELw = L/ del_M;

% pack predictions:
prdData.tL = ELw;

end
