function [data, auxData, metaData, txtData, weights] = mydata_Sylvilagus_idahoensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Sylvilagus_idahoensis'; 
metaData.species_en = 'Pygmy rabbit'; 

metaData.ecoCode.climate = {'BSk','BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 25];

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(39.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '27-30 d, based on several Sylvilagus species';
data.tx = 13;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(39.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 256;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
data.am = 11.5*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15.7; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Sylvilagus floridanus: 40*450/1150';
data.Wwx = 46.4;   units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
  comment.Wwb = 'based on Sylvilagus floridanus: 118.5*500/1150';
data.Wwi = 450;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '375-500 g';

data.Ri  = 3*6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter, 3 litters per yr';
            
data.JOi  = 384.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(39.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  comment.JOi = 'based on Ww = 432 g';                                          

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = weights.JOi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Great Basin and some of the adjacent intermountain areas';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'he only leporid native to North America that digs burrows';
metaData.bibkey.F2 = 'Wiki';
F3 = 'big sagebrush (Artemisia tridentata) and rabbitbrush (Chrysothamnus spp.) dominated communities';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'MWT3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1037709'; % Ency of Life
metaData.links.id_Wiki = 'Sylvilagus_idahoensis'; % Wikipedia
metaData.links.id_ADW = 'Urogale_everetti'; % ADW
metaData.links.id_Taxo = '93418'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500094'; % MSW3
metaData.links.id_AnAge = 'Brachylagus_idahoensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sylvilagus_idahoensis)}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Brachylagus_idahoensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Brachylagus_idahoensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

