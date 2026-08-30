  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_dussumieri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_dussumieri'; 
metaData.species_en = 'Common labeo'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data
data.ab = 7;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 126;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00676*Lp^2.95, see F1';
data.Wwi = 695;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^2.95, see F1; max. published weight: 2.0 kg';

data.Ri  = 239854/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.LL_f = [ ... % total length at t (cm), total length at t+1yr (cm)
12.310	21.206
20.850	24.233
24.217	29.881
30.336	32.898
33.231	36.014
36.125	39.016
39.012	40.524
40.632	42.025
41.907	43.640
43.756	44.913
45.377	46.760
46.762	47.341];
units.LL_f = {'cm', 'cm'}; label.LL_f = {'total length at t','total length at t+1yr','females'};  
temp.LL_f = C2K(27.3);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'Kuru1997'; 
%
data.LL_m = [ ... % total length at t (cm), total length at t+1yr (cm)
8.391	13.931
14.157	20.504
20.360	24.326
24.309	27.278
27.246	30.124
30.632	32.639
33.112	34.167
34.698	36.470
36.507	38.442
38.988	40.080
41.020	41.721
42.258	42.045];
units.LL_m = {'cm', 'cm'}; label.LL_m = {'total length at t','total length at t+1yr','males'};  
temp.LL_m = C2K(27.3);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'Kuru1997'; 

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = weights.LL_f * 50;
weights.LL_m = weights.LL_m * 50;
weights.Wwb = weights.Wwb * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00676*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to India';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3RHV3'; % Cat of Life
metaData.links.id_ITIS = '689288'; % ITIS
metaData.links.id_EoL = '206220'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_dussumieri'; % Wikipedia
metaData.links.id_ADW = 'Labeo_dussumieri'; % ADW
metaData.links.id_Taxo = '177897'; % Taxonomicon
metaData.links.id_WoRMS = '1022166'; % WoRMS
metaData.links.id_fishbase = 'Labeo-dussumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_dussumieri}}';  
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
bibkey = 'Kuru1997'; type = 'article'; bib = [ ...  
'author = {B. Madhusoodana Kurup}, ' ...
'year = {1997}, ' ...
'title = {Age and growth of \emph{Labeo dussumieri} ({V}al.) ({P}isces : {C}yprinidae) from the river {P}ampa, {K}erala}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {44(2)}, ' ...
'pages = {155-163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-dussumieri}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

