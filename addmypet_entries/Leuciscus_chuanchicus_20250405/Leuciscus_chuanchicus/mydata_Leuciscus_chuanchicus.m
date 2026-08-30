function [data, auxData, metaData, txtData, weights] = mydata_Leuciscus_chuanchicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leuciscus_chuanchicus'; 
metaData.species_en = 'Huanghe dace'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 05];

%% set data
% zero-variate data

data.am = 16*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 25.8;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 57.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.02, see F1';
data.Wwi = 729;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.02, see F1';

data.Ri = 27000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leuciscus_leuciscus';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (d), total length (cm)
    1  6.57  6.82
    2 16.09 16.10
    3 25.05 21.33
    4 27.69 25.46
    5 31.42 25.20
    6 32.00 NaN
    7 37.45 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(13);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'XionLiu2024'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time (d), weight (g)
    1    2.28   2.69
    2   46.24  43.56
    3  144.83 111.17
    4  235.23 202.91
    5  289.12 224.36
    6  365.31 NaN
    7  552.43 NaN];
data.tW_fm(:,1) = data.tW_fm(:,1) * 365; % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(13);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'XionLiu2024'; treat.tW_fm = {1 {'females','males'}}; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.224	15.222
12.347	19.028
12.908	16.491
13.571	35.518
14.184	27.907
14.286	45.666
14.490	27.907
14.643	52.008
15.153	40.592
15.663	30.444
15.918	46.934
16.531	36.786
17.347	59.619
17.398	44.397
18.316	73.573
19.082	64.693
19.439	87.526
19.592	64.693
20.051	101.480
20.510	110.359
20.714	82.452
20.714	98.943
20.816	72.304
21.224	101.480
21.888	115.433
21.990	129.387
22.092	100.211
22.755	125.581
23.316	164.905
23.571	117.970
23.724	144.609
23.827	107.822
24.184	131.924
24.490	121.776
24.541	187.738
24.796	149.683
25.153	144.609
25.357	200.423
25.663	206.765
25.714	169.979
25.918	152.220
26.020	183.932
26.735	199.154
26.888	164.905
27.092	185.201
27.449	214.376
27.449	177.590
27.500	219.450
27.704	194.080
27.755	247.357
28.061	166.173
28.214	241.015
28.367	223.256
28.673	208.034
29.235	189.006
29.235	225.793
29.286	238.478
29.439	279.070
29.643	282.875
30.000	276.533
30.102	327.273
30.306	285.412
30.510	326.004
30.663	296.829
30.765	262.579
30.918	258.774
31.020	376.744
31.531	296.829
31.582	371.670
32.806	361.522
32.959	372.939
33.622	463.002
33.622	367.865
34.490	385.624
34.643	438.901
34.694	526.427
34.694	418.605
35.306	456.660
36.786	531.501
37.041	512.474
37.704	554.334];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'XionLiu2024'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
7.959	8.880
8.367	8.880
8.571	15.222
9.388	10.148
9.694	15.222
10.051	10.148
10.561	16.491
11.429	13.953
11.735	12.685
11.888	20.296
12.500	20.296
12.653	20.296
13.418	20.296
13.980	21.564
14.286	27.907
14.745	21.564
15.153	25.370
15.255	44.397
15.765	34.250
15.765	27.907
16.378	35.518
16.582	48.203
17.041	50.740
17.092	41.861
17.602	45.666
17.959	77.378
18.010	62.156
18.112	49.471
18.163	64.693
18.418	60.888
18.469	71.036
18.724	55.814
19.133	65.962
19.184	55.814
19.184	68.499
19.490	79.915
19.694	64.693
19.796	74.841
20.153	97.674
20.408	87.526
20.459	98.943
20.459	77.378
20.867	145.877
20.867	110.359
21.122	84.989
21.173	110.359
21.327	104.017
21.378	81.184
21.429	77.378
21.684	101.480
21.837	92.600
21.939	95.137
21.990	121.776
22.194	112.896
22.500	109.091
22.500	100.211
22.551	123.044
22.551	130.655
23.061	134.461
23.061	129.387
23.112	135.729
23.112	106.554
23.265	143.340
23.469	121.776
23.469	115.433
23.520	154.757
23.724	125.581
23.724	138.266
23.776	150.951
23.929	163.636
24.082	129.387
24.439	128.118
24.490	139.535
24.796	140.803
24.898	162.368
24.949	148.414
25.357	131.924
25.510	142.072
25.612	168.710
25.816	164.905
25.867	153.488
25.969	156.025
26.020	185.201
26.224	149.683
26.327	215.645
26.327	171.247
26.429	186.469
26.684	176.321
26.735	159.831
27.041	183.932
27.245	239.746
27.347	195.349
27.398	200.423
27.653	180.127
27.755	202.960
28.265	195.349
28.367	201.691
28.418	214.376
28.724	237.209
28.827	223.256
28.878	252.431
29.286	312.051
29.490	235.941
29.796	202.960
31.276	333.615
31.684	280.338
32.398	275.264
32.551	383.087
32.959	356.448
33.418	367.865
34.541	437.632
34.541	385.624
34.847	399.577
35.000	410.994
35.459	426.216];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'XionLiu2024'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Li = 3 * weights.Li;
%weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Upper reaches of Huanghe River, China';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6PRP8'; % Cat of Life
metaData.links.id_ITIS = '689393'; % ITIS
metaData.links.id_EoL = '610816'; % Ency of Life
metaData.links.id_Wiki = 'Leuciscus_chuanchicus'; % Wikipedia
metaData.links.id_ADW = 'Leuciscus_chuanchicus'; % ADW
metaData.links.id_Taxo = '178767'; % Taxonomicon
metaData.links.id_WoRMS = '1020301'; % WoRMS
metaData.links.id_fishbase = 'Leuciscus-chuanchicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuciscus_leuciscus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leuciscus-leuciscus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'XionLiu2024'; type = 'article'; bib = [ ...
'doi = {10.7717//peerj.17351}, ' ...
'author = {Xiong, S. and J. Liu and P. Li and Y. Liu and K. Liu and Y. Wang and J. Wang}, ' ...
'year = {2024}, ' ...
'title  = {Estimates on age, growth, and mortality of \emph{Leuciscus chuanchicus} ({K}essler 1876) in the {N}ingxia section of the upper reaches of the {Y}ellow {R}iver, {C}hina}, ' ...
'journal = {PeerJ}, ' ...
'pages = {e17351}, ' ...
'volume = {12}'];
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

