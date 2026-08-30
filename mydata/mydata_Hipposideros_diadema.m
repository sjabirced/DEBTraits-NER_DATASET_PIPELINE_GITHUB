function [data, auxData, metaData, txtData, weights] = mydata_Hipposideros_diadema
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Hipposideridae';
metaData.species    = 'Hipposideros_diadema'; 
metaData.species_en = 'Diadem leaf-nosed bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TA','TPi'};
metaData.ecoCode.habitat = {'0iTi','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 08];

%% set data
% zero-variate data

data.tg = 80;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Rhinolophus_ferrumequinum';
data.tx = 40;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tg = 'based on Rhinolophus_ferrumequinum';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Wiki';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Rhinolophus_ferrumequinum';
data.Wwi = 50; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';
  comment.Wwi = '34-50 g; gbif: 22-57 g';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 pups per litter, 1 litter per yr';

data.JOi  = 33.00; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 37.20; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;

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
metaData.links.id_CoL = '3M36Q'; % Cat of Life
metaData.links.id_ITIS = '631499'; % ITIS
metaData.links.id_EoL = '328236'; % Ency of Life
metaData.links.id_Wiki = 'Hipposideros_diadema'; % Wikipedia
metaData.links.id_ADW = 'Hipposideros_diadema'; % ADW
metaData.links.id_Taxo = '64223'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800757'; % avibase
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposideros_diadema}}';
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
'howpublished = {\url{https://www.gbif.org/species/5218566}}';
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

