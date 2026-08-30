function [data, auxData, metaData, txtData, weights] = mydata_Sorex_alpinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Sorex_alpinus'; 
metaData.species_en = 'Alpine shrew'; 

metaData.ecoCode.climate = {'ET','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh','0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 28];

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '19-21 d';
data.tx = 26;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '22-30 d';
data.tp = 319;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.7*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 0.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 8.6; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 9.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 5.5 and 11.5 g';

data.Ri  = 6*2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-9 pups per litter, 2-3 litter per yr';
           
data.JOi  = 48.2;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(38.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 7.9; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 5 * weights.JOi;
weights.Wwb = 3 * weights.Wwb;
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

%% Facts
F1 = 'mountains and uplands of Central and Eastern Europe and parts of France';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7WW76'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '124135'; % Ency of Life
metaData.links.id_Wiki = 'Sorex_alpinus'; % Wikipedia
metaData.links.id_ADW = 'Sorex_alpinus'; % ADW
metaData.links.id_Taxo = '169833'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700457'; % MSW3
metaData.links.id_AnAge = 'Sorex_alpinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sorex_alpinus}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sorex_alpinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sorex_alpinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
