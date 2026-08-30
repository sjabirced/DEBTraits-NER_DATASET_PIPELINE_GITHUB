  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_chalcoides
  
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_chalcoides'; 
metaData.species_en = 'Danube bleak'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-W'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 01];

%% set data
% zero-variate data
data.ab = 11;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'SiniPetr1995';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.8;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'guess';
  comment.Lp = 'based in Alburnus alburnus: 9.9*40/25';
data.Li = 40;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SiniPetr1995';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 34;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00617*Lp^3.12,  see F1';
data.Wwi = 615; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.12, see F1';

data.GSI = 0.12;  units.GSI = 'g/g';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = 'guess'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Alburnus_belvica';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.23 
    2 13.13
    3 15.37
    4 18.73
    5 20.51
    6 22.83 
    7 25.20];
data.tL(:,1) = 365 * (0.9+data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'UnverErka2009'; 

% length-weight
data.LW = [ ... % total length (vm), weight (g)
8.625	6.916
9.522	7.543
10.232	11.506
10.346	12.775
10.460	13.726
10.715	11.502
10.876	11.977
10.896	14.675
11.174	12.768
11.240	16.101
11.403	14.195
11.470	16.099
11.538	17.686
11.742	21.018
11.933	13.556
12.200	24.030
12.224	23.395
12.363	22.283
12.521	25.139
12.820	26.247
12.888	26.564
13.004	25.770
13.025	27.833
13.026	26.881
13.028	24.976
13.116	29.420
13.117	28.785
13.144	24.022
13.165	25.768
13.207	30.371
13.313	41.640
13.348	27.513
13.351	24.338
13.441	26.084
13.463	27.671
13.489	24.496
13.508	28.782
13.532	26.877
13.574	31.956
13.621	30.685
13.623	28.622
13.668	30.209
13.761	28.938
13.762	27.827
13.763	26.875
13.849	33.382
13.875	30.048
13.918	33.064
13.931	45.127
13.945	28.778
13.947	26.715
13.995	51.159
14.011	31.952
14.013	30.524
14.013	29.571
14.124	34.967
14.144	38.776
14.172	32.586
14.175	29.094
14.213	38.776
14.242	31.950
14.261	36.553
14.263	34.014
14.266	29.728
14.354	35.283
14.360	28.457
14.421	37.346
14.487	40.678
14.494	33.059
14.499	27.345
14.539	34.329
14.560	36.710
14.583	36.392
14.627	38.773
14.679	31.312
14.699	35.121
14.720	37.343
14.722	35.280
14.723	34.645
14.740	41.311
14.765	39.089
14.794	32.105
14.797	27.819
14.860	35.914
14.879	40.040
14.880	38.771
14.904	38.294
14.904	37.342
14.951	36.389
14.954	33.373
14.969	42.262
14.999	34.801
15.004	28.293
15.014	43.690
15.019	38.135
15.040	40.674
15.053	51.309
15.057	47.658
15.086	40.039
15.103	46.705
15.105	45.277
15.108	41.785
15.113	35.753
15.152	43.689
15.154	40.832
15.202	38.609
15.202	38.609
15.205	36.070
15.289	45.117
15.316	40.672
15.357	46.386
15.429	42.735
15.451	43.845
15.500	40.194
15.542	45.749
15.545	41.622
15.563	47.972
15.565	44.797
15.567	43.368
15.587	46.860
15.588	45.590
15.613	43.368
15.632	47.495
15.675	50.510
15.726	45.431
15.740	55.272
15.752	41.938
15.756	37.176
15.770	47.176
15.791	49.557
15.795	45.906
15.819	44.319
15.836	50.827
15.850	61.779
15.861	48.445
15.887	45.747
15.904	52.731
15.913	42.413
15.970	28.921
15.978	46.540
16.003	44.793
16.005	42.254
16.018	53.365
16.027	43.365
16.053	39.872
16.069	47.968
16.072	44.158
16.136	50.030
16.178	55.268
16.202	53.363
16.204	51.617
16.249	52.411
16.290	58.759
16.294	53.997
16.299	48.442
16.300	46.378
16.320	50.346
16.350	41.775
16.360	57.172
16.362	55.584
16.416	46.060
16.438	47.012
16.543	58.281
16.590	57.170
16.592	54.789
16.617	53.519
16.700	62.883
16.706	56.375
16.726	59.550
16.751	58.121
16.756	52.248
16.793	62.247
16.880	67.802
16.886	61.771
16.911	59.389
16.941	50.659
16.957	31.929
16.976	63.516
16.979	60.500
17.030	54.944
17.077	53.039
17.091	63.991
17.113	65.420
17.119	57.959
17.120	57.324
17.121	56.054
17.127	48.594
17.160	63.356
17.161	62.086
17.187	58.911
17.196	49.070
17.198	72.720
17.255	60.339
17.269	70.815
17.272	67.323
17.296	66.370
17.440	58.909
17.618	66.209
17.648	58.272
17.743	55.097
17.757	65.414
17.765	56.525
17.896	64.302
17.897	63.350
17.915	68.588
17.937	70.016
17.944	35.254
18.008	67.952
18.014	60.492
18.152	61.284
18.196	62.871
18.218	64.300
18.237	68.903
18.245	60.490
18.313	34.458
18.327	71.600
18.353	68.426
18.535	70.170
18.649	71.757
18.683	32.391
18.743	69.692
18.750	61.597
18.994	72.547];
units.LW = {'cm','g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'UnverErka2009'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LW = 5 * weights.LW;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
%auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females,males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00617*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Caspian, mostly western to southern coast, rarely found in Ural and Volga';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGX3'; % Cat of Life
metaData.links.id_ITIS = '688380'; % ITIS
metaData.links.id_EoL = '46581705'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_chalcoides'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_belvica'; % ADW
metaData.links.id_Taxo = '240437'; % Taxonomicon
metaData.links.id_WoRMS = '307757'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-chalcoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_chalcoides}}';  
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
bibkey = 'UnverErka2009'; type = 'article'; bib = [ ... 
'author = {B\"{u}lent \"{U}nver and F\"{u}sun Erk''akan}, ' ...
'year = {2009}, ' ...
'title = {Population structure and growth properties of \emph{Alburnus chalcoides} ({G}"{u}ldenst\"{a}dt, 1772) from T\"{o}d\"{u}rge Lake}, ' ... 
'journal = {E.U. Journal of Fisheries \& Aquatic Sciences}, ' ...
'volume = {26(4)}, ' ...
'pages = {261–266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-chalcoides}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

