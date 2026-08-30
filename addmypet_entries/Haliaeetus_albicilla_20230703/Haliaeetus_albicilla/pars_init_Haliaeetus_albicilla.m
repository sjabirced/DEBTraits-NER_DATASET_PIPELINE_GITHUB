function [par, metaPar, txtPar] = pars_init_Haliaeetus_albicilla(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 6.5954;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.030748;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.95477;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 500.7808;   free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 1.4299e-08;  free.p_T   = 1;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.016162;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7367.6843;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.697e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.795e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.875e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.394e+05; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_05 = 1.0589;   free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW1 data at 05 d'; 
par.f1_15 = 3.4245;   free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW1 data at 15 d'; 
par.f1_25 = 3.2137;   free.f1_25 = 1;   units.f1_25 = '-';        label.f1_25 = 'scaled functional response for tW1 data at 25 d'; 
par.f2_05 = 1.8212;   free.f2_05 = 1;   units.f2_05 = '-';        label.f2_05 = 'scaled functional response for tW2 data at 05 d'; 
par.f2_15 = 5.1179;   free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW2 data at 15 d'; 
par.f3_05 = 1.3897;   free.f3_05 = 1;   units.f3_05 = '-';        label.f3_05 = 'scaled functional response for tW3 data at 05 d'; 
par.f3_15 = 5.9728;   free.f3_15 = 1;   units.f3_15 = '-';        label.f3_15 = 'scaled functional response for tW3 data at 15 d'; 
par.f3_25 = 4.4094;   free.f3_25 = 1;   units.f3_25 = '-';        label.f3_25 = 'scaled functional response for tW3 data at 25 d'; 
par.f4_05 = 1.6917;   free.f4_05 = 1;   units.f4_05 = '-';        label.f4_05 = 'scaled functional response for tW4 data at 05 d'; 
par.f4_15 = 8.4649;   free.f4_15 = 1;   units.f4_15 = '-';        label.f4_15 = 'scaled functional response for tW4 data at 15 d'; 
par.f4_25 = 0.12077;  free.f4_25 = 1;   units.f4_25 = '-';        label.f4_25 = 'scaled functional response for tW4 data at 25 d'; 
par.f5_05 = 1.8789;   free.f5_05 = 1;   units.f5_05 = '-';        label.f5_05 = 'scaled functional response for tW5 data at 05 d'; 
par.f5_15 = 6.7106;   free.f5_15 = 1;   units.f5_15 = '-';        label.f5_15 = 'scaled functional response for tW5 data at 15 d'; 
par.f5_25 = 0.00011233;  free.f5_25 = 1;   units.f5_25 = '-';        label.f5_25 = 'scaled functional response for tW5 data at 25 d'; 
par.t_R = 1460;       free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 6.1596;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
