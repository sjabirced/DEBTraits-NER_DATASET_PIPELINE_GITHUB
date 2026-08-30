function [data, auxData, metaData, txtData, weights] = mydata_Ponticola_cyrius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Ponticola_cyrius'; 
metaData.species_en = 'Kura goby'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 08];

%% set data
% zero-variate data

data.am = 4*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 16.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'CiceOztu2019';

data.Wwb = 8.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MohaMous2016';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 5;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on LW data and Lp';
data.Wwi = 50.1;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'CiceOztu2019';
  comment.Wwi = 'based on LW data and Li';

data.Ri  = 1078/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MohaMous2016';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [... %  time since birth (yr), total length (cm), weight (g)
    0  5.54  2.50
    1  9.45 12.12
    2 11.25 20.05
    3 14.75 39.31];
data.tLW(:,1) = (0.75 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(20);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'CiceOztu2019'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
4.305	1.556
4.609	1.556
5.087	1.556
5.348	1.556
5.523	2.593
5.675	2.593
6.458	3.457
7.306	5.531
8.263	8.296
8.524	8.469
8.720	9.333
9.003	10.025
9.220	9.506
9.243	11.580
9.373	12.099
9.548	13.309
9.678	11.580
9.873	12.444
9.874	14.000
10.135	14.691
10.222	13.481
10.353	16.420
10.418	14.519
10.506	17.802
10.680	18.840
10.701	16.765
10.940	17.975
11.049	19.012
11.267	19.185
11.398	20.049
11.636	17.284
11.680	20.914
11.747	24.025
11.789	22.123
12.094	22.988
12.226	26.617
12.247	25.062
12.749	30.765
13.117	28.346
16.407	50.123];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'CiceOztu2019'; 

    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;

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
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VW3T'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '208083'; % Ency of Life
metaData.links.id_Wiki = 'Ponticola_cyrius'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3419383'; % Taxonomicon
metaData.links.id_WoRMS = '1026667'; % WoRMS
metaData.links.id_fishbase = 'Ponticola-cyrius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ponticola}}';
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
bibkey = 'CiceOztu2019'; type = 'Article'; bib = [ ... 
'doi = {10.22034/ijab.v7i4.706}, ' ...
'author = {Cicek, E. and S. \"{O}zt\"{u}rk and S. Sungur}, ' ... 
'year = {2019}, ' ...
'title = {Some biological properties of Kura goby, Ponticola cyrius (Kessler, 1874) (Gobiiformes, Gobiidae) from Kura River, Turkey}, ' ...
'journal = {International Journal of Aquatic Biology}, ' ...
'volume = {7(4)}, ' ...
'pages = {218-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ponticola-iranicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

