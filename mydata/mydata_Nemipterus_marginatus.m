  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_marginatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_marginatus'; 
metaData.species_en = 'Red filament threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data

% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 21;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'PaulMart1980';
  comment.Li = 'fishbase gives 15 cm';

data.Wwb = 6.6e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.5 mm: pi/6*0.05^3';
data.Wwp = 13;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01413*Lp^2.97, see F1';
data.Wwi = 119;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.97, see F1';
  
data.Ri  = 1.25e5/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nemipterus_furcosus';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
245  9.6 NaN
420 NaN  11.75
650 15.8 NaN
661 NaN  14.85
970 19.3 NaN
1150 NaN 19.0];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.1);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'PaulMart1980'; treat.tL = {1 {'North Borneo','West Kalimantan'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

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
F1 = 'length-weight: weight (in g) = 0.01413*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467ZN'; % Cat of Life
metaData.links.id_ITIS = '550984'; % ITIS
metaData.links.id_EoL = '46581029'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_marginatus'; % ADW
metaData.links.id_Taxo = '180975'; % Taxonomicon
metaData.links.id_WoRMS = '278126'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-marginatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus}}';  
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
bibkey = 'PaulMart1980'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.1980.tb02760.x}, ' ...
'author = {Pauly, D. and Martosubroto, P.}, ' ...
'year = {1980}, ' ...
'title = {The population dynamics of \emph{Nemipterus marginatus} ({C}uvier \& {V}al.) off Western {K}alimantan, {S}outh {C}hina {S}ea}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {17(3)}, ' ...
'pages = {263–273}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-marginatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
