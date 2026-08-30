function [data, auxData, metaData, txtData, weights] = mydata_Heterohyrax_brucei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Hyracoidea'; 
metaData.family     = 'Procaviidae';
metaData.species    = 'Heterohyrax_brucei'; 
metaData.species_en = 'Yellow-spotted rock hyrax'; 

metaData.ecoCode.climate = {'BSh','BWh','Cw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 24];

%% set data
% zero-variate data

data.tg = 229;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '6.5-7.5 mnths';
data.tx = 91; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 494; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(36.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Procavia capensis';

data.Wwb = 225;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 2457;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.9/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.JOi  = 720;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(36.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 2000; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';
  
  %% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_1','tW_2'}; subtitle1 = {'Data for 2 individuals'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6LSSK'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Heterohyrax_brucei'; % Wikipedia
metaData.links.id_ADW = 'Heterohyrax_brucei'; % ADW
metaData.links.id_Taxo = '69202'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11400013'; % MSW3
metaData.links.id_AnAge = 'Heterohyrax_brucei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterohyrax_brucei}}';
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
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Heterohyrax_brucei/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Heterohyrax_brucei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

