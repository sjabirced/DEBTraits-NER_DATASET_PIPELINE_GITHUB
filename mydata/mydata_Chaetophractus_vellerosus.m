function [data, auxData, metaData, txtData, weights] = mydata_Chaetophractus_vellerosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cingulata'; 
metaData.family     = 'Chlamyphoridae';
metaData.species    = 'Chaetophractus_vellerosus'; 
metaData.species_en = 'Screaming hairy armadillo'; 

metaData.ecoCode.climate = {'A','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 15];

%% set data
% zero-variate data

data.tg = 68;    units.tg = 'd';    label.tg = 'gestation time';       bibkey.tg = 'ADW';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '60-75 d';
data.tx = 55;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tg = '50-60 d';
data.tp = 9*30.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.2*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'ADW';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 37.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Chaetophractus_villosus: 113.4*100/3000';
data.Wwi = 1100; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'ADW';
  comment.Wwi = '257-1126 g';
data.Wwim = 1200; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = '543-1329 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';

data.JOi  = 306.40; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1110.00; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TDLM'; % Cat of Life
metaData.links.id_ITIS = '624896'; % ITIS
metaData.links.id_EoL = '328494'; % Ency of Life
metaData.links.id_Wiki = 'Chaetophractus_vellerosus'; % Wikipedia
metaData.links.id_ADW = 'Chaetophractus_vellerosus'; % ADW
metaData.links.id_Taxo = '60563'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11700025'; % avibase
metaData.links.id_AnAge = 'Chaetophractus_vellerosus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetophractus_vellerosus}}';
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
'howpublished = {\url{https://www.gbif.org/species/2440817}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chaetophractus_vellerosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Chaetophractus_vellerosus}}';
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
