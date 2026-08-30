function [data, auxData, metaData, txtData, weights] = mydata_Xenocypris_macrolepis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Xenocypris_macrolepis'; 
metaData.species_en = 'Yellowfin'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 17;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 34.6;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 54;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00851*Lp^3.09, see F1';
data.Wwi = 485;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.09, see F1; max. published weight: 902.00 g';

data.Ri = 56377/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Xenocypris argentea: 6377*1320/160';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
    1 13.75 13.57
    2 16.39 16.47
    3 18.88 18.40
    4 20.50 20.21
    5 23.08 22.44];
data.tL_fm(:,1) = 365*(1.3 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LiLiu2024'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (yr), weight (g)
    1  22.91  21.26
    2  40.08  40.71
    3  63.10  56.68
    4  82.08  74.84
    5 119.93 103.61];
data.tW_fm(:,1) = 365*(1.3 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(28.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'LiLiu2024'; treat.tW_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
12.332	7.193
12.442	8.501
12.660	8.501
13.041	7.411
13.043	9.591
13.260	8.065
13.479	9.155
13.588	8.937
13.751	8.937
13.754	12.643
13.862	10.681
13.916	10.463
14.027	12.861
14.135	11.117
14.189	11.117
14.191	13.951
14.352	10.245
14.517	12.425
14.572	13.079
14.626	11.989
14.628	14.387
14.847	15.695
14.958	18.529
15.010	14.605
15.064	14.387
15.175	16.785
15.229	15.477
15.281	12.643
15.282	13.297
15.446	14.169
15.610	14.823
15.666	17.439
15.828	14.169
15.828	15.041
15.830	18.093
15.831	18.747
16.046	14.387
16.266	16.349
16.375	16.785
16.434	22.888
16.540	18.311
16.540	19.401
16.650	20.272
16.703	18.093
16.815	21.580
16.817	24.850
16.866	16.567
16.922	19.619
16.975	16.567
16.975	17.439
17.139	18.093
17.141	20.054
17.144	24.414
17.195	19.619
17.252	23.542
17.305	21.362
17.472	25.286
17.521	18.311
17.522	18.747
17.523	20.490
17.524	21.798
17.524	22.452
17.528	28.120
17.689	23.760
17.692	27.902
17.692	27.902
17.795	19.837
17.800	26.376
17.852	22.452
17.909	26.158
17.962	24.850
18.071	24.196
18.073	27.684
18.130	30.954
18.234	23.324
18.236	25.940
18.237	28.338
18.294	30.736
18.344	24.414
18.346	27.466
18.347	28.556
18.454	25.722
18.508	24.632
18.614	20.490
18.619	28.774
18.669	21.798
18.780	23.760
18.780	24.196
18.781	26.158
18.784	30.518
18.845	39.237
18.891	27.466
18.895	33.134
18.948	30.082
19.000	26.158
19.112	31.826
19.162	24.850
19.166	30.082
19.167	31.826
19.218	27.248
19.277	33.352
19.278	34.223
19.383	28.992
19.387	34.005
19.387	34.005
19.436	26.376
19.497	35.313
19.546	27.248
19.546	28.120
19.549	32.480
19.551	35.313
19.604	32.262
19.655	27.248
19.712	31.172
19.712	31.390
19.716	37.275
19.820	29.864
19.824	35.313
19.876	32.262
19.930	31.608
20.039	30.518
20.042	34.441
20.043	35.967
20.043	36.839
20.093	29.428
20.149	31.390
20.208	38.365
20.259	33.787
20.318	40.109
20.370	36.185
20.423	33.787
20.424	35.095
20.425	37.275
20.431	45.123
20.476	32.262
20.532	33.569
20.587	34.441
20.588	35.967
20.643	36.839
20.694	31.826
20.700	39.891
20.803	30.954
20.914	34.659
20.920	42.289
21.024	35.531
21.026	38.365
21.134	37.275
21.138	42.071
21.300	39.673
21.462	38.365
21.469	47.738
21.519	40.763
21.571	37.929
21.574	42.071
21.577	47.084
21.579	49.482
21.625	37.057
21.632	47.520
21.794	44.469
21.845	40.109
21.847	42.071
21.847	42.943
21.849	45.341
21.903	45.123
21.954	39.891
22.011	43.379
22.013	46.649
22.123	46.649
22.178	47.520
22.229	42.507
22.230	44.687
22.234	50.136
22.285	45.559
22.338	42.943
22.448	43.815
22.723	47.738
23.054	52.752
23.162	51.444
23.378	48.610
23.381	52.970
23.383	55.368
23.386	59.074
23.711	55.804
23.877	59.510
23.878	60.817
24.150	59.728
24.421	57.548
24.757	71.063
24.913	59.728
25.135	64.741
25.794	71.281];
data.LW_f(:,2) = data.LW_f(:,2) * 180/80; % correct error in digitizing
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LiLiu2024'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
10.903	9.586
10.954	10.086
11.113	7.572
11.319	11.074
11.477	8.561
12.101	13.549
12.617	23.557
12.830	16.529
12.931	22.040
12.933	18.530
13.138	24.538
13.298	19.518
13.398	26.032
13.504	24.022
13.559	19.006
13.611	19.506
13.818	23.007
13.868	25.512
14.130	25.000
14.133	19.485
14.233	26.500
14.337	27.499
14.543	32.003
14.544	29.997
14.651	24.979
14.800	38.511
14.912	26.473
15.016	26.469
15.064	32.985
15.115	34.988
15.275	30.469
15.277	25.957
15.324	35.983
15.380	28.961
15.430	32.469
15.583	38.981
15.584	36.474
15.685	42.988
15.686	40.481
15.687	38.475
15.691	32.458
15.896	39.470
16.003	34.953
16.100	46.481
16.104	39.461
16.158	37.955
16.159	35.949
16.207	41.964
16.213	32.437
16.316	34.940
16.360	49.479
16.413	46.970
16.470	38.945
16.515	51.478
16.521	40.949
16.571	44.456
16.576	35.933
16.630	33.423
16.670	53.979
16.726	48.461
16.784	38.431
16.833	43.443
16.882	47.954
16.940	38.425
16.985	50.958
17.038	50.454
17.041	43.936
17.089	52.458
17.196	47.440
17.201	39.417
17.245	53.455
17.353	46.932
17.400	54.952
17.408	40.913
17.410	37.905
17.513	39.906
17.668	43.410
17.767	52.932
17.769	49.924
17.866	62.455
17.869	56.438
17.878	41.897
17.977	49.915
18.022	63.451
18.079	54.424
18.084	46.401
18.129	58.934
18.134	49.408
18.237	51.911
18.336	61.934
18.338	57.923
18.340	54.915
18.343	49.901
18.381	72.963
18.395	49.397
18.437	67.446
18.449	45.885
18.594	66.938
18.594	66.437
18.654	52.395
18.702	60.917
18.756	56.904
18.905	70.937
18.964	58.901
19.016	58.899
19.062	69.928
19.065	64.914
19.110	76.945
19.113	71.430
19.168	66.915
19.171	61.400
19.369	79.943
19.383	55.876
19.481	66.902
19.485	60.384
19.530	72.917
19.531	69.909
19.634	72.412
19.745	61.377
19.849	62.877
19.948	71.898
19.948	70.895
19.952	64.377
20.003	66.881
20.054	68.885
20.098	82.421
20.103	73.897
20.205	78.907
20.261	71.384
20.470	71.375
20.471	69.370
20.520	75.384
20.571	76.887
20.622	79.391
20.879	86.401
20.881	83.392
21.035	86.896
21.142	81.878
21.300	80.367
21.400	88.385
21.455	82.366
21.662	86.369
21.762	93.886
21.770	80.348
21.812	96.892
21.920	91.373
21.962	108.920
21.966	102.402
22.129	90.863
22.336	94.365
22.533	113.410
22.742	112.900
23.835	119.374];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'LiLiu2024'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '7G96D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2779940'; % Ency of Life
metaData.links.id_Wiki = 'Xenocypris_macrolepis'; % Wikipedia
metaData.links.id_ADW = 'Xenocypris_macrolepis'; % ADW
metaData.links.id_Taxo = '633813'; % Taxonomicon
metaData.links.id_WoRMS = '1015911'; % WoRMS
metaData.links.id_fishbase = 'Xenocypris-macrolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Xenocypris_macrolepis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Xenocypris-macrolepis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'LiLiu2024'; type = 'article'; bib = [ ... 
'doi = {10.7717/peerj.16673}, ' ...
'author = {Li, P. and Liu, J. and Lu, W. and Sun, S. and Wang, J.}, ' ...
'year = {2024}, ' ...
'title  = {Age, growth, reproduction and mortality of \emph{Xenocypris argentea} ({G}\"{u}nther,1868) in the lower reaches of the {T}angwang {R}iver, {C}hina}, ' ...
'journal = {PeerJ}, ' ...
'pages = {12}, ' ...
'volume = {e16673}'];
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

