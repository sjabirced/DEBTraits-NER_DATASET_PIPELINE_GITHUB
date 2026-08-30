function [data, auxData, metaData, txtData, weights] = mydata_Plectorhinchus_pictus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Plectorhinchus_pictus'; 
metaData.species_en = 'Trout sweetlips'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 21];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(26.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 83;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm: pi/6*0.085^3'; 
data.Wwp = 855;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01862*Lp^2.91, see F1';
data.Wwi = 7153; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^2.91, see F1; max. published weight: 6.9 kg';

data.GSI  = 0.058;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(26.3);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Plagioscion squamosissimus';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), fork length (cm)
    1 22.969 21.729
    2 27.481 26.972
    3 31.569 31.065
    4 35.138 35.024
    5 38.679 37.904
    6 41.521 40.456
    7 46.007 44.989];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.3)*365;  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(26.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AlOgHuss1990'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  10 * weights.tL_fm;
weights.ab =  0 * weights.ab;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01862*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4K3S7'; % Cat of Life
metaData.links.id_ITIS = '630214'; % ITIS
metaData.links.id_EoL = '46578577'; % Ency of Life
metaData.links.id_Wiki = 'Plectorhinchus'; % Wikipedia
metaData.links.id_ADW = 'Plectorhinchus_pictus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '218536'; % WoRMS
metaData.links.id_fishbase = 'Plectorhinchus_pictus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectorhinchus}}';
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
bibkey = 'AlOgHuss1990'; type = 'Article'; bib = [ ... 
'author = {Soliman M. Al-Ogaily and Altaf Hussain}, ' ... 
'year = {1990}, ' ...
'title = {Biology of grunt \emph{Plectorhynchus pictus} ({T}hunberg) 1972, ({H}aemulidae, {T}eleostei, {P}ercoidei) from the {R}ed {S}ea ({J}izan area)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {9}, ' ...
'pages = {119-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Plectorhinchus_pictus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
