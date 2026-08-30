function [data, auxData, metaData, txtData, weights] = mydata_Apteryx_owenii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apterygiformes'; 
metaData.family     = 'Apterygidae';
metaData.species    = 'Apteryx_owenii'; 
metaData.species_en = 'Little spotted kiwi'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(31); % K, body temp
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

data.ab = 70;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'avibase';   
  temp.ab = C2K(31);     units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(31);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'avibase';   
  temp.tp = C2K(31);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2.13*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = C2K(31);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'avibase';   
  temp.am = C2K(31);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 285; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'avibase';
data.Wwi = 1950;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 1 to 1.95 kg';
data.Wwim = 1360; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
  comment.Wwi = 'Wiki: males 0.88 to 1.36 kg';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(31);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per clutch; 1 clutch per yr';
  
data.JOi  = 710.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(31);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 1377; units.weight.JOi = 'g'; label.weight.JOi = 'weight';                                                                                                                                                                                                                                                                                                                                                                                                                																				
                              
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
metaData.links.id_CoL = 'FYYS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Apteryx_owenii'; % Wikipedia
metaData.links.id_ADW = 'Apteryx_owenii'; % ADW
metaData.links.id_Taxo = '51312'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '187706CF92320BD8'; % avibase
metaData.links.id_birdlife = 'little-spotted-kiwi-apteryx-owenii'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apteryx_owenii}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=187706CF92320BD8&sec=lifehistory}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/liskiw1/cur/introduction#repro}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

