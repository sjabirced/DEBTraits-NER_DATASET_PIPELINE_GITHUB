function [data, auxData, metaData, txtData, weights] = mydata_Pseudomys_hermannsburgensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Pseudomys_hermannsburgensis'; 
metaData.species_en = 'Sandy inland mouse'; 

metaData.ecoCode.climate = {'BWh','BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh','0iTd','0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 26];

%% set data
% zero-variate data

data.tg = 37.5;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '37-38 d';
data.tx = 30;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'gbif'; 
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 146;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Pseudomys_australis';
data.am = 7.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Pseudomys_australis';

data.Wwb = 2;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'gbif';
data.Wwi = 15;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '9-15 g';
  
data.Ri  = 3*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'gbif';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 pups per litter; assumed: 3 litters per yr';
   
data.JOi  = 16.97; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 11.7; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P4J4'; % Cat of Life
metaData.links.id_ITIS = '585498'; % ITIS
metaData.links.id_EoL = '1179346'; % Ency of Life
metaData.links.id_Wiki = 'Pseudomys_hermannsburgensis'; % Wikipedia
metaData.links.id_ADW = 'Pseudomys_hermannsburgensis'; % ADW
metaData.links.id_Taxo = '63113'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001716'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudomys_hermannsburgensis}}';
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
'howpublished = {\url{https://www.gbif.org/species/5219796}}';
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

