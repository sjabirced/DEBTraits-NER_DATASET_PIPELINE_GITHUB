function [data, auxData, metaData, txtData, weights] = mydata_Calidris_canutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_canutus'; 
metaData.species_en = 'Knot'; 

metaData.ecoCode.climate = {'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 05];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibase';   
  temp.ab = C2K(33); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-23 d';
data.tx = 18;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'bow';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-20 d';
data.tp = 150;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.3*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 19.3;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 13.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'bow';
data.Wwi = 148.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 126;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% univariate data
data.tW_isl = [ ... % time since hatch (d), weight (g)
0.936	13.351
1.284	14.614
1.775	11.732
1.912	15.476
2.751	15.103
2.819	18.013
3.514	23.447
3.861	27.201
3.936	18.484
5.254	33.915
5.262	20.211
5.326	29.351
5.456	47.630
5.610	22.305
5.744	32.279
6.026	26.894
6.724	27.759
6.787	39.806
6.854	44.792
6.866	23.614
6.869	17.385
7.829	49.824
7.832	43.595
8.181	45.274
8.315	54.417
8.738	47.793
9.015	51.545
9.501	56.967
9.577	45.343
9.777	62.380
9.988	59.483
10.341	53.687
10.617	59.515
10.822	67.415
10.824	64.093
11.663	62.474
12.357	69.568
12.502	59.609
12.982	76.659
14.719	91.281
14.926	96.274
14.939	73.019
15.003	82.989
15.768	89.257
15.848	70.573
16.612	78.917
16.813	93.461
16.963	74.366
17.025	89.319
18.281	90.628
18.355	83.987
18.488	94.791
19.190	88.597
19.397	92.344];
units.tW_isl   = {'d', 'g'};  label.tW_isl = {'time since birth', 'wet weight', 'C.c.islandica'};  
temp.tW_isl    = C2K(41);  units.temp.tW_isl = 'K'; label.temp.tW_isl = 'temperature';
bibkey.tW_isl  = 'LameTomk2022';
comment.tW_isl = 'Data for C.c.islandica at Alert, Princess Marie Bay';
%
data.tW_rog = [ ... % time since hatch (d), weight (g)
1.257	12.887
1.257	18.267
1.676	7.941
1.955	14.163
2.723	18.754
3.282	16.712
3.422	20.444
3.771	25.843
3.911	20.469
4.399	22.976
4.609	32.507
4.749	26.305
5.098	21.356
5.377	23.439
5.447	39.999
5.656	32.559
5.726	29.665
5.866	27.188
6.215	35.070
6.494	38.809
7.123	37.185
7.193	33.463
7.193	23.943
7.263	39.261
7.263	31.397
7.402	51.271
7.682	45.904
8.170	40.548
8.170	43.445
8.240	47.588
8.939	54.659
9.078	42.249
9.078	47.215
9.218	39.772
9.358	51.368
9.427	61.306
9.986	54.711
10.056	52.231
10.126	76.241
10.196	63.413
10.196	59.688
10.265	48.102
10.405	73.771
10.405	77.497
10.964	65.521
11.034	69.664
11.034	69.664
11.173	63.876
11.173	57.253
11.243	25.386
11.453	65.959
11.662	76.317
11.941	73.020
12.011	63.504
12.919	68.102
13.059	72.662
13.198	77.221
13.198	82.602
13.547	78.480
13.687	87.593
14.036	82.230
14.036	79.747
14.106	92.167
14.525	73.148
14.944	87.656
15.014	89.729
15.084	82.282
15.084	84.352
15.363	95.127
15.503	97.617
16.271	91.033
16.341	84.414
16.830	99.339
16.899	67.885
17.039	95.624
17.179	90.664
17.249	85.701
17.249	81.562
17.318	68.734
17.947	96.911
18.017	98.984
18.226	94.027
18.366	108.521
18.994	84.546];
units.tW_rog   = {'d', 'g'};  label.tW_rog = {'time since birth', 'wet weight', 'C.c.rogersi'};  
temp.tW_rog    = C2K(41);  units.temp.tW_rog = 'K'; label.temp.tW_rog = 'temperature';
bibkey.tW_rog  = 'LameTomk2022';
comment.tW_rog = 'Data for C.c.rogersi at Meinypilgyno';
%
data.tW_can = [ ... % time since hatch (d), weight (g)
1.047	19.920
1.047	12.883
1.257	14.963
2.025	21.210
2.165	14.180
2.165	17.906
2.933	22.497
3.003	17.533
3.073	12.570
3.142	26.232
3.352	24.173
4.050	25.450
4.260	30.013
4.260	32.496
4.818	31.282
4.958	44.120
5.028	27.568
5.098	35.849
5.168	39.578
5.237	45.790
6.006	41.275
6.075	44.176
6.145	31.348
6.215	35.491
6.355	54.951
6.564	51.237
6.704	35.515
7.123	60.370
7.123	39.675
7.193	55.407
7.193	47.543
7.682	45.084
7.961	48.823
8.031	42.617
8.380	50.085
8.450	57.953
8.450	71.198
8.520	67.890
8.589	61.685
8.589	45.543
9.078	49.706
9.078	52.603
9.078	60.054
9.148	56.332
9.148	66.266
10.056	72.933
10.056	87.420
10.056	55.963
10.126	64.245
10.126	83.698
10.196	68.801
10.196	77.079
10.196	79.977
10.684	85.796
10.754	78.349
10.754	81.246
10.894	63.455
11.034	73.810
11.103	69.260
11.173	80.853
11.313	85.413
11.941	53.159
12.011	80.895
12.011	69.719
12.081	75.517
12.221	87.528
12.291	94.567
12.709	65.201
12.709	99.555
12.919	97.910
13.059	91.708
13.198	87.162
13.268	97.099
13.268	100.411
13.338	68.129
13.338	105.795
13.478	71.448
13.897	97.545
13.897	103.339
13.966	109.137
14.036	100.035
14.246	66.933
14.944	69.037
15.014	74.007
15.293	98.028
15.503	78.999
15.712	110.466
15.782	106.330
15.992	71.986
16.061	68.265
16.061	98.480
16.131	87.308
16.201	93.520
16.201	113.387
16.341	76.143
16.899	109.697
17.109	79.492
17.458	89.857
17.737	78.282
17.807	86.977
18.017	64.223
18.296	94.866
18.506	99.015
18.506	79.975
18.855	68.817
18.994	87.864
19.274	85.808
19.274	92.845
19.413	110.650
19.832	98.253
19.902	94.532
20.251	73.026
20.251	111.105
20.531	104.910
20.601	100.775
20.950	77.200
21.089	87.140
21.439	97.091
21.508	94.197
22.067	80.152];
units.tW_can   = {'d', 'g'};  label.tW_can = {'time since birth', 'wet weight', 'C.c.canutus'};  
temp.tW_can    = C2K(41);  units.temp.tW_can = 'K'; label.temp.tW_can = 'temperature';
bibkey.tW_can  = 'LameTomk2022';
comment.tW_can = 'Data for C.c.canutus at Cape Sterlegov, Knipovich Bay';
%
data.tW_ros = [ ... % time since hatch (d), weight (g)
0.856	11.625
0.934	16.596
1.918	20.370
1.982	16.648
2.049	14.996
2.408	20.808
2.559	27.852
3.802	19.222
3.866	15.914
4.041	37.032
4.090	24.617
4.174	32.899
4.381	31.254
4.995	23.006
5.144	28.394
5.509	37.932
5.771	27.598
5.990	32.989
6.299	50.803
6.432	47.084
7.039	34.283
7.113	36.770
7.377	27.677
7.471	41.755
7.752	42.597
7.891	42.190
7.953	38.054
8.123	55.860
8.145	27.302
8.155	33.097
8.157	34.753
8.268	59.179
8.800	43.063
8.872	44.722
8.944	45.553
8.962	56.730
9.139	37.285
9.280	38.120
9.313	57.575
9.693	34.415
10.005	53.884
10.125	42.301
10.139	50.166
10.175	30.300
10.201	46.030
10.611	40.669
10.632	53.087
10.965	43.170
11.184	48.976
11.194	55.185
11.200	58.496
11.663	42.791
11.741	47.762
11.743	49.004
11.748	52.315
11.965	56.879
12.044	62.264
12.463	61.870
12.609	65.603
12.666	58.155
13.235	64.392
13.246	71.015
13.301	61.912
13.310	67.293
13.579	61.512
13.599	73.102
13.636	53.651
14.043	46.220
14.307	78.932
14.364	71.071
14.397	49.135
14.595	83.913
14.621	58.252
14.720	75.641
14.814	89.719
14.845	66.542
14.978	62.823
15.210	76.080
16.081	54.186
16.281	48.401
16.374	62.065
16.775	93.128
16.809	72.020
16.821	79.057
17.141	61.689
17.178	83.628
17.272	56.315
17.385	81.982
17.585	76.612
17.589	78.681
17.672	86.964
18.071	74.566
18.200	68.364
18.287	78.716
18.367	84.929
18.372	87.826
18.376	90.310
18.531	57.619
19.206	85.384
19.267	80.006
19.279	87.043
19.481	82.914
19.611	77.126
19.727	104.450
20.159	70.531
20.359	65.160
20.510	71.790
20.604	86.281
20.809	83.394
21.158	83.412
21.163	86.309
21.172	91.690
21.232	85.899
21.390	96.668
21.550	67.289
21.620	109.097
21.850	79.721
21.955	100.421
22.116	71.456
22.147	90.083
22.151	92.567
22.427	90.511
22.438	97.134
22.637	90.935
23.140	99.238
23.610	88.086
23.694	96.783
24.177	93.081
24.236	86.462
24.256	98.466
25.502	91.905];
units.tW_ros   = {'d', 'g'};  label.tW_ros = {'time since birth', 'wet weight', 'C.c.roselaari'};  
temp.tW_ros    = C2K(41);  units.temp.tW_ros = 'K'; label.temp.tW_ros = 'temperature';
bibkey.tW_ros  = 'LameTomk2022';
comment.tW_ros = 'Data for C.c.roselaari at Kigluaik Mountains';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi; 
weights.Ri = 3 * weights.Ri; 
weights.tp = 3 * weights.tp; 
weights.tW_isl = 5 * weights.tW_isl; 
weights.tW_can = 5 * weights.tW_can; 
weights.tW_ros = 5 * weights.tW_ros; 
weights.tW_rog = 5 * weights.tW_rog; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_isl','tW_can','tW_rog','tW_ros'}; subtitle1 = {'Data for islandica, canutus, rogersi, roselaari'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1}; txtData.label.sets = {'Subspec of Calidris canutus'};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'PK44'; % Cat of Life
metaData.links.id_ITIS = '176642'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Calidris_canutus'; % Wikipedia
metaData.links.id_ADW = 'Calidris_canutus'; % ADW
metaData.links.id_Taxo = '53736'; % Taxonomicon
metaData.links.id_WoRMS = '147433'; % WoRMS
metaData.links.id_avibase = 'B5CE8FAD18923A94'; % avibase
metaData.links.id_birdlife = 'red-knot-calidris-canutus'; % birdlife
metaData.links.id_AnAge = 'Calidris_canutus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_canutus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calidris_canutus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B5CE8FAD18923A94&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/redkno/cur/breeding}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LameTomk2022'; type = 'Article'; bib = [ ... 
'doi = {10.1111/gcb.16025}, ' ...
'author = {Thomas K. Lameris and  Pavel S. Tomkovich and James A. Johnson and R. I. Guy Morrison and Ingrid Tulp and Simeon Lisovski and Lucas DeCicco and Maksim Dementyev and Robert E. Gill and Job ten Horn and Theunis Piersma and Zachary Pohlen and Hans Schekkerman and Mikhail Soloviev and Evgeny E. Syroechkovsky1 and Mikhail K. Zhemchuzhnikov and Jan A. van Gils}, ' ... 
'year = {2022}, ' ...
'title = {Mismatch-induced growth reductions in a clade of Arctic-breeding shorebirds are rarely mitigated by increasing temperatures}, ' ...
'journal = {Glob Change Biol.}, ' ...
'volume = {28}, ' ...
'pages = {829–847}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

