  function [data, auxData, metaData, txtData, weights] = mydata_Acanthobrama_marmid

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Acanthobrama_marmid'; 
metaData.species_en = 'Tigris bream'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.4;  units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase'; 
data.Li = 29;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'UlnuBlaci1994';
  comment.Wwb = 'Based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 13;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty\';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Computed as 0.00759*Lp^3.06, see F1';
data.Wwi = 226.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.06, see F1';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    1  6.700  9.739
    2 11.876 12.048
    3 14.071 13.721 
    4 15.663 15.188
    5 16.500 16.250];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'UlnuBlaci1994'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1  3.64 11.83
    2 24.45 26.87
    3 44.42 40.63
    4 62.20 57.64
    5 76.43 71.62];
data.tW_fm(:,1) = 365 * (0.5 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'UlnuBlaci1994'; treat.tW_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
6.157	3.012
6.205	3.720
6.347	3.899
6.379	3.015
6.522	3.194
6.601	3.372
7.631	5.511
8.501	8.356
8.565	8.711
8.595	11.366
8.596	9.065
8.834	9.954
9.150	11.374
9.198	11.198
9.293	10.668
9.308	11.731
9.531	10.849
9.626	11.735
9.800	11.915
9.879	12.978
9.927	11.740
10.116	14.574
10.116	13.689
10.180	12.982
10.417	13.694
10.544	14.581
10.606	18.652
10.638	16.352
10.702	16.353
10.939	16.179
11.018	17.950
11.031	25.030
11.035	16.181
11.049	19.544
11.129	17.952
11.130	14.412
11.177	15.829
11.192	17.776
11.193	17.245
11.271	20.786
11.335	18.663
11.399	16.894
11.410	28.930
11.554	26.631
11.570	25.038
11.570	24.507
11.573	17.959
11.635	22.384
11.649	25.924
11.682	23.093
11.697	24.155
11.731	18.138
11.777	22.209
11.823	26.458
11.824	23.980
11.966	26.106
11.979	33.540
12.011	31.416
12.140	25.932
12.184	35.313
12.186	31.773
12.234	30.358
12.235	26.287
12.251	27.349
12.328	33.014
12.328	31.598
12.377	28.944
12.422	36.378
12.440	30.184
12.485	35.140
12.487	31.777
12.520	28.592
12.533	34.433
12.550	33.548
12.565	35.495
12.599	29.478
12.612	36.558
12.614	31.425
12.660	34.081
12.661	31.603
12.691	37.621
12.691	36.736
12.691	35.320
12.707	35.851
12.727	26.471
12.789	29.304
12.818	35.676
12.820	31.605
12.896	40.279
12.897	36.031
12.996	27.360
13.008	36.564
13.008	35.679
13.009	34.794
13.038	40.458
13.056	36.388
13.057	33.733
13.072	35.149
13.088	36.034
13.103	38.158
13.164	43.292
13.166	37.274
13.167	35.327
13.198	36.390
13.199	34.266
13.199	33.558
13.201	29.487
13.212	41.877
13.216	31.434
13.260	40.284
13.275	43.647
13.279	32.851
13.292	39.046
13.293	37.984
13.326	35.153
13.353	45.242
13.354	44.003
13.369	46.127
13.371	40.286
13.388	36.570
13.389	34.977
13.420	36.570
13.437	33.207
13.451	39.048
13.451	37.809
13.469	34.447
13.498	40.819
13.501	33.031
13.515	36.571
13.545	42.059
13.561	40.820
13.579	36.395
13.594	39.050
13.609	40.113
13.609	39.582
13.639	44.538
13.658	37.635
13.672	40.467
13.686	45.423
13.719	41.353
13.752	39.584
13.783	40.823
13.784	38.345
13.784	37.637
13.785	36.221
13.813	44.540
13.829	45.426
13.834	33.567
13.877	42.771
13.908	46.135
13.908	44.542
13.940	45.250
13.973	41.534
13.975	36.401
13.985	51.446
13.985	50.207
13.988	42.596
14.004	43.481
14.007	35.340
14.018	47.375
14.053	38.526
14.065	48.969
14.082	46.491
14.144	50.386
14.146	46.138
14.164	40.829
14.164	39.413
14.176	48.440
14.177	47.555
14.189	56.050
14.194	44.369
14.197	36.050
14.209	45.254
14.240	46.848
14.258	41.361
14.268	57.290
14.273	44.724
14.274	42.423
14.284	56.229
14.301	54.636
14.314	61.185
14.319	49.327
14.335	48.265
14.364	56.230
14.367	48.265
14.378	59.947
14.383	46.850
14.396	53.045
14.402	39.770
14.432	43.134
14.444	53.930
14.455	65.081
14.465	41.187
14.478	47.205
14.505	58.533
14.507	53.223
14.509	49.329
14.510	45.790
14.511	43.843
14.540	50.038
14.585	57.649
14.588	48.977
14.603	50.924
14.619	52.163
14.638	43.314
14.651	50.393
14.653	46.146
14.679	59.243
14.731	47.917
14.745	53.050
14.746	51.634
14.748	47.032
14.773	63.493
14.775	57.121
14.783	38.360
14.838	59.246
14.886	56.769
14.918	57.831
14.932	61.902
14.948	60.486
14.951	53.938
14.952	51.283
14.965	58.186
14.966	55.177
14.981	59.071
15.000	50.399
15.092	57.303
15.093	55.179
15.110	53.409
15.111	51.108
15.138	61.374
15.152	66.153
15.153	63.498
15.170	59.959
15.171	58.012
15.172	56.596
15.190	50.401
15.191	47.924
15.215	68.101
15.251	56.597
15.264	63.854
15.265	61.730
15.299	56.067
15.326	67.749
15.361	58.899
15.376	62.617
15.439	63.679
15.455	61.556
15.469	66.158
15.488	59.609
15.517	66.512
15.518	62.973
15.533	65.097
15.536	56.778
15.578	72.708
15.582	61.558
15.625	73.948
15.658	69.346
15.660	65.984
15.660	64.922
15.661	62.267
15.661	61.028
15.678	59.612
15.719	76.073
15.720	73.418
15.722	67.931
15.738	68.109
15.754	66.339
15.771	65.631
15.772	62.445
15.788	61.030
15.863	71.650
15.914	65.102
15.926	73.952
15.926	72.713
15.929	66.872
15.929	65.811
15.931	61.209
15.941	75.722
15.975	69.705
15.979	59.794
16.026	60.148
16.074	58.910
16.084	75.370
16.101	70.769
16.120	64.574
16.149	71.654
16.182	66.876
16.242	76.081
16.245	68.647
16.275	74.134
16.323	72.719
16.339	71.480
16.368	79.445
16.432	76.260
16.448	77.500
16.451	70.066
16.452	65.995
16.466	71.482
16.480	75.022
16.481	74.137
16.481	73.075
16.481	72.367
16.484	64.934
16.542	79.448
16.623	74.493
17.255	79.458
17.270	83.352
17.279	58.928
17.297	92.910
17.425	90.611
17.612	100.349
17.754	99.820];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'UlnuBlaci1994'; 
    
% length-fecundity
data.LN = [ ... % forklength (cm), fecundity (#)
12.219	2177.671
12.391	1221.837
12.411	1378.106
12.526	3132.116
12.586	1203.901
12.607	3774.561
12.707	2019.928
12.709	2402.057
12.723	3444.200
12.724	1359.830
12.763	3739.369
12.789	2922.916
12.996	3217.603
12.998	3721.319
13.002	2279.621
13.017	3530.198
13.048	3877.503
13.094	3321.537
13.253	3842.169
13.277	2400.414
13.445	5144.344
13.488	3806.750
13.522	4814.096
13.617	4119.033
13.800	3493.192
13.814	4448.487
13.828	3284.672
13.895	5108.301
13.902	4396.123
13.999	4256.884
14.196	4568.968
14.240	5628.395
14.326	5350.228
14.731	6026.477
14.804	4775.646
15.027	6564.082
15.049	7241.437
15.211	6320.371
15.223	6771.950
15.309	6129.023
15.494	6111.115
15.503	5902.652
15.534	6302.066
16.041	8054.942
16.056	6995.345
16.057	7169.040
16.059	7672.756
16.089	7846.366];
units.LN = {'cm', '#'}; label.LN = {'fork length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'UlnuBlaci1994'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00759*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64D52'; % Cat of Life
metaData.links.id_ITIS = '688355'; % ITIS
metaData.links.id_EoL = '46581660'; % Ency of Life
metaData.links.id_Wiki = 'Acanthobrama_marmid'; % Wikipedia
metaData.links.id_ADW = 'Acanthobrama_marmid'; % ADW
metaData.links.id_Taxo = '159863'; % Taxonomicon
metaData.links.id_WoRMS = '279406'; % WoRMS
metaData.links.id_fishbase = 'Acanthobrama-marmid'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthobrama_marmid}}';  
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
bibkey = 'UlnuBlaci1994'; type = 'Article'; bib = [ ...  
'author = {Erhan "{U}ln\"{u} and Kadri Balci and Hasan Akbayin}, ' ...
'year = {1994}, ' ...
'title = {Some Biological Characteristics of the \emph{Acanthobrama marmid} {H}eckel, 1843 in the {T}igris {R}iver ({T}urkey)}, ' ... 
'journal = {Tr. J. of Zoology}, ' ...
'volume = {18}, '...
'pages = {131-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthobrama-marmid.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

