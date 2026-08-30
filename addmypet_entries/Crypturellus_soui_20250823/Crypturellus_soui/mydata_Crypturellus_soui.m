function [data, auxData, metaData, txtData, weights] = mydata_Crypturellus_soui
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Tinamiformes'; 
metaData.family     = 'Tinamidae';
metaData.species    = 'Crypturellus_soui'; 
metaData.species_en = 'Little tinamou'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.45); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 23];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'avibase';   
  temp.ab = C2K(39.45);     units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '19-21 d';
data.tx = 21;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(39.45);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'avibase';   
  temp.tp = C2K(39.45);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.9*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = C2K(39.45);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'avibase';   
  temp.am = C2K(39.45);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 20; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'avibase';
data.Wwi = 235;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'avibase';
  comment.Wwi = 'Wiki: 174–238 g';
data.Wwim = 198; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';
  comment.Wwi = 'Wiki: males 207 g';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(39.45);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch';
  
data.JOi  = 140;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(33.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 220.8; units.weight.JOi = 'g'; label.weight.JOi = 'weight';                                                                                                                                                                                                                                                                                                                                                                                                                																				

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = weights.JOi * 2;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '323MW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Crypturellus_soui'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '51344'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '39DD9DD76680A7F0'; % avibase
metaData.links.id_birdlife = 'little-tinamou-crypturellus-soui'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crypturellus_soui}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=39DD9DD76680A7F0&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GavrGolu2023'; type = 'article'; bib = [ ...
'doi = {10.3897/zookeys.1148.93458}, ' ...
'title = {Metabolic rate, sleep duration, and body temperature in evolution of mammals and birds: the influence of geological time of principal groups divergence}, '...
'journal = {ZooKeys}, ' ...
'volume = {1148}, ' ...
'year = {2013}, ' ...
'pages = {1-27}, ' ...
'author = {Valery M. Gavrilov and Tatiana B. Golubeva and Andrey V. Bushuev}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/chitin1/cur/breeding}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

