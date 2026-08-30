function [data, auxData, metaData, txtData, weights] = mydata_Gyps_himalayensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Gyps_himalayensis'; 
metaData.species_en = 'Himalayan vulture'; 

metaData.ecoCode.climate = {'BSk','Cwa','Cwb','Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

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

data.ab = 57;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 138;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 414;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 6*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 258;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwi = 9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 11e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.000 	 294.118
16.027 	 558.824
25.643	 764.706
27.646	 823.529
30.851	 970.588
35.659	1117.647
39.666	1411.765
49.683	1941.176
75.326	3058.824
88.948	3647.059
98.564	3735.294
109.382	4117.647
125.409	4911.765
162.270	5147.059
179.098	6088.235
222.371	6970.588
252.421	6941.176];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RanaGore2023';

% time-food consumption
data.tJX = [ ... % time since birth (d), food consumption (g/14 d)
  0.000	 47.791
 16.250	 75.218
 31.305	152.633
 44.752	264.124
 60.645	266.547
 74.886	378.046
 89.616	328.185
104.664	419.237
118.518	512.550
134.027	492.242
148.292	560.559
163.775	585.706
180.078	565.406
193.673	415.534
208.687	565.677
224.208	522.642
238.074	595.500];
data.tJX(:,2) = data.tJX(:,2)/ 14; % convert fortnight to d
units.tJX   = {'d', 'g/d'};  label.tJX = {'time since birth', 'food consumption rate'};  
temp.tJX    = C2K(40);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'RanaGore2023';

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

% %% Group plots
% set1 = {'',''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HXND'; % Cat of Life
metaData.links.id_ITIS = '175488'; % ITIS
metaData.links.id_EoL = '45515797'; % Ency of Life
metaData.links.id_Wiki = 'Gyps_himalayensis'; % Wikipedia
metaData.links.id_ADW = 'Gyps_himalayensis'; % ADW
metaData.links.id_Taxo = '52468'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '9BB5551EA97A0A1C'; % avibase
metaData.links.id_birdlife = 'himalayan-griffon-gyps-himalayensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gyps_himalayensis}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gyps_himalayensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RanaGore2023'; type = 'Article'; bib = [ ... 
'doi = {10.11609/jott.8607.15.7.23601-23605}, ' ...
'author = {Sachin Ranade and Jay Gore and Ashwini Kumar}, ' ... 
'year = {2023}, ' ...
'title = {Breeding of {H}imalayan Vulture \emph{Gyps himalayensis} {H}ume, 1869 ({A}ves: {A}ccipitriformes: {A}ccipitridae) in the {A}ssam {S}tate {Z}oo, {G}uwahati, {A}ssam, {I}ndia}, ' ...
'journal = {Journal of Threatened Taxa}, ' ...
'volume = {15(7)}, ' ...
'pages = {23601-23605}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/himgri1/cur/introduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9BB5551EA97A0A1C&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

