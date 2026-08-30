function [par, metaPar, txtPar] = pars_init_Chrysoperla_carnea(metaData)

metaPar.model = 'abp'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 12000;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.4215;       free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.022958;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.010244;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.75039;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 573.1114;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4232.7889;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.287e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.056e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty of imago (>E_He)'; 
par.h_a = 1.013e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_He = 2.297e+00; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.del_M_imago = 0.14641;  free.del_M_imago = 1;   units.del_M_imago = '-';  label.del_M_imago = 'shape coefficient of imago'; 
par.del_M_larva = 0.11072;  free.del_M_larva = 1;   units.del_M_larva = '-';  label.del_M_larva = 'shape coefficient of larva'; 
par.del_M_pupa = 0.15635;  free.del_M_pupa = 1;   units.del_M_pupa = '-';   label.del_M_pupa = 'shape coefficient of pupa'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Bt = 0.5215;    free.f_Bt  = 1;   units.f_Bt = '-';         label.f_Bt = 'scaled functional response for Jokar 2012 B. tabaci'; 
par.f_Sg = 0.64488;   free.f_Sg  = 1;   units.f_Sg = '-';         label.f_Sg = 'scaled functional response for Jokar 2012 S. graminum'; 
par.f_art = 1;        free.f_art = 0;   units.f_art = '-';        label.f_art = 'scaled functional response for Jokar 2012 artificial'; 
par.f_tN = 1;         free.f_tN  = 0;   units.f_tN = '-';         label.f_tN = 'scaled functional response for tN data'; 
par.f_tX = 0.0091529;  free.f_tX  = 1;   units.f_tX = '-';         label.f_tX = 'scaled functional response for tX data'; 
par.ome_j = 1.1196;   free.ome_j = 1;   units.ome_j = '-';        label.ome_j = 'contribution of larval structure to pupal reserve'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
