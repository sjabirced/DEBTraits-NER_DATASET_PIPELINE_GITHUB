function [data, auxData, metaData, txtData, weights] = mydata_Orius_laevigatus

%% set metaData  
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Anthocoridae';
metaData.species    = 'Orius_laevigatus'; 
metaData.species_en = 'Minute pirate bug'; 

metaData.ecoCode.climate = {'A','C'}; 
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'biTh'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp 
metaData.data_0     = {'Wwb'; 'Wwi'}; % 
metaData.data_1     = {'T-ab'; 'T-ap'; 'T-as'; 'T-Ni'; 'X-Wi'; 'X-ap'; 'X-am'; 'X-Ni'; 'X-R'; 't-N_T'; 't-S_T'}; 
metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Anna Huang'};    
metaData.date_subm = [2024 12 18];              
metaData.email    = {'anna.huang@wur.nl'};            
metaData.address  = {'Wageningen University & Research'};

metaData.author_mod_1   = {'Dana Bashkir'};    
metaData.date_mod_1 = [2025 06 11];              
metaData.email_mod_1    = {'dana.bashkir@wur.nl'};            
metaData.address_mod_1  = {'Wageningen University & Research'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 06 19];

%% set data 

% zero-variate data

data.Wwb = 3.7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'Kopp2025','Wiki','ArijPatr2001'};
  comment.Wwb = 'based on egg length of 0.4 mm, width 0.04/3: pi/6*0.04^3/9'; 
data.Wwi = 1.2*5.1500e-04; units.Wwi = 'g';   label.Wwi = 'asymptotic wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'hypothetical: 1.2*Ww_j'; 

data.Ni = 150; units.Ni = '#';   label.Ni = 'total fecundity';   bibkey.Ni = 'SancLaca2002';

% uni-variate data  

% temperature-age at birth 
data.Tab = [ ... % temperature (C), age at birth (d)
15  NaN 11.7 11.0
20	7.4  6.4  NaN
25	4.3  4.6  4.0
30	3.0  3.3  NaN
35	2.4  NaN  3.1];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; title.Tab = 'SancLaca2002,AlauDarg1994,CocuCler1997';  
treat.Tab = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Tab = 'data source';
bibkey.Tab = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-age at imago (end of instar 5)
data.Taj = [ ... % temperature (C), time since birth at imago (end of instar 5) (d)
15  NaN   43.0+11.7 48.2+11.0
20	34.6  20.4+6.4  NaN
25	20.5  13.2+4.6  14.1+4.0
30	15.2  9.3+3.3   NaN
35	12.3  NaN       10.1+3.1];
units.Taj   = {'C', 'd'};  label.Taj = {'temperature', 'age at imago'}; title.Taj = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.Taj = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Taj = 'data source';
bibkey.Taj = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 1
data.Tb1 = [ ... % temperature (C), duration of instar 1
15  NaN 9.4 8.3
20	5.6 4.0 NaN
25	3.3 2.9 3.0
30	2.5 2.0 NaN
35	2.0 NaN 2.0];
units.Tb1  = {'C', 'd'};  label.Tb1 = {'temperature', 'duration of instar 1'};  title.Tb1 = 'SancLaca2002,AlauDarg1994,CocuCler1997';
treat.Tb1 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Tb1 = 'data source';
bibkey.Tb1 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 2
data.T12 = [ ... % temperature (C), duration of instar 2
15  NaN 6.2 6.8
20	4.0 2.9 NaN
25	2.4 2.2 2.7
30	1.7 1.2 NaN
35	1.5 NaN 2.3];
units.T12  = {'C', 'd'};  label.T12 = {'temperature', 'duration of instar 2'}; title.T12 = 'SancLaca2002,AlauDarg1994,CocuCler1997';
treat.T12 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T12 = 'data source';
bibkey.T12 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 3
data.T23 = [ ... % temperature (C), duration of instar 3
15  NaN 6.0 9.6
20	4.1 3.0 NaN
25	2.6 1.8 2.2
30	1.9 1.2 NaN
35	1.5 NaN 2.0];
units.T23 = {'C', 'd'};  label.T23 = {'temperature', 'duration of instar 3'}; title.T23 = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.T23 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T23 = 'data source';
bibkey.T23 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 4 
data.T3p = [ ... % temperature (C), duration of instar 4
15  NaN 7.4 9.3
20	4.9 3.4 NaN
25	2.8 2.1 1.8
30	2.2 1.8 NaN
35	1.8 NaN 1.7];
units.T3p = {'C', 'd'};  label.T3p = {'temperature', 'duration of instar 4'}; title.T3p = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.T3p = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T3p = 'data source';
bibkey.T3p = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 
comment.T3p = 'end of instar 4 is puberty';

% temperature-duration of instar 5
data.Tpj = [ ... % temperature (C), duration of instar 5
15  NaN 14.0 13.9
20	8.6  7.1  NaN
25	4.9  4.1  4.3
30	3.9  2.9  NaN
35	3.1  NaN  2.1];
units.Tpj = {'C', 'd'};  label.Tpj = {'temperature', 'duration of instar 5'}; title.Tpj = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.Tpj = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Tpj = 'data source';
bibkey.Tpj = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 
comment.Tpj = 'instar 5 starts at puberty and ends with imago';

% temperature-duration of imago (female,male)
data.Tji_fm = [ ... % temperature (C), duration of female, male imago
15   NaN 59.5  78.4   NaN 43.8
20	70.3  NaN  50.5  33.7  NaN  
25	32.8 22.2  28.4  16.1 18.0  
30	21.2  NaN  20.9   9.4  NaN  
35	 7.7  9.5   NaN   4.9  8.5];
units.Tji_fm = {'C', 'd'};  label.Tji_fm = {'temperature', 'duration of imago'}; title.Tji_fm = '(fe)male SancLaca2002,CocuCler1997,AlauDarg1994';
treat.Tji_fm = {1 {'female SancLaca2002','female CocuCler1997','female AlauDarg1994','male SancLaca2002','male CocuCler1997'}}; label.treat.Tji_fm = 'gender/data source';
bibkey.Tji_fm = {'SancLaca2002','CocuCler1997','AlauDarg1994'}; 
comment.Tji_fm = 'imago duration is called adult longevity in literature';

% temperature-total fecundity
data.TN = [ ... % temperature (C), viable eggs per female (#)
15 NaN     113.1  
20 112.50  174.5  % tN20 158
25 115.70  144.4  % tN25 154
30 70.55   118.44 % tN30  92
35  5.89   NaN];  % tN35  12
units.TN   = {'C', '#'};  label.TN = {'temperature', 'total fecundity'}; title.TN = 'SancLaca2002,AlauDarg1994'; 
treat.TN = {0 {'SancLaca2002','AlauDarg1994'}}; label.treat.TN = 'data source';
bibkey.TN = {'SancLaca2002','AlauDarg1994'}; 

% % diet-imago wet weight
% data.XWi_fm = [ ... diet (-), imago wet weight (g)
%     0 0.42*0.001 0.35*0.001
%     1 0.42*0.001 0.31*0.001
%     2 0.36*0.001 0.33*0.001
%     3 0.40*0.001 0.36*0.001
%     4 0.35*0.001 0.32*0.001]; %mg to g
% units.XWi_fm   = {'-', 'g'};  label.XWi_fm = {'diet', 'imago wet weight'}; title.XWi_fm = 'different diets';
% temp.XWi_fm = C2K(23);  units.temp.XWi_fm = 'K'; label.temp.XWi_fm = 'temperature';
% bibkey.XWi_fm = 'ArijPatr2001'; treat.XWi_fm = {0 {'females','males'}}; label.treat.XWi_fm = 'gender';
% comment.XWi_fm = 'Control diet 0 is Ephestia kuehniella';
% 
% % diet-duration of stages
% data.Xt_ji = [ ... diet (-), duration from birth to imago, female imago stage duration (d)
%     0 13.9 39.4
%     1 14.4 27.2
%     2 13.4 36.7
%     3 13.3 36.4
%     4 14.3 42.0];
% units.Xt_ji   = {'-', 'd'};  label.Xt_ji = {'diet', 'stage duration'}; 
% temp.Xt_ji = C2K(23);  units.temp.Xt_ji = 'K'; label.temp.Xt_ji = 'temperature'; title.Xt_ji = 'different diets';
% bibkey.Xt_ji = 'ArijPatr2001'; treat.Xt_ji = {0 {'nymphs 1-5','female imago'}}; label.treat.Xt_ji = 'duration';
% comment.Xt_ji = 'Control diet 0 is Ephestia kuehniella';
% 
% % diet-total fecundity
% data.XN = [ ... diet (-), cumulative # of eggs (#)
%     0 115.9
%     1  55.9
%     2  49.1
%     3 104.4
%     4  76.1];
% units.XN   = {'-', '#'};  label.XN = {'diet', 'total fecundity'}; title.XN = 'different diets';
% temp.XN = C2K(23);  units.temp.XN = 'K'; label.temp.XN = 'temperature';
% bibkey.XN = 'ArijPatr2001'; treat.XN = {0}; label.treat.XN = 'duration';
% comment.XN = 'Control diet 0 is Ephestia kuehniella';

% % diet-mean reproduction rate
% data.XR = [ ... diet (-), mean reproduction rate (#/d)
%     0  2.9
%     1  2.1
%     2  1.3
%     3  2.9
%     4  1.8];
% units.XR   = {'-', '#/d'};  label.XR = {'diet', 'mean reproduction rate'}; title.XR = 'different diets';
% temp.XR = C2K(23);  units.temp.XR = 'K'; label.temp.XR = 'temperature';
% bibkey.XR = 'ArijPatr2001'; treat.XR = {0}; label.treat.XN = 'duration';
% comment.XR = 'Control diet 0 is Ephestia kuehniella';

% time-cum reproduction
data.tN20 = [ ... % time since start imago (d), number of eggs (#/d)
 0	0.000
 5	0.000
 6	0.411
 7	0.909
 8	1.364
 9	1.198
10	1.405
11	1.695
12	1.445
13	1.570
14	2.232
15	2.771
16	1.402
17	2.562
18	2.189
19	2.935
20	3.307
21	3.307
22	2.850
23	3.555
24	2.518
25	3.098
26	3.346
27	1.522
28	3.138
29	3.179
30	2.515
31	3.219
32	3.219
33	1.934
34	2.638
35	1.809
36	7.743
37	2.886
38	2.786
39.	2.636
40	1.931
41	2.469
42	3.422
43	2.179
44	2.427
45	2.509
46	2.302
47	3.006
48	2.757
49	2.342
50	2.424
51	2.258
52	3.667
53	3.086
54	2.216
55	2.381
56	2.629
57	2.380
58	1.882
59	1.798
60	1.550
61	1.761
62	1.135
63	2.295
64	1.672
65	1.506
66	1.532
67	0.966
68	1.057
69	1.712
70	1.380
72	0.799
73	0.882
74	0.632
75	0.134
76	0.963
77	0.092
78	0.340
79	0.340
80	0.033
81	0.173
82	0.587
83	0.546
84	0.338
85	0.130
86	0.000];
data.tN20(:,2) = cumsum(data.tN20(:,2)); % convert reprod rate to cum reprod
units.tN20   = {'d', '#'};  label.tN20 = {'time since start imago', 'cumulative reproduction', '20 C'}; 
temp.tN20 = C2K(20);  units.temp.tN20 = 'K'; label.temp.tN20 = 'temperature';
bibkey.tN20 = 'SancLaca2002'; % Figure 1
%
data.tN25 = [ ... % time since start imago (d), number of eggs (#/d)
 0  0.000
 2	0.000
 3	0.416
 4	0.960
 5	2.216
 6	3.304
 7	3.136
 8	4.308
 9	3.846
10	3.720
11	4.807
12	4.346
13	5.224
14	4.051
15	4.972
16	4.845
17	5.263
18	4.844
19	5.639
20	4.968
21	5.177
22	4.882
23	4.630
24	5.466
25	5.298
26	5.483
27	5.632
28	5.128
29	5.462
30	4.290
31	3.912
32	2.445
33	2.109
34	1.898
35	2.274
36	1.771
37	1.310
38	0.722
39	1.601
40	1.475
41	0.510
42	0.257
43	0.508
44	1.513
45	1.722
46	1.302
47	0.967
48	0.630
49	0.336
50	0.502
51	0.000];
data.tN25(:,2) = cumsum(data.tN25(:,2)); % convert reprod rate to cum reprod
units.tN25   = {'d', '#'};  label.tN25 = {'time since start imago', 'cumulative reproduction', '25 C'}; 
temp.tN25 = C2K(25);  units.temp.tN25 = 'K'; label.temp.tN25 = 'temperature';
bibkey.tN25 = 'SancLaca2002'; % Figure 1
%
data.tN30 = [ ... % time since start imago (d), number of eggs (#/d)
0   0.000 
1	0.419
2	3.365
3	2.102
4	2.985
5	2.942
6	3.616
7	3.319
8	4.498
9	2.981
10	3.738
11	4.622
12	5.716
13	6.136
14	6.557
15	6.177
16	5.670
17	5.206
18	4.026
19	4.657
20	4.108
21	2.297
22	1.707
23	1.285
24	1.790
25	1.577
26	0.230
27	0.143
28	0.000];
data.tN30(:,2) = cumsum(data.tN30(:,2)); % convert reprod rate to cum reprod
units.tN30   = {'d', '#'};  label.tN30 = {'time since start imago', 'cumulative reproduction', '30 C'}; 
temp.tN30 = C2K(30);  units.temp.tN30 = 'K'; label.temp.tN30 = 'temperature';
bibkey.tN30 = 'SancLaca2002'; % Figure 1
%
data.tN35 = [ ... % time since start imago (d), number of eggs (#/d)
0	0.000
1	0.206
2	0.498
3	0.610
4	0.912
5	1.321
6	1.786
7	1.283
8	1.323
9	1.446
10	1.243
11	1.110
12	0.000];
data.tN35(:,2) = cumsum(data.tN35(:,2)); % convert reprod rate to cum reprod
units.tN35   = {'d', '#'};  label.tN35 = {'time since start imago', 'cumulative reproduction', '35 C'}; 
temp.tN35 = C2K(35);  units.temp.tN35 = 'K'; label.temp.tN35 = 'temperature'; 
bibkey.tN35 = 'SancLaca2002'; % Figure 1

% time-survival
data.tS20 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
6.874	1.000
46.771	0.935
46.987	0.908
48.761	0.908
49.197	0.873
50.748	0.869
51.407	0.842
51.844	0.814
56.276	0.803
56.486	0.748
60.021	0.692
60.034	0.751
62.896	0.657
62.902	0.654
68.660	0.654
69.318	0.619
72.866	0.619
73.303	0.591
74.403	0.553
75.513	0.553
76.172	0.532
77.502	0.532
78.161	0.504
79.040	0.466
80.142	0.435
80.799	0.400
82.340	0.351
83.433	0.278
84.543	0.278
84.972	0.222
86.747	0.222
87.396	0.153
94.049	0.153
95.150	0.125
96.481	0.125
97.139	0.094
98.456	0.035
99.787	0.035
100.223	0.000];
units.tS20   = {'d', '-'};  label.tS20 = {'time since start imago', 'surviving fraction', '20 C'}; 
temp.tS20 = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature'; 
bibkey.tS20 = 'SancLaca2002'; 
%
data.tS25 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
3.116	1.000
8.927	0.972
9.171	0.941
10.751	0.910
11.224	0.868
15.449	0.868
15.920	0.840
25.048	0.840
26.206	0.778
27.568	0.740
30.902	0.740
31.591	0.719
32.489	0.708
33.642	0.649
34.645	0.482
35.573	0.426
36.735	0.353
37.710	0.228
38.624	0.190
40.185	0.190
40.870	0.165
44.208	0.165
44.897	0.137
45.586	0.106
48.702	0.106
48.952	0.068
56.079	0.068
56.550	0.030
59.666	0.030
60.578	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since start imago', 'surviving fraction', '25 C'}; 
temp.tS25 = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature'; 
bibkey.tS25 = 'SancLaca2002'; 
%
data.tS30 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
3.763	1.000
4.419	0.972
5.737	0.927
7.729	0.937
8.608	0.902
9.263	0.864
10.803	0.826
15.450	0.829
16.768	0.788
17.637	0.715
18.285	0.645
19.383	0.607
20.031	0.538
20.909	0.506
22.448	0.461
23.320	0.402
23.965	0.319
25.064	0.287
25.949	0.287
27.269	0.253
28.146	0.214
29.246	0.187
30.793	0.183
32.556	0.152
32.990	0.110
35.203	0.113
35.858	0.075
36.507	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since start imago', 'surviving fraction', '30 C'}; 
temp.tS30 = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature'; 
bibkey.tS30 = 'SancLaca2002'; 
%
data.tS35 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
0.674	0.965
1.561	0.962
2.699	0.829
3.385	0.735
5.166	0.704
5.853	0.606
6.986	0.498
8.323	0.467
8.996	0.432
10.332	0.404
11.454	0.345
11.707	0.206
13.043	0.178
14.167	0.111
15.292	0.038
15.521	0.000];
units.tS35   = {'d', '-'};  label.tS35 = {'time since start imago', 'surviving fraction', '35 C'}; 
temp.tS35 = C2K(35);  units.temp.tS35 = 'K'; label.temp.tS35 = 'temperature'; 
bibkey.tS35 = 'SancLaca2002'; 

%% Added data (mod_1)
% imago pronotum width-imago wet weight (female)
data.LWj_f = [ ... pronotum width (cm), wet weight of female imago (g)
     0.855*0.1  0.464*0.001
     0.842*0.1  0.515*0.001
     0.819*0.1  0.405*0.001
     0.811*0.1  0.400*0.001]; %mm to cm, mg to g
units.LWj_f = {'cm', 'g'};  label.LWj_f = {'imago pronotum width', 'imago wet weight', 'female'};
temp.LWj_f = C2K(23);  units.temp.LWj_f = 'K'; label.temp.LWj_f = 'temperature';
bibkey.LWj_f = 'DeclArij2005';
comment.LWj_f = 'Data for two diets and generations';

% imago pronotum width-imago wet weight (male)
data.LWj_m = [ ... pronotum width (cm), wet weight of male imago (g)
     0.805*0.1  0.385*0.001 
     0.800*0.1  0.412*0.001
     0.798*0.1  0.344*0.001
     0.783*0.1  0.338*0.001]; %mm to cm, mg to g
units.LWj_m = {'cm', 'g'};  label.LWj_m = {'imago pronotum width', 'imago wet weight', 'male'}; 
temp.LWj_m = C2K(23);  units.temp.LWj_m = 'K'; label.temp.LWj_m = 'temperature';
bibkey.LWj_m = 'DeclArij2005'; 
comment.LWj_m = 'Data for two diets and generations';

% food density-imago pronotum width (female, male)
data.XLj_fm = [ ... food density (#/d), female, male imago pronotum width (cm)
     1  0.585*0.1  0.550*0.1  
     3  0.684*0.1  0.653*0.1
     5  0.735*0.1  0.685*0.1
     8  0.752*0.1  0.736*0.1
    10  0.768*0.1  0.735*0.1];
units.XLj_fm = {'#/d', 'cm'};  label.XLj_fm = {'food density', 'imago pronotum width'}; title.XLj_fm = 'different food density';
temp.XLj_fm = C2K(26);  units.temp.XLj_fm = 'K'; label.temp.XLj_fm = 'temperature';
bibkey.XLj_fm = 'GallRodr2022'; treat.XLj_fm = {1 {'females','males'}}; label.treat.XLj_fm = 'gender';
comment.XLj_fm = 'Food is Ephestia kuehniella eggs';

% food density-duration of instar 1
data.X_b1 = [ ... food density (#/d), duration of instar 1 (d)
     1  2.05
     3  2.05
     5  2.02
     8  1.98
    10  2.00];
units.X_b1 = {'#/d', 'd'};  label.X_b1 = {'food density', 'duration of instar 1'}; title.X_b1 = 'different food density';
temp.X_b1 = C2K(26);  units.temp.X_b1 = 'K'; label.temp.X_b1 = 'temperature';
bibkey.X_b1 = 'GallRodr2022'; treat.X_b1 = {0}; label.treat.X_b1 = 'duration';
comment.X_b1 = 'Food is Ephestia kuehniella eggs';

% food density-duration of instar 2
data.X_12 = [ ... food density (#/d), duration of instar 2 (d)
     1  1.33
     3  1.18
     5  1.13
     8  1.11
    10  1.12];
units.X_12 = {'#/d', 'd'};  label.X_12 = {'food density', 'duration of instar 2'}; title.X_12 = 'different food density';
temp.X_12 = C2K(26);  units.temp.X_12 = 'K'; label.temp.X_12 = 'temperature';
bibkey.X_12 = 'GallRodr2022'; treat.X_12 = {0}; label.treat.X_12 = 'duration';
comment.X_12 = 'Food is Ephestia kuehniella eggs';

% food density-duration of instar 3
data.X_23 = [ ... food density (#/d), duration of instar 3 (d)
     1  2.18 
     3  1.72
     5  1.72
     8  1.48
    10  1.48];
units.X_23 = {'#/d', 'd'};  label.X_23 = {'food density', 'duration of instar 3'}; title.X_23 = 'different food density';
temp.X_23 = C2K(26);  units.temp.X_23 = 'K'; label.temp.X_23 = 'temperature';
bibkey.X_23 = 'GallRodr2022'; treat.X_23 = {0}; label.treat.X_23 = 'duration';
comment.X_23 = 'Food is Ephestia kuehniella eggs';

% food density-duration of instar 4
data.X_3p = [ ... food density (#/d), duration of instar 4 (d)
     1  4.00
     3  1.86
     5  1.80
     8  1.76
    10  1.72];
units.X_3p = {'#/d', 'd'};  label.X_3p = {'food density', 'duration of instar 4'}; title.X_3p = 'different food density';
temp.X_3p = C2K(26);  units.temp.X_3p = 'K'; label.temp.X_3p = 'temperature';
bibkey.X_3p = 'GallRodr2022'; treat.X_3p = {0}; label.treat.X_3p = 'duration';
comment.X_3p = 'Food is Ephestia kuehniella eggs';

% food density-duration of instar 5
data.X_pj = [ ... food density (#/d), duration of instar 5 (d)
     1  8.00 
     3  4.09
     5  3.67
     8  3.23
    10  3.30];
units.X_pj = {'#/d', 'd'};  label.X_pj = {'food density', 'duration of instar 5'}; title.X_pj = 'different food density';
temp.X_pj = C2K(26);  units.temp.X_pj = 'K'; label.temp.X_pj = 'temperature';
bibkey.X_pj = 'GallRodr2022'; treat.X_pj = {0}; label.treat.X_pj = 'duration';
comment.X_pj = 'Food is Ephestia kuehniella eggs';


%% set weights for all real data
weights = setweights(data, []);
%weights.XWi_fm = 5 * weights.XWi_fm;
%weights.Xt_ji = 3 * weights.Xt_ji;
weights.Wwb = 1 * weights.Wwb;
weights.Ni = 1 * weights.Ni;
%weights.Wwi = 0 * weights.Wwi;
weights.Tji_fm = 1 * weights.Tji_fm;
weights.LWj_f = 5 * weights.LWj_f;
weights.LWj_m = 5 * weights.LWj_m;
weights.XLj_fm = 3 * weights.XLj_fm;
weights.X_b1 = 3 * weights.X_b1;
weights.X_12 = 3 * weights.X_12;
weights.X_23 = 3 * weights.X_23;
weights.X_3p = 3 * weights.X_3p;
weights.X_pj = 3 * weights.X_pj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tN35','tN30','tN25','tN20'}; subtitle1 = {'Data for 35, 30, 25, 20 C'};
set2 = {'tS35','tS30','tS25','tS20'}; subtitle2 = {'Data for 35, 30, 25, 20 C'};
set3 = {'LWj_f', 'LWj_m'}; subtitle3 = {'Data for females and males'};
metaData.grp.sets = {set1,set2,set3}; %txtData.label.sets = {'temperature','temperature'};
%metaData.grp.sets = {set1,set2}; %txtData.label.sets = {'temperature','temperature'};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};
%metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points 
D1 = 'males are supposed to differ from females by {p_Am} and h_a only';
D2 = 'model hep is applied: period bp acceleration, pj isomorphic growth, allocation to reprod, ji no growth or allocation to reprod';
D3 = 'growth data suggests a 3 parameter Arrhenius model, but survival a 1 parameter one';
D4 = 'reproduction efficiency depends on temperature different from growth and survival';
D5 = 'SancLaca2002, CocuCler1997 and ArijPatr2001 mean with "adult" imago, instar 5 is pj (DEB adult), and "egg to adult" is bj';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Development stages: egg, instars 1 to 5, followed by the imago';
metaData.bibkey.F1 = 'Kopp2025'; 
metaData.facts = struct('F1',F1);

%% Links 
metaData.links.id_CoL = 'BY3DJ'; % Cat of Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_ITIS = '93980'; % ITIS Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_EoL = '3688421'; % Ency of Life
metaData.links.id_Wiki = 'Orius'; % Wikipedia
metaData.links.id_ADW = 'Orius'; % ADW, no data 
metaData.links.id_Taxo = '2729348'; % Taxonomicon, no data, has data for Orius niger (Wolff, 1811)
metaData.links.id_WoRMS = 'Orius'; % WoRMS, no data

%% References
bibkey = 'Kopp2025'; type = 'Misc'; bib = [ ...
'author = {Koppert}, ' ...
'year = {2025}, ' ...
'howpublished = {\url{https://www.koppert.com/crop-protection/biological-pest-control/predatory-insects/orius-laevigatus/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Orius_laevigatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SancLaca2002'; type = 'Article'; bib = [ ...
'author = {Sanchez, J.A. and Lacasa, A.}, ' ...
'year = {2002}, ' ...
'title  = {Modelling population dynamics of \emph{Orius laevigatus} and \emph{O. albidipennis} ({H}emiptera: {A}nthocoridae) to optimize their use as biological control agents of \emph{Frankliniella occidentalis} ({T}hysanoptera: {T}hripidae)}, ' ...
'journal = {Bulletin of Entomological Research}, ' ...
'volume = {92}, ' ...
'pages = {77--88}, ' ...
'doi = {10.1079/BER2001136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArijPatr2001'; type = 'Article'; bib = [ ...
'author = {Arijs, Yves and Patrick De Clercq}, ' ...
'year = {2001}, ' ...
'title  = {Rearing \emph{Orius laevigatus} on cysts of the brine shrimp \emph{Artemia franciscana}}, ' ...
'journal = {Biological Control}, ' ...
'volume = {21,1}, ' ...
'pages = {79--83}, ' ...
'doi = {10.1006/bcon.2000.0910}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlauDarg1994'; type = 'Article'; bib = [ ...
'author = {Alauzet, C. and Dargagnon, D. and Malausa, J.}, ' ...
'year = {1994}, ' ...
'title  = {Bionomics of a polyphagous predator: \emph{Orius laevigatus} ({H}et.: {A}nthocoridae).}, ' ...
'journal = {Entomophaga}, ' ...
'volume = {39(1)}, ' ...
'pages = {33--40}, ' ...
'doi = {10.1007/BF02373492}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CocuCler1997'; type = 'Article'; bib = [ ...
'author = {G. E. Cocuzza and P. De Clercq and S. Lizzioa and M. Van de Veire and L. Tirry and D. Degheele and V. Vacante}, ' ...
'year = {1997}, ' ...
'title  = {Life tables and predation activity of \emph{Orius laevigatus} and \emph{O. albidipennis} at three constant temperatures}, ' ...
'journal = {Entomologia Experimentalis Et Applicata}, ' ...
'volume = {85}, ' ...
'pages = {189--198}, ' ...
'doi = {10.1046/j.1570-7458.1997.00249.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GallRodr2022'; type = 'Article'; bib = [ ...
'author = {Gallego, F.J. and Rodríguez-Gómez, A. and Reche, M.D.C. and Balanza, V. and Bielza, P.}, ' ...
'year = {2022}, ' ...
'title  = {Effect of the Amount of \emph{Ephestia kuehniella} Eggs for Rearing on Development, Survival, and Reproduction of \emph{Orius laevigatus}}, ' ...
'journal = {Insects}, ' ...
'volume = {13}, ' ...
'pages = {250}, ' ...
'doi = {10.3390/insects13030250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeclArij2005'; type = 'Article'; bib = [ ...
'author = {De Clercq, P. and Arijs, Y. and Van Meir, T. and Van Stappen, G. and Sorgeloos, P. and Dewettinck, K. and Rey, M. and Grenier, S. and Febvay, G.}, ' ...
'year = {2005}, ' ...
'title  = {Nutritional value of brine shrimp cysts as a factitious food for \emph{Orius laevigatus} ({H}eteroptera: {A}nthocoridae)}, ' ...
'journal = {Biocontrol Science and Technology}, ' ...
'volume = {15}, ' ...
'pages = {467-479}, ' ...
'doi = {10.1080/09583150500086706}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
