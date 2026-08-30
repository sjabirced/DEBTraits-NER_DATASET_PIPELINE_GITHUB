function [par, metaPar, txtPar] = pars_init_Coccinella_septempunctata(metaData)

metaPar.model = 'abp'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 10000;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.32315;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.01;         free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.7656;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 3140.4042;  free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4423.2371;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.253e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 8.824e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.738e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_He = 4.311e+00; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.del_M_al = 0.14584;  free.del_M_al = 1;   units.del_M_al = '-';     label.del_M_al = 'shape coefficient for imago body length'; 
par.del_M_aw = 0.18923;  free.del_M_aw = 1;   units.del_M_aw = '-';     label.del_M_aw = 'shape coefficient for imago body width'; 
par.del_M_ll = 0.084778;  free.del_M_ll = 1;   units.del_M_ll = '-';     label.del_M_ll = 'shape coefficient for larval length'; 
par.del_M_lw = 0.29158;  free.del_M_lw = 1;   units.del_M_lw = '-';     label.del_M_lw = 'shape coefficient for larval width'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for most data'; 
par.f5 = 0.69348;     free.f5    = 1;   units.f5 = '-';           label.f5 = 'scaled functional response for Megoura viciae as food'; 
par.f6 = 0.51529;     free.f6    = 1;   units.f6 = '-';           label.f6 = 'scaled functional response for Brevicoryne brassicae as food'; 
par.f7 = 1;           free.f7    = 0;   units.f7 = '-';           label.f7 = 'scaled functional response for Aphis gossypii as food'; 
par.ome_j = 0.8;      free.ome_j = 0;   units.ome_j = '-';        label.ome_j = 'contribution of larval structure to pupal reserve'; 
par.s_1 = 2.5725;     free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 2.1286;     free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 2.1061;     free.s_3   = 1;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
