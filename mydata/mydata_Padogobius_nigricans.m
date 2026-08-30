function [data, auxData, metaData, txtData, weights] = mydata_Padogobius_nigricans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Padogobius_nigricans'; 
metaData.species_en = 'Arno goby'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 9;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess';
data.Li  = 12.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'PompGian2016';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm: pi/6*0.15*0.045^2';
data.Wwp = 2.25;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01023*Lp^3.01, see F1';
data.Wwi = 20.5;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.01, see F1';

data.GSI  = 0.09; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'PompGian2016';   
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  yr class (yr), std length (cm)
    1 3.167 3.191
    2 5.275 5.693
    3 6.614 7.370];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1); 
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm   = C2K(16);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PompGian2015'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

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
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.01023*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Central Italy (Tevere, Arno and Ombrone drainages) on Tyrrhenian slope.';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6TJ3F'; % Cat of Life
metaData.links.id_ITIS = '637793'; % ITIS
metaData.links.id_EoL = '212548'; % Ency of Life
metaData.links.id_Wiki = 'Padogobius_nigricans'; % Wikipedia
metaData.links.id_ADW = 'Padogobius_nigricans'; % ADW
metaData.links.id_Taxo = '182482'; % Taxonomicon
metaData.links.id_WoRMS = '1020748'; % WoRMS
metaData.links.id_fishbase = 'Padogobius-nigricans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Padogobius_nigricans}}';
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
bibkey = 'PompGian2015'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12689}, ' ...
'author = {Pompei, L. and Giannetto, D. and Lorenzoni, M.}, ' ... 
'year = {2015}, ' ...
'title = {Age and growth of {A}rno goby, \emph{Padogobius nigricans} ({C}anestrini, 1867), in the {A}ggia {R}iver ({U}mbria, Central {I}taly)}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {31(3)}, ' ...
'pages = {494–500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PompGian2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10750-016-2812-9}, ' ...
'author = {Pompei, L. and Giannetto, D. and Lorenzoni, M.}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive parameters in native and non-native areas of \emph{Padogobius bonelli} and comparison with \emph{P. nigricans} ({A}ctynopterigii, {G}obiidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {779(1)}, ' ...
'pages = {173–182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Padogobius-nigricans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

