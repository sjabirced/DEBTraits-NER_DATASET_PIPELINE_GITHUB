function [data, auxData, metaData, txtData, weights] = mydata_Garra_rufa
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Garra_rufa'; 
metaData.species_en = 'Red garra '; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 14];

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'CiceSece2021';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 8;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 17;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'CiceSece2021'; 
  
data.Wwb = 4.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AbedShiv2011';
  comment.Wwb = 'based on egg diameter of 1.98 mm: pi/6*0.198^3';
data.Wwp = 7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'CiceSece2021','guess'};
  comment.Wwp = 'fishbase: 0.01047*Lp^3.02, see F1, gives 0.7 g';
data.Wwi = 70;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'CiceSece2021';
  comment.Wwi = 'fishbase: 0.00832*Li^3.05, see F1, gives 54.4 g';

data.Ri = 3794/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'AbedShiv2011';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
    0  5.31  2.08
    1  8.86  9.15
    2 11.57 20.00
    3 13.45 30.58
    4 15.04 38.61
    5 16.29 62.34];
data.tLW(:,1) = 365*(0.8+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(20);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'CiceSece2021'; treat.tLW = {1 {'length','weight'}};
 
% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.884	0.471
3.163	1.090
3.186	0.843
3.256	1.245
3.326	1.246
3.489	1.093
3.535	0.631
3.721	1.250
3.744	0.171
3.954	1.252
4.070	0.636
4.187	1.716
4.372	1.256
4.489	2.028
4.582	2.799
4.721	1.413
4.815	2.493
4.861	1.415
5.024	2.341
5.047	1.879
5.186	1.109
5.210	3.114
5.303	2.035
5.512	0.958
5.606	3.272
5.628	1.884
5.838	2.965
5.977	1.734
5.978	4.508
6.001	3.121
6.141	3.585
6.326	1.737
6.397	4.512
6.443	2.509
6.513	3.126
6.723	7.598
6.745	4.207
6.792	3.129
6.792	5.441
6.932	6.675
7.071	4.210
7.327	4.059
7.327	5.754
7.443	4.831
7.652	4.370
7.676	6.220
7.909	5.298
7.909	7.147
7.955	4.065
8.258	7.151
8.398	8.848
8.513	5.458
8.654	9.004
8.677	7.771
8.748	11.471
8.769	5.768
8.909	8.082
8.933	9.623
9.166	11.475
9.212	9.164
9.258	7.777
9.445	9.937
9.515	11.941
9.539	13.020
9.561	8.705
9.676	6.702
9.725	12.406
9.934	13.795
10.003	9.325
10.003	11.175
10.098	17.958
10.120	12.872
10.282	10.253
10.283	13.952
10.307	16.111
10.376	11.949
10.401	19.194
10.491	8.559
10.609	15.497
10.656	17.810
10.727	19.198
10.748	14.265
10.819	16.578
10.844	21.665
10.910	10.721
10.912	17.812
10.984	23.362
11.029	18.892
11.074	15.501
11.145	17.198
11.192	19.664
11.401	19.204
11.422	13.347
11.424	16.892
11.541	22.288
11.561	11.190
11.587	17.973
11.587	19.668
11.704	20.594
11.749	17.512
11.751	21.982
11.775	24.448
11.796	19.824
11.888	16.434
11.934	13.814
11.982	18.285
12.026	10.578
12.030	22.293
12.122	18.594
12.124	25.531
12.146	20.753
12.170	23.990
12.213	13.046
12.310	26.149
12.358	32.315
12.378	21.371
12.402	24.146
12.422	11.815
12.427	27.229
12.518	20.294
12.539	13.666
12.542	25.689
12.611	22.607
12.660	28.773
12.660	31.548
12.772	15.980
12.799	29.853
12.802	37.560
12.822	28.775
12.845	26.308
12.870	32.320
12.934	14.132
12.958	17.215
13.054	25.232
13.168	17.525
13.194	28.007
13.240	26.158
13.266	34.174
13.288	31.091
13.453	38.337
13.473	28.010
13.474	31.401
13.475	32.943
13.499	35.409
13.523	40.342
13.540	16.758
13.567	29.552
13.616	39.110
13.749	16.606
13.775	26.626
13.800	33.717
13.802	38.187
13.847	34.642
13.869	28.476
13.871	36.029
13.959	20.462
13.982	18.766
13.986	32.485
14.055	28.170
14.246	46.823
14.265	32.950
14.311	31.101
14.473	25.862
14.478	45.592
14.592	36.653
14.612	24.630
14.689	51.143
14.711	46.982
14.828	49.911
14.914	24.479
14.987	34.499
15.060	46.368
15.078	27.563
15.108	51.301
15.129	42.978
15.342	56.082
15.551	54.234
15.572	48.685
15.588	23.715
15.733	42.984
15.852	51.617
15.942	39.286
16.228	64.723
16.299	68.885
16.343	58.250
16.597	54.861
16.857	69.353];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'CiceSece2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'In the Jordan, Orontes, and Tigris-Euphrates river basins. Also in some coastal rivers in southern Turkey and northern Syria';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3FBMD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '357123'; % Ency of Life
metaData.links.id_Wiki = 'Garra_rufa'; % Wikipedia
metaData.links.id_ADW = 'Garra_rufa'; % ADW
metaData.links.id_Taxo = '174778'; % Taxonomicon
metaData.links.id_WoRMS = '1312572'; % WoRMS
metaData.links.id_fishbase = 'Garra-rufa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Garra_rufa}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Garra-rufa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'CiceSece2021'; type = 'article'; bib = [ ...
'author = {Erdo\v{g}an \c{C}i\c{c}ek and Burak Se\c{c}er and Selda \"{O}zt\"{u}k and Sevil Sungur}, ' ...
'year = {2021}, ' ...
'title  = {Age and Growth of \emph{Garra rufa} ({H}eckel, 1843) from {M}erzimen {S}tream, {E}uphrates {R}iver {B}asin, {T}urkey}, ' ...
'journal = {Journal of Limnology and Freshwater Fisheries Research}, ' ...
'volume = {7(1)}, ' ...
'pages = {77-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'AbedShiv2011'; type = 'article'; bib = [ ...
'author = {Masoud Abedi and Amir Houshang Shiva and Hamid Mohammadi and Rokhsareh Malekpour}, ' ...
'year = {2011}, ' ...
'title  = {Reproductive biology and age determination of \emph{Garra rufa} {H}eckel, 1843 ({A}ctinopterygii: {C}yprinidae) in central {I}ran}, ' ...
'journal = {Turk. J. Zool.}, ' ...
'volume = {35(3)}, ' ...
'pages = {317-323}'];
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

