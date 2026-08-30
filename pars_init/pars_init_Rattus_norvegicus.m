function [par, metaPar, txtPar] = pars_init_Rattus_norvegicus(metaData)

metaPar.model = 'stx'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.761;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.024857;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.96072;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 632.9263;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7852.7114;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.953e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hx = 2.674e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at weaning'; 
par.E_Hp = 3.032e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.125e-17;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.1;        free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 
par.t_0 = 3.1738e-09;  free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% other parameters 
par.del_M = 0.12541;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_100_025 = 1.4019;  free.f_100_025 = 1;   units.f_100_025 = '-';    label.f_100_025 = 'scaled functional response for tW100 data at 025 d'; 
par.f_100_050 = 1.0118;  free.f_100_050 = 1;   units.f_100_050 = '-';    label.f_100_050 = 'scaled functional response for tW100 data at 050 d'; 
par.f_100_100 = 0.94169;  free.f_100_100 = 1;   units.f_100_100 = '-';    label.f_100_100 = 'scaled functional response for tW100 data at 100 d'; 
par.f_100_200 = 1.001;  free.f_100_200 = 1;   units.f_100_200 = '-';    label.f_100_200 = 'scaled functional response for tW100 data at 200 d'; 
par.f_45_025 = 0.74694;  free.f_45_025 = 1;   units.f_45_025 = '-';     label.f_45_025 = 'scaled functional response for tW45 data at 025 d'; 
par.f_45_050 = 0.81593;  free.f_45_050 = 1;   units.f_45_050 = '-';     label.f_45_050 = 'scaled functional response for tW45 data at 050 d'; 
par.f_45_100 = 0.7456;  free.f_45_100 = 1;   units.f_45_100 = '-';     label.f_45_100 = 'scaled functional response for tW45 data at 100 d'; 
par.f_45_200 = 0.79358;  free.f_45_200 = 1;   units.f_45_200 = '-';     label.f_45_200 = 'scaled functional response for tW45 data at 200 d'; 
par.f_75_025 = 1.0801;  free.f_75_025 = 1;   units.f_75_025 = '-';     label.f_75_025 = 'scaled functional response for tW75 data at 024 d'; 
par.f_75_050 = 0.95835;  free.f_75_050 = 1;   units.f_75_050 = '-';     label.f_75_050 = 'scaled functional response for tW75 data at 050 d'; 
par.f_75_100 = 0.85619;  free.f_75_100 = 1;   units.f_75_100 = '-';     label.f_75_100 = 'scaled functional response for tW75 data at 100 d'; 
par.f_75_200 = 0.92503;  free.f_75_200 = 1;   units.f_75_200 = '-';     label.f_75_200 = 'scaled functional response for tW75 data at 200 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
