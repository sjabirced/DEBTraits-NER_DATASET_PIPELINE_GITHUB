  function [data, auxData, metaData, txtData, weights] = mydata_Toxotes_jaculatrix
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Toxotidae';
metaData.species    = 'Toxotes_jaculatrix'; 
metaData.species_en = 'Banded archerfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 28];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.5*365; units.tp = 'd';    label.tp = 'time since birth at puberty at birth'; bibkey.tp = 'guess';   
  temp.tp = C2K(27.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'SimoBaka2009';
data.Li = 30;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5e-5;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SimoBaka2009';
  comment.Wwb = 'based on egg diameter of 0.46 mm: pi/6*0.046^3';
data.Wwp = 16.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'SimoBaka2009','fishbase'};
  comment.Wwp = 'based on 0.01660*Lp^3.00, see F1';
data.Wwi = 448;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^3.00, see F1';

% uni-variate data

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
11.223	23612.860
14.292	41588.695
14.352	37742.692
14.573	38329.525
14.854	39802.339
15.375	46889.293
15.395	49254.856
15.556	50730.212
15.817	50133.211
16.117	55154.575
16.338	57515.900
16.358	52192.010
16.519	58399.339
17.221	57793.004
17.461	62224.157
17.521	59265.394
17.903	64876.569
17.963	60143.325
18.384	69894.131
18.464	75511.662
19.307	82296.078
22.456	147590.00];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(27.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'SimoBaka2009';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
9.660	14.206
10.189	8.357
10.981	30.919
11.774	18.384
12.491	50.975
13.094	45.961
13.811	55.153
14.075	51.811
14.717	55.153
14.868	63.510
15.321	69.359
15.396	57.660
15.434	79.387
15.547	68.524
15.887	90.251
15.887	84.401
15.962	61.838
16.113	64.345
16.264	82.730
16.264	68.524
16.830	81.059
17.208	86.908
17.472	97.772
17.849	89.415
18.075	97.772
18.566	110.306
19.057	120.334
22.943	273.259];    
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','female'};  
bibkey.LW_f = 'SimoBaka2009';
%
data.LW_m = [ ... % total length (cm), weight (g)
8.377	15.042
8.943	20.891
9.019	9.192
9.509	18.384
9.849	21.727
10.038	15.877
10.491	13.370
10.755	21.727
11.057	20.891
11.283	27.577
11.623	25.070
11.887	32.591
11.962	47.632
12.377	40.947
12.491	39.276
12.717	33.426
12.830	40.947
13.057	35.933
13.208	36.769
13.321	32.591
13.472	65.181
13.472	40.111
13.623	46.797
13.660	49.304
13.698	66.852
13.887	40.947
14.151	43.454
14.302	66.852
14.302	44.290
14.453	55.989
14.717	45.961
14.830	71.866
15.396	89.415
15.962	76.880
16.000	84.401
16.302	113.649
16.868	96.936
16.943	101.950
17.962	108.635
18.415	117.827
18.491	147.911
18.868	126.184
19.057	143.733];    
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','male'};  
bibkey.LW_m = 'SimoBaka2009';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01660*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Asia and Oceania: India eastward to the Philippines, and south to Indonesia, Vanuatu, Solomon Islands, Papua New Guinea, and northern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57MPD'; % Cat of Life
metaData.links.id_ITIS = '169495'; % ITIS
metaData.links.id_EoL = '46581107'; % Ency of Life
metaData.links.id_Wiki = 'Toxotes_jaculatrix'; % Wikipedia
metaData.links.id_ADW = 'Toxotes_jaculatrix'; % ADW
metaData.links.id_Taxo = '45371'; % Taxonomicon
metaData.links.id_WoRMS = '283021'; % WoRMS
metaData.links.id_fishbase = 'Toxotes_jaculatrix'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Toxotes_jaculatrix}}';  
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
bibkey = 'SimoBaka2012'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-011-9944-6}, ' ...
'author = {Simon, K. D. and Bakar, Y. and A. SAMAT3, C. C. ZAIDI3, A. AZIZ4, Zaidi, C. C. and Mazlan, A. G. and Samat, A. and Arshad, A. and Temple, S. E. and Brown-Peterson, N. J.}, ' ...
'year = {2012}, ' ...
'title = {Aspects of the reproductive biology of two archer fishes \emph{Toxotes chatareus}, ({H}amilton 1822) and \emph{Toxotes jaculatrix} ({P}allas 1767)}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {93(4)}, '...
'pages = {491–503}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SimoBaka2009'; type = 'article'; bib = [ ... 
'doi = {10.1631/jzus.B0920173}, ' ...
'author = {Simon, K. D. and Bakar, Y. and Samat, A. and Zaidi, C. C. and Mazlan, A. G.}, ' ...
'year = {2009}, ' ...
'title = {Population growth, trophic level, and reproductive biology of two congeneric archer fishes (\emph{Toxotes chatareus}, {H}amilton 1822 and \emph{Toxotes jaculatrix}, {P}allas 1767) inhabiting {M}alaysian coastal waters}, ' ... 
'journal = {Journal of Zhejiang University SCIENCE B}, ' ...
'volume = {10(12)}, '...
'pages = {902-911}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Toxotes_jaculatrix}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  