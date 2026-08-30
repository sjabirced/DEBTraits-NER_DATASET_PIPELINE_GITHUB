function [data, auxData, metaData, txtData, weights] = mydata_Amblysomus_hottentotus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Afrosoricida'; 
metaData.family     = 'Chrysochloridae';
metaData.species    = 'Amblysomus_hottentotus'; 
metaData.species_en = 'Hottentot golden mole'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 24];

%% set data
% zero-variate data

data.tg = 35;  units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '4-6 wks d';
data.tx = 2.5*30.5;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '2-3 mnth';
data.tp = 200;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value is very unsure';

data.Wwb = 2;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on head/body length of 5 cm, rel to adult male: 5/12.5*5';
data.Wwx = 40;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'ADW';
  comment.Wwx = '35-45 g';
data.Wwi = 66;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'ADW';
data.Wwim = 80;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'ADW';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 pups per litter, 1 or more litters per yr, depending on food';
  
data.JOi  = 84.7;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 70; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

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
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temps are guess; actual body temperature almost equals the local environmental temp';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'there are no auricles, the eyes are covered with fur,';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'the western coast of South Africa and in south western Namibia';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BMZ7S'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1178646'; % Ency of Life
metaData.links.id_Wiki = 'Amblysomus_hottentotus'; % Wikipedia
metaData.links.id_ADW = 'Amblysomus_hottentotus'; % ADW
metaData.links.id_Taxo = '60723'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11100092'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrysochloris_asiatica}}';
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
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/site/accounts/information/Amblysomus_hottentotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

