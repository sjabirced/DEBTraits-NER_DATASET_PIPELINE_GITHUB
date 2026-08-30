function [data, auxData, metaData, txtData, weights] = mydata_Siganus_spinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_spinus'; 
metaData.species_en = 'Little spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 01];

%% set data
% zero-variate data
data.ab = 3;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WestRose1976'; 
data.Li  = 28;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on assumed egg diameter of 0.55 mm: pi/6*0.055^3'; 
data.Wwp = 29.54; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'WestRose1976';
  comment.Wwp = 'based on 0.01905*Lp^3.02, see F1';
data.Wwi = 447; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^3.02, see F1';

data.Ri = 315433/365;  units.Ri = '#/d';    label.Ri = 'max reprodion rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Siganus_luridus';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
28.104	2.056
57.194	4.804
83.325	10.665
104.526	19.987
126.221	30.693
146.436	40.361
164.678	55.564
182.428	65.926
202.643	93.575
223.844	103.589
245.538	111.182
264.274	119.469
286.462	120.837];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WestRose1976';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.050	0.107
2.217	0.137
2.282	0.211
2.306	0.146
2.329	0.157
2.351	0.187
2.351	0.177
2.374	0.201
2.422	0.165
2.470	0.157
2.494	0.217
2.494	0.173
2.518	0.251
2.543	0.201
2.593	0.237
2.594	0.207
3.282	0.392
3.346	0.480
3.379	0.499
3.412	0.524
3.548	0.555
3.619	0.583
3.690	0.624
3.838	0.674
5.198	2.115
5.406	2.308
5.567	2.518
5.622	2.644
5.622	2.376
5.790	2.775
6.576	3.858
7.322	6.513
7.323	5.968
7.615	7.245
7.690	7.387
7.767	6.902
7.768	6.143
7.842	8.061
8.073	11.653
8.078	7.036
8.157	7.829
8.318	8.795
8.482	9.321
8.567	8.459
8.995	11.994
8.998	9.689
9.085	11.098
9.266	10.779
9.540	13.086
9.542	12.109
9.543	11.205
9.826	13.603
10.020	14.278
10.219	14.699
10.317	17.504
10.632	12.224
10.729	20.640
10.834	21.666
10.839	15.883
11.053	17.164
11.155	27.080
11.160	19.471
11.161	18.913
11.268	23.186
11.490	26.047
11.606	22.738
11.950	27.875
11.951	26.045
12.187	28.697
12.674	31.009
12.799	32.867
12.922	38.385
13.052	35.175
13.439	41.884
13.575	36.920
13.703	48.442
13.975	50.847
14.250	57.123
14.254	46.144
14.398	40.675
14.679	52.853
15.113	66.061
15.115	59.953
15.119	51.833
15.729	44.376];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'WestRose1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.am;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01905*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YN5S'; % Cat of Life
metaData.links.id_ITIS = '172331'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Siganus_spinus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_spinus'; % ADW
metaData.links.id_Taxo = '187608'; % Taxonomicon
metaData.links.id_WoRMS = '219689'; % WoRMS
metaData.links.id_fishbase = 'Siganus-spinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_spinus}}';
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
bibkey = 'WestRose1976'; type = 'Article'; bib = [ ... 
'author = {H. Von Westernhagen and H. Rosenthal}, ' ... 
'year = {1976}, ' ...
'title = {SOME ASPECTS OF THE SUITABILITY OF VARIOUS PHILIPPINE SIGANID SPECIES ({S}IGANIDAE) FOR MARICULTURE}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {9}, ' ...
'pages = {297-311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Siganus-spinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

