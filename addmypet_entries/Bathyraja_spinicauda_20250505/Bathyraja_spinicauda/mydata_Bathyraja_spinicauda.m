function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_spinicauda

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_spinicauda'; 
metaData.species_en = 'Spinytail skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data;
data.ab = 1.9*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(2.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12*365; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(2.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 50*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'HaasEber2016';   
  temp.am = C2K(2.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 28;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Bathyraja aleutica';
data.Lp = 118;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014';
data.Li  = 165;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'AunePrim2014'; 

data.Wwb = 186;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on 0.00550*Lb^3.13, see F1';
data.Wwp = 16802;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = {'fishbase','AunePrim2014'};
  comment.Wwp = 'based on 0.00550*Lp^3.13, see F1';
data.Wwi = 47983; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwpi = 'based on 0.00550*Li^3.13, see F1';

data.Ri  = 47/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(2.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity is 47 eggs, assumed 1 clutch each 2 yrs';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouping
% set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Atlantic and adjacent Arctic';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KXVW'; % Cat of Life
metaData.links.id_ITIS = '160932'; % ITIS
metaData.links.id_EoL = '46560744'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_spinicauda'; % ADW
metaData.links.id_Taxo = '101369'; % Taxonomicon
metaData.links.id_WoRMS = '105868'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja_spinicauda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja_spinicauda}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
