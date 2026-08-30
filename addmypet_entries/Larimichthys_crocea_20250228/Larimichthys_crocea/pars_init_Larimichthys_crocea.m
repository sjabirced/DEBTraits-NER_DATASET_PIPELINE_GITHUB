function [par, metaPar, txtPar] = pars_init_Larimichthys_crocea(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8500;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 9.3037;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.024635;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.88874;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 45.7356;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5228.7767;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.471e-01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.243e-01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.164e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.393e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.000184;   free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.14793;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_S150 = 0.28156;  free.f_S150 = 1;   units.f_S150 = '-';       label.f_S150 = 'scaled functional response for tL data for S at 150 d'; 
par.f_S200 = 0.41029;  free.f_S200 = 1;   units.f_S200 = '-';       label.f_S200 = 'scaled functional response for tL data for S at 200 d'; 
par.f_S300 = 0.48307;  free.f_S300 = 1;   units.f_S300 = '-';       label.f_S300 = 'scaled functional response for tL data for S at 300 d'; 
par.f_S400 = 0.63385;  free.f_S400 = 1;   units.f_S400 = '-';       label.f_S400 = 'scaled functional response for tL data for S at 400 d'; 
par.f_S450 = 0.80751;  free.f_S450 = 1;   units.f_S450 = '-';       label.f_S450 = 'scaled functional response for tL data for S at 450 d'; 
par.f_X150 = 1.2991;  free.f_X150 = 1;   units.f_X150 = '-';       label.f_X150 = 'scaled functional response for tL data for X at 150 d'; 
par.f_X200 = 0.99848;  free.f_X200 = 1;   units.f_X200 = '-';       label.f_X200 = 'scaled functional response for tL data for X at 200 d'; 
par.f_X300 = 0.76509;  free.f_X300 = 1;   units.f_X300 = '-';       label.f_X300 = 'scaled functional response for tL data for X at 300 d'; 
par.f_X400 = 0.42297;  free.f_X400 = 1;   units.f_X400 = '-';       label.f_X400 = 'scaled functional response for tL data for X at 400 d'; 
par.f_X450 = 0.83979;  free.f_X450 = 1;   units.f_X450 = '-';       label.f_X450 = 'scaled functional response for tL data for X at 450 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
