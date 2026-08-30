function [data, auxData, metaData, txtData, weights] = mydata_Corydon_sumatranus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Eurylaimidae';
metaData.species    = 'Corydon_sumatranus'; 
metaData.species_en = 'Dusky broadbill'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 21];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(38);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 18;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 40.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.7*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.5*365;   units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 7.6; units.Ww0 = 'g';   label.Ww0 = 'initial weight at birth';    bibkey.Ww0 = 'LambWood1996';
  comment.Ww0 = 'based on egg length 29.4 mm, width 22.2 mm: pi/6*2.94*2.22^2';
data.Wwi = 140; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'avibase';
%data.Wwim = ; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.JOi  = 107.75; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GavrGolu2023';   
  temp.JOi = C2K(41.6); units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 115.33; units.weight.JOi = 'g'; label.weight.JOi = 'weight';                                                                                                                                                                                                                                                                                                                                                                                                                																				
   
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
metaData.links.id_CoL = '6B6VH'; % Cat of Life
metaData.links.id_ITIS = '559520'; % ITIS
metaData.links.id_EoL = '45516641'; % Ency of Life
metaData.links.id_Wiki = 'Corydon_sumatranus'; % Wikipedia
metaData.links.id_ADW = 'Corydon_sumatranus'; % ADW
metaData.links.id_Taxo = '55753'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'BB1E6094E362C526'; % avibase
metaData.links.id_birdlife = 'dusky-broadbill-corydon-sumatranus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corydon_sumatranus}}';
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
bibkey = 'LambWood1996'; type = 'Book'; bib = [ ...  
'author = {F. Lambert and M. Woodcock}, ' ...
'year = {1996}, ' ...
'title  = {Pitts, broadbills and asities}, ' ...
'publisher = {Prica Press, Sussex}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/dusbro1/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=BB1E6094E362C526&sec=lifehistory}}';
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

