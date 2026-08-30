function [data, auxData, metaData, txtData, weights] = mydata_Gyps_fulvus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Gyps_fulvus'; 
metaData.species_en = 'Eurasian griffon vulture'; 

metaData.ecoCode.climate = {'BSk','BWh','Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 11 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2025 11 06];

%% set data
% zero-variate data

data.ab = 54;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 113.75;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 414;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 252;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 200;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 8525; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 8350; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    14    873
    29.5 2300
    50   5100
    54   6260
   100   8400];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'bow';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
    32 2200
    76 6000
   100 6550
   120 7550];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'bow';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'2 chicks'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HXNC'; % Cat of Life
metaData.links.id_ITIS = '175487'; % ITIS
metaData.links.id_EoL = '45515798'; % Ency of Life
metaData.links.id_Wiki = 'Gyps_fulvus'; % Wikipedia
metaData.links.id_ADW = 'Gyps_fulvus'; % ADW
metaData.links.id_Taxo = '52465'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5D1987CEE4005AA2'; % avibase
metaData.links.id_birdlife = 'griffon-vulture-gyps-fulvus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gyps_fulvus}}';
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
bibkey = 'Schl1998'; type = 'Article'; bib = [ ... 
'author = {Schlee, M. A.}, ' ... 
'year = {1998}, ' ...
'title = {Hand-rearing R\"{u}ppell''s griffon vulture \emph{Gyps ruepellii} at {Paris Menagerie, Milwaukee County zoo and Burger''s Zoo, Arnhem}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {36}, ' ...
'pages = {179--194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gyps_fulvus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/eurgri1/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=5D1987CEE4005AA2&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

