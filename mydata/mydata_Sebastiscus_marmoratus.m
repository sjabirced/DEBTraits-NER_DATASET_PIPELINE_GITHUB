function [data, auxData, metaData, txtData, weights] = mydata_Sebastiscus_marmoratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastiscus_marmoratus'; 
metaData.species_en = 'False kelpfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 06 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 17];

%% set data
% zero-variate data

data.am = 10 *365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 36.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 7.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^3.11, see F1';
data.Wwi = 808;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.11, see F1; max reported weight 2.5 kg';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm) 
    0  5.94  5.94
    1  9.62  9.62
    2 14.80 15.52
    3 15.82 16.76
    4 16.29 16.84
    5 16.54 17.79 
    6 16.72 18.09];
data.tL_fm(:,1) = 365*(0.9+data.tL_fm(:,1)); % convert yr 
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(26.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'YokoIguc1992';  treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.731	0.960
3.357	1.974
3.766	1.713
4.174	1.452
4.362	1.788
4.738	2.458
5.084	1.878
5.210	1.893
5.304	1.905
5.457	4.419
5.648	2.883
5.930	2.919
6.180	4.197
6.461	5.168
6.681	4.572
7.055	6.801
7.276	6.205
7.403	4.974
7.462	7.476
7.557	7.176
8.056	9.421
8.244	9.756
9.150	12.364
10.023	16.527
10.616	19.096
11.143	23.839
12.045	29.565
12.300	26.790
12.419	31.795
12.975	37.477
13.294	34.087
13.345	42.513
13.353	37.213
13.355	35.654
13.539	38.171
13.721	43.184
13.748	45.994
14.096	44.166
14.124	46.664
14.145	53.216
14.331	55.422
14.332	54.486
14.368	51.372
14.527	50.145
14.615	53.898
14.831	56.732
14.961	53.941
14.980	40.534
15.110	58.949
15.265	60.216
15.275	53.980
15.287	66.768
15.305	54.608
15.388	62.103
15.481	63.362
15.596	70.548
15.704	60.895
15.714	75.241
15.726	67.446
15.828	62.157
15.839	76.192
15.938	72.774
16.040	67.485
16.120	76.851
16.160	70.931
16.217	74.992
16.335	79.996
16.356	87.171
16.433	77.825
16.436	96.849
16.467	75.647
16.485	85.316
16.627	73.484
16.632	70.678
16.696	90.956
16.734	86.595
16.770	104.687
16.838	80.059
16.970	96.915
16.981	89.432
17.021	83.512
17.070	93.186
17.078	87.573
17.124	99.117
17.182	81.037
17.273	104.438
17.322	92.282
17.327	88.852
17.374	77.943
17.387	91.042
17.426	106.951
17.460	84.191
17.600	95.123
17.648	105.732
17.650	104.173
17.891	111.064
17.957	130.095
17.963	105.147
17.968	101.406
18.129	98.931
18.160	120.141
18.206	110.479
18.216	103.620
18.289	96.456
18.397	108.632
18.403	104.267
18.607	137.036
18.700	115.842
18.745	107.116
18.790	97.454
19.036	143.639
19.159	124.631
19.329	136.815
19.628	146.831
19.766	117.223
19.915	144.372
20.078	139.715
20.538	147.257
20.778	176.600
21.529	156.736];
units.LW  = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'YokoIguc1992';  

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
10.289	7433.161
10.662	12916.466
10.988	16835.461
11.035	15118.557
11.268	19971.388
11.844	21556.396
12.015	23281.826
12.203	18445.429
12.344	17044.672
12.483	21893.850
12.499	20019.479
12.731	25809.801
13.293	22706.748
13.495	23183.409
13.946	26794.776
13.991	35390.266
14.475	33221.660
14.614	35727.115
14.714	11668.511
14.772	26202.047
15.176	32467.812
15.204	43406.419
15.206	37156.483
15.781	42803.948
15.970	35936.323
16.219	38289.789
16.812	35187.953
16.826	40969.756
16.860	30658.576
16.905	37691.582
17.433	43024.726
17.542	44278.975
17.776	42881.869
17.824	39133.734
17.899	50386.665
18.227	47743.226
18.287	56339.323];
units.LN  = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(26.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'YokoIguc1992';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
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

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01148*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'southern Hokkaido, Japan to the Philippines';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4W7X5'; % Cat of Life
metaData.links.id_ITIS = '644611'; % ITIS
metaData.links.id_EoL = '46568221'; % Ency of Life
metaData.links.id_Wiki = 'Sebastiscus_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Sebastiscus_marmoratus'; % ADW
metaData.links.id_Taxo = '187354'; % Taxonomicon
metaData.links.id_WoRMS = '282738'; % WoRMS
metaData.links.id_fishbase = 'Sebastiscus_marmoratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastiscus_marmoratus}} ';
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
bibkey = 'YokoIguc1992'; type = 'article'; bib = [ ... 
'doi = {10.11233/aquaculturesci1953.40.227}, ' ...
'author = {Koji Yokogawa and Masanori Iguchi and Ken-ichi Yamaga}, ' ...
'year = {1992}, ' ...
'title = {Age, growth and condition factor of marbled rockfish, \emph{Sebastiscus marmoratus} in southern coastal waters of the {H}arima {S}ea}, ' ...
'journal = {Aquaculture Science}, ' ...
'volume = {40(2)}, '...
'pages = {227-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZouRuan2024'; type = 'article'; bib = [ ... 
'doi = {10.11693/hyhz20240200030}, ' ...
'author = {Xiong Zou and Ze-Chao Ruan and Yan Zhang and Yue-Bin Wang and Qian-Feng Wang and Xue-Jun Chai}, ' ...
'year = {2024}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF FISH UNDER ARTIFICIAL BREEDING}, ' ...
'journal = {Oceanologia et Limnologia Sinica}, ' ...
'volume = {55(4)}, '...
'pages = {1027-1036}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastiscus_marmoratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
