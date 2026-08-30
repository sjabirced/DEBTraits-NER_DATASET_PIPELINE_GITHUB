function [par, metaPar, txtPar] = pars_init_Procellaria_aequinoctialis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.901;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.5;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019666;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.83562;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 533.6519;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.022956;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7300.6234;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.607e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.558e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.654e-16;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.05;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.296e+05; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 3.4308;   free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW1 data at 00 d'; 
par.f1_40 = 2.1267;   free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tW1 data at 40 d'; 
par.f1_65 = 1.1009;   free.f1_65 = 1;   units.f1_65 = '-';        label.f1_65 = 'scaled functional response for tW1 data at 65 d'; 
par.f1_99 = 0.48557;  free.f1_99 = 1;   units.f1_99 = '-';        label.f1_99 = 'scaled functional response for tW1 data at 99 d'; 
par.f_00 = 4.2174;    free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_40 = 1.3578;    free.f_40  = 1;   units.f_40 = '-';         label.f_40 = 'scaled functional response for tW data at 40 d'; 
par.f_65 = 1.376;     free.f_65  = 1;   units.f_65 = '-';         label.f_65 = 'scaled functional response for tW data at 65 d'; 
par.f_99 = -0.080542;  free.f_99  = 1;   units.f_99 = '-';         label.f_99 = 'scaled functional response for tW data at 99 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 4.0289;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
