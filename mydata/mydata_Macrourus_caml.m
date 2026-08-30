function [data, auxData, metaData, txtData, weights] = mydata_Macrourus_caml
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Macrourus_caml'; 
metaData.species_en = 'Caml grenadier'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 06];

%% set data
% zero-variate data

data.am = 62*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'PinkMcMi2013';   
  temp.am = C2K(2.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 52;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PinkMcMi2013'; 
data.Li  = 82;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  comment.Li = 'based on tL data; fishbase gives 58.9 cm';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm for Coryphaenoides rupestris: pi/6*0.26^3';
data.Wwp = 663;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'PinkMcMi2013','fishbase'};
  comment.Wwp = 'based on 0.00214*Lp^3.20, see F1';
data.Wwi = 2848;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00214*Li^3.20, see F1';

data.Ri  = 3.5e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(2.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Macrourus_carinatus: 79221*2848/6450';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
10.817	41.903
11.899	53.382
12.981	51.502
13.101	64.392
13.101	48.220
13.942	43.763
13.942	45.404
13.942	52.435
14.063	42.122
14.063	54.544
14.784	55.947
14.784	49.384
14.784	47.978
14.904	46.337
15.264	44.460
15.745	48.677
15.865	51.254
15.986	47.738
16.106	58.050
16.106	56.175
16.106	54.534
16.346	60.627
16.707	56.172
16.827	64.609
16.827	39.062
16.827	58.515
16.947	43.984
16.947	61.093
17.067	49.374
17.067	51.249
17.187	53.592
17.788	58.980
17.909	62.026
17.909	48.667
18.029	51.713
18.029	55.229
18.269	46.790
18.630	53.585
18.750	57.803
18.990	39.755
18.990	55.693
19.111	63.192
19.111	47.958
19.231	61.317
19.351	43.972
19.591	54.049
19.952	40.220
19.952	44.204
20.072	63.188
20.072	46.547
20.192	57.562
20.312	49.593
20.433	55.217
20.553	47.014
20.673	73.732
20.673	55.216
20.913	60.840
21.034	50.293
21.034	52.871
21.154	59.198
21.274	41.151
21.394	54.978
21.514	47.009
21.875	41.851
21.875	53.570
21.995	63.413
21.995	44.194
21.995	51.460
21.995	57.319
21.995	59.663
22.596	55.910
22.957	68.799
22.957	50.518
22.957	58.018
23.077	62.002
23.078	44.658
23.197	38.329
23.197	53.798
23.677	50.983
23.678	54.733
23.798	43.952
24.038	46.294
24.760	48.166
24.880	45.118
24.881	50.978
25.000	58.008
25.240	60.585
25.601	66.443
25.841	52.848
25.842	42.536
25.962	60.582
26.082	65.035
26.803	50.500
26.803	52.375
26.923	60.343
26.923	64.093
26.923	45.109
27.043	62.218
27.644	54.715
27.763	63.855
27.764	48.620
28.005	61.510
28.245	60.103
28.726	59.397
28.963	67.599
28.964	69.709
28.965	78.380
28.966	55.646
29.687	62.908
30.047	61.500
30.048	47.907
30.168	65.719
31.130	54.464
31.131	51.886
31.250	68.292
31.611	65.477
31.851	58.445
32.933	65.237
33.173	68.751
33.654	79.765
34.495	74.604
34.975	59.837
34.976	58.665
35.096	81.633
36.058	71.550
36.779	66.156
36.898	61.937
36.899	74.124
37.019	70.140
37.260	80.217
39.904	62.626
46.154	65.175];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(2.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PinkMcMi2013';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
12.032	43.190
12.190	44.879
13.773	47.292
14.248	55.737
14.723	50.670
14.881	53.083
14.882	40.295
15.198	49.705
15.673	34.987
15.831	46.810
16.306	54.772
16.307	47.534
16.623	57.668
16.623	49.223
16.939	45.362
16.939	44.879
17.414	60.080
17.889	52.359
18.047	48.740
18.364	44.155
18.364	42.466
18.997	53.083
19.156	45.844
19.631	49.705
19.789	51.635
20.106	52.601
20.422	46.810
20.739	54.531
21.055	53.566
21.055	43.914
21.214	57.426
21.372	55.737
21.530	42.225
21.689	49.946
22.005	57.909
22.006	49.223
22.164	47.534
22.638	43.914
22.639	50.912
22.797	54.772
23.272	52.359
23.430	54.290
23.747	50.912
23.905	42.949
24.538	53.083
24.697	65.389
24.697	55.737
24.855	59.115
25.013	48.016
25.330	52.118
25.646	53.807
25.963	62.493
26.280	49.946
26.594	57.426
26.595	46.086
26.596	42.708
26.755	54.531
26.756	52.601
27.863	47.292
28.179	56.702
28.654	53.566
28.813	54.048
28.971	61.769
29.921	45.362
29.921	44.397
30.079	55.255
30.871	60.322
31.504	50.429
31.662	51.877
31.821	58.391
31.979	61.287
32.929	54.531
33.245	53.083
33.562	64.665
33.562	46.086
34.195	53.083
35.620	64.665
35.778	60.563
36.728	58.150
36.887	69.491
38.153	53.807
38.628	68.043
43.536	63.458
43.536	64.906
46.702	58.874
48.760	75.282
49.710	66.595
50.026	58.150
51.768	68.525
61.900	71.421];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(2.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PinkMcMi2013';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
34.250	176.882
36.500	316.718
37.167	400.727
37.667	204.387
38.583	381.814
38.667	269.652
39.083	344.353
39.500	278.868
40.500	428.245
40.917	344.068
41.333	306.620
41.583	465.459
41.833	306.542
42.083	353.232
42.500	437.279
42.750	390.511
43.250	614.733
43.583	549.260
43.833	437.071
43.833	427.725
44.250	530.464
44.500	502.388
44.500	558.463
44.750	455.620
45.333	483.567
45.417	418.133
45.583	520.911
45.583	558.294
46.000	623.650
46.250	436.695
46.500	511.423
46.583	586.176
46.833	707.632
46.917	735.656
47.083	548.715
47.167	595.431
47.167	679.543
47.417	941.186
47.667	529.932
48.167	464.434
48.250	585.916
48.500	623.260
48.667	660.618
48.917	529.737
49.167	791.381
49.250	660.527
49.583	567.017
49.583	838.045
49.667	725.882
49.750	679.140
49.917	744.535
50.250	585.604
50.583	800.506
50.750	660.293
50.750	753.751
50.833	884.579
51.083	622.858
51.250	763.019
51.583	604.089
51.833	865.732
51.917	716.186
52.083	660.086
52.167	725.493
52.667	790.836
52.667	949.714
52.750	641.290
53.083	884.229
53.417	837.448
53.500	996.313
53.500	566.407
53.667	715.913
53.917	912.136
54.000	818.665
54.167	687.798
54.333	1183.099
54.667	799.870
54.667	883.982
54.750	1154.997
54.750	940.044
54.917	996.093
55.000	1136.267
55.083	715.693
55.417	1098.819
55.417	1164.239
55.667	809.060
55.917	949.208
56.000	1220.223
56.000	1051.999
56.167	874.402
56.583	1285.553
56.667	893.016
56.750	1220.106
56.750	995.807
56.917	565.875
57.000	1294.834
57.000	743.432
57.083	1154.634
57.333	1285.436
57.333	920.950
57.667	1107.814
57.833	1219.937
57.833	1079.750
57.917	1416.186
58.000	967.575
58.500	1219.833
58.583	752.531
58.667	1294.574
58.667	1163.733
58.750	1088.954
58.833	1434.735
59.000	1472.092
59.000	1201.064
59.000	883.307
59.500	1257.061
59.583	1060.786
59.833	1415.887
59.833	995.327
59.917	1546.716
59.917	1453.258
59.917	1359.800
60.000	967.263
60.167	1284.995
60.167	1135.462
60.250	1584.047
60.500	1733.541
60.750	1481.165
60.750	1369.016
60.750	1144.717
60.833	1191.433
60.917	1471.794
61.000	1640.005
61.000	948.416
61.083	1331.581
61.333	1144.626
61.417	1471.716
61.583	1359.540
61.833	1378.193
62.333	1209.890
62.417	1649.130
62.417	1396.794
62.583	1536.954
62.667	1733.203
62.833	1705.140
62.917	1331.295
63.083	1163.045
63.083	1611.643
63.417	1705.049
63.667	1583.515
64.000	1405.893
64.083	1218.964
64.083	1564.758
64.417	1293.679
64.750	1527.271
64.833	1359.034
64.833	1424.454
65.250	1489.810
65.417	1704.737
65.583	1798.169
65.917	1872.884
66.167	1770.041
66.333	1592.445
66.417	2227.946
66.583	2153.154
66.833	1994.236
67.000	2115.706
67.083	1723.169
67.333	1601.635
67.667	2162.331
67.917	2283.787
68.167	1339.823
68.500	1685.566
68.500	1629.491
68.667	1835.072
68.667	1778.998
68.917	1620.080
68.917	1433.164
69.333	1778.894
69.333	2246.183
69.500	1891.017
70.083	1685.319
70.083	1844.197
70.583	1760.007
70.750	1844.093
70.917	2759.956
70.917	1582.385
72.000	2563.525
72.000	1769.132
73.000	2413.837
73.000	2124.117
73.917	2310.890
74.333	3086.526
74.417	3226.700
74.417	2890.252
74.500	1993.042
77.583	3413.123
78.500	3226.064
80.083	2263.200
80.417	3113.616
80.667	3272.456
81.417	4188.227
84.000	3767.264
84.083	3178.465
84.167	5393.406];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'PinkMcMi2013';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
% weights.Wwi = 3 * weights.Wwi;
% weights.Wwb = 3 * weights.Wwb;
% weights.Ri = 3 * weights.Ri;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';     
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00214*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southern Ocean: probably widespread in the Southern Ocean including the Ross Sea, Balleny and Scott Islands slope, Cosmonaut Sea (33 E), south of South Georgia (54 S), at 350–2080 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3XCV2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46564615'; % Ency of Life
metaData.links.id_Wiki = 'Macrourus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3417214'; % Taxonomicon
metaData.links.id_WoRMS = '712470'; % WoRMS
metaData.links.id_fishbase = 'Macrourus_caml'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrourus}}';
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
bibkey = 'PinkMcMi2013'; type = 'Article'; bib = [ ... 
'author = {M.H. Pinkerton and P. McMillan and J. Forman and P. Marriott and P. Horn and S. Bury and J. Brown}, ' ... 
'year = {2013}, ' ...
'title = {DistrIbutIon, morphology anD ecology of \emph{Macrourus whitsoni} anD \emph{M. caml} ({G}aDIformes, {M}acrourIDae) In the {R}oss {S}ea regIon}, ' ...
'journal = {CCAMLR Science}, ' ...
'volume = {20}, ' ...
'pages = {37–61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macrourus_caml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

