function [data, auxData, metaData, txtData, weights] = mydata_Mullus_ponticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Mullus_ponticus'; 
metaData.species_en = 'Blunt-snouted mullet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAbl'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 21.9;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 11.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00832*Lp^3.08, see F1';
data.Wwi = 112;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.08, see F1; max. published weight: 161.14 g';
  
data.Ri = 1.6e6/365;  units.Ri = '#/d';    label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(10.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Mullus_barbatus';

% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (yr), total length (cm)
    0  7.65  7.42
    1 11.23 10.97
    2 13.82 13.02
    3 15.67 14.89 
    4 17.80 16.97];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(21);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CiloAkgu2019'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % yr class (yr), weight (g)
    0  9.59  9.81
    1 14.55 14.18
    2 27.15 27.85
    3 33.92 34.10
    4 50.93 49.87];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.9) * 365; % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(21);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'CiloAkgu2019'; treat.tW_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
5.981	1.678
6.275	1.661
6.275	1.661
6.340	3.397
6.668	1.059
6.668	1.059
6.930	2.203
7.028	3.357
7.192	2.768
7.355	2.758
7.584	3.904
7.683	2.739
7.911	4.465
8.042	5.037
8.075	3.876
8.239	2.707
8.434	5.594
8.532	5.588
8.631	5.003
8.696	5.579
8.827	6.731
9.056	6.138
9.154	7.292
9.383	7.278
9.480	9.012
9.612	7.265
9.644	9.002
9.874	7.830
10.036	11.298
10.037	7.240
10.232	11.287
10.331	9.542
10.461	11.853
10.495	9.533
10.559	11.848
10.624	13.583
10.723	12.998
10.787	14.733
10.920	11.247
11.016	14.720
11.279	12.965
11.345	11.223
11.378	11.221
11.540	15.269
11.672	12.943
11.768	18.155
11.930	21.044
11.932	15.826
11.999	12.344
12.061	21.036
12.063	15.819
12.192	21.608
12.196	11.753
12.358	16.961
12.420	25.073
12.455	19.274
12.556	11.732
12.584	24.484
12.652	17.524
12.683	21.580
12.719	14.621
12.749	20.417
12.818	11.717
12.944	23.883
12.980	16.925
13.010	22.720
13.041	26.197
13.109	19.816
13.145	12.278
13.336	26.180
13.339	18.643
13.436	22.116
13.437	19.217
13.531	29.647
13.661	31.378
13.697	23.260
13.797	19.196
13.827	26.731
13.863	17.453
13.989	30.200
13.991	25.562
14.154	26.712
14.157	19.175
14.185	29.609
14.250	32.503
14.254	21.489
14.382	29.017
14.483	23.215
14.515	24.952
14.609	33.642
14.610	31.903
14.612	26.106
14.642	33.640
14.706	37.115
14.709	30.158
14.740	35.374
14.906	28.407
14.908	23.770
14.966	41.158
15.003	31.880
15.038	25.501
15.069	31.297
15.098	38.251
15.099	37.672
15.170	23.754
15.233	28.968
15.263	35.923
15.427	35.334
15.555	43.442
15.556	40.544
15.559	33.007
15.585	49.817
15.623	35.322
15.688	38.217
15.717	46.331
15.821	31.253
15.850	42.266
15.880	48.641
15.918	36.465
15.944	52.115
16.013	43.416
16.046	42.834
16.080	38.194
16.209	44.564
16.279	32.386
16.338	49.194
16.341	42.237
16.368	55.569
16.437	46.869
16.536	43.965
16.629	57.293
16.630	54.394
16.667	45.117
16.698	49.173
16.732	46.852
16.765	45.111
16.927	49.740
16.930	41.044
16.989	56.692
17.090	49.730
17.092	46.252
17.183	63.638
17.220	52.041
17.317	54.934
17.417	52.030
17.479	60.722
17.578	57.238
17.608	64.193
17.807	59.544
17.940	54.318
18.357	74.004
18.586	74.571
18.813	80.355
19.431	88.435
19.533	79.733
19.924	83.769
20.511	88.952
23.138	148.510];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'CiloAkgu2019'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
6.622	2.235
6.667	2.789
6.850	2.792
6.850	2.792
6.896	2.977
7.033	2.425
7.033	1.502
7.330	3.167
7.467	3.353
7.535	2.985
7.626	3.540
7.786	3.726
7.832	3.358
7.878	2.990
7.969	3.360
8.015	3.914
8.015	3.914
8.060	4.099
8.197	4.470
8.289	4.471
8.426	4.842
8.540	5.212
8.586	5.582
8.746	5.584
8.814	5.216
8.837	7.430
8.860	5.770
8.951	7.801
9.020	6.695
9.088	5.958
9.088	5.404
9.179	8.173
9.225	6.882
9.339	7.437
9.339	8.359
9.431	7.069
9.476	8.361
9.568	8.178
9.568	7.255
9.613	9.286
9.682	7.441
9.705	7.811
9.750	9.472
9.842	9.289
9.887	8.551
10.024	9.476
10.047	7.815
10.070	10.399
10.093	9.107
10.162	11.876
10.162	7.817
10.184	13.168
10.184	9.662
10.344	10.218
10.367	11.510
10.413	10.219
10.436	12.064
10.436	10.957
10.481	11.511
10.527	13.172
10.527	8.929
10.595	10.037
10.595	10.959
10.641	10.037
10.641	8.561
10.664	12.436
10.755	11.330
10.778	12.068
10.847	10.593
10.892	12.439
10.892	12.439
10.915	14.284
11.052	10.781
11.052	12.441
11.075	13.917
11.166	11.336
11.189	13.734
11.235	12.628
11.349	12.260
11.349	13.552
11.440	15.767
11.440	10.786
11.463	12.631
11.486	14.292
11.509	16.322
11.555	16.138
11.577	14.662
11.577	11.710
11.646	15.770
11.669	13.003
11.737	17.985
11.760	14.295
11.760	17.247
11.806	15.403
11.874	13.559
11.920	16.143
11.943	14.851
11.989	18.542
12.011	17.066
12.011	15.775
12.011	13.745
12.034	19.834
12.034	17.436
12.080	14.300
12.080	12.639
12.103	13.931
12.148	15.777
12.194	19.467
12.240	19.468
12.263	15.594
12.308	18.731
12.308	16.886
12.331	18.731
12.377	21.499
12.400	16.333
12.423	18.548
12.468	17.257
12.468	20.024
12.491	15.043
12.537	20.763
12.537	17.442
12.582	17.443
12.628	23.901
12.628	16.521
12.651	22.056
12.674	20.581
12.674	13.016
12.742	23.902
12.788	18.737
12.834	12.280
12.856	20.029
12.902	20.030
12.925	22.982
12.925	21.137
12.925	15.971
12.948	17.448
12.993	22.245
13.016	19.109
13.016	17.264
13.062	23.353
13.062	24.829
13.062	21.139
13.131	12.284
13.153	17.819
13.176	16.713
13.199	19.665
13.222	22.617
13.245	20.404
13.290	18.375
13.359	22.066
13.382	25.018
13.405	24.649
13.427	20.775
13.450	19.299
13.473	25.019
13.496	21.514
13.496	22.436
13.519	26.496
13.564	17.640
13.564	16.349
13.610	21.884
13.610	20.224
13.633	18.933
13.656	24.284
13.679	17.273
13.724	19.487
13.747	23.178
13.770	27.053
13.816	22.994
13.838	30.928
13.884	26.316
13.884	25.947
13.884	20.965
13.884	15.984
13.930	23.734
13.998	27.240
14.021	19.676
14.044	24.842
14.067	22.628
14.113	25.950
14.135	27.426
14.181	25.766
14.204	22.261
14.272	24.845
14.295	26.506
14.341	30.012
14.364	23.739
14.432	30.751
14.455	13.777
14.478	29.276
14.546	28.354
14.546	22.081
14.569	30.384
14.729	30.940
14.752	20.054
14.821	30.387
14.821	31.679
14.821	30.203
14.843	35.923
14.980	28.360
14.980	20.611
15.003	36.109
15.049	32.789
15.095	21.904
15.300	28.549
15.437	37.960
15.666	30.583
16.442	41.663
16.488	44.801
16.785	43.513];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'CiloAkgu2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'a fecundity of 9e6 eggs seems a lot for a 22 cm fish';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CKKC9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66147067'; % Ency of Life
metaData.links.id_Wiki = 'Mullus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '45353'; % Taxonomicon
metaData.links.id_WoRMS = '1525520'; % WoRMS
metaData.links.id_fishbase = 'Mullus-ponticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mullus_ponticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; b45355ib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CiloAkgu2019'; type = 'Article'; bib = [ ... 
'doi = {10.24925/turjaf.v7i2.186-191.2016}, ' ...
'author = {Erhan \c{C}ilo\v{g}lu and Akg\"{u}m\"{u}\c{s}}, ' ... 
'year = {2019}, ' ...
'title = {Age, growth and gonado-somatic index of the red mullet (\emph{Mullus barbatus ponticus} {E}ssipov, 1927) in the eastern {B}lack {S}ea of {T}urkey}, ' ...
'journal = {Turkish Journal of Agriculture - Food Science and Technology}, ' ...
'volume = {7(2)}, ' ...
'pages = {186-191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mullus_ponticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
