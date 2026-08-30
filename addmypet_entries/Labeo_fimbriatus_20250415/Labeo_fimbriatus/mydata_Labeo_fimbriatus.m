  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_fimbriatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_fimbriatus'; 
metaData.species_en = 'Fringed-lipped peninsula carp'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data
data.ab = 2.5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 91;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 377;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00832*Lp^3.04, see F1';
data.Wwi = 7510;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.04, see F1';

data.Ri  = 525893/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.016	19.972
29.784	42.538
57.441	79.047
82.987	95.997
112.772	135.314
144.702	157.897
172.362	191.614
200.046	200.204
225.594	214.362
257.525	236.944
283.060	265.061
313.910	304.387
341.569	338.104];
data.tW(:,1) = 20 + data.tW(:,1); % set origin at birth
units.tW = {'d', 'g'}; label.tW = {'time since birth','weight'};  
temp.tW = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'JenaDas2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 10;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00832*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Pakistan, India, Nepal, Myanmar and Bangladesh';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3RHVJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '206639'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_fimbriatus'; % Wikipedia
metaData.links.id_ADW = 'Labeo_fimbriatus'; % ADW
metaData.links.id_Taxo = '177901'; % Taxonomicon
metaData.links.id_WoRMS = '1022460'; % WoRMS
metaData.links.id_fishbase = 'Labeo-fimbriatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_fimbriatus}}';  
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
bibkey = 'JenaDas2015'; type = 'article'; bib = [ ...  
'author = {J. K. Jena and P. C. Das and G. Mitra and B. Patro and D. Mohanta and B. Mishra}, ' ...
'year = {2015}, ' ...
'title = {Evaluation of growth performance and compatibility of \emph{Labeo fimbriatus} ({B}loch, 1795) with major carps in polyculture system}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {62(4)}, ' ...
'pages = {45-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-fimbriatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

