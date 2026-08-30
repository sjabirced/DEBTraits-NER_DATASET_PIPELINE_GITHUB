  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_tarichi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_tarichi'; 
metaData.species_en = 'Tarek'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

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
data.ab = 10;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'InnaGull2019';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'guess';
  comment.Lp = 'based in Alburnus alburnus: 9.9*27.8/25';
data.Li = 27.8;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 3.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 and 1.14 mm of Alburnus alburnus: pi/6*0.09^3';
data.Wwp = 11.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00631*Lp^3.12,  see F1';
data.Wwi = 202; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'TahaEsma2018';
  comment.Wwi = 'based on 0.00631*Li^3.12, see F1; max. published weight: 172.42 g';

data.Ri = 5e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of Alburnus alburnus: 7000*44/60';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm), weight (g)
    0 10.18  7.94
    1 13.88 11.06
    2 16.56 13.44
    3 18.50 15.26
    4 19.90 16.65
    5 20.92 17.71];
data.tL_fm(:,1) = 365 * (0.9+data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(19);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'InnaGull2019'; treat.tL_fm = {1, {'females','males'}};

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
14.323	48.391
14.323	49.704
14.524	51.286
15.096	57.607
15.111	49.993
15.142	55.245
15.250	53.936
15.281	57.088
15.327	52.626
15.328	55.777
15.482	56.044
15.482	58.670
15.512	50.794
15.513	57.621
15.543	48.694
15.545	62.873
15.605	49.746
15.683	58.152
15.698	50.275
15.714	54.739
15.729	55.527
15.730	60.254
15.746	65.243
15.790	52.641
15.837	51.855
15.838	63.933
15.900	65.511
15.930	59.735
15.945	56.847
16.023	60.789
16.114	45.824
16.117	66.831
16.147	61.318
16.178	65.520
16.209	68.147
16.210	70.773
16.224	59.220
16.226	73.137
16.240	62.109
16.255	63.685
16.285	52.394
16.286	66.311
16.317	62.636
16.330	48.457
16.333	67.101
16.379	68.415
16.425	60.277
16.426	69.467
16.426	70.517
16.457	73.669
16.470	54.239
16.550	72.885
16.580	63.958
16.610	62.908
16.657	65.273
16.673	70.788
16.734	62.387
16.736	75.516
16.796	65.540
16.796	68.954
16.828	70.530
16.843	67.380
16.904	68.432
16.936	69.484
16.936	75.523
17.013	72.900
17.028	67.123
17.043	66.336
17.106	77.629
17.136	70.541
17.200	81.571
17.229	67.918
17.260	72.383
17.336	64.245
17.370	81.839
17.384	74.487
17.432	84.205
17.445	65.824
17.462	76.591
17.522	66.615
17.523	71.078
17.555	83.421
17.555	84.471
17.584	68.192
17.585	74.757
17.633	89.988
17.647	78.960
17.676	66.882
17.738	62.945
17.739	73.186
17.740	77.125
17.742	93.668
17.756	86.578
17.788	91.306
17.832	78.441
17.912	93.148
17.925	78.969
17.939	65.053
17.941	85.272
18.112	87.903
18.143	94.206
18.219	81.867
18.250	80.555
18.327	81.083
18.360	96.051
18.389	82.398
18.389	83.711
18.559	86.342
18.574	83.192
18.605	83.718
18.730	96.326
18.963	99.222];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'females'};  
bibkey.LW_f = 'InnaGull2019';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
14.529	49.434
14.790	50.605
14.804	52.491
15.285	55.306
15.299	58.606
15.505	58.364
15.601	56.711
15.615	60.718
15.629	52.702
15.725	54.350
15.739	56.235
15.766	58.120
15.835	59.533
15.849	55.525
15.959	64.952
15.986	50.098
16.000	59.764
16.014	57.877
16.027	52.926
16.096	51.745
16.206	57.164
16.275	65.414
16.371	70.126
16.371	66.118
16.399	74.605
16.412	68.710
16.412	64.703
16.426	61.637
16.467	64.701
16.522	61.634
16.550	67.763
16.577	48.195
16.660	75.540
16.674	71.296
16.674	73.418
16.701	61.158
16.715	67.287
16.784	65.399
16.811	69.642
16.825	55.260
16.852	71.998
16.893	62.802
16.935	63.980
16.990	75.766
16.990	71.051
17.058	68.456
17.100	65.625
17.196	72.224
17.210	64.679
17.278	73.164
17.375	70.804
17.388	74.104
17.402	78.112
17.430	72.453
17.430	70.802
17.471	68.443
17.663	84.233
17.663	73.860
17.787	84.230
17.801	82.343
17.801	66.783
17.883	95.072
17.883	67.724
17.897	79.511
17.938	78.096
17.993	73.143
18.007	76.679
18.007	72.200
18.034	86.344
18.103	78.798
18.117	92.707
18.158	64.180
18.186	96.477
18.186	93.648
18.213	79.031
18.364	87.985
18.364	83.034
18.447	82.089
18.570	97.173
18.667	83.968
18.694	82.789
18.749	86.323
18.790	82.550
18.914	83.725];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'males'};  
bibkey.LW_m = 'InnaGull2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 15 * weights.tL_fm;

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
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females,males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00631*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to Lake Van Golu, Turkey';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGZM'; % Cat of Life
metaData.links.id_ITIS = '688383'; % ITIS
metaData.links.id_EoL = '210106'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_tarichi'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_tarichi'; % ADW
metaData.links.id_Taxo = '160311'; % Taxonomicon
metaData.links.id_WoRMS = '1026599'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-tarichi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_tarichi}}';  
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
bibkey = 'BostPola2011'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2010.01468.x}, ' ...
'author = {D. Bostanc{\i} and N. Polat}, ' ...
'year = {2011}, ' ...
'title = {Age and growth of \emph{Alburnus tarichi} ({G}uldenstadt, 1814): an endemic fish species of {L}ake {V}an ({T}urkey)}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {27}, ' ...
'pages = {1346–1349}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-tarichi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

