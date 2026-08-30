function [data, auxData, metaData, txtData, weights] = mydata_Favonigobius_reichei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Favonigobius_reichei'; 
metaData.species_en = 'Indo-Pacific tropical sand goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 09];

%% set data
% zero-variate data

data.ab = 3.5;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'this is ignorned; there is probably a delay in the start of development';
data.am = 134;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'Schl1997';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives 27 cm, but that is unlikely given Li';
data.Li  = 3.2; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Schl1997';

data.Wwb = 0.000212; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Eviota_queenslandica';
data.Wwp = 0.05;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 0.5*(1.5/3.2)^3';
data.Wwi = 0.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Schl1997';

data.GSI = 0.184 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'Schl1997'; 
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), std length (cm)
42.179	1.371
51.453	1.570
52.650	1.299
53.846	1.570
55.641	1.768
57.436	0.974
58.333	1.876
59.829	1.101
60.726	1.552
61.624	1.497
61.923	1.317
62.821	1.570
63.419	1.137
63.718	1.335
64.017	1.407
69.701	2.057
77.479	2.291
79.573	2.165
79.573	1.985
80.470	1.768
81.368	2.634
82.265	2.399
82.863	2.039
83.761	2.869
91.239	2.237
92.137	2.508
92.137	1.786
93.632	2.472
94.231	2.598
97.821	2.995
98.120	2.309
106.197	1.930
106.795	2.399
112.778	3.031
114.573	3.139
119.957	2.887
125.043	2.526];
data.tL_f(:,1) = data.tL_f(:,1) + 0; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'std length', 'females'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Schl1997'; 
%
data.tL_m = [ ... % time (d), std length (cm)
59.231	1.840
84.060	2.111
88.547	1.660
90.342	3.103
92.137	2.724
92.735	2.887
105.598	3.247
120.855	2.580];
data.tL_m(:,1) = data.tL_m(:,1) + 0; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'std length', 'males'};  
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Schl1997'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
0.907	0.004
1.019	0.016
1.030	0.008
1.092	0.012
1.114	0.020
1.204	0.018
1.204	0.032
1.243	0.032
1.271	0.032
1.310	0.036
1.366	0.032
1.434	0.038
1.501	0.028
1.512	0.042
1.557	0.042
1.590	0.058
1.624	0.058
1.702	0.068
1.714	0.082
1.781	0.071
1.781	0.086
1.820	0.071
1.820	0.081
1.854	0.077
1.876	0.087
1.882	0.103
1.921	0.097
1.954	0.105
1.982	0.095
1.988	0.119
2.005	0.083
2.010	0.105
2.027	0.135
2.061	0.101
2.061	0.121
2.072	0.135
2.078	0.166
2.111	0.127
2.134	0.113
2.150	0.153
2.206	0.183
2.240	0.177
2.285	0.163
2.302	0.175
2.330	0.203
2.363	0.181
2.369	0.225
2.386	0.171
2.391	0.185
2.453	0.262
2.453	0.195
2.470	0.225
2.486	0.169
2.503	0.265
2.531	0.239
2.531	0.223
2.531	0.203
2.531	0.245
2.554	0.201
2.582	0.322
2.604	0.249
2.621	0.263
2.660	0.251
2.688	0.338
2.733	0.293
2.733	0.239
2.755	0.319
2.772	0.277
2.783	0.263
2.800	0.337
2.811	0.321
2.834	0.299
2.856	0.362
2.878	0.269
2.895	0.343
2.906	0.317
2.940	0.337
2.957	0.375
3.041	0.377
3.086	0.395
3.114	0.369
3.119	0.411
3.231	0.484];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Schl1997'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
2.122	0.155
2.262	0.161
2.318	0.159
2.369	0.185
2.425	0.247
2.514	0.241
2.537	0.215
2.559	0.235
2.570	0.267
2.587	0.273
2.632	0.225
2.649	0.237
2.671	0.275
2.716	0.259
2.778	0.265
2.778	0.291
2.867	0.345
2.923	0.359
2.929	0.315
2.957	0.351
3.069	0.377
3.130	0.456
3.192	0.470
3.214	0.451];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'Schl1997'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.19'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: East Africa to the Philippines, north to Japan, south to northern Australia'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3DWYH'; % Cat of Life
metaData.links.id_ITIS = '553329'; % ITIS
metaData.links.id_EoL = '46576170'; % Ency of Life
metaData.links.id_Wiki = 'Favonigobius_reichei'; % Wikipedia
metaData.links.id_ADW = 'Favonigobius_reichei'; % ADW
metaData.links.id_Taxo = '382376'; % Taxonomicon
metaData.links.id_WoRMS = '280777'; % WoRMS
metaData.links.id_fishbase = 'Favonigobius_reichei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Favonigobius_reichei}}';
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
bibkey = 'Schl1997'; type = 'phdthesis'; bib = [ ...
'author = {Marie-Lise Schl\"{a}ppy}, ' ... 
'year = {1997}, ' ...
'title = {Patterns of growth, reproduction and survival in gobiid fish; the implcations of small body size on life history characteristics}, ' ...
'school = {James Cook University of North Queensland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Favonigobius_reichei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


