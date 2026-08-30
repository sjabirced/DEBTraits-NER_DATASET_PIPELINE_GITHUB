function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_fusca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_fusca'; 
metaData.species_en = 'Kapwaeti'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

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

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 6;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 13.2;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'PatiMoha2011';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^2.96, see F1';
data.Wwi = 20.7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^2.96, see F1; max. published weight: 25.90 g';

data.GSI = 0.0955; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'PatiMoha2011';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length-weight
data.tL_fm = [ ... % time (yr), total length (cm)
    1  7.811  7.215
    2 11.525 10.622
    3 14.509 12.821
    4 17.082 14.110
    5 18.115 15.809];
data.tL_fm(:,1) = 365 * (1.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm= C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PatiMoha2011'; treat.tL_fm = {1 {'females','males'}}; 
    
% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
7.063	4.675
7.367	3.096
7.719	5.919
8.141	6.853
8.469	7.790
8.539	7.159
8.633	13.447
8.727	7.785
8.820	8.411
8.867	9.668
9.031	8.407
9.172	10.920
9.312	9.030
9.359	9.029
9.523	11.856
9.570	12.169
9.594	9.653
9.664	14.369
9.805	10.907
9.875	11.848
9.969	7.758
10.016	11.531
10.016	13.418
10.086	12.473
10.203	10.584
10.227	13.728
10.344	10.581
10.508	13.408
10.555	15.608
10.602	14.034
10.719	14.347
10.742	16.233
10.836	17.489
10.930	16.543
11.000	18.114
11.281	17.794
11.328	19.680
11.398	13.703
11.469	20.620
11.492	16.846
11.609	18.101
11.633	15.900
11.656	22.503
11.773	19.670
11.797	23.129
11.820	18.097
11.961	19.352
11.984	23.125
12.031	21.552
12.148	20.606
12.289	25.005
12.336	23.118
12.359	19.658
12.430	18.084
12.500	24.687
12.500	21.542
12.711	21.223
12.711	24.053
12.922	23.734
13.016	24.990
13.063	28.763
13.086	26.247
13.250	27.501
13.438	31.585
13.531	28.438
13.602	29.066
13.695	35.982
13.719	32.837
13.742	31.264
13.859	34.406
13.953	33.461
14.023	34.403
14.070	36.603
14.117	31.256
14.187	30.312
14.422	32.193
14.445	39.111
14.586	37.536
14.750	38.161
14.820	47.594
14.891	42.875
14.937	39.101
14.984	41.301
15.008	46.961
15.008	48.533
15.125	42.870
15.125	49.474
15.172	39.096
15.195	44.756
15.289	50.414
15.312	36.892
15.359	46.325
15.453	50.411
15.453	48.838
15.477	56.071
15.477	45.064
15.523	43.177
15.570	59.213
15.922	53.860
15.969	45.683
15.992	55.116
16.039	47.568
16.062	50.712
16.086	56.058
16.109	60.145
16.297	64.230
16.320	56.053
16.367	51.649
16.391	46.932
16.461	49.761
16.531	56.678
16.578	53.846
16.578	51.960
16.695	56.674
16.836	63.275
16.906	54.468
16.906	58.871
16.977	60.442
17.047	65.786
17.141	64.212
17.211	70.814
17.234	56.977
17.281	60.750
17.328	65.466
17.398	56.659
17.422	69.237
17.469	55.400
17.539	59.487
17.633	62.944
17.656	65.144
17.703	69.860
17.773	72.375
17.961	80.861
17.984	75.829
18.031	70.168
18.125	58.531
18.195	71.737
18.430	71.732
18.453	82.109
18.758	83.989
18.969	84.614
18.992	73.922];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'PatiMoha2011'; 
%
data.LW_m = [ ... % total length (cm), weight (g) 
5.735	2.462
6.731	4.623
6.849	5.237
6.944	4.321
7.062	5.853
7.300	6.164
7.799	4.033
8.343	7.408
8.438	8.022
8.508	9.552
8.793	9.558
8.888	10.783
9.173	10.483
9.196	12.013
9.244	10.790
9.504	12.631
9.506	8.961
9.550	14.466
9.717	13.552
9.719	10.188
9.884	12.332
9.978	13.252
10.004	8.665
10.097	13.866
10.097	12.948
10.333	15.706
10.357	14.177
10.427	17.237
10.689	15.407
10.690	14.490
10.736	17.243
10.927	13.883
10.950	16.941
11.020	18.166
11.092	16.027
11.139	16.945
11.447	18.481
11.565	20.929
11.565	20.318
11.684	18.791
11.729	23.991
11.827	18.182
11.873	21.242
11.966	24.913
11.970	17.880
12.111	19.717
12.252	22.167
12.395	22.781
12.511	26.759
12.583	25.843
12.609	21.562
12.772	27.070
12.797	25.236
12.919	18.816
13.033	27.381
13.034	25.852
13.034	24.629
13.317	28.916
13.318	26.776
13.409	35.034
13.696	30.453
13.929	39.326
13.956	34.128
14.167	38.719
14.384	32.302
14.975	36.289
16.397	39.988];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'PatiMoha2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 10 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

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
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to  Iran';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '5WXKW'; % Cat of Life
metaData.links.id_ITIS = '688840'; % ITIS
metaData.links.id_EoL = '215216'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_fusca'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_fusca'; % ADW
metaData.links.id_Taxo = '165383'; % Taxonomicon
metaData.links.id_WoRMS = '1019214'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-fusca'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_fusca}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-fusca.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'PatiMoha2011'; type = 'article'; bib = [ ...
'author = {R. Patimar1 and B. Mohammadzadeh}, ' ...
'year = {2011}, ' ...
'title  = {On the biological characteristics of \emph{Capoeta fusca} {N}ikolskii, 1897 in eastern {I}ran}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {27}, ' ...
'pages = {873–878}'];
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

