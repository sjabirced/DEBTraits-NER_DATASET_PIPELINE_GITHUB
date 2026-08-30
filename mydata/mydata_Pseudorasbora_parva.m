  function [data, auxData, metaData, txtData, weights] = mydata_Pseudorasbora_parva

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Gobionidae';
metaData.species    = 'Pseudorasbora_parva'; 
metaData.species_en = 'Stone moroko'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 15;        units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 12.5;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.24;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00776*Lp^3.13, see F1';
data.Wwi = 21; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00776*Li^3.13, see F1';

data.Ri = 4*3060/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity is assumed to be batch fecundity, 3 till 4 spawnings per yr';

% univariate data

% time-length
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0 3.85 3.20
    1 5.17 5.15
    2 6.50 6.58
    3 NaN  7.87];
data.tL_fm(:,1) = 365*(0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
  temp.tL_fm = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = 'RoseCriv1993'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5*weights.tL_fm;
weights.Li = 3*weights.Li;
weights.Wwb = 3*weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P9F3'; % Cat of Life
metaData.links.id_ITIS = '689761'; % ITIS
metaData.links.id_EoL = '209182'; % Ency of Life
metaData.links.id_Wiki = 'Pseudorasbora_parva'; % Wikipedia
metaData.links.id_ADW = 'Pseudorasbora_parva'; % ADW
metaData.links.id_Taxo = '43739'; % Taxonomicon
metaData.links.id_WoRMS = '465541'; % WoRMS
metaData.links.id_fishbase = 'Pseudorasbora-parva'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pseudorasbora_parva}}';  
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
bibkey = 'RoseCriv1993'; type = 'article'; bib = [ ... 
'doi = {10.22092/ijfs.2022.126511}, ' ...
'author = {Elisabeth Rosecchi and Alain J. Crivelli and George Catsadorakis}, ' ...
'year = {1993}, ' ...
'title = {The establishment and impact of \emph{Pseudorasbora parva},  an exotic fish species introduced  into {L}ake {M}ikri {P}respa (north-western {G}reece)}, ' ... 
'journal = {Aquatic Conservation: Marine and Freshwater Ecosystems}, ' ...
'volume = {3}, '...
'pages = {223-231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudorasbora-parva.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
