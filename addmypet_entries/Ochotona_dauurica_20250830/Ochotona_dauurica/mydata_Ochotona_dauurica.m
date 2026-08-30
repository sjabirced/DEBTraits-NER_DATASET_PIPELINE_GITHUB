function [data, auxData, metaData, txtData, weights] = mydata_Ochotona_dauurica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Ochotonidae';
metaData.species    = 'Ochotona_dauurica'; 
metaData.species_en = 'Daurian pika'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 30];

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(40.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '21-24 d';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'ADW';   
  temp.tx = C2K(40.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 21;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(40.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(40.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Ochotona_princeps';
data.Wwx = 90;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 249;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WhitSeym2003';

data.Ri  = 3*8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(40.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-11 pups per litter (mean 4.8), several litters per yr';
   
data.JOi  = 249;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(40.1);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 249; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 5 * weights.JOi;
weights.Wwi = 5 * weights.Wwi;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1', D1);
% 
% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7W4BL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '124590'; % Ency of Life
metaData.links.id_Wiki = 'Ochotona_dauurica'; % Wikipedia
metaData.links.id_ADW = 'Ochotona_dauurica'; % ADW
metaData.links.id_Taxo = '112623'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500020'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ochotona_dauurica}}';
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
% bibkey = 'AnAge'; type = 'Misc'; bib = ...
% 'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=}}';
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ochotona_dauurica/}}';
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
