function [par, metaPar, txtPar] = pars_init_Fenneropenaeus_chinensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8700;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.96403;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.84159;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.019148;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.93827;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 3156.1541;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4435.152;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.596e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.309e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.036e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.821e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 61700;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'T_AH'; 
par.T_AL = 77900;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'T_AL'; 
par.T_H = 306;        free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'T_H'; 
par.T_L = 277;        free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'T_L'; 
par.del_M = 0.062181;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_WN = 0.99117;   free.f_WN  = 1;   units.f_WN = '-';         label.f_WN = 'scaled functional response for WN data'; 
par.f_tL1 = 1.1032;   free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL,tW in Bohai Sea'; 
par.f_tL2 = 1.1062;   free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL,tW in Yellow Sea'; 
par.f_tL3 = 1.0644;   free.f_tL3 = 1;   units.f_tL3 = '-';        label.f_tL3 = 'scaled functional response for tL,tW in East China Sea'; 
par.t_0 = 1.4275;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.z_m = 0.84613;    free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
