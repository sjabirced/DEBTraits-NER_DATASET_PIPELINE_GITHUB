function [data, auxData, metaData, txtData, weights] = mydata_Paraliparis_bathybius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Paraliparis_bathybius'; 
metaData.species_en = 'Black seasnail'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MANE','MN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.7); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.ab = 180;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'OrloTokr2011';   
  temp.ab = C2K(3.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(3.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(3.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 25; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'OrloTokr2011';

data.Wwb = 0.0477; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Glub2010';
  comment.Wwb = 'based on egg diameter of 4.5 mm: pi/6*0.45^3';
data.Wwp = 7.4;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00525*Lp^3.15, see F1';
data.Wwi = 133;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'OrloTokr2011';
  comment.Wwi = 'based on 0.00525*Li^3.15, see F1';
 
data.Ri  = 428/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Glub2010';   
  temp.Ri = C2K(3.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Careproctus furcellus: 1129*600/2000';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
%weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.Ri = weights.Ri * 3;
weights.Wwb = weights.Wwb * 3;

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
F1 = 'length-weight: weight in g = 0.00525*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Arctic to Northeast Atlantic: Norwegian Sea and Greenland; also Faroe Trough, north of Faroe Islands, east of Iceland, south of Jan Mayen Island and west of Bear Islands';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4CZBB'; % Cat of Life
metaData.links.id_ITIS = '644245'; % ITIS
metaData.links.id_EoL = '46569483'; % Ency of Life
metaData.links.id_Wiki = 'Paraliparis_bathybius'; % Wikipedia
metaData.links.id_ADW = 'Paraliparis_bathybius'; % ADW
metaData.links.id_Taxo = '182839'; % Taxonomicon
metaData.links.id_WoRMS = '127222'; % WoRMS
metaData.links.id_fishbase = 'Paraliparis_bathybius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paraliparis_bathybius}}';
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
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen and Michaela Aschan}, ' ...
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Paraliparis_bathybius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
