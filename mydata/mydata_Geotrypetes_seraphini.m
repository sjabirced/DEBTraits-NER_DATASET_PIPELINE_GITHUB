function [data, auxData, metaData, txtData, weights] = mydata_Geotrypetes_seraphini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Dermophiidae';
metaData.species    = 'Geotrypetes_seraphini'; 
metaData.species_en = 'Gaboon caecilian'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'bjFc','jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHa','jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 03];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.tp = 'based on Typhlonectes_compressicauda';
data.tp = 488;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Typhlonectes_compressicauda';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Typhlonectes_compressicauda';

data.Wwb = 0.0082; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm of Typhlonectes_compressicauda: pi/6*0.25^3';
data.Wwi = 49;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'amphibiaweb';
  comment.Wwi = 'based on length 400 mm and a diameter 10-15 mm: 40*pi*1.25^2/4';

data.Ri  = 14/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Typhlonectes_compressicauda';

data.JOi  = 0.0012; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(20);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1.93; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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

%% Facts
F1 = 'endemic to Gabon';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FTNB'; % Cat of Life
metaData.links.id_ITIS = '668470'; % ITIS
metaData.links.id_EoL = '1019463'; % Ency of Life
metaData.links.id_Wiki = 'Geotrypetes_seraphini'; % Wikipedia
metaData.links.id_ADW = 'Geotrypetes_seraphini'; % ADW
metaData.links.id_Taxo = '48014'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Geotrypetes+seraphini'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geotrypetes_seraphini}}';
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
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Geotrypetes+seraphini}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

