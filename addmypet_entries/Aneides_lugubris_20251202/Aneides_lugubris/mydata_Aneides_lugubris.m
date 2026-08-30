function [data, auxData, metaData, txtData, weights] = mydata_Aneides_lugubris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Aneides_lugubris'; 
metaData.species_en = 'Arboreal salamander'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'bjFc','jiTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHa','jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 02];

%% set data
% zero-variate data

data.ab = 3.5*30.5;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 3*30.5;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'guess';   
  temp.tj = C2K(23);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Wiki';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 0.0335; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 7-9.5 mm including jelly, assumed 4 mm excluding: pi/6*0.4^3';
data.Wwi = 22.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'EoL';

data.Ri  = 20/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 eggs per clutch, assumed: 1 clutch per season';

data.JOi  = 0.0024; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(23);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 5.49; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
F1 = 'endomic to Mexico';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DW5C'; % Cat of Life
metaData.links.id_ITIS = '173703'; % ITIS
metaData.links.id_EoL = '331531'; % Ency of Life
metaData.links.id_Wiki = 'Aneides_lugubris'; % Wikipedia
metaData.links.id_ADW = 'Aneides_lugubris'; % ADW
metaData.links.id_Taxo = '47442'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Aneides+lugubris'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aneides_lugubris}}';
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
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Aneides+lugubris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/331531}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

