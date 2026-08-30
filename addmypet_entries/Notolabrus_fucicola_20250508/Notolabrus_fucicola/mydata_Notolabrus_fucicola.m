function [data, auxData, metaData, txtData, weights] = mydata_Notolabrus_fucicola

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Notolabrus_fucicola'; 
metaData.species_en = 'Yellow-saddled wrasse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE';'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 08];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LekFair2012';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.4; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 38; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 137.6;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^3.08, see F1';
data.Wwi = 701;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.08, see F1';

data.Ri = 1.3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'guess';
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coris julis: 1e4*(38/16)^3';
  
% univariate data
data.tL_LB = [ ... % time since birth (yr), total length (cm) 
2.409	16.908
2.558	18.269
2.600	15.506
3.504	18.601
3.505	18.477
3.536	22.353
3.538	21.529
3.538	21.116
3.541	19.055
3.544	17.694
3.545	16.539
3.614	20.787
3.654	19.550
4.484	21.654
4.486	20.665
4.487	20.046
4.521	22.520
4.524	20.335
4.556	24.170
4.595	23.510
4.595	23.263
4.635	22.026
4.636	21.160
5.432	20.996
5.465	24.048
5.505	22.646
5.508	20.708
5.508	20.501
5.544	21.780
5.544	21.697
5.576	25.450
5.580	23.223
5.581	22.275
5.582	21.450
5.657	22.028
6.408	26.029
6.411	24.215
6.411	24.008
6.446	26.276
6.447	25.740
6.447	25.534
6.448	24.874
6.449	24.421
6.454	21.204
6.482	27.349
6.490	22.153
6.519	27.596
6.520	27.431
6.558	26.936
6.559	26.565
6.561	25.411
7.437	22.155
7.470	25.082
7.503	27.887
7.507	25.371
7.536	31.062
7.542	27.474
7.543	26.526
7.620	25.866
8.450	27.682
8.490	26.693
8.561	29.909
8.563	28.342
8.563	28.095
8.597	31.064
8.600	29.126
8.600	28.796
8.601	28.466
9.429	31.148
9.434	28.426
10.413	31.768
10.449	32.923
10.491	30.243
10.494	28.428
10.531	29.171
10.572	26.820
11.471	32.925
11.590	30.080
14.610	35.364];
data.tL_LB(:,1) = 365 * (0 + data.tL_LB(:,1)); % convert yr to d
for i=2:size(data.tL_LB,1); if data.tL_LB(i,1)<=data.tL_LB(i-1,1);data.tL_LB(i,1)=data.tL_LB(i-1,1)+1e-3; end;end
units.tL_LB   = {'d', 'cm'};  label.tL_LB = {'time since birth', 'total length', 'Lord''s Bluff'};  
temp.tL_LB    = C2K(18.4);  units.temp.tL_LB = 'K'; label.temp.tL_LB = 'temperature';
bibkey.tL_LB = 'WelsLyle2005'; comment.tL_LB = 'Lord''s Bluff';
%
data.tL_PB = [ ... % time since birth (yr), total length (cm) 
2.374	14.722
3.051	18.064
3.393	17.364
3.396	15.549
3.434	15.054
3.460	22.766
3.657	17.776
3.773	16.375
3.880	20.540
3.916	21.983
4.068	21.159
4.107	20.705
4.113	16.746
4.223	19.303
4.338	18.190
4.377	17.695
4.411	19.757
4.415	17.407
4.415	17.118
4.449	20.087
4.488	19.139
4.524	20.335
4.677	19.469
4.902	20.459
4.982	17.944
5.209	18.439
5.281	20.666
5.319	20.336
5.322	18.769
5.395	20.048
5.432	20.955
5.440	15.718
5.467	22.522
5.468	21.697
5.472	19.677
5.507	21.285
5.695	22.110
5.770	22.770
5.922	22.069
6.003	18.853
6.072	22.936
6.190	20.255
6.266	20.503
6.378	21.287
6.413	23.266
6.413	22.812
6.458	18.565
6.492	21.081
6.530	20.586
6.532	19.802
6.532	19.596
6.533	18.978
6.566	22.359
6.641	22.607
6.642	21.906
7.056	23.350
7.063	19.144
7.210	21.948
7.212	20.876
7.289	20.134
7.319	24.711
7.353	27.062
7.358	24.093
7.361	22.196
7.362	21.783
7.362	21.495
7.398	22.938
7.401	20.959
7.430	26.691
7.474	22.608
7.884	26.856
7.966	22.939
8.038	25.290
8.077	24.135
8.110	27.146
8.113	25.620
8.188	26.032
8.266	24.672
8.345	22.198
8.379	25.167
8.417	24.878
8.419	23.765
8.421	22.610
8.452	26.651
8.487	28.590
8.489	27.435
8.794	26.157
9.134	26.735
9.138	24.137
9.246	27.601
9.325	25.168
9.329	22.818
9.367	22.694
9.398	27.354
9.401	25.334
9.445	21.127
9.477	25.004
9.478	24.220
9.513	26.282
9.514	25.746
9.891	26.613
10.000	29.706
10.006	25.871
10.075	30.201
10.084	24.139
10.268	27.768
10.308	26.407
10.384	26.036
10.385	25.418
10.386	25.129
10.496	27.439
10.983	30.244
11.326	29.007
11.330	26.409
11.332	25.378
11.400	30.492
11.403	28.471
11.436	31.399
11.437	31.028
11.480	27.647
11.482	25.915
11.591	28.925
11.706	28.183
12.164	26.246
12.202	25.957
12.269	31.648
12.344	32.019
12.385	29.628
12.387	28.762
13.368	30.867
13.409	29.011
13.823	30.703
14.355	29.384
14.393	28.889
14.426	32.023
15.528	29.592
16.390	35.161
16.963	32.399
17.492	32.978
23.169	34.720];
data.tL_PB(:,1) = 365 * (0 + data.tL_PB(:,1)); % convert yr to d
for i=2:size(data.tL_PB,1); if data.tL_PB(i,1)<=data.tL_PB(i-1,1);data.tL_PB(i,1)=data.tL_PB(i-1,1)+1e-3; end;end
units.tL_PB   = {'d', 'cm'};  label.tL_PB = {'time since birth', 'total length', 'Point Bailey'};  
temp.tL_PB    = C2K(18.4);  units.temp.tL_PB = 'K'; label.temp.tL_PB = 'temperature';
bibkey.tL_PB = 'WelsLyle2005'; comment.tL_PB = 'Point Bailey';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_PB = 5 * weights.tL_PB;
weights.tL_LB = 5 * weights.tL_LB;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_LB','tL_PB'}; subtitle1 = {'Data from Lord''s Bluff, Point Bailey'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00955*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Indian Ocean and Southwest Pacific: southern Australia, from South Australia to New South Wales, including Tasmania and throughout New Zealand';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6SBC4'; % Cat of Life
metaData.links.id_ITIS = '614011'; % ITIS
metaData.links.id_EoL = '46572146'; % Ency of Life
metaData.links.id_Wiki = 'Notolabrus_fucicola'; % Wikipedia
metaData.links.id_ADW = 'Notolabrus_fucicola'; % ADW
metaData.links.id_Taxo = '181431'; % Taxonomicon
metaData.links.id_WoRMS = '281788'; % WoRMS
metaData.links.id_fishbase = 'Notolabrus_fucicola'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notolabrus_fucicola}}';
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
bibkey = 'WelsLyle2005'; type = 'Article'; bib = [ ... 
'author = {Dirk C. Welsford and Jeremy M. Lyle}, ' ... 
'year = {2005}, ' ...
'title = {Estimates of growth and comparisons of growth rates determined from length- and age-based models for populations of purple wrasse (\emph{Notolabrus fucicola})}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {103}, ' ...
'pages = {697–711}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Notolabrus_fucicola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

