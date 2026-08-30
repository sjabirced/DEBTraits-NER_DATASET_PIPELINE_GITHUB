function [data, auxData, metaData, txtData, weights] = mydata_Blarina_carolinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Blarina_carolinensis'; 
metaData.species_en = 'Southern short-tailed shrew'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 27];


%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '21-30 d';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(34.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tp = 'based on Blarina_brevicauda';
data.tp = 46;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(34.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Blarina_brevicauda';
data.am = 803;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(34.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Blarina_brevicauda';
  
data.Wwb = 0.83;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Blarina_brevicauda: 1.34*14/22.6';
data.Wwi = 14; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 4*2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(34.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2-6 pups per litter, 2-3 litters per yr';
           
data.JOi  = 33.3;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(34.2);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 10.2; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
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

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TNYC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '327369'; % Ency of Life
metaData.links.id_Wiki = 'Blarina_carolinensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '60847'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700354'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Blarina_carolinensis}}';
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
% %
% bibkey = 'AnAge'; type = 'Misc'; bib = ...
% 'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=}}';
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
