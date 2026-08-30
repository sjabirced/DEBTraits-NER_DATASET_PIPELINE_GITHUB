function [data, auxData, metaData, txtData, weights] = mydata_Transandinomys_talamancae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Transandinomys_talamancae'; 
metaData.species_en = 'Robert''s hocicudo'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 19];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';       bibkey.tg = 'guess';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 3.5*7;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'gbif';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Peromyscus_gossypinus: 2*60.5/46';
data.Wwi = 60.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'gbif';
  comment.Wwi = 'gbif: 47-74 g';

data.Ri  = 23.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'gbif';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-9 pups per litter; up to 6 litters per yr';

data.JOi  = 35; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 20; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'weight is much smaller than range';
  
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
metaData.links.id_CoL = '4BG4Q'; % Cat of Life
metaData.links.id_ITIS = '972509'; % ITIS
metaData.links.id_EoL = '1180023'; % Ency of Life
metaData.links.id_Wiki = 'Transandinomys_talamancae'; % Wikipedia
metaData.links.id_ADW = 'Oryzomys_talamancae'; % ADW
metaData.links.id_Taxo = '1684731'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000824'; % avibase
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Transandinomys_talamancae}}';
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
'howpublished = {\url{https://www.gbif.org/species/5786979}}';
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
