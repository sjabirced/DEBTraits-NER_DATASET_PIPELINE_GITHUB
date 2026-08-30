function [data, auxData, metaData, txtData, weights] = mydata_Macrotis_lagotis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Peramelemorphia'; 
metaData.family     = 'Thylacomyidae';
metaData.species    = 'Macrotis_lagotis'; 
metaData.species_en = 'Greater bilby'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHr', 'xiHl', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 14];

%% set data
% zero-variate data

data.tg = 17;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 110;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 11;    units.Li  = 'cm';  label.Li  = 'ultimate head length for females';   bibkey.Li  = 'SoutChri2000';
data.Lim  = 14;    units.Lim  = 'cm';  label.Lim  = 'ultimate head length for males';   bibkey.Lim  = 'SoutChri2000';

data.Wwb = 0.245; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 1000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'SoutChri2000';
data.Wwim = 2000;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'SoutChri2000';

data.Ri  = 4 * 2/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 4 litters per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
44.985	45.331
57.960	172.698
68.365	262.615
76.693	83.053
81.562	285.194
87.035	202.910
95.124	135.620
102.040	622.212
102.453	427.605
102.627	345.271
102.722	300.362
108.274	180.653
110.225	510.013
110.812	233.072
123.502	495.167
123.835	337.985
123.977	270.621
128.958	420.368
133.796	637.479
142.314	368.098
155.289	495.465
158.160	390.701
168.676	428.225
170.723	712.675
176.465	503.148
184.063	667.889
191.819	757.782
197.720	473.406
205.746	436.056
210.727	585.804
221.164	660.752
231.664	705.760
231.950	571.032
235.011	376.450
247.749	616.090
258.217	676.068
258.741	429.067
263.674	601.269
270.971	908.224
284.612	721.225
287.372	668.856
292.479	758.724
294.684	968.326
300.791	586.646
303.202	698.944
316.161	833.796
319.366	571.850
321.856	646.724
329.533	774.041
340.256	714.261
342.587	863.983
348.044	789.184
351.010	639.511
358.132	1028.800
363.557	968.970
363.969	774.363
372.123	677.134
377.040	856.821
377.278	744.548
387.318	1006.618
387.953	707.222
390.189	901.854
392.378	1118.940
403.133	1044.191
405.988	946.912
406.115	887.033
419.661	744.944
432.208	1074.403
443.105	932.289
443.406	790.076
448.292	984.733
458.412	1209.378
459.316	782.740
472.545	790.349
474.829	962.526
475.051	857.738
496.354	805.542
500.843	1187.320
506.664	940.369
509.487	858.060
520.020	888.099
520.226	790.795
533.058	985.526
564.767	1023.248
564.909	955.884
573.078	851.170
575.013	1188.014
575.188	1105.681
599.235	1008.600
623.281	911.520
628.183	1098.691
673.786	829.657
713.282	942.302
720.769	1159.438
755.729	912.759
786.930	1189.997
797.890	1017.944
839.893	1197.978
857.976	1415.213
858.816	1018.514
869.555	951.249
954.401	914.618
1094.462	1073.114
1227.275	902.201
1234.254	1358.853];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f    = C2K(35);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SoutChri2000';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
32.528	15.591
64.414	107.922
69.671	69.628
77.797	238.418
90.993	192.532
91.099	292.226
91.172	361.246
104.247	200.328
107.010	307.716
109.472	131.360
120.141	200.480
120.320	369.194
123.042	438.238
136.116	277.321
146.940	492.148
157.471	430.900
159.990	308.224
162.851	507.638
178.688	454.109
184.059	523.179
194.785	645.981
197.288	507.968
197.930	1113.803
205.828	1067.866
208.169	776.478
210.647	615.458
211.069	1014.235
216.164	822.566
229.150	577.292
229.247	669.318
229.345	761.343
229.564	968.400
253.365	930.285
261.011	646.616
261.125	753.979
261.645	1244.782
261.905	1490.183
266.667	984.093
274.427	807.787
282.293	731.176
282.447	876.883
285.868	1605.443
293.133	961.341
293.328	1145.392
306.223	815.761
316.917	907.888
317.908	1843.480
319.932	1253.009
320.037	1352.703
327.416	815.964
335.615	1053.773
338.036	839.072
338.345	1130.486
338.621	1391.225
349.030	1214.944
349.104	1283.963
349.811	1951.148
359.367	969.645
362.528	1452.804
364.559	870.001
370.548	1521.899
372.726	1077.135
386.995	2043.529
387.157	2196.905
388.547	1008.268
389.034	1468.395
396.762	1261.414
397.119	1598.841
402.775	1936.318
412.494	1108.191
413.891	2427.223
422.927	954.917
423.772	1752.471
425.657	1031.630
426.511	1836.853
433.718	1139.069
433.889	1300.114
439.488	1583.910
444.258	1085.489
452.383	1254.279
452.465	1330.967
455.341	1545.718
455.528	1722.100
468.879	1821.921
471.309	1614.890
473.405	1093.437
473.535	1216.138
478.996	1369.564
479.914	2236.138
487.056	1477.004
487.227	1638.048
498.351	2136.621
502.683	1224.086
505.551	1431.169
510.532	1132.137
524.647	1952.824
527.800	2428.314
529.579	1607.779
534.438	1193.716
535.430	2129.308
548.789	2236.798
556.265	1792.084
571.679	1339.778
627.325	1355.649
664.680	1609.074
670.384	1992.565
699.450	1923.825
725.518	1525.302
736.480	1870.499
752.065	1579.237
787.446	2469.147
876.724	1726.138
950.865	1696.174
993.469	1903.637
1139.613	2326.817
1144.285	1736.371
1194.503	1629.491
1234.311	1698.891
1576.297	1947.568];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m    = C2K(35);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SoutChri2000';

% time-head length
data.tL_f = [ ... % time since birth (yr), headlength (mm)
1.648	0.517
3.032	1.145
5.288	0.775
27.999	2.030
38.091	2.584
45.984	3.618
48.803	4.320
51.680	5.132
54.324	5.501
55.960	3.950
61.403	4.984
61.578	5.316
61.965	6.055
63.620	4.541
70.441	8.197
71.999	6.498
76.531	5.796
78.864	5.574
79.563	6.904
82.246	7.347
83.610	5.278
88.840	5.906
92.260	7.753
93.973	6.349
94.147	6.682
100.114	8.713
101.750	7.162
112.094	8.195
116.354	6.976
119.095	7.530
124.713	8.897
133.738	7.419
136.440	7.899
136.751	8.490
166.172	8.525
166.657	9.449
173.290	8.082
176.167	8.894
200.998	9.521
208.077	9.004
212.609	8.302
218.072	9.373
259.278	8.521
311.605	10.181
321.580	10.513
323.274	9.072
325.530	8.703
333.676	10.217
341.395	10.918
370.603	10.548
380.035	9.845
410.038	10.989
448.853	10.248
473.219	9.989
507.754	10.430
525.177	10.947
537.040	10.207
539.180	9.616
569.707	11.757
578.596	10.021
598.449	10.500
713.510	10.310
728.444	10.753
806.365	9.826
963.234	9.929
1237.595	9.806
1237.789	10.175];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'head length', 'females'};  
temp.tL_f   = C2K(35);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SoutChri2000';
%
data.tL_m = [ ... % time since birth (yr), headlength (mm)
4.125	0.744
8.928	1.303
11.424	1.042
16.220	1.637
28.230	3.014
30.628	3.312
33.215	2.530
37.849	4.056
47.448	5.210
54.837	4.987
57.372	4.502
57.411	4.279
59.164	8.263
61.993	6.103
64.358	6.587
66.991	5.544
71.624	7.071
73.905	8.039
76.727	5.916
83.797	7.517
83.921	6.810
86.423	6.512
93.553	7.777
95.912	8.298
96.101	7.219
115.416	8.856
115.650	7.516
120.466	7.999
125.425	7.664
137.429	9.078
137.814	6.882
142.421	8.557
152.306	8.072
152.365	7.737
162.003	8.668
178.920	10.007
179.031	9.374
205.893	9.894
213.191	10.192
227.795	10.750
227.932	9.968
235.015	11.494
247.651	9.297
257.498	9.036
262.255	9.855
279.433	9.705
313.573	10.634
320.846	11.081
340.402	11.340
340.559	10.447
360.076	10.930
362.246	12.531
376.882	12.902
377.110	11.599
386.950	11.375
413.988	10.890
418.641	12.305
423.633	11.783
433.531	11.224
443.176	12.117
453.055	11.670
453.244	10.590
472.416	13.047
477.701	10.850
516.449	13.454
649.166	11.140
823.004	11.876
945.568	11.573
1227.112	12.900];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'head length', 'males'};  
temp.tL_m   = C2K(35);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SoutChri2000';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = '3XC4Y'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '323882'; % Ency of Life
metaData.links.id_Wiki = 'Macrotis_lagotis'; % Wikipedia
metaData.links.id_ADW = 'Macrotis_lagotis'; % ADW
metaData.links.id_Taxo = '60075'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10900004'; % MSW3
metaData.links.id_AnAge = 'Macrotis_lagotis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrotis_lagotis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoutChri2000'; type = 'Article'; bib = [ ... 
'doi = {10.1071/WR99104}, ' ...
'author = {Richard Southgate and P. Christie and K. Bellchambers}, ' ... 
'year = {2000}, ' ...
'title = {Breeding biology of captive, reintroduced and wild greater bilbies, \emph{Macrotis lagotis} ({M}arsupialia: {P}eramelidae)}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {27(6)}, ' ...
'pages = {621-628}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macrotis_lagotis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

