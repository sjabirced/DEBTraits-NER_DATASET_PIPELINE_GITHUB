function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_maculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_maculatus'; 
metaData.species_en = 'Saddle grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
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

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'value for Lutjanus vitta';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KhanImty2004'; 
data.Li  = 59.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 70; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'KhanImty2004','fishbase'};
  comment.Wwp = 'based on 0.01738*Lp^2.93, see F1';
data.Wwi = 2723; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.93, see F1; max. published weight: 3.2 kg';

data.Ri = 146963/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on fecundity of Pomadasys_jubelini for TL = 25 cm';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
220.349	7.927
345.347	10.789
365+97.009	12.697
365+158.533	13.872
365+219.568	14.972
365+282.098	15.633
365+345.130	16.073];
data.tL(:,1) = data.tL(:,1) + 30;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaseLiu2020'; treat.tL = {1 {'females','males'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
7.030	6.571
8.026	8.552
8.983	13.123
10.037	16.896
10.993	23.659
12.009	30.221
13.082	37.580
14.039	45.338
15.054	55.686
16.030	60.456
17.026	67.616
18.061	74.776
19.095	84.326
20.091	91.885
21.028	98.647
22.043	104.811];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BaseLiu2020'; 

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01738*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQLP'; % Cat of Life
metaData.links.id_ITIS = '630245'; % ITIS
metaData.links.id_EoL = '46578441'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_maculatus'; % ADW
metaData.links.id_Taxo = '184498'; % Taxonomicon
metaData.links.id_WoRMS = '218568'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys_maculatus}}';
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
bibkey = 'BaseLiu2020'; type = 'Article'; bib = [ ...
'doi = {10.11648/j.be.20200401.11}, ' ...
'author = {Abdul Baset and Qun Liu and Baochao Liao and Abdul Waris and Imtiaz Ahmad and Han Yanan and Zhang Qingqing}, ' ... 
'year = {2020}, ' ...
'title = {Population Dynamics of Saddle Grunt Fish, \emph{Pomadasys maculatus} ({B}loch, 1793) from {P}akistani {W}aters}, ' ...
'journal = {Bioprocess Engineering}, ' ...
'volume = {4(1)}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KhanImty2004'; type = 'Article'; bib = [ ...
'author = {Atiqullah Khan and Imtyaz}, ' ... 
'year = {2004}, ' ...
'title = {STUDIES ON THE FECUNDITY AND SEX RATIO OF SADDLE GRUNT FISH, \emph{Pomadasys maculatus} ({B}LOCH, 1797)(FAMILY:{P}OMADASYIDAE) FROM {K}ARACHI {C}OAST, {P}AKISTAN}, ' ...
'journal = {International Journal of Biology and Biotechnology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-maculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
