function [data, auxData, metaData, txtData, weights] = mydata_Colobus_guereza

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Colobus_guereza'; 
metaData.species_en = 'Mantled guereza'; 

metaData.ecoCode.climate = {'Am','BSh','Cfa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTg', '0iTa', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'Joi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 28];

%% set data
% zero-variate data

data.tg = 175;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 377;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1461;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
   temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 35*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 366.4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1600;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 11770;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'ADW';
  comment.Wwi = 'ADW: males can weigh up to 1.19 times heavier than females: 5-14 kg';
data.Wwim = 14000;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ADW';
  comment.Wwim = 'ADW: males can weigh up to 1.19 times heavier than females: 5-14 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JOi  = 2980;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(37);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 10500; units.weight.JOi = 'K'; label.weight.JOi = 'temperature';                                                                                                                            

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;
weights.tx = 0 * weights.tx;

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
% set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'tx is ignored due to  inconsistency';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '5XKBR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '128444'; % Ency of Life
metaData.links.id_Wiki = 'Colobus_guereza'; % Wikipedia
metaData.links.id_ADW = 'Colobus_guereza'; % ADW
metaData.links.id_Taxo = '66070'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100605'; % MSW3
metaData.links.id_AnAge = 'Colobus_guereza'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Colobus_guereza}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Colobus_guereza}}';
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
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Colobus_guereza/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

