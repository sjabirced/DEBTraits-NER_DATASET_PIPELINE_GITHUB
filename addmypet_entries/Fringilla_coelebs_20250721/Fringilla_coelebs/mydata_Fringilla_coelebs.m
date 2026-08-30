function [data, auxData, metaData, txtData, weights] = mydata_Fringilla_coelebs
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Fringillidae';
metaData.species    = 'Fringilla_coelebs'; 
metaData.species_en = 'Chaffinch'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aT'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 21];

%% set data
% zero-variate data

data.ab = 13;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-15 d'; 
data.tx = 13.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '13-14 d';
  comment.tx = 'temperature from DaanMasm1991,DawsWhit1999';
data.tp = 40.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Wiki';
data.Wwx = 12.5; units.Wwx = 'g';  label.Wwx = 'wet weight at fledging'; bibkey.Wwx = 'guess';
data.Wwi = 20.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 18-29 g';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-7 eggs per clutch, rarely 2 clutches per yr';
  
% uni-variate data
  
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
D1 = '';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6JPSJ'; % Cat of Life
metaData.links.id_ITIS = '179168'; % ITIS
metaData.links.id_EoL = '45510257'; % Ency of Life
metaData.links.id_Wiki = 'Fringilla_coelebs'; % Wikipedia
metaData.links.id_ADW = 'Fringilla_coelebs'; % ADW
metaData.links.id_Taxo = '58495'; % Taxonomicon
metaData.links.id_WoRMS = '558558'; % WoRMS
metaData.links.id_avibase = '6364E4A53B9D5D99'; % avibase
metaData.links.id_birdlife = 'common-chaffinch-fringilla-coelebs'; % birdlife
metaData.links.id_AnAge = 'Fringilla_coelebs'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spinus_tristis}}';
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
bibkey = 'Holc1970'; type = 'Article'; bib = [ ... 
'author = {Larry C. Holcomb}, ' ... 
'year = {1970}, ' ...
'title = {Growth rate of {A}merican goldfinch}, ' ...
'journal = {Bird Banding}, ' ...
'volume = {41}, ' ...
'pages = {11-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Spinus_tristis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

