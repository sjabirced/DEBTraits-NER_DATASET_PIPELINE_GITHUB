function [data, auxData, metaData, txtData, weights] = mydata_Zacco_platypus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Zacco_platypus'; 
metaData.species_en = 'Freshwater minnow'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 02];

%% set data
% zero-variate data

data.ab = 8.5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 150;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'YanYan2012'; 
data.Li = 22.5;    units.Li = 'cm'; label.Li = 'ultimate total length';     bibkey.Li = 'fishbase'; 
  
data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'YanYan2012';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 10;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'YanYan2012','fishbase'};
  comment.Wwp = 'based on 0.00813*Lp^3.10, see F1';
data.Wwi = 126;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.10, see F1; max. published weight: 387.80 g (probably an error)';

data.GSI = 0.07;  units.GSI = 'g/g';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = 'BaeWang2024'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.110	0.421
5.212	1.448
5.397	1.192
5.847	2.349
5.971	1.453
6.751	2.100
6.854	1.459
7.180	4.154
7.242	3.257
7.324	3.898
7.353	18.514
7.364	5.565
7.406	3.771
7.428	1.720
7.506	6.592
7.651	5.183
7.670	7.362
7.714	4.029
7.776	3.132
7.877	5.441
7.917	6.467
8.041	4.801
8.123	5.314
8.204	6.853
8.303	11.598
8.308	4.547
8.328	5.957
8.389	6.855
8.492	5.830
8.512	6.984
8.552	8.138
8.610	12.369
8.613	8.267
8.718	6.088
8.720	3.524
8.736	8.780
8.738	6.857
8.776	10.447
8.819	7.242
8.838	9.550
8.897	12.628
8.898	11.346
8.903	4.935
8.923	6.602
8.958	13.397
8.986	4.295
9.044	8.270
9.045	6.988
9.047	4.680
9.065	7.629
9.108	5.834
9.123	11.860
9.125	9.937
9.188	8.655
9.211	5.835
9.225	12.758
9.268	10.835
9.285	14.938
9.289	10.323
9.333	6.477
9.348	12.759
9.394	7.503
9.432	11.478
9.454	9.042
9.495	9.555
9.575	11.863
9.578	8.530
9.596	10.838
9.620	7.120
9.630	19.684
9.658	11.223
9.659	9.172
9.677	12.377
9.677	12.120
9.682	6.351
9.720	10.839
9.740	11.480
9.758	13.531
9.825	7.121
9.864	10.199
9.927	8.532
9.941	15.840
9.945	11.609
9.990	6.353
10.009	7.764
10.047	12.251
10.049	9.046
10.069	10.328
10.071	8.021
10.109	11.482
10.189	13.406
10.211	11.740
10.216	6.355
10.229	14.688
10.233	10.329
10.254	9.945
10.255	8.791
10.256	7.637
10.271	14.432
10.374	13.151
10.392	16.228
10.417	11.485
10.435	13.792
10.480	9.177
10.492	19.947
10.496	15.331
10.519	11.614
10.619	15.204
10.620	13.409
10.639	15.589
10.663	11.871
10.664	10.076
10.668	5.717
10.677	19.051
10.720	16.615
10.770	6.231
10.784	13.795
10.848	11.231
10.866	14.693
10.905	17.257
10.950	12.001
11.023	22.643
11.092	13.797
11.130	17.387
11.132	14.951
11.149	19.182
11.152	16.233
11.217	12.388
11.260	9.824
11.312	21.235
11.318	13.542
11.356	17.517
11.522	14.954
11.619	22.391
11.623	17.262
11.681	21.494
11.762	22.648
11.766	18.033
11.890	17.264
11.924	25.854
11.971	18.675
12.011	19.573
12.014	15.470
12.038	11.881
12.140	12.907
12.330	6.626
12.339	20.088
12.343	14.703
12.689	18.680
12.772	17.399
12.891	23.041
13.339	27.146
14.693	27.412
15.392	26.520];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight','Huishui Stream'};  
bibkey.LW = 'YanYan2012';
%
data.LW1 = [ ... % total length (cm), weight (g)
3.701	0.294
3.955	1.030
4.230	0.396
4.632	1.236
4.737	1.867
4.970	1.445
5.161	1.128
5.414	1.232
5.541	1.231
5.774	1.545
5.964	2.702
6.154	1.754
6.196	2.806
6.408	2.384
6.556	2.278
6.598	3.330
6.746	2.382
6.978	4.065
7.063	3.117
7.190	4.800
7.444	3.325
7.486	4.798
7.739	5.113
7.761	3.534
7.888	3.954
7.929	7.006
7.950	5.954
8.142	4.163
8.268	6.268
8.395	5.004
8.521	6.582
8.606	6.160
8.627	7.844
8.691	4.897
8.923	7.843
8.924	5.632
9.028	9.210
9.093	4.473
9.219	8.262
9.260	9.841
9.262	6.156
9.367	8.156
9.452	6.576
9.493	10.155
9.535	9.629
9.685	6.786
9.767	11.838
9.833	5.732
9.958	10.468
9.959	7.521
9.980	9.415
10.022	8.678
10.063	11.520
10.275	11.835
10.276	8.045
10.297	9.729
10.338	11.098
10.572	9.307
10.655	12.675
10.762	10.674
10.909	12.357
10.950	15.094
10.971	16.568
11.036	10.988
11.121	12.146
11.141	15.093
11.225	16.461
11.245	17.829
11.372	17.197
11.437	13.407
11.438	11.828
11.458	14.565
11.479	13.933
11.563	16.880
11.563	15.406
11.669	15.090
11.689	17.721
11.709	20.353
11.858	18.773
11.882	11.931
11.941	21.720
11.986	17.404
12.029	14.561
12.090	20.245
12.112	18.982
12.113	16.140
12.133	19.929
12.239	18.771
12.300	23.718
12.365	20.033
12.410	15.191
12.430	17.822
12.449	21.506
12.535	19.085
12.662	19.505
12.768	18.662
12.811	17.083
12.830	22.136
12.849	25.609
12.852	19.609
12.894	20.872
12.937	18.451
13.062	22.345
13.064	17.608
13.145	25.923
13.275	19.922
13.316	21.396
13.357	26.659
13.442	24.027
13.609	30.447
13.631	27.078
13.653	25.499
13.694	29.394
13.799	31.393
13.823	24.235
13.842	28.656
13.927	27.077
13.969	28.761
14.013	24.760
14.034	25.813
14.074	30.023
14.095	30.970
14.098	22.760
14.160	28.023
14.179	32.444
14.264	30.548
14.352	23.811
14.501	20.336
14.559	34.126
14.625	27.599
14.709	29.072
14.750	33.809
14.750	31.598
14.773	28.651
14.941	30.334
14.981	36.228
15.151	33.806
15.194	32.227
15.237	30.964
15.341	36.647
15.655	42.540
15.764	36.540
15.887	45.697
15.973	42.749
16.037	39.169
16.354	41.799
16.461	37.378];
units.LW1 = {'cm', 'g'};  label.LW1 = {'total length','weight','Seomgang River'};  
bibkey.LW1 = 'BaeWang2024';
    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

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
set1 = {'LW','LW1'}; subtitle1 = {'Data for different sampling sites'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '7GCFK'; % Cat of Life
metaData.links.id_ITIS = '639704'; % ITIS
metaData.links.id_EoL = '216681'; % Ency of Life
metaData.links.id_Wiki = 'Zacco_platypus'; % Wikipedia
metaData.links.id_ADW = 'Zacco_platypus'; % ADW
metaData.links.id_Taxo = '190211'; % Taxonomicon
metaData.links.id_WoRMS = '1026712'; % WoRMS
metaData.links.id_fishbase = 'Zacco_platypus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Zacco_platypus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Zacco_platypus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'YanYan2012'; type = 'article'; bib = [ ... 
'doi = {10.3724/SP.J.1035.2012.00474}, ' ...
'author = {Yan, Yun-Zhi and Yan, Li-Li and Chu, Ling and Liang, Yang-Yang and Chen, Yi-Feng and Zhang, Xing-Ming}, ' ...
'year = {2012}, ' ...
'title  = {AGE, GROWTH AND REPRODUCTION OF \emph{Zacco platypus} IN THE {H}UISHUI {S}TREAM[J]}, ' ...
'journal = {Acta Hydrobiologica Sinica}, ' ...
'pages = {474-481}, ' ...
'volume = {36(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BaeWang2024'; type = 'article'; bib = [ ... 
'doi = {10.11626/KJEB.2024.42.1.015}, ' ...
'author = {Ji Hye Bae and Ju Hyoun Wang and Hwang Goo Lee}, ' ...
'year = {2024}, ' ...
'title  = {Fish fauna and growth characteristics of \emph{Zacco platypus} populations in {S}eomgang {R}iver}, ' ...
'journal = {Korean Journal of Environmental Biology}, ' ...
'pages = {15-27}, ' ...
'volume = {42(1)}'];
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

