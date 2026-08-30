function [data, auxData, metaData, txtData, weights] = mydata_Eothenomys_melanogaster
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Eothenomys_melanogaster'; 
metaData.species_en = 'Pere David''s vole'; 

metaData.ecoCode.climate = {'Cfa','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi','0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 21];

%% set data
% zero-variate data

data.tg = 24.5;    units.tg = 'd';    label.tg = 'gestation time';       bibkey.tg = 'guess';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Loxodontomys_micropus';
data.tx = 12;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Loxodontomys_micropus';
data.tp = 60;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Loxodontomys_micropus';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Loxodontomys_micropus';

data.Wwb = 2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Loxodontomys_micropus';
data.Wwi = 46; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'gbif';
  comment.Wwi = '18-46.5 g';

data.Ri  = 3*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter; assumed 3 litters per yr';

data.JOi  = 62.5; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 25.2; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 8 * weights.JOi;
weights.Wwi = 2 * weights.Wwi;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FLN7'; % Cat of Life
metaData.links.id_ITIS = '632842'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Eothenomys_melanogaster'; % Wikipedia
metaData.links.id_ADW = 'Eothenomys_melanogaster'; % ADW
metaData.links.id_Taxo = '62658'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000215'; % avibase
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eothenomys_melanogaster}}';
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
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/2438894}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
