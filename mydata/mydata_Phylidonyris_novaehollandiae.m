function [data, auxData, metaData, txtData, weights] = mydata_Phylidonyris_novaehollandiae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Meliphagidae';
metaData.species    = 'Phylidonyris_novaehollandiae'; 
metaData.species_en = 'New Holland honeyeater'; 

metaData.ecoCode.climate = {'Cs','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2026 01 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2026 01 02];

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(32);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 16.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';
  temp.tx = C2K(40.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 49.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(40.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.9*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'avibase';   
  temp.am = C2K(40.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 2.56;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'avibase';
data.Wwi = 18.5;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 20.2;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 eggs per clutch, 1 clutch per year';
 
data.JOi  = 0.32*60*60/20.1;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'LondCast2015';   
  temp.JOi = C2K(40.2);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 17.3; units.weight.JOi = 'g'; label.weight.JOi = 'weight'; 
   
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
D1 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4GZH6'; % Cat of Life
metaData.links.id_ITIS = '562056'; % ITIS
metaData.links.id_EoL = '45518442'; % Ency of Life
metaData.links.id_Wiki = 'Phylidonyris_novaehollandiae'; % Wikipedia
metaData.links.id_ADW = 'Phylidonyris_novaehollandiae'; % ADW
metaData.links.id_Taxo = '57978'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'DF9A1A25DF97BDB8'; % avibase
metaData.links.id_birdlife = 'new-holland-honeyeater-phylidonyris-novaehollandiae'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phylidonyris_novaehollandiae}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/nehhon2/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=DF9A1A25DF97BDB8&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LondCast2015'; type = 'Article'; bib = [ ... 
'doi = {10.1111/1365-2435.12348}, ' ...
'title = {Basal metabolism in tropical birds: latitude, altitude, and the ‘pace of life’}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {29}, ' ...
'year = {2015}, ' ...
'pages = {338–346}, ' ...
'author = {Gustavo A. Londono and Mark A. Chappell Marıa del Rosario Castaneda and Jill E. Jankowski and Scott K. Robinson}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

