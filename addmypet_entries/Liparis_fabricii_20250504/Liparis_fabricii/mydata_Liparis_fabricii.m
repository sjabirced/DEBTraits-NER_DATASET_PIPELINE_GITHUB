function [data, auxData, metaData, txtData, weights] = mydata_Liparis_fabricii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Liparis_fabricii'; 
metaData.species_en = 'Gelatinous snailfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MAN','MN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 04];

%% set data
% zero-variate data

data.ab = 130;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(0.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2.85*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(0.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(0.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 21; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0028; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 1.75 mm: pi/6*0.175^3';
data.Wwp = 6.8;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','AunePrim2014'};
  comment.Wwp = 'based on 0.01202*Lp^3.05, see F1';
data.Wwi = 130;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','AunePrim2014'};
  comment.Wwi = 'based on 0.01202*Li^3.05, see F1';
 
data.Ri  = 295/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(0.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01202*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Often found in empty scallop shells';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3V9KP'; % Cat of Life
metaData.links.id_ITIS = '550548'; % ITIS
metaData.links.id_EoL = '46569422'; % Ency of Life
metaData.links.id_Wiki = 'Liparis_fabricii'; % Wikipedia
metaData.links.id_ADW = 'Liparis_fabricii'; % ADW
metaData.links.id_Taxo = '178945'; % Taxonomicon
metaData.links.id_WoRMS = '127218'; % WoRMS
metaData.links.id_fishbase = 'Liparis_fabricii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liparis_fabricii}}';
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
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Liparis_fabricii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
