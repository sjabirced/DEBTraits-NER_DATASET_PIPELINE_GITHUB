function [par, metaPar, txtPar] = pars_init_Spodoptera_frugiperda(metaData)

metaPar.model = 'hax'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 1.034e+04;  free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.492;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.09365;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.8;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.007903;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9705;     free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 0.1048;   free.kap_V = 1;   units.kap_V = '-';        label.kap_V = 'conversion efficient E -> V -> E'; 
par.p_M = 52.86;      free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5404;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.0002651; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 0.213;     free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_He = 18.54;     free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.E_Rj = 171.6;     free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at pupation'; 
par.h_a = 1.000e-04;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_A1 = 9536.1173; free.T_A1  = 0;   units.T_A1 = 'K';         label.T_A1 = 'Arrhenius temperature for 1st instar'; 
par.T_AH = 8.594e+04; free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at lower boundary temperature'; 
par.T_AL = 1154;      free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary temperature'; 
par.T_H = 309.3;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary temperature'; 
par.T_L = 286.1;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary temperature'; 
par.del_M = 0.1432;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for body length of the larva'; 
par.del_Mp = 0.2765;  free.del_Mp = 1;   units.del_Mp = '-';      label.del_Mp = 'shape coefficient for body length of the pupa'; 
par.del_Mh = 1.198 ;  free.del_Mh = 1;   units.del_Mh = '-';      label.del_Mh = 'shape coefficient for larva head length'; 
par.e_0 = 0.1021;     free.e_0   = 1;   units.e_0 = '-';          label.e_0 = 'threshold scaled reserve density for starvation'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_B1 = 0.91741;   free.f_B1  = 0;   units.f_B1 = '-';         label.f_B1 = 'sc. funct. response for Bayer2021 data, 100 (2nd run)'; 
par.f_B2 = 1;         free.f_B2  = 0;   units.f_B2 = '-';         label.f_B2 = 'sc. funct. response for Bayer2021 data, 100 (3rd run)'; 
par.f_B3 = 1.0174;    free.f_B3  = 0;   units.f_B3 = '-';         label.f_B3 = 'sc. funct. response for Bayer2021 data, 80'; 
par.f_B4 = 0.96474;   free.f_B4  = 0;   units.f_B4 = '-';         label.f_B4 = 'sc. funct. response for Bayer2021 data, 50'; 
par.f_B5 = 0.73112;   free.f_B5  = 0;   units.f_B5 = '-';         label.f_B5 = 'sc. funct. response for Bayer2021 data, 40'; 
par.f_B6 = 0.55698;   free.f_B6  = 0;   units.f_B6 = '-';         label.f_B6 = 'sc. funct. response for Bayer2021 data, 30'; 
par.f_B7 = 0.35943;   free.f_B7  = 0;   units.f_B7 = '-';         label.f_B7 = 'sc. funct. response for Bayer2021 data, 20';
par.f_s = 1.446;      free.f_s  = 0;   units.f_s = '-';           label.f_s = 'sc. funct. response for GaoLin2023 data';
par.h_b = 0.032477;   free.h_b   = 0;   units.h_b = '1/d';        label.h_b = 'background hazard during larval stage'; 
par.hb = 0;           free.hb    = 0;   units.hb = '1/d';         label.hb = 'assumed background hazard rate for GaoLin2023 data'; 
par.ks = 0.4089;      free.ks    = 0;   units.ks = '1/d';         label.ks = 'starvation rate coefficient'; 
par.s_1 = 6.734;      free.s_1   = 0;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 4.16;       free.s_2   = 0;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 3.751;      free.s_3   = 0;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 2.882;      free.s_4   = 0;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_4^2/ L_3^2'; 
par.s_5 = 2.332;      free.s_5   = 0;   units.s_5 = '-';          label.s_5 = 'stress at instar 5: L_5^2/ L_4^2'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_X = 0.2;        free.d_X   = 0;   units.d_X = 'g/cm^3';     label.d_X = 'specific density of food'; 
par.d_V = 0.2;        free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.2;        free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 
par.d_P = 0.2;        free.d_P   = 0;   units.d_P = 'g/cm^3';     label.d_P = 'specific density of faeces'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
