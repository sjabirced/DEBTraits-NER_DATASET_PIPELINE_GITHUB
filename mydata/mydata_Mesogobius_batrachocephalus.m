  function [data, auxData, metaData, txtData, weights] = mydata_Mesogobius_batrachocephalus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Mesogobius_batrachocephalus'; 
metaData.species_en = 'Knout goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAbl'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi';'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 06];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Aydi2021'; 
  comment.Lp = 'based on the same relative length, compared to Gobio gobio: 13*8.5/21';
data.Li = 35;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 0.01;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Aydi2021';
  comment.Wwb = 'Based on egg diameter of 2.7 mm: pi/6*0.27^3';
data.Wwp = 52.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Aydi2021','fishbase'};
  comment.Wwp = 'based on 0.01072*Lp^2.94, see F1';
data.Wwi = 371;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.94, see F1; max. published weight: 600 g';

data.GSI = 0.21; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'Aydi2021';
  temp.GSI = C2K(11); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (d), total length (cm)
1	13.96  26.29
2	19.16  66.18
3	23.15 122.49
4	27.44 201.49
5	28.36 216.81
6	30.49 257.08
7	32.36 297.44
8	34.00 272.78];
data.tLW(:,1) = 365 * (0.5+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'length', 'weight'};  
temp.tLW = C2K(11);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Aydi2021'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW_f = [ ... % total length (cm),  wet weight (g)
5.343	4.276
13.432	28.860
14.991	30.998
15.139	26.722
15.659	32.066
15.733	38.480
16.252	42.755
16.549	41.686
16.772	44.893
17.069	61.995
17.143	39.549
17.291	53.444
17.588	42.755
17.885	57.720
18.108	45.962
18.479	66.271
18.553	54.513
18.998	74.822
18.998	60.926
18.998	53.444
19.369	79.097
19.814	66.271
20.037	72.684
20.111	81.235
20.260	101.544
20.557	89.786
20.557	69.477
20.705	83.373
20.705	78.028
20.853	100.475
20.928	123.990
21.150	109.026
21.447	91.924
21.892	129.335
21.892	112.233
21.967	87.648
21.967	75.891
22.189	89.786
22.189	74.822
22.263	113.302
22.263	104.751
22.783	135.748
22.931	115.439
22.931	114.371
23.006	132.542
23.451	123.990
23.525	149.644
23.748	118.646
23.822	144.299
24.045	162.470
24.119	146.437
24.119	130.404
24.193	183.848
24.416	174.228
24.416	120.784
24.638	134.679
24.712	160.333
24.861	183.848
24.935	167.815
25.083	152.850
25.083	175.297
25.380	146.437
25.380	129.335
25.826	205.226
25.826	168.884
25.900	189.192
25.974	147.506
26.048	222.328
26.122	178.504
26.345	188.124
26.345	207.363
26.419	215.914
26.419	150.713
26.494	230.879
26.494	169.953
26.642	199.881
26.716	157.126
26.790	207.363
26.790	146.437
26.939	163.539
27.087	229.810
27.161	177.435
27.532	180.641
27.532	171.021
27.607	227.672
27.607	204.157
27.681	249.050
27.829	230.879
27.829	188.124
27.829	135.748
27.904	239.430
27.904	253.325
28.126	212.708
28.126	205.226
28.126	182.779
28.200	259.739
28.497	243.705
28.720	238.361
28.794	257.601
28.794	188.124
28.868	219.121
28.868	202.019
29.017	228.741
29.091	274.703
29.091	206.295
29.165	301.425
29.165	195.606
29.388	305.701
29.388	198.812
29.462	289.667
29.536	235.154
29.685	320.665
29.685	233.017
29.759	265.083
30.056	242.637
30.204	274.703
30.427	361.283
30.575	266.152
30.575	254.394
30.872	258.670
31.243	307.838
31.466	244.774
31.540	273.634
31.614	291.805
31.614	252.257
32.653	377.316
34.063	272.565];
units.LW_f = {'dcm', 'g'}; label.LW_f = {'total length', 'wet weight', 'females'};  
bibkey.LW_f = 'Aydi2021';
%
data.LW_m = [ ... % total length (cm),  wet weight (g)
9.126	7.711
12.639	13.494
13.030	20.241
14.368	26.988
14.758	29.880
14.926	36.627
15.316	26.024
15.372	32.771
15.595	41.446
15.651	34.699
15.874	37.590
15.874	23.133
16.097	33.735
16.208	36.627
16.431	40.482
16.487	32.771
16.710	44.337
16.766	40.482
17.100	46.265
17.100	39.518
17.268	43.373
17.602	39.518
17.658	46.265
17.993	48.193
18.160	49.157
18.216	53.012
18.494	53.976
18.717	61.687
18.773	69.398
18.996	64.578
19.052	51.084
19.108	71.325
19.275	61.687
19.275	56.867
19.387	65.542
19.387	79.036
19.833	67.470
19.944	72.289
20.000	61.687
20.112	78.072
20.167	68.434
20.335	86.747
20.335	87.711
20.335	62.651
20.613	96.386
20.613	77.108
20.669	81.928
20.781	70.361
20.892	72.289
21.004	90.602
21.171	95.422
21.227	72.289
21.283	82.892
21.283	80.000
21.450	106.988
21.561	109.880
21.617	88.675
21.673	97.349
21.729	91.566
21.896	104.096
21.952	110.843
22.007	114.699
22.063	85.783
22.175	95.422
22.175	79.036
22.286	109.880
22.286	83.855
22.621	110.843
22.677	129.157
22.788	120.482
22.844	109.880
23.067	134.940
23.067	115.663
23.178	136.867
23.290	148.434
23.290	120.482
23.346	106.024
23.457	145.542
23.457	140.723
23.457	117.590
23.569	131.084
23.569	110.843
23.569	98.313
23.792	129.157
23.848	154.217
23.848	122.410
23.903	108.916
24.015	143.614
24.015	128.193
24.294	128.193
24.349	140.723
24.349	129.157
24.461	167.711
24.517	157.108
24.684	146.506
24.740	159.036
24.851	113.735
24.963	133.976
24.963	150.361
25.019	142.651
25.074	133.012
25.130	162.892
25.186	171.566
25.186	139.759
25.465	165.783
25.465	130.120
25.465	144.578
25.576	188.916
25.576	108.916
25.632	173.494
26.134	193.735
26.134	185.060
26.134	159.036
26.190	144.578
26.245	172.530
26.245	142.651
26.301	162.892
26.357	148.434
26.413	106.024
26.468	210.120
26.580	202.410
26.580	154.217
26.636	195.663
26.636	162.892
26.691	187.952
26.691	175.422
26.747	150.361
26.803	206.265
26.803	178.313
26.803	168.675
26.970	199.518
27.026	227.470
27.026	186.024
27.249	277.590
27.249	173.494
27.305	143.614
27.361	213.012
27.584	164.819
27.584	158.072
27.807	274.699
27.807	201.446
27.862	244.819
27.862	236.145
27.974	232.289
28.030	298.795
28.030	154.217
28.086	228.434
28.086	196.627
28.141	243.855
28.197	184.096
28.253	220.723
28.253	201.446
28.253	187.952
28.309	227.470
28.420	235.181
28.420	191.807
28.476	277.590
28.476	176.386
28.587	298.795
28.587	215.904
28.587	189.880
28.643	255.422
28.643	180.241
28.699	196.627
28.810	178.313
28.866	222.651
29.033	218.795
29.089	273.735
29.089	245.783
29.145	251.566
29.145	192.771
29.201	209.157
29.257	227.470
29.312	240.964
29.368	169.639
29.368	175.422
29.480	235.181
29.647	212.048
29.703	160.964
29.758	226.506
29.814	268.916
29.981	222.651
30.037	284.337
30.093	301.687
30.093	235.181
30.093	190.843
30.204	265.060
30.372	322.892
30.372	295.904
30.483	282.410
30.539	235.181
30.762	253.494
30.929	330.602
30.929	280.482
31.041	262.169
31.041	254.458
31.097	266.024
31.097	220.723
31.375	336.386
31.431	273.735
31.487	291.084
31.487	255.422
31.543	375.904
31.543	232.289
31.599	266.988
31.654	301.687
31.766	277.590
31.933	270.843
32.156	256.386
32.323	254.458
32.435	329.639
33.439	337.349];
units.LW_m = {'dcm', 'g'}; label.LW_m = {'total length', 'wet weight', 'males'};  
bibkey.LW_m = 'Aydi2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.GSI = 3 * weights.GSI;
weights.Wwp = 0 * weights.Wwp;

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
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data at females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.01072*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe and Asia: Black Sea, and Sea of Azov; lower South Bug and freshwater Lake Siut Giol on Romanian coast';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '423L9'; % Cat of Life
metaData.links.id_ITIS = '172177'; % ITIS
metaData.links.id_EoL = '46575266'; % Ency of Life
metaData.links.id_Wiki = 'Mesogobius_batrachocephalus'; % Wikipedia
metaData.links.id_ADW = 'Mesogobius_batrachocephalus'; % ADW
metaData.links.id_Taxo = '46589'; % Taxonomicon
metaData.links.id_WoRMS = '126909'; % WoRMS
metaData.links.id_fishbase = 'Mesogobius_batrachocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mesogobius_batrachocephalus}}';  
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
bibkey = 'Aydi2021'; type = 'Article'; bib = [ ...  
'doi = {10.3153/AR21009}, ' ...
'author = {Aydın, M.}, ' ...
'year = {2021}, ' ...
'title = {The first data on the population parameters and morphometry of \emph{Mesogobius batrachocephalus} ({P}allas 1814) (Family: {G}obiidae) in the southern {B}lack {S}ea}, ' ... 
'journal = {Aquatic Research}, ' ...
'volume = {4(2)}, '...
'pages = {116-128}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mesogobius_batrachocephalus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
