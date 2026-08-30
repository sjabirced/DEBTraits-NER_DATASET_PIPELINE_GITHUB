function [par, metaPar, txtPar] = pars_init_Canis_familiaris(metaData)

metaPar.model = 'stx'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 7.6087;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for race E'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.03985;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98834;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 5911.7313;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7833.0675;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.607e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hx = 3.507e+05; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at weaning'; 
par.E_Hp = 1.197e+07; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for race E'; 
par.h_a = 1.232e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.1;        free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 
par.t_0 = 44.1549;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 

%% other parameters 
par.E_HpB = 5.128e+06; free.E_HpB = 1;   units.E_HpB = 'J';        label.E_HpB = 'maturity at puberty for race B'; 
par.E_HpCS = 4.756e+06; free.E_HpCS = 1;   units.E_HpCS = 'J';       label.E_HpCS = 'maturity at puberty for race CS'; 
par.E_HpCT = 4.961e+06; free.E_HpCT = 1;   units.E_HpCT = 'J';       label.E_HpCT = 'maturity at puberty for race CT'; 
par.E_HpG = 7.768e+06; free.E_HpG = 1;   units.E_HpG = 'J';        label.E_HpG = 'maturity at puberty for race G'; 
par.E_HpI = 6.444e+06; free.E_HpI = 1;   units.E_HpI = 'J';        label.E_HpI = 'maturity at puberty for race I'; 
par.E_HpL = 4.792e+06; free.E_HpL = 1;   units.E_HpL = 'J';        label.E_HpL = 'maturity at puberty for race L'; 
par.E_HpM = 2.270e+06; free.E_HpM = 1;   units.E_HpM = 'J';        label.E_HpM = 'maturity at puberty for race M'; 
par.E_HpN = 6.307e+06; free.E_HpN = 1;   units.E_HpN = 'J';        label.E_HpN = 'maturity at puberty for race N'; 
par.E_HpP = 4.588e+06; free.E_HpP = 1;   units.E_HpP = 'J';        label.E_HpP = 'maturity at puberty for race P'; 
par.E_HpS = 5.661e+06; free.E_HpS = 1;   units.E_HpS = 'J';        label.E_HpS = 'maturity at puberty for race S'; 
par.E_HpSB = 6.179e+06; free.E_HpSB = 1;   units.E_HpSB = 'J';       label.E_HpSB = 'maturity at puberty for race SB'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.p_MB = 2839.5596;  free.p_MB  = 1;   units.p_MB = 'J/d.cm^3';  label.p_MB = '[p_M], vol-spec somatic maint for race B'; 
par.p_MCS = 2585.0343;  free.p_MCS = 1;   units.p_MCS = 'J/d.cm^3';  label.p_MCS = '[p_M], vol-spec somatic maint for race CS'; 
par.p_MCT = 2638.2687;  free.p_MCT = 1;   units.p_MCT = 'J/d.cm^3';  label.p_MCT = '[p_M], vol-spec somatic maint for race CT'; 
par.p_MG = 3928.1803;  free.p_MG  = 1;   units.p_MG = 'J/d.cm^3';  label.p_MG = '[p_M], vol-spec somatic maint for race G'; 
par.p_MI = 3310.7101;  free.p_MI  = 1;   units.p_MI = 'J/d.cm^3';  label.p_MI = '[p_M], vol-spec somatic maint for race I'; 
par.p_ML = 2662.6124;  free.p_ML  = 1;   units.p_ML = 'J/d.cm^3';  label.p_ML = '[p_M], vol-spec somatic maint for race L'; 
par.p_MM = 2385.7087;  free.p_MM  = 1;   units.p_MM = 'J/d.cm^3';  label.p_MM = '[p_M], vol-spec somatic maint for race M'; 
par.p_MN = 3337.2702;  free.p_MN  = 1;   units.p_MN = 'J/d.cm^3';  label.p_MN = '[p_M], vol-spec somatic maint for race N'; 
par.p_MP = 2305.7281;  free.p_MP  = 1;   units.p_MP = 'J/d.cm^3';  label.p_MP = '[p_M], vol-spec somatic maint for race P'; 
par.p_MS = 3202.0023;  free.p_MS  = 1;   units.p_MS = 'J/d.cm^3';  label.p_MS = '[p_M], vol-spec somatic maint for race S'; 
par.p_MSB = 3107.9095;  free.p_MSB = 1;   units.p_MSB = 'J/d.cm^3';  label.p_MSB = '[p_M], vol-spec somatic maint'; 
par.z_B = 6.4865;     free.z_B   = 1;   units.z_B = '-';          label.z_B = 'zoom factor for race B'; 
par.z_CS = 5.7886;    free.z_CS  = 1;   units.z_CS = '-';         label.z_CS = 'zoom factor for race CS'; 
par.z_CT = 5.0092;    free.z_CT  = 1;   units.z_CT = '-';         label.z_CT = 'zoom factor for race CT'; 
par.z_G = 7.8943;     free.z_G   = 1;   units.z_G = '-';          label.z_G = 'zoom factor for race G'; 
par.z_I = 8.3054;     free.z_I   = 1;   units.z_I = '-';          label.z_I = 'zoom factor for race I'; 
par.z_L = 7.386;      free.z_L   = 1;   units.z_L = '-';          label.z_L = 'zoom factor for race L'; 
par.z_M = 5.3573;     free.z_M   = 1;   units.z_M = '-';          label.z_M = 'zoom factor for race M'; 
par.z_N = 7.9325;     free.z_N   = 1;   units.z_N = '-';          label.z_N = 'zoom factor for race N'; 
par.z_P = 4.0871;     free.z_P   = 1;   units.z_P = '-';          label.z_P = 'zoom factor for race P'; 
par.z_S = 5.9058;     free.z_S   = 1;   units.z_S = '-';          label.z_S = 'zoom factor for race S'; 
par.z_SB = 8.9182;    free.z_SB  = 1;   units.z_SB = '-';         label.z_SB = 'zoom factor for race SB'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
