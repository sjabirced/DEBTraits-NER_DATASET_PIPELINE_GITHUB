function [data, auxData, metaData, txtData, weights] = mydata_Gobiopterus_mindanensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobiopterus_mindanensis'; 
metaData.species_en = 'Mindanao glassgoby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW','MIE'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
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

data.ab = 5;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 120;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'Schl1997';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 0.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'fishbase gives 27 cm, but that is unlikely given Li';
data.Li  = 1.6; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.000212; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Eviota_queenslandica';
data.Wwp = 0.0033;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 0.04*(0.7/1.6)^3';
data.Wwi = 0.04;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Schl1997';

data.GSI = 0.285 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'Schl1997'; 
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), std length (cm)
53.726	0.715
64.576	0.774
69.457	1.115
71.228	0.928
71.549	1.030
72.114	0.834
72.775	1.149
73.051	1.013
73.402	1.277
74.553	0.996
74.862	1.038
76.070	1.055
76.366	1.030
79.665	0.962
79.670	0.987
80.579	1.021
83.310	1.132
83.901	1.072
84.817	1.140
87.243	1.234
88.434	1.166
89.375	1.362
89.922	1.072
90.869	1.302
90.883	1.379
92.992	1.387
93.819	0.979
94.818	1.489
95.103	1.404
103.187	1.166
114.067	1.387
117.389	1.438
122.206	1.438];
data.tL_f(:,1) = data.tL_f(:,1) + 0; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'std length', 'females'};  
temp.tL_f   = C2K(27.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Schl1997'; 
%
data.tL_m = [ ... % time (d), std length (cm)
77.008	1.243
81.511	1.174
84.208	1.106
86.905	1.038
88.484	1.430
89.642	1.183
92.632	1.072
94.424	0.996
99.577	1.183
102.579	1.132
105.348	1.447
108.310	1.191
113.725	1.166
118.886	1.396];
data.tL_m(:,1) = data.tL_m(:,1) + 0; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'std length', 'males'};  
temp.tL_m   = C2K(27.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Schl1997'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
0.728	0.004
0.798	0.005
0.806	0.007
0.933	0.007
0.952	0.009
0.960	0.008
0.965	0.010
0.998	0.012
1.003	0.010
1.028	0.011
1.036	0.009
1.039	0.010
1.049	0.013
1.060	0.014
1.062	0.015
1.068	0.014
1.084	0.013
1.098	0.010
1.111	0.014
1.124	0.017
1.149	0.018
1.157	0.019
1.160	0.017
1.162	0.020
1.165	0.015
1.167	0.021
1.197	0.024
1.219	0.020
1.237	0.025
1.243	0.022
1.270	0.024
1.272	0.026
1.286	0.026
1.302	0.026
1.337	0.031
1.345	0.028
1.363	0.035
1.364	0.032
1.374	0.040
1.398	0.039
1.415	0.036
1.420	0.038];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Schl1997'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
1.030	0.012
1.032	0.017
1.038	0.014
1.084	0.018
1.093	0.010
1.100	0.017
1.140	0.020
1.155	0.013
1.167	0.022
1.184	0.020
1.197	0.020
1.208	0.023
1.219	0.022
1.235	0.024
1.262	0.021
1.287	0.019
1.394	0.031];
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
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Pacific: Philippines. Eastern Indian Ocean: Western Australia'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3GPH4'; % Cat of Life
metaData.links.id_ITIS = '637438'; % ITIS
metaData.links.id_EoL = '46576569'; % Ency of Life
metaData.links.id_Wiki = 'Gobiopterus'; % Wikipedia
metaData.links.id_ADW = 'Gobiopterus_mindanensis'; % ADW
metaData.links.id_Taxo = '691002'; % Taxonomicon
metaData.links.id_WoRMS = '280903'; % WoRMS
metaData.links.id_fishbase = 'Gobiopterus_mindanensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobiopterus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Gobiopterus_mindanensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


