function [par, metaPar, txtPar] = pars_init_Pinna_nobilis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7833.5921;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.3629;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 80.1187;    free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.22999;  free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0084735;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.83084;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 11.0782;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2358.7748;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.674e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.618e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 6.127e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.245e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 476702.9917;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_AL = 117171.9573;  free.T_AL  = 1;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for lower boundary'; 
par.T_H = 301.5106;    free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'Upper temp boundary'; 
par.T_L = 281.4333;    free.T_L   = 1;   units.T_L = 'K';          label.T_L = 'Lower temp boundary'; 
par.del_M1 = 0.6369;   free.del_M1 = 1;   units.del_M1 = '-';       label.del_M1 = 'shape coefficient larva'; 
par.del_M2 = 0.095477; free.del_M2 = 1;   units.del_M2 = '-';       label.del_M2 = 'shape coefficient adult'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'reference scaled functional response'; 
par.f_LdL = 0.63564;  free.f_LdL = 1;   units.f_LdL = '-';        label.f_LdL = 'scaled functional response for LdL'; 
par.f_tL1 = 0.50527;  free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL1'; 
par.f_tL2 = 0.70647;  free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL2'; 
par.f_tLT = 1;        free.f_tLT = 1;   units.f_tLT = '-';        label.f_tLT = 'scaled functional response for tL_T datasets'; 
par.f_A = 0.38664;  free.f_A = 1;   units.f_A = '-';      label.f_A = 'Scaled functional response for Acarli et al. (2011) datasets.'; 
par.f_H = 0.55417;  free.f_H = 1;   units.f_H = '-';     label.f_H = 'scaled functional response for physiological rates data from Hernadis et al. (2023)'; 
par.lambda = 11.5014;  free.lambda = 1;   units.lambda = '-';       label.lambda = 'Total weight (shell + flesh) to wet weight conversion factor Wtotal = lambda * Ww'; 
par.L0_A_large = 6.4034; free.L0_A_large = 1;   units.L0_A_large = 'cm';  label.L0_A_large = 'Initial length for Acarli2011 large group datasets'; 
par.L0_A_small = 3.866;  free.L0_A_small = 1;   units.L0_A_small = 'cm';  label.L0_A_small = 'Initial length for Acarli2011 small group datasets'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
