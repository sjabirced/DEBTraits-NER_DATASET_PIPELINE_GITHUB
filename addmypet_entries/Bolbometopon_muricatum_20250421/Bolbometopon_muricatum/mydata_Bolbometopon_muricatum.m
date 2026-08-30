function [data, auxData, metaData, txtData, weights] = mydata_Bolbometopon_muricatum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Bolbometopon_muricatum'; 
metaData.species_en = 'Green humphead parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-W'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data

data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TaylHami2018';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 60; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TaylHami2018'; 
data.Lim  = 130;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: pi/6*0.075^3'; 
data.Wwp = 3508; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'TaylHami2018','guess'};
  comment.Wwp = 'based on 0.01380*60^3.03, see F1';
data.Wwi = 35e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.03, see F1; max. published weight: 46.0 kg ';

data.GSI = 2*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'TaylHami2018';
  temp.GSI = C2K(28.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'assumed: 2 spawnings per year';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.038	1.332
0.058	1.799
0.059	1.334
0.075	1.667
0.096	2.067
0.105	2.002
0.121	2.069
0.126	2.335
0.136	3.001
0.155	2.736
0.165	2.803
0.172	3.269
0.184	3.403
0.195	3.071
0.255	4.139
0.270	4.805
0.312	4.675
0.318	5.939
0.410	7.141
0.483	9.141
0.492	6.815
0.510	8.145
0.588	11.010
0.626	11.145
0.638	11.611
0.657	11.214
0.690	13.477
0.720	15.274
0.739	12.150
0.743	16.406
0.766	19.200
0.767	11.155
0.774	16.208
0.784	20.132
0.851	18.873
1.676	21.946
1.677	41.680
1.965	27.900
2.254	33.854
2.543	37.946
2.775	34.219
2.832	46.878
3.006	28.259
3.815	50.590
3.988	54.311
3.989	43.513
4.046	40.161
4.162	46.117
4.797	70.311
4.798	52.811
4.913	65.469
4.971	48.713
5.028	60.628
5.029	57.649
5.087	55.042
5.896	57.266
5.952	53.914
5.953	60.616
5.954	73.648
6.012	78.488
6.069	69.923
6.935	84.434
6.936	72.891
6.937	64.327
6.992	75.125
6.993	60.231
6.994	55.390
8.092	94.473
8.150	60.217
9.017	90.365
9.827	97.430
9.884	67.642
9.885	79.557
9.942	75.088
9.943	84.769
10.058	71.735
10.925	72.842
10.926	68.746
10.983	76.937
11.965	82.137
12.023	85.488
12.139	89.210
13.006	88.827
13.179	102.973
13.757	85.466
13.931	114.879
13.987	107.804
13.988	81.740
15.896	99.216
15.954	95.492
16.012	83.204
16.069	107.778
16.879	100.321
16.936	95.108
17.918	105.521
17.919	103.287
17.975	99.935
17.976	96.956
17.977	85.786
18.902	99.924
19.942	85.017
20.000	89.484
20.058	103.633
20.923	90.962
20.924	93.569
20.925	97.664
20.926	104.739
21.040	116.652
21.965	104.726
21.966	93.183
22.081	96.905
22.139	107.330
22.832	106.205
23.006	99.500
23.295	101.731
23.873	91.670
23.931	103.585
25.029	103.571
25.202	99.473
25.896	108.028
25.954	101.698];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylHami2018'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
5.780	74.767
5.838	67.692
6.879	65.817
6.936	78.476
6.994	70.284
7.746	85.913
7.860	55.007
7.861	71.390
7.862	80.327
7.918	96.709
7.919	63.943
7.977	67.293
8.843	105.261
8.844	84.782
8.960	77.707
9.015	71.748
9.016	67.653
9.017	63.557
9.884	90.355
9.942	94.450
10.867	92.576
10.981	105.235
10.982	100.022
10.983	88.852
11.040	82.149
12.139	98.890
13.064	110.422
13.121	104.463
13.873	91.050
13.931	95.889
14.046	102.218
14.855	108.165
14.971	104.068
15.954	117.832
16.936	111.490
20.925	107.345
21.156	99.151
21.850	110.312
21.908	101.003
23.121	107.690
24.220	111.772
25.087	106.921
25.088	113.251
25.838	113.242
29.017	81.926];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylHami2018'; 

% length-weight
data.LW = [ ... % total length (cm), weight(g)
5.435	128.489
7.492	381.385
10.577	319.779
11.018	5.020
13.956	195.316
15.425	321.961
17.335	889.748
18.216	1331.092
18.804	134.504
20.126	891.004
21.889	387.862
22.476	514.110
24.092	640.821
24.386	263.002
25.561	515.498
26.884	1083.022
27.471	642.341
28.940	831.979
30.115	832.508
30.997	517.944
33.054	1085.798
33.641	519.134
34.082	1527.205
35.551	1275.898
35.845	583.116
36.873	1780.431
37.754	457.991
38.195	1277.088
39.664	710.821
39.811	2222.698
40.399	1404.063
41.427	2034.448
42.455	2034.910
42.749	964.176
43.043	1972.182
44.512	2413.790
45.393	3107.098
45.540	1658.344
49.066	2541.822
49.066	1848.908
49.066	3360.718
51.270	2542.814
51.270	3361.710
52.151	2984.155
52.298	4055.087
53.473	2795.773
53.620	3488.754
53.767	1977.007
54.795	4938.100
55.089	2355.555
55.530	3552.604
55.530	4371.502
55.971	2418.945
57.146	3616.324
57.146	2860.419
58.174	2356.944
58.468	4246.840
58.615	3050.054
59.643	3869.415
59.790	4940.348
60.378	2861.873
61.553	3555.314
61.700	2862.468
61.847	3114.501
61.994	4311.417
63.463	5382.945
64.050	4249.352
64.344	2989.641
65.226	4060.904
65.226	4690.826
65.960	5447.061
67.282	4250.806
67.282	5195.689
67.576	6329.678
68.164	3558.288
69.045	5574.433
69.339	6897.399
69.339	4692.676
70.367	6078.966
71.102	7024.179
71.542	5512.564
71.689	8095.309
72.571	8347.674
72.718	4883.173
72.718	6394.984
73.305	5387.373
73.452	7025.236
73.893	6395.513
74.187	8474.384
74.774	5325.043
75.215	7340.990
75.950	9105.099
75.950	8097.226
76.537	6270.719
76.537	7656.546
77.712	6838.176
78.153	8224.201
78.300	9484.111
78.888	7657.604
78.888	7027.682
78.888	10303.271
80.063	11059.705
80.210	8729.065
80.210	9421.977
80.651	9233.198
80.651	7595.403
81.532	9989.500
81.826	7721.916
82.120	11375.591
82.560	12005.711
82.707	9045.146
83.295	8415.492
83.882	10557.489
84.470	12699.485
85.058	9550.142
85.205	11628.950
85.498	16164.514
85.498	14085.775
85.792	8668.583
85.792	10306.378
86.086	11944.307
87.114	14716.424
87.114	13456.580
87.261	16102.317
87.849	9614.391
87.849	10622.264
88.290	11567.344
88.290	12890.178
88.730	15410.063
89.024	14024.368
89.612	12134.868
90.052	9489.398
90.346	13584.018
90.346	16859.610
90.787	18182.642
90.787	12324.373
90.934	15411.054
91.375	16356.135
91.375	14214.403
91.522	13206.593
91.668	11757.842
92.550	15474.775
92.697	18435.469
92.844	17049.708
92.844	13270.181
93.284	19128.648
93.578	20262.637
93.725	12262.705
93.872	18058.046
94.166	16483.375
94.166	14215.658
94.313	15727.535
95.047	19759.363
95.047	14719.993
95.194	18751.553
95.194	13586.200
95.341	17113.825
95.635	21649.390
95.635	13145.453
96.369	17303.265
96.369	14279.641
96.663	16169.538
96.810	18941.258
96.810	14909.760
96.810	12075.116
97.104	15728.791
97.104	17996.507
97.251	20579.250
97.398	22658.057
97.398	19886.404
97.545	21965.210
97.691	20516.458
97.838	17429.909
98.426	16674.268
98.867	24107.537
98.867	21713.837
99.014	15918.627
99.748	19257.540
99.748	16296.909
99.748	17241.792
99.895	24737.921
100.042	18060.822
100.189	22533.329
100.336	21084.576
100.630	20013.842
100.923	25683.266
101.364	21903.937
101.364	20392.127
101.511	23037.860
101.511	19825.262
101.511	18943.373
101.805	24486.813
103.127	21337.802
103.421	26692.264
103.568	27385.244
103.568	22345.872
103.715	24487.672
104.155	19574.484
104.449	21338.397
104.596	28267.596
104.596	23291.217
105.037	25496.140
105.037	18944.959
105.624	29212.941
105.771	26315.369
106.212	24362.811
106.359	27512.483
106.359	20079.413
106.359	22158.152
106.506	30410.187
106.506	27071.605
106.946	28457.630
107.387	24930.269
107.681	29024.889
107.975	25812.423
108.416	26190.574
108.709	26883.619
108.709	23608.029
108.709	22285.194
108.856	30915.182
108.856	28269.512
109.444	30222.533
110.178	29026.013
110.325	31230.804
110.766	24742.812
110.913	23168.076
111.207	25876.869
111.501	30538.420
111.647	26506.989
111.794	28585.795
111.941	31357.515
112.382	25184.484
112.823	32428.778
113.410	26066.837
113.557	33625.959
113.704	29720.512
113.851	31925.304
114.439	33563.363
114.439	28083.048
114.586	34319.335
115.173	30792.040
116.495	29721.768
116.642	35706.087
116.642	31485.614
117.083	29344.080
117.230	30289.028
117.377	32997.756
117.524	34761.602
118.552	33817.183
119.727	34825.585];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'TaylHami2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01380*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: Red Sea and East Africa to Samoa and the Line Islands, north to the Yaeyama and Wake islands, south to the Great Barrier Reef and New Caledonia.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'MBLC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Bolbometopon_muricatum'; % Wikipedia
metaData.links.id_ADW = 'Bolbometopon_muricatum'; % ADW
metaData.links.id_Taxo = '164351'; % Taxonomicon
metaData.links.id_WoRMS = '219074'; % WoRMS
metaData.links.id_fishbase = 'Bolbometopon_muricatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bolbometopon_muricatum}}';
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
bibkey = 'TaylHami2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-018-1723-9}, ' ...
'author = {Taylor, B. M. and Hamilton, R. J. and Almany, G. R. and Howard Choat, J.}, ' ... 
'year = {2018}, ' ...
'title = {The world''s largest parrotfish has slow growth and a complex reproductive ecology}, ' ...
'journal = {Coral Reefs}, ' ...
'volume = {84}, ' ...
'pages = {283-546}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Bolbometopon-muricatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

