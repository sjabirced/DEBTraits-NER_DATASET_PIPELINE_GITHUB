  function [data, auxData, metaData, txtData, weights] = mydata_Procypris_rabaudi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Procypris_rabaudi'; 
metaData.species_en = 'Rock carp'; 

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 17];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 56;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.9e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WangGao2015';
  comment.Wwb = 'based on egg diameter of 1.76 mm: pi/6*0.176^3';
data.Wwp = 768;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.16, see F1';
data.Wwi = 2846; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.16, see F1; max. published weight: 2.6 kg';
    
data.Ri = 13894/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'WangGao2015';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.248	5.205
0.362	5.688
0.439	8.290
0.515	4.438
0.534	8.195
0.963	7.911
0.992	9.164
1.020	10.898
1.021	7.141
1.087	9.647
1.088	11.188
1.116	8.877
1.144	10.515
1.154	7.721
1.155	9.455
1.173	10.900
1.182	8.877
1.192	11.960
1.211	8.203
1.259	8.686
1.268	11.672
1.325	12.155
1.336	11.480
1.337	11.191
1.338	10.035
1.344	12.829
1.345	10.806
1.373	8.398
1.421	9.266
1.507	10.037
1.526	11.194
1.554	12.157
1.592	9.653
1.602	10.424
1.631	8.690
1.774	10.908
1.775	10.330
1.964	11.970
1.993	14.282
1.994	9.658
2.002	10.332
2.021	12.837
2.022	11.681
2.031	14.861
2.032	11.200
2.041	12.645
2.060	14.090
2.069	10.237
2.088	13.127
2.098	11.875
2.099	9.852
2.117	15.054
2.126	10.912
2.136	15.633
2.145	14.284
2.146	16.307
2.154	11.490
2.155	12.743
2.156	9.949
2.184	14.573
2.203	13.707
2.260	11.780
2.261	12.937
2.279	13.226
2.308	13.997
2.327	17.562
2.336	14.383
2.346	13.805
2.347	12.938
2.403	16.599
2.411	15.251
2.412	14.191
2.413	12.071
2.422	15.829
2.431	17.467
2.432	12.939
2.565	15.830
2.927	15.353
2.937	18.532
2.946	22.579
2.947	17.280
2.994	16.703
3.004	18.244
3.013	20.267
3.014	14.198
3.042	14.969
3.051	17.763
3.080	17.474
3.088	21.521
3.089	19.016
3.098	22.099
3.099	19.883
3.108	13.236
3.128	15.163
3.137	16.319
3.154	24.604
3.155	22.003
3.156	20.462
3.166	14.489
3.175	18.246
3.176	13.526
3.194	19.499
3.204	16.801
3.205	15.549
3.414	20.465
3.421	14.685
3.422	15.744
3.423	16.515
3.424	17.189
3.425	17.864
3.426	19.213
3.442	19.791
3.576	23.646
3.585	18.251
3.595	22.105
3.938	22.494
3.967	23.073
3.995	27.312
4.005	24.615
4.014	25.385
4.015	22.881
4.081	25.290
4.082	20.955
4.091	28.373
4.092	22.303
4.100	24.327
4.101	19.413
4.119	23.653
4.157	21.534
4.167	23.268
4.176	24.809
4.186	22.883
4.224	20.378
4.262	20.090
4.281	23.944
4.291	22.499
4.292	21.728
4.293	20.668
4.310	24.522
4.348	25.197
4.415	26.065
4.424	24.716
4.453	23.946
4.454	22.212
4.605	22.406
4.615	23.177
4.977	31.563
5.015	35.706
5.025	26.746
5.026	29.926
5.054	32.720
5.055	34.936
5.101	28.578
5.102	30.215
5.159	26.748
5.206	31.084
5.254	26.364
5.263	31.855
5.426	27.522
5.473	28.775
5.950	34.368
6.007	32.057
6.008	30.034
6.026	36.970
6.083	30.709
6.103	28.782
6.188	36.105
7.027	41.607
7.046	33.996
7.180	35.828
7.285	35.829
7.304	33.807
7.447	37.276
8.029	36.609
8.048	43.449];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WangGao2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00851*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'middle and upper reaches of Yangtze River, China.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6W9X6'; % Cat of Life
metaData.links.id_ITIS = '689721'; % ITIS
metaData.links.id_EoL = '210174'; % Ency of Life
metaData.links.id_Wiki = 'Procypris_rabaudi'; % Wikipedia
metaData.links.id_ADW = 'Procypris_rabaudi'; % ADW
metaData.links.id_Taxo = '184798'; % Taxonomicon
metaData.links.id_WoRMS = '1015895'; % WoRMS
metaData.links.id_fishbase = 'Procypris-rabaudi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Procypris_rabaudi}}';  
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
bibkey = 'WangGao2015'; type = 'Article'; bib = [ ...
'doi = {10.1007/s12562-015-0872-9}, ' ...
'author = {Teng Wang and Xin Gao and Jun Wang and Ivan Jakovlic and Sheng‑Guo Dan and Huan‑Zhang Liu}, ' ...
'year = {2015}, ' ...
'title = {Life history traits and implications for conservation of rock carp \emph{Procypris rabaudi} {T}chang, an endemic fish in the upper {Y}angtze {R}iver, {C}hina}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {81}, '...
'pages = {515–523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Procypris-rabaudi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

