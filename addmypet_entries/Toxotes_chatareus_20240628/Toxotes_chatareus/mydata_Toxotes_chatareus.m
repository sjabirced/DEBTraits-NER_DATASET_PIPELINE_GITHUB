  function [data, auxData, metaData, txtData, weights] = mydata_Toxotes_chatareus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Toxotidae';
metaData.species    = 'Toxotes_chatareus'; 
metaData.species_en = 'Spotted archerfish'; 

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
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.5*365; units.tp = 'd';    label.tp = 'time since birth at puberty at birth'; bibkey.tp = 'guess';   
  temp.tp = C2K(27.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'SimoBaka2009';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5e-5;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SimoBaka2009';
  comment.Wwb = 'based on egg diameter of 0.46 mm: pi/6*0.046^3';
data.Wwp = 20;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'SimoBaka2009','fishbase'};
  comment.Wwp = 'based on 0.01660*Lp^3.00, see F1';
data.Wwi = 1062;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^3.00, see F1; max. published weight: 750.00 g';

% uni-variate data
% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
10.662	22737.471
12.226	24774.662
12.587	27724.527
14.473	30642.179
14.593	44835.578
14.814	47196.904
14.874	51040.365
14.914	36843.588
15.235	43934.768
15.937	45102.937
16.238	49532.807
16.819	56322.744
16.960	60460.257
17.000	63712.648
17.802	70202.166
18.083	76406.953
18.585	67228.149
19.006	101230.343
19.026	88216.982
22.997	150536.046];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(27.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'SimoBaka2009';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
9.390	12.389
9.782	23.009
10.922	25.664
11.563	28.319
12.169	33.628
13.310	50.442
13.737	54.867
14.094	55.752
14.414	68.142
14.878	55.752
15.305	78.761
15.483	76.106
15.840	71.681
16.018	82.301
16.160	107.965
16.232	91.150
16.445	84.071
16.481	94.690
17.051	77.876
18.477	123.894
22.432	271.681];    
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','female'};  
bibkey.LW_f = 'SimoBaka2009';
%
data.LW_m = [ ... % total length (cm), weight (g)
8.463	12.389
8.962	14.159
9.283	12.389
9.425	17.699
9.853	9.735
10.102	16.814
10.352	10.619
10.673	23.009
10.922	22.124
10.993	31.858
11.243	23.894
11.599	25.664
12.062	26.549
12.169	34.513
12.490	30.973
12.633	40.708
12.633	47.788
12.953	43.363
12.953	33.628
13.238	38.938
13.523	38.938
13.595	52.212
13.915	42.478
14.094	42.478
14.307	44.248
14.379	58.407
14.486	64.602
14.521	47.788
14.806	55.752
14.806	49.558
15.198	85.841
15.555	63.717
16.980	100.885
16.980	86.726
18.085	115.929
19.082	146.903
20.045	183.186];    
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
F2 = 'Asia and Oceania: Sri Lanka and India to New Guinea and northern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57MPB'; % Cat of Life
metaData.links.id_ITIS = '169493'; % ITIS
metaData.links.id_EoL = '46581106'; % Ency of Life
metaData.links.id_Wiki = 'Toxotes_chatareus'; % Wikipedia
metaData.links.id_ADW = 'Toxotes_chatareus'; % ADW
metaData.links.id_Taxo = '189182'; % Taxonomicon
metaData.links.id_WoRMS = '283020'; % WoRMS
metaData.links.id_fishbase = 'Toxotes_chatareus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Toxotes_chatareus}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Toxotes_chatareus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  