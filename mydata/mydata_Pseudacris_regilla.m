function [data, auxData, metaData, txtData, weights] = mydata_Pseudacris_regilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Pseudacris_regilla'; 
metaData.species_en = 'Pacific tree frog'; 

metaData.ecoCode.climate = {'B','Cs','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'bjFc','jiTf'};
metaData.ecoCode.embryo  = {'Fpe'};
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

data.ab = 3.5*7;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 3*30.5;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'ADW';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3; ADW gives 0.24 g, which corresponds with a sphere of 7.7 mm diameter';
data.Wwi = 2.76;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'NespSola2017';

data.Ri  = 70/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JOi  = 0.0027; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(20);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 2.76; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
metaData.links.id_CoL = '4NH9V'; % Cat of Life
metaData.links.id_ITIS = '207313'; % ITIS
metaData.links.id_EoL = '46395040'; % Ency of Life
metaData.links.id_Wiki = 'Pseudacris_regilla'; % Wikipedia
metaData.links.id_ADW = 'Pseudacris_regilla'; % ADW
metaData.links.id_Taxo = '549434'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pseudacris+regilla'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudacris_regilla}}';
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
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pseudacris+regilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pseudacris_regilla/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

