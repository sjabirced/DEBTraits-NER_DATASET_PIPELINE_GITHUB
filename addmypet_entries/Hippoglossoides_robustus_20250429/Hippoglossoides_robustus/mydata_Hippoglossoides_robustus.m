function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossoides_robustus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hippoglossoides_robustus'; 
metaData.species_en = 'Bering flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.am = 29*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'Star2011';   
  temp.am = C2K(0.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'guess';
data.Li  = 35;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Star2011';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.92 mm of H. elassodon: pi/6*0.092^3';
data.Wwp = 32;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00676*Lp^3.12, see F1';
data.Wwi = 444;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Star2011','fishbase'};
  comment.Wwi = 'based on 0.00676*Li^3.12, see F1';
  
data.GSI  = 0.09; units.GSI  = 'g/g'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(0.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on H. elassodon';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.902	6.079
1.066	1.645
1.803	5.870
1.803	5.045
2.090	8.446
2.172	6.178
2.213	4.837
2.664	8.444
2.951	9.165
3.074	8.030
3.402	8.751
3.893	14.419
4.057	10.810
4.344	10.500
4.590	13.592
4.631	12.664
4.631	8.025
4.754	11.736
4.795	10.602
4.836	16.993
4.837	15.035
4.877	19.467
4.918	16.065
4.958	14.003
4.959	12.663
5.000	18.024
5.041	23.384
5.082	10.498
5.122	21.631
5.123	15.755
5.205	14.930
5.206	13.796
5.246	17.198
5.247	12.765
5.287	11.631
5.656	14.722
5.697	14.001
5.779	12.660
5.820	17.815
5.821	16.578
5.902	18.948
5.943	23.587
5.984	14.515
5.985	15.855
5.986	20.391
6.025	12.865
6.066	17.092
6.066	19.257
6.107	13.381
6.107	18.123
6.148	15.339
6.189	23.174
6.230	12.659
6.231	14.720
6.270	19.256
6.271	22.555
6.311	16.988
6.434	19.256
6.598	25.441
6.721	13.791
6.762	19.255
6.803	24.100
6.803	22.657
6.844	24.718
6.844	21.110
6.844	20.182
6.845	16.883
6.885	17.914
6.886	16.161
6.887	15.131
6.926	17.295
6.967	19.151
6.967	14.099
7.008	26.058
7.047	23.893
7.048	22.450
7.049	21.212
7.090	21.522
7.091	20.388
7.092	16.058
7.131	28.841
7.172	22.862
7.173	12.655
7.254	15.232
7.336	17.397
7.418	18.222
7.746	21.622
7.828	16.261
7.829	20.179
7.869	25.746
7.869	24.921
7.910	14.715
7.951	31.312
7.951	16.983
7.953	19.869
7.991	13.993
7.992	15.539
7.993	18.013
8.033	21.312
8.074	19.044
8.075	22.446
8.156	26.982
8.197	24.714
8.236	25.848
8.237	19.353
8.238	20.074
8.320	32.033
8.361	27.909
8.402	22.548
8.688	23.475
8.689	14.712
8.730	25.949
8.770	20.588
8.811	30.279
8.811	24.402
8.811	22.856
8.852	19.144
8.934	27.907
8.934	21.515
8.975	22.752
8.975	13.989
9.098	32.236
9.098	30.484
9.098	25.948
9.098	20.381
9.098	17.803
9.098	17.185
9.139	13.886
9.262	21.617
9.303	22.545
9.467	23.885
9.754	31.203
9.795	26.873
9.836	29.244
9.877	28.110
9.959	30.378
10.164	26.769
10.328	33.469
10.328	25.840
10.533	23.469
10.615	24.705
10.615	29.138
10.656	32.128
10.738	29.963
10.779	25.839
10.820	22.437
10.820	30.375
10.820	31.406
10.820	33.364
10.861	26.869
10.902	16.972
10.943	23.673
10.984	21.302
10.984	24.601
10.984	27.900
10.984	28.828
11.107	25.528
11.107	32.745
11.107	35.425
11.148	24.394
11.148	30.167
11.148	31.198
11.148	34.394
11.270	26.868
11.311	23.981
11.311	34.291
11.680	28.207
11.680	26.970
11.721	34.495
11.721	30.372
11.721	29.031
11.762	36.660
11.762	26.042
11.803	36.041
11.803	23.773
11.844	33.773
11.844	31.505
11.885	22.742
11.926	32.433
11.926	26.969
11.967	36.350
11.967	34.495
11.967	30.268
12.049	27.896
12.049	20.577
12.090	33.566
12.090	29.030
12.131	25.937
12.213	32.535
12.213	26.865
12.254	28.205
12.664	28.410
12.705	35.626
12.828	29.955
12.869	33.564
12.910	25.728
12.992	35.728
12.992	27.068
12.992	29.027
13.033	32.223
13.156	37.583
13.156	34.078
13.238	40.882
13.238	22.531
13.238	26.964
13.238	32.428
13.730	30.159
13.770	34.488
13.811	36.035
13.852	31.498
13.934	36.962
13.934	30.158
13.934	27.993
14.098	32.322
14.180	30.157
14.180	28.920
14.221	34.590
14.262	31.291
14.713	30.671
14.918	26.752
14.918	28.608
14.918	34.691
14.959	35.412
15.000	39.020
15.000	33.762
15.041	30.463
15.041	31.494
15.082	37.886
15.082	20.463
15.123	33.556
15.164	27.783
15.246	41.081
15.246	37.988
15.615	33.657
15.656	29.018
15.738	32.626
15.861	33.553
15.861	25.718
15.943	34.481
15.984	40.976
15.984	36.027
15.984	34.893
16.025	37.676
16.025	21.491
16.189	32.418
16.189	29.016
16.270	36.026
16.598	38.087
16.680	33.241
16.680	38.705
16.721	30.251
16.762	31.282
16.803	34.169
16.803	35.818
16.844	39.942
16.844	37.467
16.844	24.065
16.926	37.055
16.926	29.426
17.090	41.075
17.131	32.415
17.131	37.776
17.172	39.013
17.213	33.446
17.213	34.580
17.213	36.538
17.705	37.671
17.746	35.506
17.828	39.010
17.910	36.742
17.951	46.742
17.992	43.546
18.033	33.340
18.156	36.638
18.156	39.009
18.279	33.442
18.811	40.038
18.811	35.605
18.934	38.697
19.016	34.677
19.016	35.604
19.180	34.573
19.221	44.470
19.672	34.880
19.754	40.138
19.959	33.333
20.041	36.941
20.082	37.766
20.246	38.899
20.738	38.794
20.943	37.763
20.984	40.237
21.270	36.731
21.721	36.729
21.844	38.069
22.090	36.728
22.705	38.891
22.746	41.365
22.869	42.395
22.992	43.323
23.033	36.828
23.156	40.126
23.156	34.765
23.852	37.546
23.852	31.361
24.098	44.247
24.139	41.978
24.180	40.947
24.303	43.421
24.836	38.780
25.000	40.017
25.123	37.233
25.328	40.119
26.885	42.278
27.008	38.876
29.098	37.735
30.000	38.866];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(0.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Star2011';
comment.tL_f = 'Data for females in eastern Bering Sea';
% males 
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.850	1.605
1.808	5.132
2.090	3.853
2.233	6.494
2.659	7.617
2.905	6.259
2.906	7.219
3.048	8.580
3.259	6.261
3.331	7.701
3.797	15.304
3.828	10.905
4.004	9.706
4.143	6.267
4.678	12.030
4.754	17.790
4.822	14.271
4.852	8.591
4.853	9.631
4.854	10.991
4.862	20.511
4.886	7.471
4.958	8.752
4.962	13.152
4.996	11.312
4.999	15.552
5.067	12.192
5.071	16.832
5.136	9.633
5.137	11.073
5.169	7.633
5.173	12.193
5.205	8.433
5.210	13.473
5.242	9.474
5.246	14.434
5.667	10.916
5.740	13.157
5.744	17.957
5.774	12.037
5.776	14.517
5.842	8.517
5.848	15.717
5.852	19.397
5.885	16.758
5.917	13.238
5.948	8.518
5.950	10.758
5.951	12.038
5.993	18.998
6.020	9.959
6.027	17.719
6.057	12.119
6.059	14.519
6.064	20.119
6.129	13.559
6.133	17.959
6.166	15.479
6.309	16.600
6.625	14.682
6.626	15.882
6.658	12.123
6.728	11.003
6.773	21.483
6.801	13.404
6.804	16.844
6.841	19.164
6.870	11.004
6.873	14.684
6.875	17.724
6.879	21.564
6.939	9.804
6.942	13.404
6.944	15.724
6.984	20.205
7.016	16.765
7.047	12.205
7.056	22.365
7.084	13.405
7.089	19.165
7.091	21.165
7.117	10.846
7.155	14.446
7.229	18.126
7.723	16.609
7.728	21.569
7.762	20.210
7.787	8.610
7.867	19.250
7.898	14.531
7.899	15.891
7.901	17.971
7.904	20.611
7.932	12.291
8.042	16.771
8.076	15.812
8.106	10.052
8.107	10.932
8.117	21.572
8.119	23.892
8.149	18.292
8.185	19.332
8.360	17.094
8.789	21.736
8.816	13.176
8.857	19.337
8.896	23.577
8.925	16.617
8.933	24.937
9.037	22.698
9.070	20.458
9.071	21.578
9.075	26.058
9.100	14.378
9.104	18.298
9.175	19.339
9.249	22.699
9.599	18.141
9.845	17.023
9.848	20.543
9.911	11.983
10.031	27.504
10.054	13.264
10.058	18.304
10.070	31.824
10.095	19.105
10.099	23.905
10.100	24.865
10.197	14.625
10.233	15.825
10.696	19.508
10.730	17.909
10.770	22.709
10.810	28.469
10.869	15.510
10.871	17.030
10.914	26.070
10.948	24.950
10.974	13.430
11.018	23.911
11.049	19.111
11.059	29.591
11.095	30.631
11.224	16.712
11.231	24.872
11.263	20.472
11.306	29.912
11.617	21.274
11.720	17.915
11.757	19.355
11.763	25.995
11.796	23.995
11.830	22.476
11.868	24.956
11.933	18.316
11.970	20.317
12.008	24.077
12.014	30.877
12.038	17.117
12.078	22.717
12.112	21.518
12.115	25.118
12.150	24.158
12.255	22.878
12.713	21.441
12.818	20.162
12.927	22.723
12.931	27.523
12.996	21.603
13.009	35.603
13.035	24.803
13.133	16.724
13.170	17.924
13.173	21.444
13.317	24.885
13.844	20.409
14.097	26.250
14.134	28.410
14.162	20.491
14.164	22.811
14.195	17.851
14.275	27.531
14.806	28.575
14.943	23.696
15.091	30.737
15.154	22.737
15.160	28.657
15.932	22.742
16.041	26.103
16.145	23.863
16.287	23.704
16.790	33.227
16.852	22.588
16.929	29.948
16.958	22.829
17.103	27.549
17.177	30.750
17.183	37.790
17.206	23.710
17.207	25.150
17.845	26.354
17.915	25.155
17.983	22.755
18.093	27.316
18.168	31.876
18.312	34.277
18.976	26.281
19.152	25.003
20.000	24.048
20.041	30.848
20.917	21.334
21.879	29.500
21.880	30.940
22.121	23.822
22.171	40.142
22.839	35.666
22.872	32.946
22.873	34.466
23.086	35.508
23.120	33.828
23.755	31.752
24.000	28.474
24.182	34.315
24.360	36.636
26.021	35.447];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(0.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Star2011';
comment.tL_m = 'Data for males in eastern Bering Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Pacific: Hokkaido, Japan and the Sea of Okhotsk north to northeast of Cape Lisburne, south to northwest of Akutan Island, Aleutian chain, Alaska. Arctic Canada';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3M25L'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570096'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossoides_robustus'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossoides_robustus'; % ADW
metaData.links.id_Taxo = '176722'; % Taxonomicon
metaData.links.id_WoRMS = '254561'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossoides_robustus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossoides_robustus}}';
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
bibkey = 'Star2011'; type = 'Article'; bib = [ ... 
'doi = {10.1080/17451000.2011.569554}, ' ...
'author = {Stark, J. W.}, ' ... 
'year = {2011}, ' ...
'title = {Contrasting the maturation, growth, spatial distribution and vulnerability to environmental warming of \emph{Hippoglossoides robustus} ({B}ering flounder) with \emph{H. elassodon} (flathead sole) in the eastern {B}ering {S}ea}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {7(8)}, ' ...
'pages = {778–785}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hippoglossoides_robustus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

