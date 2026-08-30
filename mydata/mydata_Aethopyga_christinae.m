function [data, auxData, metaData, txtData, weights] = mydata_Aethopyga_christinae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Nectariniidae';
metaData.species    = 'Aethopyga_christinae'; 
metaData.species_en = 'Fork-tailed sunbird'; 

metaData.ecoCode.climate = {'A','Cfa','Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

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
  comment.ab = 'based on Aethopyga_siparaja';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';
  temp.tx = C2K(40.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Aethopyga_siparaja';
data.tp = 57;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(40.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';   
  temp.tR = C2K(40.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(40.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Aethopyga_siparaja';

data.Ww0 = 0.9;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'guess';
  comment.Ww0 = 'based on Aethopyga_siparaja';
data.Wwi = 5.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(40.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Aethopyga_siparaja: 3 eggs per clutch, 1 clutch per year';
 
data.JOi  = 0.12*60*60/20.1;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'LondCast2015';   
  temp.JOi = C2K(40.2);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 5.2; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
   
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

%% Links
metaData.links.id_CoL = '65CC9'; % Cat of Life
metaData.links.id_ITIS = '558453'; % ITIS
metaData.links.id_EoL = '45517629'; % Ency of Life
metaData.links.id_Wiki = 'Aethopyga_christinae'; % Wikipedia
metaData.links.id_ADW = 'Aethopyga_christinae'; % ADW
metaData.links.id_Taxo = '85625'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '828EAC60A5A2609D'; % avibase
metaData.links.id_birdlife = 'hainan-sunbird-aethopyga-christinae'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aethopyga_christinae}}';
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
'howpublished = {\url{https://birdsoftheworld.org/bow/species/fotsun1/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=828EAC60A5A2609D&sec=lifehistory}}';
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

