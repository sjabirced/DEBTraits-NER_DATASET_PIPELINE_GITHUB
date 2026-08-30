function [data, auxData, metaData, txtData, weights] = mydata_Petrogale_lateralis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Petrogale_lateralis'; 
metaData.species_en = 'Black-flanked rock-wallaby';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.tg = 30;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from DawsDenn1969';
data.tx = 344;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 541;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .484;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 4200;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter;, 1 litter per yr'; 

% univariate data
% time-weight
data.tL = [ ... % time since birth (d), head length (cm)
    40.4 2.5
    51.9 3.0
    64.3 3.5
    77.5 4.0
    91.7 4.5
   106.9 5.0
   123.4 5.5
   141.5 6.0
   161.4 6.5
   183.5 7.0
   208.4 7.5
   236.9 8.0];
units.tL = {'d', 'cm'};     label.tL = {'time', 'head length'};  
temp.tL = C2K(36.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TaggFinl2007';

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
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6V6PY'; % Cat of Life
metaData.links.id_ITIS = '552750'; % ITIS
metaData.links.id_EoL = '325803'; % Ency of Life
metaData.links.id_Wiki = 'Petrogale_lateralis'; % Wikipedia
metaData.links.id_ADW = 'Petrogale_lateralis'; % ADW
metaData.links.id_Taxo = '60370'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000286'; % MSW3
metaData.links.id_AnAge = 'Petrogale_lateralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petrogale_lateralis}}';
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
bibkey = 'JoneTagg2004'; type = 'article'; bib = [ ... 
'doi = {10.1071/zo03033}, ' ...
'author = {Jones, M. and Taggart, D. and Temple-Smith, P.}, ' ... 
'year = {2004}, ' ...
'title = {Age determination and growth in wild \emph{Petrogale lateralis pearsoni} and captive \emph{Petrogale lateralis} “MacDonnell Ranges race”}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {52(4)}, ' ...
'pages = {447–461}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Petrogale_lateralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

