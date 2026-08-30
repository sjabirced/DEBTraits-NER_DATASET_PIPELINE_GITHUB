function [data, auxData, metaData, txtData, weights] = mydata_Limosa_lapponica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Limosa_lapponica'; 
metaData.species_en = 'Bar-tailed godwit'; 

metaData.ecoCode.climate = {'Dfc','Dwc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 10 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 10 16];

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(38);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 87;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 37.75; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'avibase';
data.Wwb = 27.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'avibase';
data.Wwi = 354; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 313; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 eggs per clutch, 1 clutch per yr';
 
data.JOi  = 273.5; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(40.9);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 240; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
metaData.links.id_CoL = '6QFD3'; % Cat of Life
metaData.links.id_ITIS = '176687'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Limosa_lapponica'; % Wikipedia
metaData.links.id_ADW = 'Limosa_lapponica'; % ADW
metaData.links.id_Taxo = '53655'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9A684C997C1AF1BA'; % avibase
metaData.links.id_birdlife = 'bar-tailed-godwit-limosa-lapponica'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limosa_lapponica}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/batgod/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9A684C997C1AF1BA&sec=lifehistory}}';
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

