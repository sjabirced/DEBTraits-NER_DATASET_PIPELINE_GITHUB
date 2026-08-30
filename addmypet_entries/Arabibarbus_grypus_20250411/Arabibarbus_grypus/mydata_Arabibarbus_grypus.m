  function [data, auxData, metaData, txtData, weights] = mydata_Arabibarbus_grypus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Arabibarbus_grypus'; 
metaData.species_en = 'Shabout'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 11];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 70;  units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'guess'; 
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 2998;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty\';          bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00525*Lp^3.12, see F1';
data.Wwi = 32327; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.12, see F1; max. published weight: 30.0 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'AbduMoha2019';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 20.2
    2 32.0
    3 39.0
    4 43.9
    5 48.3];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MohaAlJu2019'; 

    
% length-weight
data.LW = [ ... %  total length (cm), weight (g)
18.097	70.265
18.769	88.308
19.741	93.497
21.387	93.568
21.834	103.881
21.909	109.031
22.953	134.811
24.524	140.026
25.417	178.667
25.575	101.468
25.948	109.204
26.019	147.810
26.321	127.235
27.658	209.645
27.882	219.949
28.334	183.939
28.635	173.658
28.910	397.567
29.076	245.736
29.156	194.268
29.444	299.795
29.454	207.149
29.597	268.920
30.052	214.895
30.272	256.081
30.492	299.840
30.574	225.212
30.642	289.553
31.096	243.249
31.315	297.302
31.324	209.803
31.622	222.683
31.759	338.498
31.905	377.107
31.919	245.858
32.062	310.202
32.358	335.950
32.814	266.484
32.817	238.176
32.874	405.457
33.032	328.258
33.251	384.885
33.340	251.066
33.555	341.148
33.561	276.810
33.771	415.790
34.006	315.432
34.012	261.389
34.081	318.009
34.147	395.218
34.678	325.755
34.895	400.397
34.974	356.650
35.205	294.896
35.267	418.428
35.496	374.687
35.500	338.658
35.726	323.227
36.027	305.225
36.171	359.275
36.179	284.643
36.392	387.594
36.684	462.238
36.838	418.495
36.904	500.851
36.920	349.013
37.441	374.771
37.504	488.009
37.513	400.509
37.659	441.692
37.869	570.377
37.889	387.658
37.955	467.440
38.408	426.283
38.486	403.125
38.558	428.863
38.623	521.513
38.628	467.469
39.296	516.395
39.367	555.001
39.382	413.457
39.453	452.063
39.612	364.570
39.748	488.105
39.753	444.355
39.960	603.923
40.043	531.868
40.125	459.812
40.337	575.630
40.419	508.722
40.586	349.170
40.858	606.535
41.085	580.810
41.095	485.589
41.314	537.069
41.623	447.009
41.685	562.821
42.063	526.807
42.948	652.948
43.020	676.113
44.520	645.295
44.896	622.149
45.110	717.379
45.337	696.801
45.489	671.072
47.998	995.444
48.451	959.434
48.833	889.965
49.047	987.769
49.052	938.872
49.796	977.507
50.057	1330.091
50.317	1003.264
50.321	959.514
50.582	1317.246
50.739	1255.488
50.968	1209.175
51.128	1108.814
51.492	1204.050
51.513	1013.610];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'AbduMoha2019'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00525*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Tigris-Euphrates basin in Iraq and Syria, rivers of southern Iran and possibly Orontes River';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'G24W'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49803211'; % Ency of Life
metaData.links.id_Wiki = 'Arabibarbus_grypus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5258602'; % Taxonomicon
metaData.links.id_WoRMS = '1044791'; % WoRMS
metaData.links.id_fishbase = 'Arabibarbus-grypus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Arabibarbus_grypus}}';  
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
bibkey = 'MohaAlJu2019'; type = 'Article'; bib = [ ...  
'author = {Abdul-Razak M. Mohamed and Mohanad O.A. Al-Jubouri}, ' ...
'year = {2019}, ' ...
'title = { Growth and Exploitation Rates of Four Cyprinids Fish  in {A}l-{D}iwaniya {R}iver, {I}raq}, ' ... 
'journal = {IOSR Journal of Agriculture and Veterinary Science (IOSR-JAVS)}, ' ...
'volume = {12(8)}, '...
'pages = {58-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AbduMoha2019'; type = 'Article'; bib = [ ...  
'doi = {10.29196/jubpas.v27i2.2223}, ' ...
'author = {Mohanad Obayes Abdullah and Jubouri Abdul-Razak M Mohamed}, ' ...
'year = {2019}, ' ...
'title = {Some Biological Aspects of Al-Shabbot \emph{Arabibarbus grypus} ({H}eckel, 1843) in {A}l-{D}iwanyia {R}iver, {M}iddle of {I}raq}, ' ... 
'journal = {Journal of University of Babylon for Pure and Applied Sciences}, ' ...
'volume = {27(2)}, '...
'pages = {306-316}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Arabibarbus-grypus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

