  function [data, auxData, metaData, txtData, weights] = mydata_Lates_angustifrons
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Lates_angustifrons'; 
metaData.species_en = 'Tanganyika lates'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 27];

%% set data

% zero-variate data

data.ab = 8;   units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 33*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 56.5;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 200;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm of Latris lineata: pi/6*0.13^3';
data.Wwi = 99794;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.02, see F1';
    
data.Ri  = 6.3e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Latris lineata: 2.35e6*67e3/25e3';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
 0  NaN   NaN   NaN   NaN    4.436
 6  NaN   NaN   1.447 NaN    4.751
12  NaN   NaN   1.914 NaN    5.080
18	0.792 1.829 2.243 2.603  5.312
24	1.038 2.171 2.462 3.015  5.420
30	1.284 2.569 2.763 3.482  5.487
36	1.571 3.051 2.940 3.908  5.539];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KondAbe1995'; treat.tL = {1 {'ind 1','ind 2','ind 3','ind 4','ind 5'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwi = 5 * weights.Wwi;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01122*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to Lake Tanganyika and Malagarazi River delta';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3SJ2Z'; % Cat of Life
metaData.links.id_ITIS = '645773'; % ITIS
metaData.links.id_EoL = '988101'; % Ency of Life
metaData.links.id_Wiki = 'Lates_angustifrons'; % Wikipedia
metaData.links.id_ADW = 'Lates_angustifrons'; % ADW
metaData.links.id_Taxo = '178240'; % Taxonomicon
metaData.links.id_WoRMS = '1018405'; % WoRMS
metaData.links.id_fishbase = 'Lates-angustifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lates_angustifrons}}';  
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
bibkey = 'KondAbe1995'; type = 'article'; bib = [ ...  
'doi = {10.1007/bf00014612}, ' ...
'author = {Takaki Kondo and Naoya Abe}, ' ...
'year = {1995}, ' ...
'title = {Habitat preference, food habits and growth of juveniles of \emph{Lates angustifrons} and \emph{Lates mariae} ({P}isces: {C}entropomidae) in {L}ake {T}anganyika}, ' ... 
'journal = {Ecological Research}, ' ...
'volume = {10, '...
'pages = {275-280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Lates-angustifrons.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
