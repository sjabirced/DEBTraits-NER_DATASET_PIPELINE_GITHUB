function [par, metaPar, txtPar] = pars_init_Aphidius_rhopalosiphi(metaData)

metaPar.model = 'hax'; 

%% reference parameter (not to be changed) 
 par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
 par.T_A = 8594.6366;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
 par.z = 0.31447;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
 par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
 par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
 par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
 par.v = 0.015516;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
 par.kap = 0.95701;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
 par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
 par.kap_V = 0.7;      free.kap_V = 0;   units.kap_V = '-';        label.kap_V = 'conversion efficiency from larval reserve to larval structure, back to imago reserve'; 
 par.p_M = 748.4046;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
 par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
 par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
 par.E_G = 4400;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
 par.E_Hb = 7.591e-07; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
 par.E_Hp = 2.003e-05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
 par.E_He = 9.174e-02; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
 par.E_Rj = 235.3326;  free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at pupation'; 
 par.h_a = 5.122e-03;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
 par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
 par.H3_Khs = 40.5732;  free.H3_Khs = 1;   units.H3_Khs = '#';       label.H3_Khs = 'half sat coeff for Holling type 3 functional response of host abundance vs parasitization'; 
 par.H3_k = 3.167;     free.H3_k  = 1;   units.H3_k = '-';         label.H3_k = 'par k for Holling type 3 functional response of host abundance vs parasitization'; 
 par.afRp = 0.47373;   free.afRp  = 1;   units.afRp = '-';         label.afRp = 'affinity factor for parasitization of host Rhopalosiphum padi vs Sitobion avenae (ShirCart1983)'; 
 par.del_M = 0.32138;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
 par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
 par.hatchrate = 0.66939;  free.hatchrate = 1;   units.hatchrate = '-';    label.hatchrate = 'fraction of offspring hatched versus deposited'; 
 par.repro_b = 9.8758;  free.repro_b = 1;   units.repro_b = '-';      label.repro_b = 'slope parameter for reprod decline curve'; 
 par.repro_e = 3.9092;  free.repro_e = 1;   units.repro_e = 'd';      label.repro_e = 'time at 50 perc decline of reprod at T_ref and unlimited host abundance'; 
 par.t_0 = 2.9019;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development (since egg deposition) at T_ref'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
