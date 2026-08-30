function [data, auxData, metaData, txtData, weights] = mydata_Myoxocephalus_joak
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Myoxocephalus_joak'; 
metaData.species_en = 'Plain sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAPN'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 07];

%% set data
% zero-variate data

data.am = 14 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'JohTaka2019';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 47;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 74;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 7.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.4 mm of Myoxocephalus_scorpius: pi/6*0.24^3';
data.Wwp = 1056;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.10, see F1';
data.Wwi = 4313;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.10, see F1; max. published weight: 8.0 kg';

data.Ri = 66*4313/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(2.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity 66 eggs/g: ';

% uni-variate data
% time-length
data.tL_f = [ ... % age (yr), total length (cm) 
0.830	12.953
1.170	12.350
1.724	22.066
2.042	21.703
2.071	28.543
2.105	16.902
2.129	18.462
2.726	25.777
2.858	21.456
2.864	26.856
2.864	27.216
2.865	28.416
2.912	29.375
2.913	30.455
3.085	21.334
3.132	23.014
3.137	28.173
3.209	31.773
3.229	29.493
3.230	30.213
3.233	32.853
3.276	31.052
3.432	27.811
3.730	30.928
3.751	29.248
3.793	25.888
3.842	29.487
3.858	23.247
3.888	30.087
4.183	30.325
4.186	33.565
4.211	35.244
4.229	30.924
4.230	32.004
4.279	34.884
4.344	32.603
5.182	30.796
6.207	34.387
6.210	37.747
6.228	32.587
6.411	34.265
6.412	35.105
6.435	35.825
6.455	33.545
7.433	35.097
7.912	38.213
8.111	32.811
8.201	32.090
8.226	33.890
8.231	38.690
8.249	34.610
8.296	36.169
8.320	37.609
8.337	32.209
8.385	34.489
8.411	37.728
8.455	36.648
8.937	41.684
9.206	38.801];
data.tL_f(:,1) =  365 * (0.1 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(2.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JohTaka2019';
%
data.tL_m = [ ... % age (yr), total length (cm) 
0.095	3.840
0.715	11.274
0.758	8.994
0.759	10.074
0.761	11.874
0.762	12.714
0.786	13.914
0.787	15.114
1.126	13.431
1.149	13.911
1.791	20.385
1.794	23.625
1.814	21.465
1.858	19.664
2.082	16.423
2.130	19.062
2.131	20.262
2.407	23.980
2.796	27.336
2.859	21.936
2.862	25.056
2.863	26.016
2.884	24.456
3.182	27.453
3.270	25.292
3.429	25.051
3.450	23.371
3.453	25.891
3.456	29.611
3.473	24.091
3.792	24.688
3.863	27.567
3.883	25.527
3.884	26.487
3.885	27.087
3.909	28.527
3.912	31.047
4.182	29.005
4.255	34.284
4.269	25.284
4.272	28.284
4.409	28.883
4.450	24.922
4.724	26.840
4.867	32.959
6.154	27.188
6.198	26.227
6.292	29.346
6.314	27.786
6.334	25.266
6.448	25.865
6.790	27.902
7.153	28.139
7.289	27.538
7.767	29.334
7.787	26.814
7.790	29.694
8.063	30.051
8.130	28.731
8.131	30.291
8.173	26.810
8.174	27.770
8.176	29.210
8.220	28.370
8.269	31.850
8.289	28.969
8.310	27.409
8.335	30.049
8.354	26.329
8.445	26.568
8.514	27.167
9.221	30.521
9.264	28.721
9.286	28.121
9.403	31.000
9.466	26.439
9.469	28.839
9.763	28.117
9.809	28.956
11.217	29.664
11.309	31.583
11.806	29.059
13.261	32.167];
data.tL_m(:,1) =  365 * (0.1 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(2.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JohTaka2019';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
9.112	24.498
9.441	16.147
10.672	29.967
11.411	24.371
12.559	46.529
13.379	65.928
13.873	49.234
15.430	88.036
16.252	85.213
16.661	115.746
18.138	118.442
18.546	165.641
18.875	151.734
19.861	151.679
19.942	176.675
20.518	151.643
20.680	193.300
20.681	173.856
21.169	246.051
21.498	234.921
21.578	293.250
21.906	284.899
22.073	243.223
22.969	379.284
22.975	265.395
22.975	254.284
23.136	315.386
23.298	359.821
23.301	298.710
23.467	265.368
23.715	237.576
23.794	301.461
24.037	370.892
24.366	351.429
24.613	343.082
24.698	281.966
24.775	379.184
25.023	345.837
25.107	304.165
25.348	406.930
25.510	462.476
25.683	293.022
25.843	362.458
26.004	426.338
26.009	329.115
26.248	473.546
26.338	326.319
26.414	437.426
26.495	454.088
26.500	359.644
26.743	423.519
27.159	323.496
27.230	540.159
27.235	442.936
27.237	395.714
27.316	465.154
27.403	373.482
27.558	542.918
27.729	415.131
27.807	501.238
27.890	473.455
27.891	454.011
27.981	309.561
28.304	409.543
28.545	512.308
28.625	556.748
28.710	498.410
28.875	487.289
28.958	465.063
29.035	570.614
29.114	617.832
29.118	537.276
29.444	598.369
29.941	498.341
30.180	656.661
30.182	617.772
30.348	578.874
30.594	573.305
30.761	526.074
31.084	637.167
31.097	381.610
31.163	692.718
31.494	639.922
31.498	573.255
31.821	662.126
31.824	609.348
31.899	756.566
32.231	670.436
32.305	837.099
32.308	773.210
32.475	720.423
32.568	517.640
32.802	745.405
32.878	864.845
32.972	645.395
33.542	723.141
33.547	628.697
33.698	895.355
34.110	870.332
34.178	1142.550
34.359	800.874
34.448	678.647
34.607	770.304
34.705	461.966
34.847	900.847
35.180	806.384
35.336	964.708
35.415	1028.593
35.420	928.592
35.587	886.917
35.659	1067.468
35.670	867.468
35.830	942.459
36.167	778.551
36.478	1122.978
36.563	1047.973
37.049	1181.280
37.617	1311.804
37.631	1053.470
37.788	1181.239
37.955	1136.785
38.611	1147.860
39.024	1100.614
39.169	1464.495
41.477	1294.923];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'JohTaka2019';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwp = weights.Wwp * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Pacific: Chukchi Sea to Bearing Sea, eastern Aleutian Is., and Gulf of Alaska to Kachemak Bay, Cook Inlet; SE Alaska at Limestone Inlet; to Okhotsk and Japan seas as far as northern North Korea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '456LG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myoxocephalus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Myoxocephalus-octodecemspinosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myoxocephalus}}';
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
bibkey = 'JohTaka2019'; type = 'Article'; bib = [ ...
'doi = {10.1007/s12562-019-01391-3}, ' ...
'author = {Joh, M. and Takayama, T. and Mihara, Y.}, ' ... 
'year = {2019}, ' ...
'title = {Age and growth of three marine sculpins, \emph{Myoxocephalus jaok}, \emph{Enophrys diceraus}, and \emph{Gymnocanthus herzensteini}, and age composition of fishery-bycatch sculpins in the western coastal Pacific around {H}okkaido {I}sland, {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {86(3)}, ' ...
'pages = {427–436}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myoxocephalus_joak.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

