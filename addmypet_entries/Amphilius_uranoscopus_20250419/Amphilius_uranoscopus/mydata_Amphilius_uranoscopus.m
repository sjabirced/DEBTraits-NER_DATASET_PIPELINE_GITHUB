function [data, auxData, metaData, txtData, weights] = mydata_Amphilius_uranoscopus
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Amphiliidae';
metaData.species    = 'Amphilius_uranoscopus'; 
metaData.species_en = 'Stargazer mountain catfish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 19];

%% set data
% zero-variate data;

data.am = 6*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 28.5;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'NgugMany2009'; 

data.Wwb = 2.14; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 14.5 mm: pi/6*1.45^3';
data.Wwp  = 15.8; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.00490*Lp^3.15, see F1';
data.Wwi  = 187.5; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'NgugMany2009','fishbase'}; 
  comment.Wwi = 'based on 0.00490*Li^3.15, see F1';

data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'NgugMany2009';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 12.2
    2 19.2
    3 23.2
    4 25.5
    5 26.8
    6 27.5];
data.tL(:,1) = 365 * (data.tL(:,1) + 0); % conver yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NgugMany2009'; 

% length-weight
data.LW_f = [ ... % fork length (cm), weight (g)
7.994	4.729
8.702	8.246
8.974	8.251
9.301	8.647
9.437	9.818
9.546	9.430
9.927	10.995
9.982	10.996
10.118	12.167
10.471	11.784
10.798	12.180
11.070	10.239
11.125	14.522
11.398	17.252
11.806	18.039
11.941	12.591
12.050	14.151
12.296	19.606
12.296	20.774
12.459	20.387
12.567	15.329
12.677	23.117
12.813	18.448
13.195	24.295
13.303	21.961
13.522	26.637
13.548	20.019
13.821	24.307
13.902	21.583
14.094	29.762
14.392	25.097
14.611	32.108
14.856	31.334
14.911	34.450
15.129	38.347
15.130	41.851
15.345	29.008
15.374	40.687
15.456	43.414
15.946	40.699
16.026	32.136
16.028	44.204
16.109	37.587
16.219	45.375
16.381	37.593
16.463	42.266
16.818	46.555
17.226	48.120
17.417	54.353
17.552	43.844
17.692	65.647
17.877	39.179
17.879	49.301
17.963	60.203
18.046	67.990
18.288	53.980
18.425	61.379
18.644	64.109
18.778	56.326
18.915	60.221
19.049	50.102
19.080	67.621
19.160	61.783
19.461	68.018
19.516	72.301
19.842	71.529
20.635	96.070
20.769	81.668
21.912	82.859
22.296	102.720
22.463	121.409
22.707	116.743
23.555	144.010];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'fork length','weight','females'};  
temp.LW_f    = C2K(17);  units.temp.LW_f = 'K'; label.temp.LW_f = 'temperature';
bibkey.LW_f = 'NgugMany2009'; 
%
data.LW_m = [ ... % fork length (cm), weight (g)
9.301	7.479
9.954	7.103
9.981	8.660
10.253	9.444
10.471	9.838
10.525	9.060
10.607	9.451
10.770	8.286
10.852	11.402
11.044	16.078
11.097	11.018
11.206	12.188
11.561	15.698
11.587	11.027
11.778	13.756
11.941	12.591
11.969	14.538
12.050	12.983
12.105	17.266
12.213	14.154
12.322	12.210
12.350	15.324
12.459	18.052
12.513	13.381
12.622	17.666
12.649	15.330
12.785	16.112
12.786	20.004
12.948	15.725
13.031	20.399
13.085	18.453
13.112	18.064
13.249	20.792
13.302	18.068
13.521	21.965
13.547	18.462
13.629	19.242
13.712	24.694
13.793	21.192
13.983	22.364
14.037	19.640
14.147	25.481
14.337	22.760
14.418	19.258
14.447	27.433
14.528	26.267
14.555	22.764
14.773	26.661
15.019	29.002
15.045	25.888
15.099	23.942
15.154	22.386
15.155	31.340
15.399	28.620
15.481	25.896
15.509	35.240
15.510	38.354
15.591	33.684
15.808	30.185
15.890	35.247
16.026	31.357
16.054	34.472
16.245	37.590
16.353	35.256
16.434	31.754
16.489	36.038
16.734	38.378
16.925	37.603
16.979	37.215
17.062	44.613
17.063	48.506
17.143	40.333
17.198	41.891
17.280	48.510
17.361	41.894
17.387	37.612
17.497	44.622
17.550	36.058
17.634	49.296
17.715	46.572
17.906	44.630
18.069	47.747
18.070	52.030
18.123	41.130
18.205	42.300
18.342	50.478
18.450	46.587
18.479	53.205
18.505	49.702
18.505	51.259
18.832	52.434
18.861	62.167
18.943	63.725
19.132	57.890
19.133	61.393
19.134	65.286
19.323	59.450
19.486	57.118
19.514	60.622
19.569	67.630
19.594	49.723
19.596	63.349
19.730	49.337
20.034	76.593
20.740	72.714
20.956	62.597
20.957	69.215
21.064	57.538
21.069	87.514
21.533	91.416
21.559	87.134
21.584	75.845
21.612	79.349
21.754	113.220
22.048	79.358
22.075	82.083
22.104	91.037
22.456	83.648
22.593	88.711
22.786	99.226
23.140	101.958];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'fork length','weight','males'};  
temp.LW_m    = C2K(17);  units.temp.LW_m = 'K'; label.temp.LW_m = 'temperature';
bibkey.LW_m = 'NgugMany2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00490*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
F2 = 'widespread in Central and East Africa';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '66G4J'; % Cat of Life
metaData.links.id_ITIS = '679620'; % ITIS
metaData.links.id_EoL = '205436'; % Ency of Life
metaData.links.id_Wiki = 'Amphilius'; % Wikipedia
metaData.links.id_ADW = 'Amphilius_uranoscopus'; % ADW
metaData.links.id_Taxo = '160716'; % Taxonomicon
metaData.links.id_WoRMS = '1015825'; % WoRMS
metaData.links.id_fishbase = 'Amphilius-uranoscopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amphilius}}';
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
bibkey = 'NgugMany2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-2028.2009.01032.x}, ' ...
'author = {Charles C. Ngugi and Julius O. Manyala and Murithi Njiru and Chrisestom M. Mlewa},'...
'title = {Some aspects of the biology of the stargazer mountain catfish, \emph{Amphilius uranoscopus} ({P}feffer); ({S}iluriformes: {A}mphiliidae) indigenous to {K}enya streams},'...
'journal = {African Journal of Ecology}, '...
'volume = {47(4)}, '...
'year = {2009}, '...
'pages = {606-613}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amphilius-uranoscopus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

