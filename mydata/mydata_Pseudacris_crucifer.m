function [data, auxData, metaData, txtData, weights] = mydata_Pseudacris_crucifer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Pseudacris_crucifer'; 
metaData.species_en = 'Spring peeper'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'bjFc','jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHa','jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 01];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'AnAge';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 100;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'AnAge';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 912;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 4 yr as under-estimate';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '3-5 g';

data.Ri  = 700/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JOi  = 0.0024; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(19);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1.3; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'amphibiaweb'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NH9F'; % Cat of Life
metaData.links.id_ITIS = '776304'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pseudacris_crucifer'; % Wikipedia
metaData.links.id_ADW = 'Pseudacris_crucifer'; % ADW
metaData.links.id_Taxo = '47858'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pseudacris+crucifer'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pseudacris_crucifer'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudacris_crucifer}}';
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
bibkey = 'NespSola2017'; type = 'Article'; bib = [ ... 
'author = {R. F. Nespolo and J. J. Solano-Iguaran and F. Bozinovic}, '...
'title = {Phylogenetic Analysis Supports the Aerobic-Capacity Model for the Evolution of Endothermy}, '...
'journal = {Am. Nat.}, '....
'year = {2017}, '...
'volume = {189}, '...
'pages = {13-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pseudacris+crucifer}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pseudacris_crucifer/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pseudacris_crucifer}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

