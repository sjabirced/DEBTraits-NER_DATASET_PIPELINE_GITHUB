function [par, metaPar, txtPar] = pars_init_Buteo_lagopus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.7286;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.037504;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.94633;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 424.3581;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.017047;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7338.3307;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.946e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.130e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.173e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.849e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_10 = 1.4699;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW1 data at 10 d'; 
par.f1_20 = 2.5499;   free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tW1 data at 20 d'; 
par.f1_30 = 1.6513;   free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tW1 data at 35 d'; 
par.f1_40 = 1.0642;   free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tW1 data at 40 d'; 
par.f1_50 = 1.3586;   free.f1_50 = 1;   units.f1_50 = '-';        label.f1_50 = 'scaled functional response for tW1 data at 50 d'; 
par.f1_60 = 1.9489;   free.f1_60 = 1;   units.f1_60 = '-';        label.f1_60 = 'scaled functional response for tW1 data at 60 d'; 
par.f2_10 = 1.3594;   free.f2_10 = 1;   units.f2_10 = '-';        label.f2_10 = 'scaled functional response for tW2 data at 10 d'; 
par.f2_20 = 2.5557;   free.f2_20 = 1;   units.f2_20 = '-';        label.f2_20 = 'scaled functional response for tW2 data at 20 d'; 
par.f2_30 = 1.1955;   free.f2_30 = 1;   units.f2_30 = '-';        label.f2_30 = 'scaled functional response for tW2 data at 35 d'; 
par.f2_40 = 1.4294;   free.f2_40 = 1;   units.f2_40 = '-';        label.f2_40 = 'scaled functional response for tW2 data at 40 d'; 
par.f2_50 = 1.5536;   free.f2_50 = 1;   units.f2_50 = '-';        label.f2_50 = 'scaled functional response for tW2 data at 50 d'; 
par.f2_60 = 1.2659;   free.f2_60 = 1;   units.f2_60 = '-';        label.f2_60 = 'scaled functional response for tW2 data at 60 d'; 
par.f3_10 = 1.4467;   free.f3_10 = 1;   units.f3_10 = '-';        label.f3_10 = 'scaled functional response for tW3 data at 10 d'; 
par.f3_20 = 1.7204;   free.f3_20 = 1;   units.f3_20 = '-';        label.f3_20 = 'scaled functional response for tW3 data at 20 d'; 
par.f3_30 = 1.9413;   free.f3_30 = 1;   units.f3_30 = '-';        label.f3_30 = 'scaled functional response for tW3 data at 35 d'; 
par.f3_40 = 0.37986;  free.f3_40 = 1;   units.f3_40 = '-';        label.f3_40 = 'scaled functional response for tW3 data at 40 d'; 
par.f3_50 = 1.8515;   free.f3_50 = 1;   units.f3_50 = '-';        label.f3_50 = 'scaled functional response for tW3 data at 50 d'; 
par.f3_60 = 2.1833;   free.f3_60 = 1;   units.f3_60 = '-';        label.f3_60 = 'scaled functional response for tW3 data at 60 d'; 
par.f4_10 = 1.3471;   free.f4_10 = 1;   units.f4_10 = '-';        label.f4_10 = 'scaled functional response for tW4 data at 10 d'; 
par.f4_20 = 2.0301;   free.f4_20 = 1;   units.f4_20 = '-';        label.f4_20 = 'scaled functional response for tW4 data at 20 d'; 
par.f4_30 = 1.4629;   free.f4_30 = 1;   units.f4_30 = '-';        label.f4_30 = 'scaled functional response for tW4 data at 35 d'; 
par.f4_40 = 0.90407;  free.f4_40 = 1;   units.f4_40 = '-';        label.f4_40 = 'scaled functional response for tW4 data at 40 d'; 
par.f4_50 = 1.6131;   free.f4_50 = 1;   units.f4_50 = '-';        label.f4_50 = 'scaled functional response for tW4 data at 50 d'; 
par.f4_60 = 1.2661;   free.f4_60 = 1;   units.f4_60 = '-';        label.f4_60 = 'scaled functional response for tW4 data at 60 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 4.456;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
