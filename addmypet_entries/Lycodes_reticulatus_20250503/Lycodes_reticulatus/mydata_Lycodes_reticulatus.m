function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_reticulatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_reticulatus'; 
metaData.species_en = 'Artic eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MAN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 03];

%% set data
% zero-variate data

data.ab = 307;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(3.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 19 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(3.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 70; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';
  comment.Li = 'fishbase gives 36 cm';

data.Wwb = 0.1131; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 6 mm: pi/6*0.6^3';
data.Wwp = 39.3;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00309*Lp^3.21, see F1';
data.Wwi = 2587;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.21, see F1';

data.Ri = 459/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(3.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_G = [ ... % time since hatch (yr), std length (cm)
1.809	7.759
2.907	10.109
3.100	8.579
4.918	14.691
4.928	12.926
5.748	15.395
5.937	14.688
6.204	16.570
7.042	15.861
7.315	16.684
7.861	18.330
7.864	17.741
8.877	18.797
10.072	20.323
10.081	18.794
10.810	20.909
12.003	22.788
12.921	24.197
13.119	21.961
13.387	23.725
14.956	24.662
15.230	25.249
16.883	27.715
17.806	28.183
24.895	35.574
27.698	30.977
29.892	36.029
31.945	33.200
35.072	37.073];
data.tL_G(:,1) = 365*(0.1+data.tL_G(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tL_G,1);if data.tL_G(i,1)<=data.tL_G(i-1,1);data.tL_G(i,1)=data.tL_G(i-1,1)+1e-3;end;end
units.tL_G = {'d', 'cm'};  label.tL_G = {'time since birth', 'std length', 'NE Greenland'};  
  temp.tL_G = C2K(3.5);  units.temp.tL_G = 'K'; label.temp.tL_G = 'temperature';
bibkey.tL_G = 'Dorr1993'; 
comment.tL_G = 'data from NE Greenland';
%
data.tL_B = [ ... % time since hatch (yr), std length (cm)
1.927	6.780
2.018	7.681
3.073	10.782
3.073	8.815
4.037	15.033
4.083	12.000
4.128	9.950
5.000	16.414
5.092	14.364
5.138	15.019
6.101	16.155
6.101	14.762
6.147	16.482
7.156	17.863
7.202	18.191
8.073	15.311
8.165	18.917
9.083	22.266
9.083	19.479
9.083	18.823
9.083	17.758
10.092	21.270
10.183	20.367
10.183	19.302
11.193	23.470
11.972	24.034
12.018	24.935
12.018	19.771
12.064	24.524
12.110	21.655
13.028	24.185
13.119	23.528
14.083	21.467
15.092	23.258
18.945	27.145];
data.tL_B(:,1) = 365*(0.1+data.tL_B(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tL_B,1);if data.tL_B(i,1)<=data.tL_B(i-1,1);data.tL_B(i,1)=data.tL_B(i-1,1)+1e-3;end;end
units.tL_B = {'d', 'cm'};  label.tL_B = {'time since birth', 'std length', 'Barents Sea'};  
  temp.tL_B = C2K(3.5);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'Dorr1993'; 
comment.tL_B = 'data from Barents Sea';

% time-weight
data.tW_G = [ ... % time since hatch (yr), weight (g)
1.862	4.717
2.886	5.896
3.261	3.538
4.931	17.689
5.028	11.792
6.045	25.943
6.051	16.509
6.701	21.226
6.976	29.481
7.262	18.868
8.001	29.481
8.744	35.377
8.937	23.585
9.301	40.094
10.049	36.557
10.135	48.349
11.440	50.708
11.887	83.726
13.191	87.264
13.197	75.472
13.206	58.962
15.141	101.415
17.174	134.434
18.574	130.896
24.792	349.057
27.947	211.085
29.970	428.066
32.210	257.075
35.031	380.896];
data.tW_G(:,1) = 365*(0.1+data.tW_G(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tW_G,1);if data.tW_G(i,1)<=data.tW_G(i-1,1);data.tW_G(i,1)=data.tW_G(i-1,1)+1e-3;end;end
units.tW_G = {'d', 'g'};  label.tW_G = {'time since birth', 'weight', 'NE Greenland'};  
  temp.tW_G = C2K(3.5);  units.temp.tW_G = 'K'; label.temp.tW_G = 'temperature';
bibkey.tW_G = 'Dorr1993'; 
comment.tW_G = 'data from NE Greenland';
%
data.tW_B = [ ... % time since hatch (yr), weight (g)
2.975	7.057
4.165	17.918
5.080	15.779
5.126	23.816
6.087	23.569
6.224	21.439
7.277	26.864
8.284	18.578
9.108	40.791
10.114	35.341
12.082	53.758
12.128	66.760
12.128	41.228
13.089	75.732
14.096	49.479
15.057	61.288];
data.tW_B(:,1) = 365*(0.1+data.tW_B(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tW_B,1);if data.tW_B(i,1)<=data.tW_B(i-1,1);data.tW_B(i,1)=data.tW_B(i-1,1)+1e-3;end;end
units.tW_B = {'d', 'g'};  label.tW_B = {'time since birth', 'weight', 'Barents Sea'};  
  temp.tW_B = C2K(3.5);  units.temp.tW_B = 'K'; label.temp.tW_B = 'temperature';
bibkey.tW_B = 'Dorr1993'; 
comment.tW_B = 'data from Barents Sea';

% length-weight
data.LW_G = [ ... % std length (cm), weight (g)
7.323	2.890
8.599	6.535
9.879	5.442
12.781	10.387
14.285	18.788
15.446	20.055
15.907	24.828
16.366	31.969
16.491	22.499
18.224	34.471
18.343	30.925
18.911	45.183
19.951	52.366
21.116	50.079
21.803	61.977
22.714	82.183
24.001	73.981
24.686	87.063
25.136	103.683
28.009	140.617
28.246	135.894
30.846	215.463
32.781	260.624
35.604	350.872
35.759	433.822
37.079	390.077];
units.LW_G = {'cm', 'g'};  label.LW_G = {'std length', 'weight', 'NE Greenland'};  
bibkey.LW_G = 'Dorr1993'; 
comment.LW_G = 'data from NE Greenland';
%
data.LW_B = [ ... % std length (cm), weight (g)
10.842	6.720
14.466	15.990
15.234	18.603
15.582	19.554
16.349	21.693
16.421	23.115
18.371	27.633
19.286	35.934
19.849	41.388
19.990	42.811
21.742	54.674
21.805	49.698
23.141	61.794
23.646	75.305
25.163	67.497];
units.LW_B = {'cm', 'g'};  label.LW_B = {'std length', 'weight', 'Barents Sea'};  
bibkey.LW_B = 'Dorr1993'; 
comment.LW_B = 'data from Barents Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_G = weights.tL_G * 5;
weights.tL_B = weights.tL_B * 5;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 3;
weights.Wwb = weights.Wwb * 3;
weights.Wwp = weights.Wwp * 0;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_G','tL_B'}; subtitle1 = {'Data from Greenland, Barents Sea'};
set2 = {'tW_G','tW_B'}; subtitle2 = {'Data from Greenland, Barents Sea'};
set3 = {'LW_G','LW_B'}; subtitle3 = {'Data from Greenland, Barents Sea'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00309*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Western Atlantic: western Greenland, Hudson Bay and Labrador to Massachusetts. Arctic: west of Boothia Peninsula in the Northwest Territories and the northern parts of Kara and Laptev seas';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WKY7'; % Cat of Life
metaData.links.id_ITIS = '165280'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_reticulatus'; % ADW
metaData.links.id_Taxo = '179367'; % Taxonomicon
metaData.links.id_WoRMS = '127112'; % WoRMS
metaData.links.id_fishbase = 'Lycodes_reticulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycodes}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Lycodes_reticulatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
