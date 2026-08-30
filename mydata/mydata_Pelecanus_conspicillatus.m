function [data, auxData, metaData, txtData, weights] = mydata_Pelecanus_conspicillatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Pelecanidae';
metaData.species    = 'Pelecanus_conspicillatus'; 
metaData.species_en = 'Australian pelican'; 

metaData.ecoCode.climate = {'BWh','BSh','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTg','0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 10 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 10 21];

%% set data
% zero-variate data

data.ab = 33.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 61;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 183;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'bow';   
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 50*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 172.9; units.Ww0 = 'g';   label.Ww0 = 'intital wet weight';    bibkey.Ww0 = 'avibase';
data.Wwi = 5505; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
  comment.Wwi = 'bow: 4–6.8 kg';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'bow: 2 eggs per clutch, 1 clutch per yr';
 
data.JOi  = 3262.5; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(40.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 5090; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.tx = 3 * weights.tx;
weights.tp = 3 * weights.tp;

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

%% Facts
F1 = 'endemic to Australia';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GCMH'; % Cat of Life
metaData.links.id_ITIS = '174861'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Ardeola_bacchus'; % Wikipedia
metaData.links.id_ADW = 'Ardeola_bacchus'; % ADW
metaData.links.id_Taxo = '51750'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '56292AA80E2251F0'; % avibase
metaData.links.id_birdlife = 'chinese-pond-heron-ardeola-bacchus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url1244188{http://en.wikipedia.org/wiki/Ardeola_bacchus}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/chpher1/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=56292AA80E2251F0&sec=lifehistory}}';
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

