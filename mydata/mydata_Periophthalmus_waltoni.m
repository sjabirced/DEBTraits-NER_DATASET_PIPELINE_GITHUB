function [data, auxData, metaData, txtData, weights] = mydata_Periophthalmus_waltoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Periophthalmus_waltoni'; 
metaData.species_en = 'Waltson''s mudskipper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'SharTahe2018';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'SharTahe2018'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 4.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'SharTahe2018','fishbase'};
  comment.Wwp = 'based on 0.01023*Lp^2.96, see F1';
data.Wwi = 31;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.96, see F1';


% uni-variate data
% time-length
data.tL = [... %  time (d), total length (cm)
349.077	6.518
365+14.083	6.875
365+45.427	8.036
365+76.113	8.482
365+104.749	9.018
365+135.440	9.286
365+167.485	9.911
365+194.080	10.268
365+224.083	10.714
365+254.093	10.982
365+286.834	11.161
365+316.847	11.339
365+349.579	11.786
730+13.901	12.232
730+43.904	12.679
730+105.303	12.768
730+134.618	13.393
730+164.634	13.482
730+195.341	13.304
730+256.033	14.107
730+286.058	13.929
730+316.756	14.018
1095+105.909	15.000
1095+134.560	15.089
1095+285.327	15.357];
data.tL(:,1) = data.tL(:,1) - 30; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SharTahe2018';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.615	1.744
5.803	1.628
5.879	1.977
6.144	2.326
6.218	1.860
6.369	1.977
6.408	2.442
6.446	2.791
6.559	2.907
6.673	3.372
6.747	2.907
6.898	2.791
7.011	3.023
7.163	3.488
7.314	3.605
7.428	4.070
7.539	3.023
7.540	3.837
7.692	4.535
7.766	3.837
7.879	3.837
7.914	2.558
7.956	4.767
7.996	5.698
8.220	4.884
8.221	5.581
8.225	7.674
8.296	5.000
8.297	5.698
8.487	6.628
8.523	5.930
8.524	6.047
8.635	5.116
8.713	6.512
8.713	6.512
8.749	5.930
8.823	4.884
8.863	6.279
8.902	6.860
8.934	4.070
8.973	4.535
9.017	8.256
9.053	7.093
9.087	5.000
9.163	5.814
9.197	3.721
9.204	7.558
9.313	5.000
9.316	6.860
9.429	6.744
9.505	7.209
9.511	10.116
9.544	8.023
9.583	8.721
9.584	9.070
9.615	5.349
9.693	6.977
9.699	10.000
9.736	9.767
9.805	6.512
9.808	7.907
9.847	8.837
9.879	5.581
9.882	7.326
9.886	9.419
9.994	6.977
10.038	10.000
10.072	8.372
10.147	8.023
10.150	9.651
10.260	8.140
10.264	10.116
10.266	11.279
10.299	8.953
10.341	10.930
10.342	11.395
10.378	10.465
10.416	10.814
10.452	9.767
10.456	12.209
10.487	8.721
10.533	13.023
10.600	8.372
10.601	9.302
10.602	9.767
10.639	9.070
10.642	11.047
10.646	13.256
10.683	12.558
10.716	10.349
10.718	11.395
10.826	8.372
10.833	12.442
10.907	11.744
10.947	13.023
11.018	10.349
11.018	10.581
11.021	12.326
11.057	11.279
11.060	13.023
11.133	11.744
11.137	13.721
11.149	20.233
11.174	13.488
11.175	13.953
11.176	14.651
11.206	10.581
11.254	15.698
11.360	12.209
11.368	16.163
11.472	11.744
11.473	11.977
11.513	13.140
11.515	14.419
11.517	15.465
11.549	12.442
11.585	11.512
11.590	14.535
11.668	15.465
11.670	16.628
11.700	12.442
11.704	14.884
11.705	15.116
11.707	16.628
11.710	18.140
11.711	18.372
11.739	13.372
11.781	15.930
11.821	17.093
11.851	12.907
11.853	14.070
11.896	16.860
11.934	16.744
11.975	18.605
12.004	14.070
12.006	15.000
12.010	17.442
12.050	18.372
12.063	25.698
12.084	16.512
12.158	15.930
12.160	16.860
12.164	19.070
12.194	15.116
12.267	13.837
12.268	14.535
12.273	16.860
12.275	18.256
12.312	17.674
12.353	19.302
12.384	15.930
12.426	18.140
12.458	15.000
12.503	19.070
12.538	17.442
12.572	15.581
12.579	19.651
12.610	16.047
12.615	18.721
12.656	20.349
12.674	10.116
12.770	20.930
12.803	18.256
12.804	18.837
12.805	19.535
12.876	17.093
12.878	18.256
12.961	22.326
12.999	22.674
13.031	19.419
13.033	20.698
13.106	19.186
13.108	20.233
13.143	18.953
13.147	20.930
13.149	21.860
13.176	16.395
13.302	23.372
13.372	20.698
13.374	21.395
13.374	21.395
13.375	22.093
13.415	23.140
13.484	19.767
13.526	22.326
13.530	24.186
13.562	21.512
13.600	21.512
13.633	19.302
13.678	23.256
13.749	20.581
13.751	21.860
13.793	23.837
13.878	29.070
13.947	25.930
14.015	21.744
14.017	22.907
14.101	27.791
14.138	27.209
14.150	33.488
14.169	23.488
14.202	21.512
14.204	22.093
14.209	25.233
14.211	26.163
14.339	34.186
14.365	27.674
14.472	24.419
14.510	24.767
14.598	31.744
14.974	31.163
15.009	29.767
15.125	31.628
15.199	30.465];
units.LW  = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'SharTahe2018';
    
% length-fecundity
data.LN = [ % total length(cm), fecundity (#)
7.969	991.753
8.369	1637.740
8.502	1601.574
9.082	2965.801
9.437	3108.877
9.523	2462.015
9.609	1815.154
9.660	3647.398
9.695	1240.149
9.828	1311.766
10.007	1778.511
10.053	2281.422
10.186	2460.823
10.226	1239.195
10.273	1921.746
10.365	2891.640
10.370	4292.828
10.408	2496.354
10.669	1238.400
10.715	1741.311
10.808	3142.341
10.896	2890.686
11.071	2423.306
11.114	1956.163
11.119	3393.279
11.159	2243.507
11.163	3213.560
11.300	4363.015
11.603	2673.847
11.649	3248.614
11.652	4039.028
11.659	5763.567
11.700	5009.002
11.780	2565.745
11.780	2601.673
11.823	2242.315
11.873	3894.919
12.049	3499.394
12.311	2744.431
12.312	2924.071
12.313	3103.710
12.500	6013.553
12.535	3318.880
12.799	3066.908
12.901	6767.323
13.244	3676.887
13.287	3389.385
13.612	7376.826
13.651	6155.198
14.318	7088.131
14.589	8596.626
16.942	10604.376
17.652	11034.239];
units.LN  = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(28.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SharTahe2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01023*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6V665'; % Cat of Life
metaData.links.id_ITIS = '637856'; % ITIS
metaData.links.id_EoL = '46576701'; % Ency of Life
metaData.links.id_Wiki = 'Periophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Periophthalmus_waltoni'; % ADW
metaData.links.id_Taxo = '183519'; % Taxonomicon
metaData.links.id_WoRMS = '277982'; % WoRMS
metaData.links.id_fishbase = 'Periophthalmus-waltoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Periophthalmus}}';
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
bibkey = 'SharTahe2018'; type = 'Article'; bib = [ ... 
'author = {Sana Sharifiana and Mohammad Reza Taherizadehb and Ali Salarpouric and Mohsen Dehghania}, ' ... 
'year = {2018}, ' ...
'title = {Population Dynamic of the Mudskipper \emph{Periophthalmus waltoni} {K}oumans, 1941 from the {B}ay of {H}ormozgan {P}rovince, {P}ersian {G}ulf}, ' ...
'journal = {Russian Journal of Marine Biology}, ' ...
'volume = {44(2)}, ' ...
'pages = {149–158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Periophthalmus-waltoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

