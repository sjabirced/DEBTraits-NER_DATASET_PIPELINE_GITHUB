  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_lacerta
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_lacerta'; 
metaData.species_en = 'Kura barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 13];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'DopeKeiv2005';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 37.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DopeKeiv2014';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 9.1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^2.98, see F1';
data.Wwi = 468.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^2.98, see F1';
    
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'DopeKeiv2014';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
0.013	8.646
0.026	6.484
0.052	7.564
0.984	9.493
0.984	10.069
0.984	10.646
0.997	7.331
0.997	7.619
0.997	11.798
1.010	8.268
1.010	8.772
1.010	11.005
1.036	11.509
1.062	13.022
1.954	12.429
1.967	13.005
1.980	11.997
1.980	13.654
1.980	14.374
1.980	14.950
1.993	10.195
1.993	10.483
1.993	11.060
1.993	16.175
2.007	13.221
2.033	9.834
2.977	16.157
2.990	13.779
2.990	15.220
2.990	15.725
3.003	16.877
3.003	19.399
3.016	16.373
3.016	18.534
3.016	18.822
3.030	14.571
3.043	17.813
3.961	16.212
3.974	18.877
3.974	19.670
3.987	17.508
3.987	20.102
4.000	15.418
4.000	18.300
4.013	15.850
4.013	16.643
4.013	17.940
4.013	19.237
4.997	20.155
5.010	19.002
5.010	19.867
5.010	20.515
5.023	18.138
5.993	21.218
5.993	21.578
5.993	21.867
6.007	22.443
6.020	20.641
6.990	22.497
6.990	23.145
7.003	21.488
7.030	21.920];
data.tL_f(:,1) = 365*(0.9 + data.tL_f(:,1)); % set origin at birth
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DopeKeiv2005'; 
%
data.tL_m = [ ... % time since birth (d), total length (cm)
0.016	5.635
0.025	5.844
0.033	6.365
0.033	4.957
0.033	4.592
0.049	5.166
0.985	8.358
0.993	9.297
1.002	5.384
1.002	8.619
1.002	8.932
1.002	10.028
1.010	7.628
1.010	10.393
1.018	5.906
1.018	6.324
1.018	7.106
1.018	8.045
1.026	9.663
1.026	9.819
1.034	6.793
1.979	12.125
1.979	11.290
1.995	13.012
1.995	12.908
1.995	11.760
1.995	10.821
1.995	10.142
1.995	7.273
2.003	9.516
2.003	9.151
2.003	8.995
2.003	8.316
2.003	8.056
2.003	7.743
2.011	8.734
2.028	13.378
2.997	10.622
3.005	11.144
3.005	11.562
3.005	11.875
3.005	13.649
3.013	12.397
3.013	12.710
3.021	13.075
3.998	13.920
4.015	12.511
4.015	13.190
4.015	13.398
4.023	15.642];
data.tL_m(:,1) = 365*(0.9 + data.tL_m(:,1)); % set origin at birth
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DopeKeiv2005'; 

% time-weight
data.tW_fm = [ ... % time since birth (d), fork length (cm)
 0    5.33  3.38
 1	  9.80  8.57
 2   22.36 17.41
 3   44.85 26.83
 4   62.45 38.86
 5   78.83 NaN
 6   96.87 NaN
 7  118.68 NaN];
data.tW_fm(:,1) = 365*(0.9 + data.tW_fm(:,1)); % set origin at birth
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DopeKeiv2005'; treat.tW_fm = {1 {'female','male'}}; 

% length-weight
data.LW_f = [ % fork length (cm), weight (g)
6.395	2.285
7.097	3.320
7.369	5.775
7.604	4.361
7.721	5.413
7.760	4.357
8.032	6.811
8.227	6.102
8.461	6.799
8.462	5.744
8.695	8.200
8.891	5.732
8.967	9.951
9.046	7.486
9.124	6.429
9.318	9.941
9.475	8.530
9.631	7.118
9.786	12.038
9.904	8.869
10.215	12.026
10.253	14.136
10.604	14.478
10.644	11.662
10.877	16.229
10.916	13.765
11.150	14.814
11.500	17.618
11.735	16.556
11.774	14.445
11.968	19.716
12.241	20.411
12.437	15.130
12.475	17.943
12.592	18.291
12.593	15.829
12.630	21.808
12.747	22.508
12.825	24.264
12.827	17.229
13.021	20.390
13.176	23.551
13.294	20.030
13.332	21.788
13.526	25.652
13.722	23.536
13.798	29.513
13.917	22.123
13.993	31.267
14.033	25.286
14.189	27.040
14.461	29.495
14.538	33.010
14.735	28.080
14.967	32.998
15.005	37.922
15.007	29.831
15.240	33.342
15.356	38.264
15.433	41.779
15.707	37.902
15.900	45.635
15.979	41.764
16.055	48.445
16.171	50.200
16.175	38.240
16.446	46.323
16.719	43.150
16.836	46.312
17.030	49.121
17.457	55.441
17.459	48.405
17.536	50.514
17.807	57.893
17.883	66.333
17.887	52.966
18.042	56.479
18.118	63.161
18.353	58.933
18.387	77.927
18.427	73.001
18.471	54.357
18.508	64.557
18.818	70.880
18.896	69.470
19.012	75.095
19.208	71.572
19.209	66.648
19.244	81.420
19.321	84.232
19.395	97.597
19.401	75.788
19.671	87.037
19.794	67.335
20.102	82.452
20.143	75.767
20.175	98.279
20.606	93.694
20.766	78.915
20.799	98.613
21.265	105.283
21.652	115.825
21.698	93.663
21.929	101.395
22.004	115.112
22.315	116.510
22.593	100.673
23.250	121.760];
units.LW_f = {'cm', 'g'}; label.LW_f = {'fork length', 'weight', 'females'};  
temp.LW_f = C2K(17);  units.temp.LW_f = 'K'; label.temp.LW_f = 'temperature';
bibkey.LW_f = 'DopeKeiv2005'; 
%
data.LW_m = [ % fork length (cm), weight (g)
4.745	2.261
4.962	1.903
5.086	2.993
5.303	4.447
5.489	3.725
5.676	5.178
5.954	3.371
5.986	4.822
6.016	2.647
6.233	1.926
6.234	5.551
6.513	5.194
6.668	4.834
6.792	5.924
6.823	5.199
7.009	4.478
7.133	4.117
7.196	7.019
7.505	4.849
7.537	8.838
7.599	7.751
7.753	5.579
7.878	7.394
7.941	9.932
8.095	7.760
8.095	9.210
8.282	11.389
8.498	8.492
8.716	12.484
8.747	9.947
8.964	9.226
8.996	13.214
9.119	11.404
9.213	15.031
9.367	9.958
9.461	13.948
9.553	9.962
9.708	10.690
9.709	15.765
9.897	20.119
9.926	13.594
10.081	12.146
10.144	16.498
10.236	15.050
10.331	19.039
10.515	14.692
10.610	21.945
10.641	19.770
10.858	21.949
10.919	16.150
11.137	19.054
11.262	24.857
11.447	20.510
11.480	27.036
11.637	33.564
11.758	24.503
11.759	28.129
11.974	20.157
12.038	27.771
12.130	24.147
12.256	28.863
12.378	23.427
12.504	30.680
12.690	28.508
12.720	27.421
12.753	34.672
12.906	25.612
12.938	30.688
13.062	30.327
13.063	35.040
13.123	25.978
13.404	33.234
13.467	36.498
13.778	39.766
13.838	34.329
15.705	59.741];
units.LW_m = {'cm', 'g'}; label.LW_m = {'fork length', 'weight', 'males'};  
temp.LW_m = C2K(17);  units.temp.LW_m = 'K'; label.temp.LW_m = 'temperature';
bibkey.LW_m = 'DopeKeiv2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
% weights.Li = weights.Li * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00955*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Euphrates and Tigris drainages';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KNFP'; % Cat of Life
metaData.links.id_ITIS = '688602'; % ITIS
metaData.links.id_EoL = '355855'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_lacerta'; % Wikipedia
metaData.links.id_ADW = 'Barbus_lacerta'; % ADW
metaData.links.id_Taxo = '163108'; % Taxonomicon
metaData.links.id_WoRMS = '1019047'; % WoRMS
metaData.links.id_fishbase = 'Barbus-lacerta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_lacerta}}';  
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
bibkey = 'DopeKeiv2005'; type = 'Article'; bib = [ ...  
'author = {Dopeikar, H. and Y. Keivany}, ' ...
'year = {2005}, ' ...
'title = {Population dynamic study of kura barbel (\emph{Barbus lacerta}: {C}yprinidae) in {T}igris {B}asin}, ' ...
'journal = {Rom. J. Biol.-Zool.}, ' ...
'volume = {60(2)}, '...
'pages = {101-112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DopeKeiv2014'; type = 'Article'; bib = [ ...  
'author = {Hakimeh Dopeikar, Yazdan Keivany and Mohammad Shadkhast}, ' ...
'year = {2014}, ' ...
'title = {Reproductive biology and gonad histology of the kura barbel, \emph{Barbus lacerta} ({C}yprinidae), in {B}ibi-{S}ayyedan {R}iver, {T}igris basin }, ' ...
'journal = {North-western Journal of Zoology}, ' ...
'volume = {11}, '...
'pages = {141402}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbus-lacerta}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

