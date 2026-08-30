function [data, auxData, metaData, txtData, weights] = mydata_Varanus_indicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_indicus'; 
metaData.species_en = 'Mangrove monitor'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi','TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 16];

%% set data
% zero-variate data

data.ab = 180;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GregZahr2012';   
  temp.ab = C2K(28);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 578; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 10;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'GregZahr2012'; 
  comment.Lb = 'based on (Wwb/Wwi)^(1/3)*Li: 52*(26/2827)^(1/3)';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'GregZahr2012';
  comment.Li = 'TL 220 cm, max 244 cm';

data.Wwi = 1287;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'AnAge';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-12 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-length for embryo
data.tLe = [ ... % dpo (d), SVL (cm)
1.633	0.122
10.035	0.815
24.266	1.550
31.965	1.958
43.159	2.083
56.460	3.061
63.225	3.307
73.725	4.041
81.431	5.018
87.943	3.638
95.422	5.103
103.364	6.365
128.816	9.582
160.763	9.955];
units.tLe   = {'d', 'cm'};  label.tLe = {'days post oviposition', 'SVL'};  
temp.tLe    = C2K(28);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'GregZahr2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 5 * weights.tLe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7FG7H'; % Cat of Life
metaData.links.id_ITIS = '174116'; % ITIS
metaData.links.id_EoL = '46559498'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_indicus'; % Wikipedia
metaData.links.id_ADW = 'Varanus_indicus'; % ADW
metaData.links.id_Taxo = '49774'; % Taxonomicon
metaData.links.id_WoRMS = '395084'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Varanus&species=indicus'; % ReptileDB
metaData.links.id_AnAge = 'Varanus_indicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_indicus}}';
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
bibkey = 'GregZahr2012'; type = 'Article'; bib = [ ... 
'author = {Martina Gregorovicova and Oldrich Zahradnicek and Abigail S. Tucker and Petr Velensky and Ivan Horacek}, ' ... 
'year = {2012}, ' ...
'title = {Embryonic development of the monitor lizard, \emph{Varanus indicus}}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {33}, ' ...
'pages = {451-468}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Varanus_indicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Varanus_indicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

