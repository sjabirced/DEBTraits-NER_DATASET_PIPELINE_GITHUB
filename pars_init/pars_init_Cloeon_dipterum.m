function [par, metaPar, txtPar] = pars_init_Cloeon_dipterum(metaData)

metaPar.model = 'hep'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8233.6835;  free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.29154;      free.z     = 0;   units.z = '-';            label.z = 'zoom factor for female'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0043059;    free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.72004;    free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 181.8121;   free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.030818;   free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5896.2613;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.663e-03; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.169e+00; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_Rj = 2031.9125;  free.E_Rj  = 0;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at emergence'; 
par.h_a = 2.204e-03;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L_0 = 0.033016;   free.L_0   = 0;   units.L_0 = 'cm';         label.L_0 = 'initial length for gaia2019 head length data'; 
par.L_0_f = 0.21458;  free.L_0_f = 0;   units.L_0_f = 'cm';       label.L_0_f = 'initial length for gaia2016 data'; 
par.L_0_m = 0.21799;  free.L_0_m = 0;   units.L_0_m = 'cm';       label.L_0_m = 'initial length for gaia2016 data'; 
par.L_ini_W = 0.652;  free.L_ini_W = 0;   units.L_ini_W = 'cm';     label.L_ini_W = 'initial length tS (Wage2015)'; 
par.L_ini_c = 0.2678;  free.L_ini_c = 0;   units.L_ini_c = 'cm';     label.L_ini_c = 'initial length tL_c (gaia2016, winter)'; 
par.L_ini_g = 0.3574;  free.L_ini_g = 0;   units.L_ini_g = 'cm';     label.L_ini_g = 'initial length tL (gaia2016, summer)'; 
par.L_ini_w = 0.2678;  free.L_ini_w = 0;   units.L_ini_w = 'cm';     label.L_ini_w = 'initial length tL_w (gaia2016, winter)'; 
par.T_AL = 71720.4054;  free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for lower boundary'; 
par.T_L = 283.9374;   free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary  temperature'; 
par.dV = 0.076397;    free.dV    = 0;   units.dV = 'need to put';  label.dV = 'scalar with specific density in g/cm^3 of dry mass'; 
par.del_M = 0.20236;  free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mh = 1.5349;  free.del_Mh = 0;   units.del_Mh = '-';       label.del_Mh = 'shape coefficient for head length'; 
par.del_Mw = 0.28676;  free.del_Mw = 0;   units.del_Mw = '-';       label.del_Mw = 'shape coefficient for wing length'; 
par.del_Y = 1.4103;   free.del_Y = 0;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.e_critical = 0.20888;  free.e_critical = 1;   units.e_critical = '-';   label.e_critical = 'critical reserve density'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_7 = 0.59805;    free.f_7   = 0;   units.f_7 = '-';          label.f_7 = 'scaled functional responce for instar 7'; 
par.f_8 = 0.3979;     free.f_8   = 0;   units.f_8 = '-';          label.f_8 = 'scaled functional responce for instar 8'; 
par.f_9 = 0.022049;   free.f_9   = 0;   units.f_9 = '-';          label.f_9 = 'scaled functional responce for instar 9'; 
par.f_HFT = 1;        free.f_HFT = 0;   units.f_HFT = '-';        label.f_HFT = 'scaled functional response for HFT'; 
par.f_LFT = 0.1183;   free.f_LFT = 0;   units.f_LFT = '-';        label.f_LFT = 'scaled functional response for LFT'; 
par.f_MFT = 0.32209;  free.f_MFT = 0;   units.f_MFT = '-';        label.f_MFT = 'scaled functional response for MFT'; 
par.f_S = 0.48064;    free.f_S   = 0;   units.f_S = '-';          label.f_S = 'scaled functional response for Swee2018 data'; 
par.f_W = 1;          free.f_W   = 0;   units.f_W = '-';          label.f_W = 'scaled functional response (Wage2015)'; 
par.f_c = 0.13238;    free.f_c   = 0;   units.f_c = '-';          label.f_c = 'scaled functional response for Cian1979 data'; 
par.f_fm1 = 0.82284;  free.f_fm1 = 0;   units.f_fm1 = '-';        label.f_fm1 = 'scaled functional response for tL data (gaia2016)'; 
par.f_g = 1;          free.f_g   = 0;   units.f_g = '-';          label.f_g = 'scaled functional response for gaia2019 data'; 
par.f_g13 = 0.51646;  free.f_g13 = 0;   units.f_g13 = '-';        label.f_g13 = 'scaled functional response for gaia2019 data, 13oC'; 
par.f_g18 = 0.66012;  free.f_g18 = 0;   units.f_g18 = '-';        label.f_g18 = 'scaled functional response for gaia2019 data, 18oC'; 
par.f_g22 = 0.63828;  free.f_g22 = 0;   units.f_g22 = '-';        label.f_g22 = 'scaled functional response for gaia2019 data, 22oC'; 
par.f_g26 = 0.43476;  free.f_g26 = 0;   units.f_g26 = '-';        label.f_g26 = 'scaled functional response for gaia2019 data, 26oC'; 
par.f_g8 = 0.59478;   free.f_g8  = 0;   units.f_g8 = '-';         label.f_g8 = 'scaled functional response for gaia2019 data, 8oC'; 
par.f_tL_c = 0.239246;  free.f_tL_c = 0;   units.f_tL_c = '-';       label.f_tL_c = 'scaled functional response for tL data (gaia2016 semifield winter, cold)'; 
par.f_tL_g = 0.17431;  free.f_tL_g = 0;   units.f_tL_g = '-';       label.f_tL_g = 'scaled functional response for tL data (gaia2016 semifield summer)'; 
par.f_tL_w = 0.15387;   free.f_tL_w = 0;   units.f_tL_w = '-';       label.f_tL_w = 'scaled functional response for tL data (gaia2016 semifield winter, warm)'; 
par.h_b = 0.0029287;  free.h_b   = 1;   units.h_b = '1/d';        label.h_b = 'background hazard rate (Wage2015)'; 
par.s_1 = 12.0188;    free.s_1   = 0;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 1.8729;     free.s_2   = 0;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 2.5675;     free.s_3   = 0;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 1.112;      free.s_4   = 0;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_4^2/ L_3^2'; 
par.s_5 = 1.7856;     free.s_5   = 0;   units.s_5 = '-';          label.s_5 = 'stress at instar 5: L_5^2/ L_4^2'; 
par.s_6 = 1.6889;     free.s_6   = 0;   units.s_6 = '-';          label.s_6 = 'stress at instar 6: L_6^2/ L_5^2'; 
par.s_7 = 1.3187;     free.s_7   = 0;   units.s_7 = '-';          label.s_7 = 'stress at instar 7 (N1): L_7^2/ L_6^2'; 
par.s_8 = 1.1995;     free.s_8   = 0;   units.s_8 = '-';          label.s_8 = 'stress at instar 8 (N2): L_8^2/ L_7^2'; 
par.k_starv = 0.21833;  free.k_starv = 1;   units.k_starv = '1/d';   label.k_starv = 'starvation rate coefficient'; 
par.tau_1 = 2.2086;   free.tau_1 = 0;   units.tau_1 = '-';        label.tau_1 = 'scaled time related to time-variable f: end of decrease'; 
par.y_cl = 0.36401;   free.y_cl  = 0;   units.y_cl = 'g/mol';     label.y_cl = 'conversion from mol of periphyton to g of chlorophyl'; 
par.z_m = 0.2907;     free.z_m   = 0;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
