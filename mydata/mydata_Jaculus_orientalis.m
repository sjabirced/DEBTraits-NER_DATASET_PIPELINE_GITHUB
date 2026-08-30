function [data, auxData, metaData, txtData, weights] = mydata_Jaculus_orientalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Dipodidae';
metaData.species    = 'Jaculus_orientalis'; 
metaData.species_en = 'Greater Egyptian jerboa'; 

metaData.ecoCode.climate = {'BWh','Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHw'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.6); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 17];

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';    label.tg = 'gestation time';       bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';
  temp.tx = C2K(35.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 300;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'gbif';
  temp.tp = C2K(35.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '8-12 mnth';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(35.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 5.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Jaculus_jaculus: 2*160/55';
data.Wwi = 160; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'gbif';
  comment.Wwi = '104-182 g';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'gbif';   
  temp.Ri = C2K(35.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 pups per litter, 1 litter per yr; 2-8 pups per season';

data.JOi  = 139.1; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 139.1; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 5 * weights.Wwi;

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
metaData.links.id_CoL = '3QK2Y'; % Cat of Life
metaData.links.id_ITIS = '609759'; % ITIS
metaData.links.id_EoL = '327897'; % Ency of Life
metaData.links.id_Wiki = 'Jaculus_orientalis'; % Wikipedia
metaData.links.id_ADW = 'Jaculus_orientalis'; % ADW
metaData.links.id_Taxo = '63327'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12900052'; % avibase
metaData.links.id_AnAge = 'Jaculus_orientalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Jaculus_orientalis}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Jaculus_orientalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Jaculus_orientalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/5219894}}';
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
