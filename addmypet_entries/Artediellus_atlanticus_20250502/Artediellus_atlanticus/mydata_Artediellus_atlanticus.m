function [data, auxData, metaData, txtData, weights] = mydata_Artediellus_atlanticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Artediellus_atlanticus'; 
metaData.species_en = 'Atlantic hookear sculpin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 02];

%% set data
% zero-variate data

data.am = 10 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'AunePrim2014';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 0.006;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 2.25 mm: pi/6*0.225^3';
data.Wwp = 1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00589*Lp^3.15, see F1';
data.Wwi = 29.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00589*Li^3.15, see F1'; 

data.Ri = 62/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'AunePrim2014';   
  temp.Ri = C2K(3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), std length (cm) 
5.024	6.098
5.080	5.095
5.203	5.597
5.261	5.188
5.985	5.375
6.052	6.925
6.170	6.334
6.471	6.336
7.135	6.796
7.196	6.933
7.198	7.480
7.200	7.845
7.257	7.207
7.922	7.622
8.105	8.171
8.224	7.761
9.191	8.679
9.193	9.135
9.247	7.677
9.250	8.452
10.036	9.141
10.096	8.914
10.218	9.416
10.335	8.551
11.183	9.605
11.186	10.289
11.187	10.426
11.245	10.016
12.089	10.295
12.148	9.885
12.151	10.569
12.269	10.114
12.331	10.616
13.117	11.123
13.118	11.260
13.176	10.941
14.083	11.768
14.142	11.540
14.202	11.358
14.203	11.632
14.265	12.042
15.168	11.912];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f = C2K(3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Dorr1993';  comment.tL_f = 'data from N Svalbard';
%
data.tL_m = [ ...
4.098	6.417
4.932	5.321
4.933	5.458
5.117	6.551
5.170	4.955
5.953	6.185
6.019	7.552
6.134	6.549
6.195	6.777
6.197	7.187
6.198	7.324
6.255	6.640
7.094	7.003
7.157	7.595
7.218	8.051
8.002	9.326
8.177	8.140
8.180	9.006
8.899	9.005
9.077	8.594
9.978	9.458
10.100	9.868
10.161	10.187
11.000	10.459
11.001	10.641
11.060	10.322
11.120	10.367
11.178	9.957
11.180	10.367
11.235	9.227
12.200	11.003
12.319	10.821
13.159	11.183
13.159	11.229
13.338	10.910
14.119	11.637
15.255	11.315];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m = C2K(3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Dorr1993';  comment.tL_m = 'data from N Svalbard';

% time-weight
data.tW_f = [ ... % age (years), weight (g) (cm) 
4.888	2.489
4.940	5.212
4.995	4.121
5.159	3.301
5.862	6.828
5.864	4.921
6.135	5.733
6.891	10.350
6.895	6.262
6.949	7.215
7.002	8.304
7.055	8.984
7.056	8.711
8.030	11.825
8.895	16.439
8.954	12.624
9.174	9.622
10.037	15.326
10.038	14.917
10.039	13.828
10.148	13.280
10.200	16.004
10.952	23.618
10.954	22.119
11.010	20.892
11.011	20.075
11.012	18.576
11.013	17.895
11.173	20.344
12.046	17.193
12.092	25.230
12.093	24.004
12.095	22.777
12.146	25.637
13.013	28.072
13.180	24.254
14.038	34.863
14.045	28.460
15.020	31.164
17.083	33.166];
data.tW_f(:,1) = 365 * (0.3 + data.tW_f(:,1)); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f = C2K(3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Dorr1993';  comment.tW_f = 'data from N Svalbard';
%
data.tW_m = [ ...
4.167	5.722
4.980	5.858
4.982	3.951
5.142	6.540
5.200	2.861
5.845	8.174
5.901	6.403
6.064	5.858
6.168	9.946
6.172	6.540
6.978	12.943
7.036	9.673
7.040	5.995
8.118	11.172
8.976	19.619
9.999	25.749
10.057	22.343
10.220	21.935
10.915	31.471
11.029	26.022
11.030	24.659
11.085	23.978
11.087	22.752
11.130	32.970
11.197	21.117
11.943	32.561
12.162	30.926
13.077	36.240
14.050	38.965
14.865	37.057
14.969	40.872
15.085	33.787];
data.tW_m(:,1) = 365 * (0.3 + data.tW_m(:,1)); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m = C2K(3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Dorr1993';  comment.tW_m = 'data from N Svalbard';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwb = weights.Wwb * 3;
weights.Wwi = weights.Wwi * 3;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northwest Atlantic: Greenland and Canada to Cape Cod in Massachusetts, USA. Northeast Atlantic: Greenland, Iceland, the Faroes, Novaya Zemlya (but not White Sea) in Russia, southern part of Barents Sea, Scandinavian coast to Skagerrak, the Orkneys in Scotland, and Ireland';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'GVSN'; % Cat of Life
metaData.links.id_ITIS = '167207'; % ITIS
metaData.links.id_EoL = '46568931'; % Ency of Life
metaData.links.id_Wiki = 'Artediellus'; % Wikipedia
metaData.links.id_ADW = 'Artediellus_uncinatus'; % ADW
metaData.links.id_Taxo = '161838'; % Taxonomicon
metaData.links.id_WoRMS = '127195'; % WoRMS
metaData.links.id_fishbase = 'Artediellus_uncinatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Artediellus}}';
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
bibkey = 'Dorr1993'; type = 'phdthesis'; bib = [ ...
'author = {Christian F. von Dorrien}, ' ... 
'year = {1993}, ' ...
'title = {Ecology and Respiration of selected Arctic enthic Fish Species}, ' ...
'school = {Christian-Albrechts-University of Kiel}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Artediellus_uncinatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

