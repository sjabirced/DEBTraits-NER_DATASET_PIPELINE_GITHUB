function [data, auxData, metaData, txtData, weights] = mydata_Gymnocypris_firmispinatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Gymnocypris_firmispinatus'; 
metaData.species_en = 'Anning barb'; 

metaData.ecoCode.climate = {'Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
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

data.am = 13*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'MaNie2018';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'MaNie2018'; 
data.Li = 24;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'MaNie2018'; 
  
data.Wwb = 4.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.98 mm: pi/6*0.198^3';
data.Wwp = 5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'MaNie2018';
data.Wwi = 149;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MaNie2018';

data.Ri = 3257/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tL_fm = [ ... % time (yr), total length (cm)
 1  6.78  5.90
 2  7.33  8.04
 3  8.83  9.18
 4 10.51 10.09
 5 11.82 10.80
 6 12.96 11.34
 7 14.80 12.84
 8 17.07 14.73
 9 16.74 14.00
10 19.72 NaN
11 19.97 NaN
12 23.40 NaN
13 21.30 NaN];
data.tL_fm(:,1) = 365*(0.9+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(23);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MaNie2018'; treat.tL_fm = {1 {'females','males'}};
 
% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.685	1.124
2.945	0.281
3.147	0.562
3.262	0.281
3.464	1.124
3.609	0.562
3.782	0.281
3.897	1.124
3.926	0.562
4.157	1.685
4.244	0.843
4.532	1.124
4.677	1.966
4.850	1.404
5.139	1.124
5.370	2.247
5.572	1.404
5.687	2.528
5.976	2.809
6.236	3.652
6.438	1.404
6.611	3.652
6.697	0.562
6.957	3.652
6.957	2.247
7.073	5.618
7.217	2.247
7.448	4.213
7.708	4.775
7.823	2.247
7.968	5.618
8.227	7.022
8.372	4.494
8.776	5.618
8.805	8.146
9.036	7.022
9.382	9.551
9.642	11.798
9.700	9.831
9.931	8.989
10.075	12.921
10.248	11.236
10.364	8.989
10.537	11.798
10.537	9.270
10.595	15.169
10.855	15.730
10.970	12.079
11.028	9.551
11.143	7.865
11.316	11.236
11.432	14.326
11.663	16.573
11.749	12.640
11.778	19.663
12.067	11.517
12.096	14.045
12.240	12.921
12.327	16.854
12.442	18.258
12.471	15.449
12.644	20.787
12.933	21.910
12.933	22.472
12.962	17.416
13.135	23.034
13.279	15.169
13.337	20.225
13.626	26.966
13.741	23.596
13.741	21.910
13.915	19.382
14.001	27.247
14.030	32.584
14.319	26.966
14.376	32.303
14.521	23.034
14.636	29.775
14.752	34.551
14.896	43.820
14.983	34.831
15.127	40.169
15.127	33.146
15.156	37.360
15.271	42.416
15.560	38.202
15.676	29.775
15.733	33.708
15.935	46.348
15.993	33.146
16.051	43.258
16.051	38.764
16.339	32.022
16.455	47.472
16.542	41.573
16.599	35.112
16.744	46.348
16.744	49.719
16.801	44.944
16.801	38.202
16.801	31.180
17.292	50.562
17.321	45.225
17.350	55.618
17.696	50.000
17.725	47.472
17.754	61.517
17.783	45.787
18.158	57.865
18.418	53.090
18.533	51.966
18.793	69.382
19.197	76.124
19.226	65.169
19.342	74.157
19.400	79.494
19.486	72.191
19.804	71.629
20.958	99.438
21.363	79.775
22.604	95.225
22.691	83.989
23.441	148.034
24.221	116.011];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'MaNie2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
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
D1 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to Jinshajiang River and Lancanjiang River in China';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6L6VT'; % Cat of Life
metaData.links.id_ITIS = '689185'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Gymnocypris_firmispinatus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocypris_firmispinatus'; % ADW
metaData.links.id_Taxo = '175563'; % Taxonomicon
metaData.links.id_WoRMS = '1524120'; % WoRMS
metaData.links.id_fishbase = 'Gymnocypris-firmispinatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gymnocypris_firmispinatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gymnocypris-firmispinatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MaNie2018'; type = 'article'; bib = [ ...
'doi = {10.1007/s00343-019-7372-1}, ' ...
'author = {Ma, B. and Nie, Y. and Wei, K. and Xu, B. and Zhu, X. and Xu, J.}, ' ...
'year = {2018}, ' ...
'title  = {Estimates on age, growth, and mortality of \emph{Gymnocypris firmispinatus} ({C}yprinidae: {S}chizothoracinae) in the {A}nning {R}iver, {C}hina}, ' ...
'journal = {Journal of Oceanology and Limnology}, ' ...
'volume = {7(1)}, ' ...
'pages = {77-82}'];
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

