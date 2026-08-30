function [data, auxData, metaData, txtData, weights] = mydata_Chalcophaps_indica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Chalcophaps_indica'; 
metaData.species_en = 'Common emerald dove'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi_W'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 10 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 10 17];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(38);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 37.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.8*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.3; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'avibase';
data.Wwi = 136; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 136.6; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
data.JOi  = 132.76; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(40.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 115.95; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
data.JOi1  = 142.5; units.JOi1  = 'ml O2/h'; label.JOi1  = 'max BMR';  bibkey.JOi1  = 'GavrGolu2023';   
  temp.JOi1 = C2K(40.5);  units.temp.JOi1 = 'K'; label.temp.JOi1 = 'temperature';
  weight.JOi1 = 124; units.weight.JOi1 = 'g'; label.weight.JOi1 = 'weight';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TGJN'; % Cat of Life
metaData.links.id_ITIS = '177222'; % ITIS
metaData.links.id_EoL = '45516211'; % Ency of Life
metaData.links.id_Wiki = 'Chalcophaps_indica'; % Wikipedia
metaData.links.id_ADW = 'Chalcophaps_indica'; % ADW
metaData.links.id_Taxo = '53959'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '05E5E8F648951C9F'; % avibase
metaData.links.id_birdlife = 'grey-capped-emerald-dove-chalcophaps-indica'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chalcophaps_indica}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/emedov2/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=05E5E8F648951C9F&sec=lifehistory}}';
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

