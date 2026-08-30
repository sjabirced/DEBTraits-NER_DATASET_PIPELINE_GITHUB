function [data, auxData, metaData, txtData, weights] = mydata_Dasycercus_cristicauda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Dasycercus_cristicauda'; 
metaData.species_en = 'Crest-tailed mulgara'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 18];

%% set data
% zero-variate data

data.tg = 38;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 121;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 315;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 22;     units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 120;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 185;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';

data.Ri  = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter, 1 litter per yr';

data.JOi  = 36.9;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(37.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 101; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.JOi = 5 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '347N2'; % Cat of Life
metaData.links.id_ITIS = '552604'; % ITIS
metaData.links.id_EoL = '323721'; % Ency of Life
metaData.links.id_Wiki = 'Dasycercus_cristicauda'; % Wikipedia
metaData.links.id_ADW = 'Dasycercus_cristicauda'; % ADW
metaData.links.id_Taxo = '59930'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800014'; % MSW3
metaData.links.id_AnAge = 'Dasycercus_cristicauda'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasycercus_cristicauda}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dasycercus_cristicauda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003'; type = 'article'; bib = [ ... 
'doi = {0.1073/pnas.0436428100}, '...
'author = {Craig R. White and Roger S. Seymour}, ' ... 
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, ' ...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

