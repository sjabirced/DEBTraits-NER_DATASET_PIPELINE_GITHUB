function [par, metaPar, txtPar] = pars_init_Bembidion_lampros(metaData)

metaPar.model = 'hax'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6730.9702;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.055878;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.3;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.011061;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.90735;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 0.0017405;  free.kap_V = 1;   units.kap_V = '-';        label.kap_V = 'conversion efficient E -> V -> E'; 
par.p_M = 629.8726;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0020813;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4412.1375;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.176e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.621e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at pupation'; 
par.E_He = 4.377e-02; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.E_Rj = 1.7695e-08;  free.E_Rj  = 1;   units.E_Rj = 'J';         label.E_Rj = 'reproduction buffer at emergence'; 
par.h_a = 2.335e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.04514;    free.s_G   = 1;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 15000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary'; 
par.T_AL = 15000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary'; 
par.T_H = 309.3584;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'upper temperature boundary,  see Boye1998'; 
par.T_L = 282.849;    free.T_L   = 1;   units.T_L = 'K';          label.T_L = 'lower temperature boundary, see MarxHomm2021'; 
par.del_M_I = 0.25111;  free.del_M_I = 0;   units.del_M_I = '-';      label.del_M_I = 'shape factor imago'; 
par.del_M_L = 0.22;   free.del_M_L = 0;   units.del_M_L = '-';      label.del_M_L = 'shape factor larvae'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.k_E = 2.1356e-09;  free.k_E   = 1;   units.k_E = '1/d';        label.k_E = 'reproduction buffer turnover'; 
par.s_1 = 1.5313;     free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'L1/Lb relation'; 
par.s_2 = 2.5356;     free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'L2/L1 relation'; 
par.s_3 = 3.6175;     free.s_3   = 1;   units.s_3 = '-';          label.s_3 = 'L3/L2 relation'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
