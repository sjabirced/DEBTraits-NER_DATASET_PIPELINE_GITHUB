function [data, auxData, metaData, txtData, weights] = mydata_Planigale_gilesi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Planigale_gilesi'; 
metaData.species_en = 'Paucident planigale'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 20];

%% set data
% zero-variate data

data.tg = 16;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.01;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 5.8;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 14;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = '6-15 g';

data.Ri  = 2*6.1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.1 pups per litter, 2 litters per yr';
  
data.JOi  = 12.16;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.1);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 9.5; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'arid inland areas from Lake Eyre, South Australia, to Moree, New South Wales, and from Mildura, Victoria, to the southwestern Northern Territory';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JJYX'; % Cat of Life
metaData.links.id_ITIS = '552626'; % ITIS
metaData.links.id_EoL = '323741'; % Ency of Life
metaData.links.id_Wiki = 'Planigale_gilesi'; % Wikipedia
metaData.links.id_ADW = 'Planigale_gilesi'; % ADW
metaData.links.id_Taxo = '59947'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800112'; % MSW3
metaData.links.id_AnAge = 'Planigale_gilesi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planigale_gilesi}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Planigale_gilesi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003'; type = 'article'; bib = [ ... 
'doi = {0.1073/pnas.0436428100}, '...
'author = {Craig R. White and Roger S. Seymour}, ' ...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, ' ...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438},  ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

