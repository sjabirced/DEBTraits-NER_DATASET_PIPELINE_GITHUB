  function [data, auxData, metaData, txtData, weights] = mydata_Platycaranx_chrysophrys
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Platycaranx_chrysophrys'; 
metaData.species_en = 'Longnose trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 72;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 545;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01862*Lp^2.87, see F1';
data.Wwi = 4e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^2.87, see F1; max. published weight: 4.4 kg';

data.GSI = 0.045;   units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Caranx caballus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
322.574	29.731
353.825	31.583
382.557	30.594
365+263.346	43.737
365+353.316	45.950
365+383.307	46.465
730+75.744	49.164
730+137.830	51.532
730+168.666	52.047
730+229.914	53.412
730+291.163	54.609
730+381.139	55.653
1095+47.819	56.335
1095+110.333	57.868
1095+229.871	60.595
1095+354.063	62.156
1460+46.936	62.683
1460+76.927	63.198
1460+291.520	65.301
1460+381.919	66.345];
data.tL(:,1) = 0+ data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'MarzJaya2013'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
19.964	234.875
23.253	149.466
26.549	256.227
27.181	373.665
27.490	245.551
28.668	309.608
29.062	373.665
29.927	427.046
31.258	384.341
31.740	693.950
32.290	736.655
32.358	448.398
32.905	405.694
34.085	523.132
36.204	587.189
36.673	565.836
37.852	629.893
38.092	758.007
38.557	629.893
39.115	864.768
39.188	715.302
39.270	811.388
39.823	928.825
39.894	736.655
39.897	822.064
40.128	704.626
40.449	886.121
40.921	939.501
41.082	1046.263
41.150	790.035
41.782	896.797
41.790	1099.644
42.173	875.444
42.179	1024.911
42.962	1014.235
43.193	918.149
43.442	1259.786
43.592	1088.968
43.676	1217.082
43.823	992.883
43.986	1142.349
44.148	1281.138
44.525	896.797
44.610	1056.939
44.848	1142.349
44.933	1291.815
45.093	1387.900
45.233	960.854
45.320	1174.377
45.629	1056.939
45.714	1217.082
46.189	1355.871
46.338	1153.025
46.813	1270.462
47.119	1078.292
47.364	1334.519
47.439	1238.434
47.763	1494.662
48.070	1345.195
48.297	1120.996
48.393	1569.395
48.458	1249.110
48.702	1462.633
48.854	1345.195
48.943	1612.099
49.175	1537.366
49.181	1697.509
49.557	1281.138
49.719	1419.929
49.883	1601.423
49.888	1729.537
50.027	1270.462
50.108	1334.519
50.113	1473.310
50.143	2241.993
50.281	1761.566
50.286	1879.003
50.514	1697.509
50.586	1537.366
50.656	1323.843
50.738	1409.253
51.069	1857.651
51.295	1612.099
51.298	1708.185
51.546	2017.793
51.681	1473.310
51.763	1558.719
51.925	1686.832
52.061	1174.377
52.168	1900.356
52.479	1836.299
52.547	1558.719
52.627	1612.099
52.872	1857.651
53.025	1750.889
53.101	1708.185
53.262	1804.270
53.405	1451.957
53.487	1558.719
53.584	2017.793
53.657	1900.356
53.960	1612.099
53.981	2156.583
54.121	1718.861
54.205	1857.651
54.207	1911.032
54.371	2092.526
54.522	1953.736
54.592	1750.889
54.609	2188.612
54.754	1879.003
54.838	2028.469
54.839	2039.146
55.131	1483.986
55.302	1846.975
55.385	1985.765
55.402	2412.811
55.470	2145.907
55.780	2060.498
55.921	1654.804
56.167	1921.708
56.186	2412.811
56.188	2455.516
56.241	1814.946
56.245	1921.708
56.330	2081.850
56.338	2284.697
56.413	2199.288
56.720	2039.146
56.724	2135.231
56.947	1836.299
57.109	1953.736
57.128	2444.840
57.202	2327.402
57.345	1996.441
57.431	2167.260
57.439	2391.459
57.493	1750.889
57.584	2071.174
57.749	2295.373
57.892	1943.060
57.901	2167.260
57.967	1857.651
58.225	2444.840
58.279	1814.946
58.288	2039.146
58.375	2263.345
58.466	2594.306
58.520	1964.413
58.777	2519.573
58.844	2220.640
58.854	2487.544
58.918	2124.555
58.928	2380.783
59.256	2733.096
59.567	2669.039
59.586	3170.818
59.627	2220.640
59.638	2476.868
59.640	2551.601
59.792	2423.487
59.807	2797.153
59.858	2113.879
59.889	2882.562
59.945	2316.726
60.113	2615.658
60.207	3010.676
60.414	2295.373
60.430	2701.067
60.485	2092.526
60.577	2434.163
60.599	3000.000
60.647	2231.316
60.811	2423.487
60.817	2572.954
60.909	2925.267
60.963	2306.049
60.977	2647.687
61.132	2615.658
61.139	2797.153
61.287	2572.954
61.435	2338.078
61.513	2327.402
61.606	2701.067
61.612	2850.534
61.618	3000.000
61.676	2487.544
61.792	3437.722
61.898	2145.907
61.902	2263.345
61.911	2476.868
61.928	2914.590
61.935	3085.409
62.154	2679.715
62.298	2359.430
62.462	2540.925
62.471	2775.800
62.487	3170.818
62.553	2850.534
62.559	3021.352
62.633	2903.914
62.703	2690.391
62.715	2989.323
62.795	3042.704
62.960	3234.875
63.013	2604.982
63.334	2786.476
63.567	2743.772
63.650	2861.210
63.669	3330.961
63.771	3939.501
63.823	3256.228
63.970	3010.676
64.132	3149.466
64.202	2935.943
64.210	3149.466
64.255	2295.373
64.421	2519.573
64.591	2850.534
64.695	3523.132
64.754	3032.028
64.760	3160.142
64.763	3245.551
64.829	2925.267
64.844	3309.608
65.082	3384.341
65.227	3085.409
65.398	3459.074
65.481	3576.512
65.525	2690.391
65.621	3149.466
65.628	3320.285
65.700	3149.466
65.710	3416.370
65.774	3032.028
66.036	3725.979
66.087	3042.704
66.174	3256.228
66.187	3576.512
66.249	3160.142
66.334	3341.637
66.408	3213.523
66.416	3427.046
66.512	3886.121
66.637	3074.733
66.666	3811.388
66.710	2935.943
66.822	3790.035
66.861	2775.800
66.966	3469.751
67.107	3053.381
67.117	3320.285
67.127	3576.512
67.270	3213.523
67.306	4142.348
67.377	3950.178
67.423	3128.114
67.449	3768.683
67.679	3661.921
67.679	3661.921
67.694	4035.587
67.746	3352.313
67.749	3437.722
67.751	3491.103
67.971	3096.085
68.164	4035.587
68.368	3224.199
68.440	3074.733
68.469	3811.388
68.543	3704.626
68.632	3960.854
68.672	2989.323
68.786	3886.121
68.794	4088.968
68.856	3683.274
69.001	3384.341
69.103	3971.530
69.167	3608.541
69.226	3128.114
69.233	3309.608
69.393	3373.665
69.625	3298.932
69.651	3971.530
69.857	3224.199
69.874	3661.921
69.957	3779.359
69.969	4078.292
70.027	3555.160
70.419	3565.836
70.502	3683.274
70.588	3864.768
70.672	4024.911
70.692	4516.014
70.969	3587.188
71.052	3715.302
71.061	3939.501
71.229	4227.758
71.278	3480.427
71.365	3693.950
71.370	3811.388
71.436	3501.779
71.598	3640.569
71.717	4676.156
71.762	3822.064
71.771	4056.939
71.846	3960.854
71.862	4366.548
72.150	3725.979
72.400	4110.320
72.485	4281.138
72.717	4185.053
72.726	4419.929
72.954	4227.758
73.012	3725.979
73.019	3907.473
73.057	4857.651
73.198	4451.957
73.661	4270.462
73.821	4355.872
73.884	3971.530
74.001	4943.060
74.108	3672.598
74.288	4270.462
74.293	4387.900
74.302	4633.452
74.430	3896.797
75.045	3576.512
75.130	3758.007
75.291	3864.768
76.738	4782.918
78.128	4238.434];    
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'MarzJaya2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
%weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^2.87'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2HN'; % Cat of Life
metaData.links.id_ITIS = '1228275'; % ITIS
metaData.links.id_EoL = '46578079'; % Ency of Life
metaData.links.id_Wiki = 'Carangoides_chrysophrys'; % Wikipedia
metaData.links.id_ADW = 'Carangoides_chrysophrys'; % ADW
metaData.links.id_Taxo = '106145'; % Taxonomicon
metaData.links.id_WoRMS = '1802006'; % WoRMS
metaData.links.id_fishbase = 'Platycaranx-chrysophrys'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Carangoides_chrysophrys}}';  
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
bibkey = 'MarzJaya2013'; type = 'article'; bib = [ ... 
'author = {A. Al-Marzouqi and N. Jayabalan and A. Al-Nahdi}, ' ...
'year = {2013}, ' ...
'title = {Length based growth and stock assessment of the longnose trevally \emph{Carangoides chrysophrys} ({C}uvier, 1833) from the {A}rabian {S}ea coast of {O}man}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {60(2)}, '...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Platycaranx-chrysophrys.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  