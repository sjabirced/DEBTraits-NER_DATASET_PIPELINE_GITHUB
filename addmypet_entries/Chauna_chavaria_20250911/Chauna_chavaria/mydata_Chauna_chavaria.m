function [data, auxData, metaData, txtData, weights] = mydata_Chauna_chavaria
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anhimidae';
metaData.species    = 'Chauna_chavaria'; 
metaData.species_en = 'Northern screamer'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 11];

%% set data
% zero-variate data

data.ab = 43;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'bow';   
  temp.ab = C2K(35);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 40;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 120;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2.4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22.7*365;   units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 184; units.Ww0 = 'g';   label.Ww0 = 'initial weight';    bibkey.Ww0 = 'avibase';
data.Wwi = 3090; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 2117; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch: 1 clutch per year'; 
 
data.JOi  = 1238.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(40);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 2620; units.weight.JOi = 'g'; label.weight.JOi = 'weight';                                                                                                                                                                                                                                                                                                                                                                                                                																				
   
%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;
weights.Ww0 = 3 * weights.Ww0;

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

%% Links
metaData.links.id_CoL = '5Y249'; % Cat of Life
metaData.links.id_ITIS = '553902'; % ITIS
metaData.links.id_EoL = '45512012'; % Ency of Life
metaData.links.id_Wiki = 'Chauna_chavaria'; % Wikipedia
metaData.links.id_ADW = 'Chauna_chavaria'; % ADW
metaData.links.id_Taxo = '51968'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '013B2B0B83B5F4CF'; % avibase
metaData.links.id_birdlife = 'northern-screamer-chauna-chavaria'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chauna_chavaria}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/norscr1/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=013B2B0B83B5F4CF&sec=lifehistory}}';
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

