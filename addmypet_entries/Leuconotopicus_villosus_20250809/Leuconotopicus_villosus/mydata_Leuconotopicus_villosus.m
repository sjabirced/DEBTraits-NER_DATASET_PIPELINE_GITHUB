function [data, auxData, metaData, txtData, weights] = mydata_Leuconotopicus_villosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Picidae';
metaData.species    = 'Leuconotopicus_villosus'; 
metaData.species_en = 'Hairy woodpecker'; 

metaData.ecoCode.climate = {'B', 'Cfa','D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwfm', 'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 09];

%% set data
% zero-variate data

data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '11-15 d; temp is guessed'; 
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '20-25 d';
data.tp = 65;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.8);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 4.3;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 3.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 40; units.Wwx = 'g';   label.Wwx = 'wet weight at fledge';     bibkey.Wwx = 'guess';
data.Wwi = 61.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'avibase';
data.Wwim = 69.8; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'avibase';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-6 eggs per clutch, 1 clutch per yr';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7VPRT'; % Cat of Life
metaData.links.id_ITIS = '1145285'; % ITIS
metaData.links.id_EoL = '917240'; % Ency of Life, server problems
metaData.links.id_Wiki = 'Leuconotopicus_villosus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5472314'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9D06AF89CDBCF27B'; % avibase
metaData.links.id_birdlife = 'hairy-woodpecker-leuconotopicus-villosus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leuconotopicus_villosus}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9D06AF89CDBCF27B&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

