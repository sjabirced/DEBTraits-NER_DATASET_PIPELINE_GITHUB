function [par, metaPar, txtPar] = pars_init_Ostrea_chilensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.3688;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 9.1736;     free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, specific food searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defecation efficiency'; 
par.v = 0.022896;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99647;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 35.4799;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maintenance'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surface area-spec somatic maintenance'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maintenance rate coefficient'; 
par.E_G = 2297.2512;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], specific costs for structure'; 
par.E_Hb = 1.989e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.845e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at end of acceleration'; 
par.E_Hp = 6.972e+00; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.309e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hr = 3.650e-04; free.E_Hr  = 1;   units.E_Hr = 'J';         label.E_Hr = 'maturity at release'; 
par.del_M = 0.38259;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mb = 0.79424;  free.del_Mb = 1;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient at birth'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Chap = 1;       free.f_Chap = 1;   units.f_Chap = '-';       label.f_Chap = 'scaled functional response for 1-var data'; 
par.f_Rich1 = 1;      free.f_Rich1 = 1;   units.f_Rich1 = '-';      label.f_Rich1 = 'scaled functional response for tL3 data'; 
par.f_Rich2 = 0.99997;  free.f_Rich2 = 1;   units.f_Rich2 = '-';      label.f_Rich2 = 'scaled functional response for tL4 data'; 
par.f_Vide = 0.99999;  free.f_Vide = 1;   units.f_Vide = '-';       label.f_Vide = 'scaled functional response for tL1 data'; 
par.f_Wils = 0.99131;  free.f_Wils = 1;   units.f_Wils = '-';       label.f_Wils = 'scaled functional response for tL2 data'; 
par.f_Wint1 = 0.33826;  free.f_Wint1 = 1;   units.f_Wint1 = '-';      label.f_Wint1 = 'scaled functional response for LWd1 and LF_f1 data'; 
par.f_Wint2 = 0.69;   free.f_Wint2 = 1;   units.f_Wint2 = '-';      label.f_Wint2 = 'scaled functional response for LWd2 and LF_f2 data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
