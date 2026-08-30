function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_stridens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_stridens'; 
metaData.species_en = 'Striped piggy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAm','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 08];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'value for Lutjanus vitta';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 18.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.99, see F1';
data.Wwi = 110; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.99, see F1';

data.Ri = 153649/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on fecundity of Pomadasys_jubelini for TL = 20 cm';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  8.75  8.50
    2 11.38 11.18
    3 13.49 13.26
    4 15.17 14.92
    5 16.53 16.23
    6 17.61 17.23
    7 18.48 17.99];
data.tL_fm(:,1) = 365 * (0.4 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(25.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AvsaMavr2021'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
9.090	7.573
9.232	6.193
9.627	8.419
9.722	9.252
9.880	9.256
9.959	8.705
10.022	10.091
10.212	12.587
10.259	10.374
10.417	12.593
10.433	11.209
10.607	10.937
10.654	13.430
10.717	11.494
10.812	14.265
10.828	12.051
10.938	15.652
10.986	13.162
11.017	14.547
11.096	13.442
11.160	16.212
11.160	32.544
11.286	17.046
11.318	14.556
11.460	17.604
11.539	16.499
11.570	20.099
11.618	33.387
11.681	16.503
11.681	16.503
11.744	20.380
11.870	19.000
11.886	17.893
11.934	21.216
12.013	22.049
12.076	20.390
12.139	23.160
12.155	19.285
12.265	20.118
12.329	23.165
12.439	20.123
12.455	24.276
12.518	18.741
12.550	25.939
12.566	22.895
12.645	26.219
12.724	21.515
12.787	23.731
12.850	29.269
12.850	27.331
12.882	25.118
12.897	22.073
12.976	24.290
12.992	30.934
13.008	29.827
13.024	24.568
13.103	28.723
13.150	25.402
13.213	30.110
13.229	26.235
13.229	29.280
13.261	31.495
13.308	34.818
13.340	32.605
13.403	28.177
13.466	11.570
13.498	32.886
13.498	26.519
13.608	21.263
13.656	35.105
13.719	33.169
13.719	26.525
13.735	29.017
13.750	40.090
13.814	28.189
13.814	16.286
13.861	35.941
13.861	33.173
13.924	42.033
13.940	39.265
13.956	37.327
14.003	29.855
14.082	33.732
14.098	36.778
14.098	40.100
14.114	37.609
14.177	31.520
14.177	35.119
14.193	39.549
14.256	38.166
14.256	42.042
14.303	26.541
14.319	31.524
14.335	33.739
14.351	45.643
14.398	37.063
14.398	40.108
14.414	43.984
14.461	42.878
14.524	49.246
14.524	43.987
14.524	38.451
14.572	12.985
14.619	35.131
14.651	45.374
14.667	39.839
14.682	39.009
14.698	49.528
14.730	43.993
14.746	40.671
14.746	39.287
14.761	42.886
14.761	47.592
14.777	43.163
14.809	36.521
14.872	58.391
14.888	45.104
14.888	39.845
14.904	40.399
14.904	47.596
14.919	41.783
14.951	42.615
14.983	52.581
15.030	45.108
15.046	47.600
15.062	50.092
15.093	43.726
15.109	50.647
15.156	47.326
15.204	42.898
15.235	51.481
15.251	50.927
15.314	47.607
15.425	58.129
15.472	55.916
15.488	52.318
15.536	49.828
15.551	56.749
15.567	48.998
15.583	46.508
15.599	60.902
15.646	53.983
15.678	51.216
15.741	65.335
15.741	59.522
15.773	60.907
15.788	52.326
15.820	67.275
15.899	56.482
15.962	64.234
15.994	59.806
16.025	64.790
16.073	54.272
16.152	57.873
16.199	53.445
16.246	62.028
16.246	64.242
16.436	65.355
16.468	61.203
16.610	65.913
16.626	58.439
16.720	65.363
16.736	63.425
16.768	68.409
16.784	74.222
16.784	72.838
16.863	60.107
16.878	67.858
16.894	63.153
16.957	79.210
16.973	69.522
17.131	78.107
17.147	73.679
17.289	66.762
17.305	78.112
17.494	61.785
17.494	78.671
17.905	81.451
18.095	96.127
18.363	88.661
18.553	99.739
18.806	101.130];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'AvsaMavr2021'; 
%
data.LW_m = [ ...
9.106	10.992
9.160	9.737
9.306	10.988
9.360	12.449
9.433	12.239
9.433	14.328
9.650	10.980
9.651	13.697
9.795	13.485
9.813	12.440
9.922	14.318
9.941	15.989
10.031	12.644
10.122	14.314
10.267	15.565
10.285	13.475
10.285	14.519
10.358	18.906
10.376	18.279
10.448	15.979
10.485	18.485
10.503	16.604
10.520	14.723
10.739	18.480
10.756	16.808
10.866	19.522
10.901	15.551
10.920	18.267
10.939	20.565
11.065	20.145
11.137	18.472
11.138	20.770
11.192	20.978
11.247	22.440
11.265	21.185
11.355	19.094
11.483	22.226
11.536	20.135
11.537	24.105
11.610	23.268
11.663	20.759
11.682	24.938
11.718	21.176
11.773	23.473
11.882	26.396
11.917	22.008
11.991	25.140
12.009	27.439
12.044	20.751
12.062	22.840
12.066	35.587
12.082	28.064
12.137	29.525
12.172	24.510
12.190	24.092
12.191	31.405
12.208	25.554
12.227	27.852
12.262	23.045
12.317	24.925
12.354	29.103
12.371	26.595
12.390	29.520
12.461	22.832
12.462	25.549
12.464	35.369
12.499	29.100
12.552	26.591
12.588	23.247
12.608	31.605
12.625	27.635
12.680	29.723
12.699	30.976
12.788	26.378
12.843	29.511
12.897	26.375
12.899	33.898
12.969	27.836
12.971	34.523
13.007	32.015
13.026	35.985
13.097	29.714
13.152	33.683
13.169	29.086
13.188	31.802
13.225	35.353
13.352	34.097
13.442	33.468
13.443	36.603
13.606	38.480
13.623	34.091
13.624	35.136
13.642	36.390
13.770	42.656
13.806	40.774
13.822	32.207
13.841	36.385
13.843	44.744
13.897	42.444
14.005	38.054
14.006	44.322
14.114	39.305
14.115	43.484
14.149	34.916
14.167	36.170
14.276	38.048
14.278	44.317
14.297	46.406
14.332	41.599
14.477	42.641
14.513	40.550
14.515	48.700
14.516	52.670
14.532	44.729
14.569	46.609
14.677	47.234
14.694	40.965
14.694	42.218
14.734	54.128
14.876	43.677
14.878	53.498
14.932	52.452
14.968	48.272
14.968	49.944
15.023	51.405
15.024	56.002
15.112	48.269
15.130	45.761
15.168	52.447
15.168	54.537
15.169	56.208
15.223	55.371
15.314	55.578
15.332	58.086
15.385	51.816
15.458	55.158
15.515	62.052
15.586	57.035
15.623	59.333
15.713	60.376
15.729	52.018
15.768	61.002
16.056	54.309
16.094	61.622
16.166	58.904
16.204	67.261
16.530	64.956
16.584	66.000
16.729	63.280
16.729	64.325
16.822	73.935
16.877	75.188
16.914	80.620
18.631	62.405];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'AvsaMavr2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 15 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01413*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQMJ'; % Cat of Life
metaData.links.id_ITIS = '630227'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys_stridens'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_stridens'; % ADW
metaData.links.id_Taxo = '184509'; % Taxonomicon
metaData.links.id_WoRMS = '126948'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-stridens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys_stridens}}';
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
bibkey = 'AvsaMavr2021'; type = 'Article'; bib = [ ...
'doi = {10.3897/aiep.51.e63320}, ' ...
'author = {Av\c{s}ar, D. and Mavruk, S. and Yeldan, H. and Mana\c{s}irli, M.}, ' ... 
'year = {2021}, ' ...
'title = {Population dynamics of an emergent invasive fish, striped piggy, \emph{Pomadasys stridens} ({A}ctinopterygii, {P}erciformes, {H}aemulidae) in the {G}ulf of {I}skenderun, north-eastern {M}editerranean}, ' ...
'journal = {Acta Ichthyol. Piscat.}, ' ...
'volume = {51(1)}, ' ...
'pages = {13-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-stridens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
