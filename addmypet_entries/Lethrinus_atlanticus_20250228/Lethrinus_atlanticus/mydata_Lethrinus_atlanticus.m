function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_atlanticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_atlanticus'; 
metaData.species_en = 'Atlantic emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 28];

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 22.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 150;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.95, see F1';
data.Wwi = 1520;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.95, see F1';

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
323.514	7.766
351.201	9.920
365+49.055	13.926
365+107.701	15.770
365+144.687	16.178
365+169.943	16.290
365+202.299	16.880
365+234.286	17.952
365+263.085	18.543
365+291.159	19.616
365+323.526	19.845
730+16.809	21.929
730+107.520	22.140
730+262.577	23.892];
data.tL(:,1) = data.tL(:,1) - 150;  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KonnNii2023'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
6.427	4.182
6.921	6.432
7.200	3.660
7.478	4.786
7.755	8.696
7.972	6.478
8.065	7.596
8.219	12.057
8.343	7.609
8.589	10.960
8.837	7.631
8.929	13.759
9.084	8.198
9.176	14.884
9.331	14.891
9.393	9.326
9.578	16.572
9.795	11.571
10.041	16.593
10.350	17.163
10.380	22.176
10.751	22.192
10.845	16.072
10.998	24.431
11.061	19.422
11.093	8.845
11.431	25.007
11.461	27.235
11.677	30.029
11.833	21.127
12.046	45.079
12.049	27.261
12.172	31.164
12.441	106.343
12.511	38.975
12.512	25.612
12.604	31.184
12.724	59.585
12.728	27.848
12.847	66.829
12.850	40.103
12.913	32.311
13.067	35.659
13.253	36.224
13.254	28.429
13.404	60.173
13.433	74.094
13.468	46.256
13.468	42.358
13.470	30.665
13.593	34.012
13.778	36.247
13.779	31.236
13.807	49.611
13.962	50.732
13.962	43.494
14.056	37.930
14.087	36.261
14.148	46.286
14.455	55.765
14.457	46.856
14.548	59.667
14.550	40.179
14.702	58.003
14.766	46.870
14.768	30.166
14.889	51.330
14.890	42.978
14.979	68.595
15.045	39.087
15.169	32.968
15.197	57.468
15.197	53.014
15.198	49.117
15.200	35.197
15.505	64.720
15.507	51.357
15.569	43.565
15.599	58.043
15.632	35.773
15.814	66.405
15.815	55.826
15.850	26.874
15.907	61.398
15.940	44.695
15.969	60.287
16.001	53.050
16.093	57.508
16.095	38.021
16.184	67.535
16.247	61.970
16.307	74.778
16.371	58.078
16.431	69.216
16.435	40.263
16.523	77.015
16.525	60.868
16.587	63.098
16.648	69.782
16.651	40.829
16.802	70.903
17.080	74.813
17.140	84.281
17.174	65.908
17.296	77.050
17.450	79.284
17.451	71.489
17.574	74.835
17.635	85.973
17.726	93.216
17.787	100.457
17.790	80.412
17.882	86.541
17.975	83.761
18.065	102.140
18.129	89.893
18.282	94.911
18.284	86.002
18.497	106.613
18.529	100.490
18.591	96.038
18.620	111.073
18.716	90.476
18.745	102.170
18.838	101.617
18.940	29.239
19.085	99.401
19.145	113.880
19.299	122.239
19.330	118.900
19.332	101.639
19.394	104.983
19.424	113.336
19.546	125.034
19.547	116.682
19.609	111.117
19.854	129.502
19.887	115.584
20.038	139.533
20.132	133.412
20.407	156.253
20.470	149.017
20.532	145.679
20.656	142.901
20.750	134.553
20.751	123.974
20.995	146.814
20.997	132.337
21.213	138.471
21.796	166.337
21.830	146.851
22.106	159.669
22.198	167.468
22.382	180.840
22.506	172.493
23.400	196.475];
units.LW   = {'d', 'cm'};  label.LW = {'total length','weight'};  
bibkey.LW = 'KonnNii2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PQMZ'; % Cat of Life
metaData.links.id_ITIS = '169149'; % ITIS
metaData.links.id_EoL = '46580959'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_atlanticus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_atlanticus'; % ADW
metaData.links.id_Taxo = '45297'; % Taxonomicon
metaData.links.id_WoRMS = '278633'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-atlanticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_atlanticus}}';
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
bibkey = 'KonnNii2023'; type = 'Article'; bib = [ ... 
'doi = {10.4314/br.v21i1.2}, ' ...
'author = {Amponsah Samuel Kweku Konney and Commeyn Nii and Awornyom Selasi and Henneh Samuel}, ' ... 
'year = {2023}, ' ...
'title = {Growth, mortality and exploitation rates of \emph{Lethrinus atlanticus} in the marine waters of {G}hana, {W}est {A}frica}, ' ...
'journal = {Journal of Biological Research \& Biotechnology}, ' ...
'volume = {21(1)}, ' ...
'pages = {1778-1788}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-atlanticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
