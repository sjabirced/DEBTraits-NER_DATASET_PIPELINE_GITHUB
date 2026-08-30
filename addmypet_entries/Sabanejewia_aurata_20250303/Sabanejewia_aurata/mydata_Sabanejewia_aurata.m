  function [data, auxData, metaData, txtData, weights] = mydata_Sabanejewia_aurata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Sabanejewia_aurata'; 
metaData.species_en = 'Golden spined loach'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 03];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ZaneMrak2008';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 14;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 0.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00372*p^2.88, see F1';
data.Wwi = 7.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00372*Li^2.88, see F1';

data.Ri = 968/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cobitis calderoni';
  
% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm)
1	4.0 0.34
2	7.4 2.79
3	8.2 4.41];
data.tLW(:,1) = 365 * (0+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(22);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'HarkGyor2002'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.666	0.125
3.124	0.159
3.317	0.192
3.405	0.226
3.465	0.226
3.583	0.267
3.613	0.251
3.731	0.326
3.805	0.284
3.938	0.293
3.953	0.334
3.953	0.392
4.042	0.334
4.101	0.417
4.160	0.343
4.175	0.393
4.205	0.459
4.234	0.418
4.338	0.451
4.352	0.426
4.397	0.484
4.471	0.459
4.486	0.526
4.575	0.584
4.723	0.659
4.989	0.634
5.108	0.875
6.501	1.757
6.619	1.932
7.138	2.140
7.301	2.447
7.391	2.771
7.391	2.962
7.392	3.021
7.496	3.320
7.585	3.586
7.599	3.245
7.940	3.295
8.028	3.329
8.209	4.442];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'HarkGyor2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00372*(TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Black Sea Bassin';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78YQJ'; % Cat of Life
metaData.links.id_ITIS = '640071'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sabanejewia_aurata'; % Wikipedia
metaData.links.id_ADW = 'Sabanejewia_aurata'; % ADW
metaData.links.id_Taxo = '43993'; % Taxonomicon
metaData.links.id_WoRMS = '1020191'; % WoRMS
metaData.links.id_fishbase = 'Sabanejewia-balcanica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sabanejewia_aurata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HarkGyor2002'; type = 'Article'; bib = [ ...  
'author = {A. Harka and K. Gy\"{o}re and P. Lengyel }, ' ...
'year = {2002}, ' ...
'title = {GROWTH OF THE GOLDEN SPINED LOACH, \emph{Sabanejewia_aurata} ({F}ILIPPI, 1865) IN RIVER {T}ISZA (EASTERN {H}UNGARY)}, ' ... 
'journal = {Tiscia}, ' ...
'volume = {33}, '...
'pages = {45-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sabanejewia-aurata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

