function [data, auxData, metaData, txtData, weights] = mydata_Monotaxis_grandoculis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Monotaxis_grandoculis'; 
metaData.species_en = 'Humpnose big-eye bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ElMaMeha2022';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 30.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
data.Wwp = 507;   units.Wwp = 'cm';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01950*Lp^2.98, see F1';
data.Wwi = 3881; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01950*Li^2.98, see F1; max. published weight: 5.9 kg';

data.Ri  = 6.8e5/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'LongGill2020';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.997	19.190
1.006	21.320
1.032	20.209
1.985	26.250
1.993	29.028
1.994	23.380
1.995	22.732
2.001	26.898
2.002	21.991
2.011	25.510
2.012	24.491
2.020	28.010
2.946	30.161
2.981	31.643
2.990	32.569
2.991	29.051
2.998	33.773
2.999	31.181
3.025	30.255
3.977	36.666
3.978	35.000
3.979	33.611
4.013	38.056
4.031	35.927
4.032	34.260
4.983	41.319
4.992	42.338
5.001	39.097
5.028	40.302
5.998	44.676
5.999	43.195
6.007	45.324
6.015	42.176
6.994	48.218
7.003	47.107
7.021	45.348
7.974	47.500
8.000	48.426];
data.tL(:,1) = 365 * (0.2+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ElMaMeha2022';

% length-weight
data.LW_f = [ ... % fork length (cm), wet weight (g)
19.325	119.454
19.836	127.986
21.063	153.584
22.188	179.181
22.802	187.713
22.904	213.311
23.517	196.246
23.824	281.570
24.029	221.843
24.540	290.102
24.540	221.843
25.153	358.362
25.767	273.038
26.278	341.297
26.585	324.232
26.789	349.829
27.096	383.959
27.505	375.427
28.016	435.154
28.323	383.959
28.732	443.686
28.834	477.816
29.346	477.816
30.061	520.478
30.573	494.881
31.186	622.867
31.288	546.075
32.106	614.335
32.822	682.594
33.231	750.853
33.742	682.594
34.254	708.191
35.072	793.515
36.708	938.567
37.117	981.229
37.935	972.696
39.571	1117.747
40.082	1177.474
40.491	1305.461
40.491	1228.669
41.207	1228.669
41.718	1288.396
41.922	1441.980
42.740	1518.771
44.479	1621.160
44.888	1689.420
46.728	1800.341
47.035	1953.925
47.955	2150.171];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight','females'};  
bibkey.LW_f = 'ElMaMeha2022';
%
data.LW_m = [ ... % fork length (cm), wet weight (g)
19.013	135.135
19.841	168.919
20.668	177.365
21.805	202.703
22.530	244.932
23.046	228.041
24.184	270.270
25.428	371.622
25.528	304.054
26.565	396.960
27.496	422.297
28.014	456.081
28.738	481.419
28.943	439.189
30.598	498.311
31.947	633.446
32.462	599.662
32.774	650.338
33.086	709.460
33.602	684.122
34.017	717.906
34.532	701.014
35.052	785.473
35.467	827.703
36.710	903.716
36.712	945.946
38.472	1030.405
39.714	1106.419
42.105	1461.149
43.141	1537.162
45.317	1680.743
48.125	2153.716];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight','males'};  
bibkey.LW_m = 'ElMaMeha2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length=weight: Ww in  g = 0.01950*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '449L9'; % Cat of Life
metaData.links.id_ITIS = '169170'; % ITIS
metaData.links.id_EoL = '46580978'; % Ency of Life
metaData.links.id_Wiki = 'Monotaxis_grandoculis'; % Wikipedia
metaData.links.id_ADW = 'Monotaxis_grandoculis'; % ADW
metaData.links.id_Taxo = '180336'; % Taxonomicon
metaData.links.id_WoRMS = '218584'; % WoRMS
metaData.links.id_fishbase = 'Monotaxis-grandoculis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monotaxis_grandoculis}}';
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
bibkey = 'ElMaMeha2022'; type = 'Article'; bib = [ ... 
'author = {Samia M. El-Mahdy and Sahar F. Mehanna and Ashraf S. Mohammad and Yassein A.  Osman}, ' ... 
'year = {2022}, ' ...
'title = {Age, growth, mortality and yield per recruit of the humpnose big-eye bream \emph{Monotaxis grandoculis} ({F}orsskal, 1775) from {H}urghada, {R}ed {S}ea, {E}gypt}, ' ...
'journal = {Egyptian Journal of Aquatic Biology & Fisheries}, ' ...
'volume = {26(3)}, ' ...
'pages = {857–868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LongGill2020'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIEP/02965}, ' ...
'author = {Ken Longenecjer and Alisha Gill and Mildred Kelokelo and Ross Langston and Terry J. Donaldson and Erik C. Franklin}, ' ... 
'year = {2020}, ' ...
'title = {RAPID REPRODUCTIVE ANALYSIS AND WEIGHT-LENGTH RELATION  OF THE HUMPNOSE BIG-EYE BREAM, \emph{Monotaxis grandoculis} ({A}CTINOPTERYGII: {P}ERCIFORMES: {L}ETHRINIDAE), FROM {M}ICRONESIA  WITH IMPLICATIONS FOR FISHERIES}, ' ...
'journal = {ACTA ICHTHYOLOGICA ET PISCATORIA}, ' ...
'volume = {50(4)}, ' ...
'pages = {493–500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Monotaxis-grandoculis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
