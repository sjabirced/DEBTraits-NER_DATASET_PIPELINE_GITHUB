function [data, auxData, metaData, txtData, weights] = mydata_Psammogobius_biocellatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobionidae';
metaData.species    = 'Psammogobius_biocellatus'; 
metaData.species_en = 'Sleepy goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
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

data.ab = 2;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'this is ignorned; there is probably a delay in the start of development';
data.am = 160;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'Schl1997';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 6.17; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Schl1997';

data.Wwb = 0.000212; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Eviota_queenslandica';
data.Wwp = 4.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 40*(3/6.17)^3';
data.Wwi = 40;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Schl1997';

data.GSI = 0.095 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'Schl1997'; 
  temp.GSI = C2K(28.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (d), std length (cm)
46.038	1.453
57.736	1.552
66.415	2.468
68.302	1.856
70.566	1.856
78.491	1.786
79.623	2.092
81.509	2.703
82.642	2.295
83.019	2.125
84.528	2.431
85.283	3.212
86.792	4.435
87.170	3.586
87.547	3.144
88.679	2.498
90.566	3.041
93.585	3.482
98.113	5.486
101.132	2.665
103.396	3.956
107.925	5.417
112.453	3.377
114.717	4.634
114.717	4.226
143.396	4.560
148.679	5.103
156.981	5.951];
data.tL_f(:,1) = data.tL_f(:,1) + 0; % set origin at birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'std length', 'females'};  
temp.tL_f   = C2K(28.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Schl1997'; 
%
data.tL_m = [ ... % time (d), std length (cm)
63.396	1.925
75.849	1.583
80.377	3.145
82.264	2.465
82.642	1.616
84.528	2.261
90.943	2.260
91.321	2.803
97.358	4.127
98.491	3.481
104.528	4.364
107.925	3.853
108.302	4.295
118.868	3.376
143.396	4.390];
data.tL_m(:,1) = data.tL_m(:,1) + 0; % set origin at birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'std length', 'males'};  
temp.tL_m   = C2K(28.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Schl1997'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
1.491	0.540
1.723	0.832
1.811	0.828
1.822	1.432
2.065	1.421
2.142	0.361
2.198	2.322
2.286	1.412
2.496	1.856
2.562	2.306
2.629	6.229
2.794	2.447
3.081	3.794
3.148	4.546
3.203	4.241
3.324	4.689
3.490	5.588
3.578	4.829
3.877	6.326
3.932	7.683
3.954	6.323
4.187	9.182
4.208	7.369
4.286	7.668
4.530	11.735
4.618	13.845
4.662	12.031
5.162	23.788
5.205	19.256
5.372	23.779
5.471	21.509
5.970	33.417];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Schl1997'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
1.469	0.692
1.568	0.990
1.800	0.678
2.142	1.720
2.407	1.558
2.661	2.755
2.993	3.495
3.369	5.895
3.501	4.984
3.568	6.038
4.099	9.941
4.122	15.829
4.298	11.292
4.330	9.931
4.343	15.216
4.640	11.730
6.215	39.598];
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
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: south to East London, South Africa. Western Central Pacific: Guam'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4NCMZ'; % Cat of Life
metaData.links.id_ITIS = '637911'; % ITIS
metaData.links.id_EoL = '46576035'; % Ency of Life
metaData.links.id_Wiki = 'Psammogobius_biocellatus'; % Wikipedia
metaData.links.id_ADW = 'Psammogobius_biocellatus'; % ADW
metaData.links.id_Taxo = '691687'; % Taxonomicon
metaData.links.id_WoRMS = '279206'; % WoRMS
metaData.links.id_fishbase = 'Psammogobius_biocellatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammogobius_biocellatus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Psammogobius_biocellatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


