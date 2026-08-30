function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_rossi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_rossi'; 
metaData.species_en = 'Threespot eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.8); % K, body temp
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

data.ab = 169;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(0.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(0.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'AunePrim2014';   
  temp.am = C2K(0.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 32.5;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';
  
data.Wwb = 0.0082;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 5.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','AunePrim2014'}; 
  comment.Wwp = 'based on 0.00269*Lp^3.22, see F1';
data.Wwi = 181;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','AunePrim2014'};
  comment.Wwi = 'based on 0.00269*Li^3.22, see F1';

data.Ri  = 337/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(0.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00269*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Atlantic: just north of Iceland, northern Norway (Porsanger Fjord) and Barents Sea (but not in southern parts). Arctic Ocean: Kara Sea and Beaufort Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WKY8'; % Cat of Life
metaData.links.id_ITIS = '165283'; % ITIS
metaData.links.id_EoL = '46574871'; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_rossi'; % ADW
metaData.links.id_Taxo = '127113'; % Taxonomicon
metaData.links.id_WoRMS = '127110'; % WoRMS
metaData.links.id_fishbase = 'Lycodes_rossi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycodes}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Lycodes_rossi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
