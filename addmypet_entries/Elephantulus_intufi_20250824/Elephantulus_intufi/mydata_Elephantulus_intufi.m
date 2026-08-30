function [data, auxData, metaData, txtData, weights] = mydata_Elephantulus_intufi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Macroscelidea'; 
metaData.family     = 'Macroscelididae';
metaData.species    = 'Elephantulus_intufi'; 
metaData.species_en = 'Bushveld elephant shrew';

metaData.ecoCode.climate = {'BWh', 'BWk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 24];

%% set data
% zero-variate data

data.tg = 51;  units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(35.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '50-52 d';
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW'; 
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '3-4 wks';
data.tp = 330;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'one captive specimen lived 4.2 years ';

data.Wwb = 10;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwx = 29;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 52;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'ADW';
  comment.Wwi = '40-74 g';
data.Wwim = 45;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'ADW';
  comment.Wwim = '35-56 g';

data.Ri  = 5.5*1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = '';   
  temp.Ri = C2K(37.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 young per litter, assumed 5 litters per yr';
  
data.JOi  = 52.03;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(30.9);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 46.5; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '326389'; % Ency of Life
metaData.links.id_Wiki = 'Elephantulus_intufi'; % Wikipedia
metaData.links.id_ADW = 'Elephantulus_intufi'; % ADW
metaData.links.id_Taxo = '61595'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11200008'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elephantulus_intufi}}';
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
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/site/accounts/information/Elephantulus_intufi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

