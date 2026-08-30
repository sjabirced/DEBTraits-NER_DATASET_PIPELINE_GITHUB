function [data, auxData, metaData, txtData, weights] = mydata_Icelus_bicornis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Icelus_bicornis'; 
metaData.species_en = 'Twohorn sculpin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 03];

%% set data
% zero-variate data

data.ab = 113; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(0.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(0.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'AunePrim2014';   
  temp.am = C2K(0.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 12.8;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0042;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 1.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00776*Lp^3.19, see F1';
data.Wwi = 26.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00776*Li^3.19, see F1'; 

data.Ri = 725/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'AunePrim2014';   
  temp.Ri = C2K(0.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Canadian Arctic to Hudson and Ungava bays and Newfoundland in Canada. Eastern Atlantic: Greenland, Iceland, Jan Mayen, Spitzbergen, Barents and Kara seas, Bohuslän in Norway. Reported from the Alaskan Beaufort Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3P8PZ'; % Cat of Life
metaData.links.id_ITIS = '167188'; % ITIS
metaData.links.id_EoL = '46568963'; % Ency of Life
metaData.links.id_Wiki = 'Icelus_bicornis'; % Wikipedia
metaData.links.id_ADW = 'Icelus_bicornis'; % ADW
metaData.links.id_Taxo = '177401'; % Taxonomicon
metaData.links.id_WoRMS = '127199'; % WoRMS
metaData.links.id_fishbase = 'Icelus_bicornis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Icelus_bicornis}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Icelus_bicornis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

