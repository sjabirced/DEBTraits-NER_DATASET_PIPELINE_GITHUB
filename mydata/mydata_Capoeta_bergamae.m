function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_bergamae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_bergamae'; 
metaData.species_en = 'Bergama barb'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp =  8;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'OzcaBali2009'; 
data.Li = 19.8;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'OzcaBali2009';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 5.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'OzcaBali2009','fishbase'};
  comment.Wwp = 'based on 0.01230*Lp^2.95, see F1';
data.Wwi = 82.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.95, see F1';

data.GSI = 0.12; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'OzcaBali2009';
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
    0  6.71  6.84
    1 12.14 12.13
    2 16.13 15.88
    3 19.07 18.53
    4 21.22 20.41];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm= C2K(20);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OzcaBali2009'; treat.tL_fm = {1 {'females','males'}}; 
    
% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.691	34.018
12.128	36.237
12.494	35.107
12.638	38.454
13.051	41.791
13.126	37.319
13.199	36.758
13.487	45.687
13.513	42.334
13.760	36.739
13.808	37.854
14.001	41.758
14.142	51.809
14.266	46.218
14.268	43.425
14.999	41.165
15.189	51.214
15.312	50.092
16.112	57.886
16.331	57.878
16.377	62.904
16.935	66.237
17.418	75.717
17.736	71.795
18.051	76.254
18.212	95.242
18.390	80.152
18.823	91.869
18.869	95.778
20.637	117.504
20.784	114.706
21.083	150.449
21.185	140.949
21.575	141.494
21.754	124.169
21.945	130.308
22.456	132.524
22.737	154.861
23.311	176.070
23.438	166.010];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'OzcaBali2009'; 
%
data.LW_m = [ ... % total length (cm), weight (g) 
11.889	27.415
11.974	29.784
12.470	28.800
12.836	29.251
12.944	29.718
13.116	27.332
13.179	36.826
13.201	32.550
13.267	30.171
13.308	34.918
13.481	34.906
13.567	33.000
13.825	34.883
13.846	37.731
13.954	39.148
14.170	32.959
14.191	36.283
14.406	39.593
14.490	48.611
14.575	50.505
14.642	41.001
14.705	47.646
14.986	46.202
15.178	52.838
15.352	43.803
15.395	47.124
15.589	46.161
15.846	52.793
16.038	61.329
16.425	62.252
16.511	64.621
16.554	64.618
16.706	57.484
17.479	66.455
17.739	61.213
17.824	66.907
18.123	77.810
18.207	86.828
18.423	82.064
19.370	84.849
19.668	100.027
22.092	141.182
23.249	169.600];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'OzcaBali2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 10 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01230*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to  Iran';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '5X9M4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '993439'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_bergamae'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_bergamae'; % ADW
metaData.links.id_Taxo = '1682638'; % Taxonomicon
metaData.links.id_WoRMS = '1524495'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-bergamae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_bergamae}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-bergamae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'OzcaBali2009'; type = 'article'; bib = [ ...
'author = {Ozcan, G. and S. Bal{\i}k}, ' ...
'year = {2009}, ' ...
'title  = {Some biological parameters of the bergamae barb, \emph{Capoeta bergamae} {K}araman, 1969 ({C}yprinidae), in {K}emer reservoir ({A}ydin, {T}urkey)}, ' ...
'journal = {North-West. J. Zool.}, ' ...
'volume = {5(2)}, ' ...
'pages = {242-250}'];
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

