function [data, auxData, metaData, txtData, weights] = mydata_Chironectes_minimus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Chironectes_minimus'; 
metaData.species_en = 'Water opossum'; 

metaData.ecoCode.climate = {'A', 'Cf'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 21];

%% set data
% zero-variate data

data.tg = 13;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW: 120 d';
data.tx = 60;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'ADW: 45-60 d';
data.tp = 304;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge: One captive specimen lived for 3.1 years';

data.Wwb = 0.25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 75;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwpm = 400;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty';   bibkey.Wwpm = 'ADW';
data.Wwi = 923;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'GenoIsle2018';
 comment.Wwi = 'ADW: 604-790 g';

data.Ri  = 2.5*4/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: 2-3 litters per yr, 4 pups per litter'; 

data.JOi  = 366.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WithThom2000';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 922.9; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;
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

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'both female and male have a pouch, in males for protection';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XT73'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '289603'; % Ency of Life
metaData.links.id_Wiki = 'Chironectes_minimus'; % Wikipedia
metaData.links.id_ADW = 'Chironectes_minimus'; % ADW
metaData.links.id_Taxo = '59815'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10400032'; % MSW3
metaData.links.id_AnAge = 'Chironectes_minimus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chironectes_minimus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chironectes_minimus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438},  ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WithThom2000'; type = 'article'; bib = [ ...
'doi = {10.1071/ZO99073}, ' ...
'title = {Metabolic physiology of the north-western marsupial mole, \emph{Notoryctes caurinus} ({M}arsupialia: {N}otoryctidae)}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {48}, ' ...
'year = {2000}, ' ...
'pages = {241–258},  ' ...
'author = {P. C. Withers and G. G. Thompson and R. S. Seymour}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chironectes_minimus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

