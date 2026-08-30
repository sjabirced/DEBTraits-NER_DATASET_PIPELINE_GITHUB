function [data, auxData, metaData, txtData, weights] = mydata_Amblyraja_hyperborea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Amblyraja_hyperborea'; 
metaData.species_en = 'Arctic skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MA','MP','MN','MI'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.3); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
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
% zero-variate data;
data.ab = 2.5*365; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(3.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014';   
  temp.tp = C2K(3.3); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AunePrim2014';   
  temp.am = C2K(3.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';
  comment.Lb = 'TL 16-18 cm';
data.Lp  = 45; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014';
data.Li  = 112;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwp = 626;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00309*Lp^3.21, see F1';
data.Wwi = 11.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00309*Lp^3.21, see F1';

data.Ri  = 30/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(3.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed; eurybathic, eurythermic';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00302*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Arctic, Indian, Pacific and Atlantic oceans: in cold and deep waters';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '65ZNG'; % Cat of Life
metaData.links.id_ITIS = '564138'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Amblyraja_hyperborea'; % Wikipedia
metaData.links.id_ADW = 'Amblyraja_hyperborea'; % ADW
metaData.links.id_Taxo = '108251'; % Taxonomicon
metaData.links.id_WoRMS = '105863'; % WoRMS
metaData.links.id_fishbase = 'Amblyraja_hyperborea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amblyraja_hyperborea}}'; 
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
'howpublished = {\url{https://www.fishbase.de/summary/Amblyraja_hyperborea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  