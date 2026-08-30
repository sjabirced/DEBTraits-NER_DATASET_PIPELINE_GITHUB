function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_incisus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_incisus'; 
metaData.species_en = 'Bastard grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 09];

%% set data
% zero-variate data

data.ab = 7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(23.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'value for Lutjanus vitta';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(23.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Pomadasys maculatus';
data.Li  = 53.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 63; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'KhanImty2004','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^2.98, see F1';
data.Wwi = 1908; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.98, see F1';

data.Ri = 146963/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(23.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on fecundity of Pomadasys_jubelini for TL = 25 cm';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 10.7
    1 12.5
    2 17.6
    3 21.2
    4 23.6
    5 26.1
    6 27.5
    7 29.5];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.7);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PajuLore2003'; treat.tL = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01349*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W6JT'; % Cat of Life
metaData.links.id_ITIS = '630272'; % ITIS
metaData.links.id_EoL = '46578432'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_incisus'; % ADW
metaData.links.id_Taxo = '184492'; % Taxonomicon
metaData.links.id_WoRMS = '126947'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-incisus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys}}';
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
bibkey = 'PajuLore2003'; type = 'Article'; bib = [ ...
'author = {Pajuelo, J.G. and J.M. Lorenzo and M. Gregoire}, ' ... 
'year = {2003}, ' ...
'title = {Age and growth of the bastard grunt (\emph{Pomadasys incisus}: {H}aemulidae) inhabiting the {C}anarian archipelago, {N}orthwest {A}frica}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {101}, ' ...
'pages = {851-859}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-incisus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
