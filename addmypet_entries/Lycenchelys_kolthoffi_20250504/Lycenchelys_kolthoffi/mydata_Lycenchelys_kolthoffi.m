function [data, auxData, metaData, txtData, weights] = mydata_Lycenchelys_kolthoffi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycenchelys_kolthoffi'; 
metaData.species_en = 'Checkered wolf eel'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MANE','MN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 04];

%% set data
% zero-variate data

data.ab = 150;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(1.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(1.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(1.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 21;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'AunePrim2014';
  
data.Wwb = 0.0477;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4.5 mm: pi/6*0.45^3';
data.Wwp = 4.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'AunePrim2014','fishbase'}; 
  comment.Wwp= 'based on 0.00141*Lp^3.09, see F1';
data.Wwi = 17.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'AunePrim2014','fishbase'}; 
  comment.Wwi = 'based on 0.00141*Li^3.09, see F1';

data.Ri = 32/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(1.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
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
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00141*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Arctic, Northwest to Northeast Atlantic: north of Novaya Zemlya and northern part of Kara Sea; then from Greenland, Hudson Strait, north of Iceland, Faroe Islands, Svalbard and Laptev Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WJFL'; % Cat of Life
metaData.links.id_ITIS = '165246'; % ITIS
metaData.links.id_EoL = '46574799'; % Ency of Life
metaData.links.id_Wiki = 'Lycenchelys'; % Wikipedia
metaData.links.id_ADW = 'Lycenchelys_kolthoffi'; % ADW
metaData.links.id_Taxo = '179276'; % Taxonomicon
metaData.links.id_WoRMS = '127098'; % WoRMS
metaData.links.id_fishbase = 'Lycenchelys_kolthoffi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycenchelys}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Lycenchelys_kolthoffi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
