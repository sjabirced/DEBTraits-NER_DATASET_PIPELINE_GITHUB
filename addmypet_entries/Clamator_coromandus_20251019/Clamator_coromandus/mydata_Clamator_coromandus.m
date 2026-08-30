function [data, auxData, metaData, txtData, weights] = mydata_Clamator_coromandus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cuculiformes'; 
metaData.family     = 'Cuculidae';
metaData.species    = 'Clamator_coromandus'; 
metaData.species_en = 'Chestnut-winged cuckoo'; 

metaData.ecoCode.climate = {'A','Cwa','Cfa'};
metaData.ecoCode.ecozone = {'TPi','TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 10 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 10 19];

%% set data
% zero-variate data

data.ab = 13;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(39);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Garrulax_monileger, a frequent host';
data.tx = 18;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 54;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';   
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.6*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.84; units.Ww0 = 'g';   label.Ww0 = 'intital wet weight';    bibkey.Ww0 = 'bow';
  comment.Ww0 = 'based on egg length 25.4–29.9 mm, width 20.3–24.4 mm: pi/6*2.7*2.2^2';
data.Wwi = 75.1; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
  comment.Wwi = 'bow: 66.4–86 g';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'bow';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4 eggs per clutch, 1 clutch per yr';
 
data.JOi  = 57.41; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(40.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 54.8; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Obligate brood parasite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'P5WV'; % Cat of Life
metaData.links.id_ITIS = '554694'; % ITIS
metaData.links.id_EoL = '45517833'; % Ency of Life
metaData.links.id_Wiki = 'Cacomantis_variolosus'; % Wikipedia
metaData.links.id_ADW = 'Cacomantis_variolosus'; % ADW
metaData.links.id_Taxo = '54486'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '05824D50EB48837B'; % avibase
metaData.links.id_birdlife = 'brush-cuckoo-cacomantis-variolosus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cacomantis_variolosus}}';
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
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/brucuc3/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=05824D50EB48837B&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GavrGolu2023'; type = 'Article'; bib = [ ... 
'doi = {10.3897/zookeys.1148.93458}, ' ...
'title = {Metabolic rate, sleep duration, and body temperature in evolution of mammals and birds: the influence of geological time of principal groups divergence}, ' ...
'journal = {ZooKeys}, ' ...
'volume = {1148}, ' ...
'year = {2013}, ' ...
'pages = {1-27}, ' ...
'author = {Valery M. Gavrilov and Tatiana B. Golubeva and Andrey V. Bushuev}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

