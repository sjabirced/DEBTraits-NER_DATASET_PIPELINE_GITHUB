function [par, metaPar, txtPar] = pars_init_Orius_laevigatus(metaData)

metaPar.model = 'hep'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 12000;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.014926;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 0.00081085;  free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.97744;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.013227;  free.kap_P = 1;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.03138;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9233;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 5031.1234;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4359.7524;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.670e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.949e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_Rj = 3579.5959;  free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at emergence'; 
par.h_a = 4.503e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_H1 = 4.997e-03; free.E_H1  = 1;   units.E_H1 = 'J';         label.E_H1 = 'maturity at end of instar 1'; 
par.E_H2 = 1.262e-02; free.E_H2  = 1;   units.E_H2 = 'J';         label.E_H2 = 'maturity at end of instar 2'; 
par.E_H3 = 4.311e-02; free.E_H3  = 1;   units.E_H3 = 'J';         label.E_H3 = 'maturity at end of instar 3'; 
par.T_AH = 40000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary'; 
par.T_H = 306;        free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper temprature boundary'; 
par.del_M = 0.76805;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_0 = 1;          free.f_0   = 0;   units.f_0 = '-';          label.f_0 = 'scaled functional response for control diet'; 
% par.f_1 = 1.0458;     free.f_1   = 1;   units.f_1 = '-';          label.f_1 = 'scaled functional response for diet 1'; 
% par.f_2 = 1.0029;     free.f_2   = 1;   units.f_2 = '-';          label.f_2 = 'scaled functional response for diet 2'; 
% par.f_3 = 1.0574;     free.f_3   = 1;   units.f_3 = '-';          label.f_3 = 'scaled functional response for diet 3'; 
% par.f_4 = 0.82416;    free.f_4   = 1;   units.f_4 = '-';          label.f_4 = 'scaled functional response for diet 4'; 
par.f_AD = 1.0022;    free.f_AD  = 1;   units.f_AD = '-';         label.f_AD = 'scaled functional response used in AlauDarg1994'; 
par.f_CC = 0.88788;   free.f_CC  = 1;   units.f_CC = '-';         label.f_CC = 'scaled functional response used in CocuCler1997'; 
par.f_SL = 0.89605;   free.f_SL  = 1;   units.f_SL = '-';         label.f_SL = 'scaled functional response used in SancLaca2002'; 
par.h_am = 4.105e-05;  free.h_am  = 1;   units.h_am = '1/d^2';     label.h_am = 'Weibull aging acceleration for males'; 
par.k_R0 = 5.8414e-07;  free.k_R0  = 1;   units.k_R0 = '1/d';       label.k_R0 = 'threshold for buffer mobilisation'; 
par.k_RE = 0.0062744;  free.k_RE  = 1;   units.k_RE = '1/d';       label.k_RE = 'increase in buffer mobilisation'; 
par.k_Rm = 0.1959;    free.k_Rm  = 1;   units.k_Rm = '1/d';       label.k_Rm = 'maximum buffer mobilisation'; 
par.kap15_R = 0.6463;  free.kap15_R = 1;   units.kap15_R = '-';      label.kap15_R = 'reproduction efficiency at 15 C'; 
par.kap25_R = 0.93414;  free.kap25_R = 1;   units.kap25_R = '-';      label.kap25_R = 'reproduction efficiency at 25 C'; 
par.kap30_R = 0.60898;  free.kap30_R = 1;   units.kap30_R = '-';      label.kap30_R = 'reproduction efficiency at 30 C'; 
par.kap35_R = 0.28029;  free.kap35_R = 1;   units.kap35_R = '-';      label.kap35_R = 'reproduction efficiency at 35 C'; 
par.t_0 = 4.965;      free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'start of egg development'; 
par.z_m = 0.014859;   free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
