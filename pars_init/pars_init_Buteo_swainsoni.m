function [par, metaPar, txtPar] = pars_init_Buteo_swainsoni(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.3568;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.030507;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97298;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 539.2791;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.022062;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7324.6525;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.513e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.562e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.938e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.137e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.fc1977_00 = 0.5363;  free.fc1977_00 = 1;   units.fc1977_00 = '-';    label.fc1977_00 = 'scaled functional response for tW_1977 cultiv data at 00 d'; 
par.fc1977_10 = 9.0693;  free.fc1977_10 = 1;   units.fc1977_10 = '-';    label.fc1977_10 = 'scaled functional response for tW_1977 cultiv data at 10 d'; 
par.fc1977_20 = 0.13901;  free.fc1977_20 = 1;   units.fc1977_20 = '-';    label.fc1977_20 = 'scaled functional response for tW_1977 cultiv data at 20 d'; 
par.fc1977_30 = 0.0054253;  free.fc1977_30 = 1;   units.fc1977_30 = '-';    label.fc1977_30 = 'scaled functional response for tW_1977 cultiv data at 30 d'; 
par.fc1978_00 = 0.0072644;  free.fc1978_00 = 1;   units.fc1978_00 = '-';    label.fc1978_00 = 'scaled functional response for tW_1978 cultiv data at 00 d'; 
par.fc1978_10 = 4.7841;  free.fc1978_10 = 1;   units.fc1978_10 = '-';    label.fc1978_10 = 'scaled functional response for tW_1978 cultiv data at 10 d'; 
par.fc1978_20 = 1.4532;  free.fc1978_20 = 1;   units.fc1978_20 = '-';    label.fc1978_20 = 'scaled functional response for tW_1978 cultiv data at 20 d'; 
par.fc1978_30 = 0.80082;  free.fc1978_30 = 1;   units.fc1978_30 = '-';    label.fc1978_30 = 'scaled functional response for tW_1978 cultiv data at 30 d'; 
par.fc1979_00 = 7.8206;  free.fc1979_00 = 1;   units.fc1979_00 = '-';    label.fc1979_00 = 'scaled functional response for tW_1979 cultiv data at 00 d'; 
par.fc1979_10 = 0.020505;  free.fc1979_10 = 1;   units.fc1979_10 = '-';    label.fc1979_10 = 'scaled functional response for tW_1979 cultiv data at 10 d'; 
par.fc1979_20 = 2.9413;  free.fc1979_20 = 1;   units.fc1979_20 = '-';    label.fc1979_20 = 'scaled functional response for tW_1979 cultiv data at 20 d'; 
par.fc1979_30 = 0.79658;  free.fc1979_30 = 1;   units.fc1979_30 = '-';    label.fc1979_30 = 'scaled functional response for tW_1979 cultiv data at 30 d'; 
par.fg1977_00 = 0.6003;  free.fg1977_00 = 1;   units.fg1977_00 = '-';    label.fg1977_00 = 'scaled functional response for tW_1977 grazed data at 00 d'; 
par.fg1977_10 = 7.6291;  free.fg1977_10 = 1;   units.fg1977_10 = '-';    label.fg1977_10 = 'scaled functional response for tW_1977 grazed data at 10 d'; 
par.fg1977_20 = 1.5843;  free.fg1977_20 = 1;   units.fg1977_20 = '-';    label.fg1977_20 = 'scaled functional response for tW_1977 grazed data at 20 d'; 
par.fg1977_30 = 0.21372;  free.fg1977_30 = 1;   units.fg1977_30 = '-';    label.fg1977_30 = 'scaled functional response for tW_1977 grazed data at 30 d'; 
par.fg1978_00 = 0.095921;  free.fg1978_00 = 1;   units.fg1978_00 = '-';    label.fg1978_00 = 'scaled functional response for tW_1978 grazed data at 00 d'; 
par.fg1978_10 = 5.3168;  free.fg1978_10 = 1;   units.fg1978_10 = '-';    label.fg1978_10 = 'scaled functional response for tW_1978 grazed data at 10 d'; 
par.fg1978_20 = 2.4139;  free.fg1978_20 = 1;   units.fg1978_20 = '-';    label.fg1978_20 = 'scaled functional response for tW_1978 grazed data at 20 d'; 
par.fg1978_30 = 0.72704;  free.fg1978_30 = 1;   units.fg1978_30 = '-';    label.fg1978_30 = 'scaled functional response for tW_1978 grazed data at 30 d'; 
par.fg1979_00 = 0.25626;  free.fg1979_00 = 1;   units.fg1979_00 = '-';    label.fg1979_00 = 'scaled functional response for tW_1979 grazed data at 00 d'; 
par.fg1979_10 = 5.2777;  free.fg1979_10 = 1;   units.fg1979_10 = '-';    label.fg1979_10 = 'scaled functional response for tW_1979 grazed data at 10 d'; 
par.fg1979_20 = 2.0366;  free.fg1979_20 = 1;   units.fg1979_20 = '-';    label.fg1979_20 = 'scaled functional response for tW_1979 grazed data at 20 d'; 
par.fg1979_30 = 1.4505;  free.fg1979_30 = 1;   units.fg1979_30 = '-';    label.fg1979_30 = 'scaled functional response for tW_1979 grazed data at 30 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 4.031;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
