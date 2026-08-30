function [par, metaPar, txtPar] = pars_init_Pseudemydura_umbrina(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 19731;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 7.7963;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defacation efficiency'; 
par.v = 0.02579;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.64323;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.2774;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], spec som maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, spec som maint'; 
par.k_J = 0.0018559;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 8141.425;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec costs for structure'; 
par.E_Hb = 1.058e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 5.576e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.756e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull ageing acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 90000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temp at high temp boundary'; 
par.T_AL = 50000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temp at low temp boundary'; 
par.T_H = 304.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'high temp boundery'; 
par.T_L = 278.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'low temp boundary'; 
par.del_M = 0.43769;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response'; 
par.s_M = 0.074816;   free.s_M   = 1;   units.s_M = '-';          label.s_M = 'depression factor for egg development'; 
par.s_MO2 = 1;        free.s_MO2 = 0;   units.s_MO2 = '-';        label.s_MO2 = 'depression factor for egg resp'; 
par.s_Megg = 1;       free.s_Megg = 0;   units.s_Megg = '-';       label.s_Megg = 'depression factor for egg growth'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
