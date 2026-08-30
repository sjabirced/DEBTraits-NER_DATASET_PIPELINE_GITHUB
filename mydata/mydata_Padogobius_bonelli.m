function [data, auxData, metaData, txtData, weights] = mydata_Padogobius_bonelli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Padogobius_bonelli'; 
metaData.species_en = 'Padanian goby'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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

data.ab = 12;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'PompGian2016a';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'PompGian2016';
data.Li  = 8.6;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'PompGian2016';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm: pi/6*0.15*0.045^2';
data.Wwp = 0.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','PompGian2016'};
  comment.Wwp = 'based on 0.01023*Lp^3.01, see F1';
data.Wwi = 6.65;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.01, see F1';

data.GSI  = 0.12; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'PompGian2016';   
  temp.GSI = C2K(12); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  yr class (yr), std length (cm)
    1 3.18 3.15
    2 5.00 4.97
    3 6.42 6.05
    4 NaN  6.80];
data.tL_fm(:,1) = 365 * data.tL_fm(:,1); 
units.tL_fm   = {'d', 'cm', 'g'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm   = C2K(12);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PompGian2016a'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... total length (log10 in cm), fecundity (log10 in #)
0.623	1.619
0.662	2.105
0.663	2.080
0.673	2.062
0.674	1.870
0.690	2.098
0.691	1.710
0.691	1.976
0.691	1.849
0.693	1.746
0.700	1.627
0.709	1.978
0.716	2.095
0.717	2.128
0.717	2.019
0.719	2.049
0.723	2.090
0.723	1.925
0.724	1.659
0.725	1.961
0.733	2.014
0.746	2.214
0.747	2.241
0.749	2.092
0.754	2.059
0.755	2.082
0.755	2.171
0.756	1.978
0.763	2.105
0.764	2.062
0.764	1.973
0.765	2.208
0.773	2.219
0.779	2.186
0.780	2.077
0.785	2.241
0.793	2.317
0.795	2.082
0.795	2.244
0.799	2.370
0.801	2.211
0.812	2.304
0.826	2.130
0.827	2.552
0.840	2.231
0.875	2.410];
data.LN = 10.^data.LN; % remove log transform
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PompGian2016'; 
    
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
D2 = 'GSI is not in harmony with fecundity data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.01023*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Italian rivers of the northern Adriatic, northwards from the Marches, and the Po basin (with Swiss tributaries) and Venezia, as well as the Dalmatian rivers Zrmanje and Krka.';
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
bibkey = 'PompGian2016a'; type = 'Article'; bib = [ ... 
'doi = {10.1051/kmae/2016013}, ' ...
'author = {Pompei, L. and Giannetto, D. and Lorenzoni, M.}, ' ... 
'year = {2016}, ' ...
'title = {First information on age and growth of \emph{Padogobius bonelli} ({B}onaparte, 1846) outside of its native range: {R}iver {A}ggia ({C}entral {I}taly)}, ' ...
'journal = {Knowledge and Managementof Aquatic Ecosystems}, ' ...
'volume = {417}, ' ...
'pages = {1-8}'];
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

