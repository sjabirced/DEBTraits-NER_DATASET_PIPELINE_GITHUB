function [data, auxData, metaData, txtData, weights] = mydata_Cottunculus_microps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Cottunculus_microps'; 
metaData.species_en = 'Polar sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 03];

%% set data
% zero-variate data
data.ab = 133; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(2.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014';   
  temp.tp = C2K(2.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'AunePrim2014';   
  temp.am = C2K(2.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 29;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0141;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 4.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 142;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri = 375/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate'; bibkey.Ri = 'AunePrim2014';
  temp.Ri = C2K(2.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Atlantic: English Channel, North Sea, Norwegian coastline, Svalbard, southwestern Barents Sea, off Spitzbergen, Bear Island, the Faeroes and Iceland, southeastern coasts of Greenland. Western Atlantic: New Jersey, USA to Gulf of St. Lawrence, Canada and Greenland';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'YYF3'; % Cat of Life
metaData.links.id_ITIS = '167408'; % ITIS
metaData.links.id_EoL = '46569225'; % Ency of Life
metaData.links.id_Wiki = 'Cottunculus_microps'; % Wikipedia
metaData.links.id_ADW = 'Cottunculus_microps'; % ADW
metaData.links.id_Taxo = '172042'; % Taxonomicon
metaData.links.id_WoRMS = '127235'; % WoRMS
metaData.links.id_fishbase = 'Cottunculus_microps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottunculus_microps}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Cottunculus_microps}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

