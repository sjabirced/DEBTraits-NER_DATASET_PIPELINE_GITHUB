function [par, metaPar, txtPar] = pars_init_Arenicola_defodiens(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6176.1459;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.28428;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.018236;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.81745;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 33.3093;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4223.8348;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.101e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.562e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.257e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.690e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 7.036e-04; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_AH = 133653.8274;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary'; 
par.T_H = 297.8711;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.del_ML = 0.17118;  free.del_ML = 1;   units.del_ML = '-';       label.del_ML = 'shape coefficient for trunk length'; 
par.del_MTL = 0.15716;  free.del_MTL = 1;   units.del_MTL = '-';      label.del_MTL = 'shape coefficient for trunk length'; 
par.del_Me = 0.63624;  free.del_Me = 1;   units.del_Me = '-';       label.del_Me = 'shape coefficient for embryo'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_field = 0.8;    free.f_field = 0;   units.f_field = '-';      label.f_field = 'scaled functional response for 1-var data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
