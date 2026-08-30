  function [data, auxData, metaData, txtData, weights] = mydata_Chondrostoma_regium

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chondrostoma_regium'; 
metaData.species_en = 'Brond-snout'; 

metaData.ecoCode.climate = {'Csa','BWk','BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 03];

%% set data
% zero-variate data
data.ab = 14;      units.ab = 'd';  label.ab = 'age at birth';    bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'SoofPoor2014'; 
data.Li = 40;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1.5 mm of C.nasus: pi/6*0.15^3';
data.Wwp = 10;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00631*Lp^3.06, see F1';
data.Wwi = 504;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.06, see F1';

% univariate data

% time-length
data.tL_f= [ ... % time since birth (yr), fork length (cm)
0.928	5.199
0.941	3.981
0.941	4.309
0.942	4.871
0.943	6.651
0.955	3.841
0.955	3.934
0.956	4.871
0.957	6.323
0.969	3.185
0.969	3.326
0.998	3.607
1.013	5.433
1.942	11.007
1.967	6.792
1.967	6.885
1.968	7.822
1.969	9.696
1.981	6.417
1.981	7.260
1.994	4.824
1.995	5.761
1.997	8.712
1.997	9.180
1.998	10.726
2.009	6.604
2.011	9.087
2.011	9.133
2.039	8.103
2.068	8.946
2.936	9.321
2.952	12.787
2.966	11.756
2.966	12.319
2.967	13.677
2.979	9.883
2.979	10.632
2.980	11.194
2.980	11.429
2.993	10.211
2.994	11.756
2.994	11.756
3.008	11.007
3.008	11.850
3.008	11.897
3.009	12.037
3.009	12.037
3.066	13.396
3.963	14.707
3.975	11.475
3.976	13.536
3.977	13.770
3.977	13.911
3.977	14.333
3.990	13.115
3.990	13.255
3.991	13.396
3.991	13.396
3.991	14.005
4.018	11.850
4.018	12.319
4.018	12.600
4.019	12.881
4.931	16.909
4.960	16.347
4.960	16.534
4.974	16.159
4.975	18.080
4.987	15.222
4.988	15.925
4.988	15.925
4.988	17.002
4.989	17.237
5.003	16.815
5.003	17.518
5.015	14.192
5.015	14.754
5.015	15.035
5.016	15.504
5.016	15.644];
data.tL_f(:,1) = 365 * (0.5+data.tL_f(:,1)); % covert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SoofPoor2014'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.954	3.747
0.954	3.794
0.955	4.637
0.971	4.169
0.986	3.044
0.987	3.700
0.987	3.981
0.988	4.965
1.002	2.482
1.003	3.466
1.003	4.075
1.005	5.761
1.005	6.089
1.956	6.230
1.958	9.227
1.989	5.902
1.990	7.869
1.990	8.103
1.990	8.244
2.006	7.635
2.006	7.728
2.022	6.604
2.024	8.899
2.040	8.525
2.962	13.068
2.975	9.133
2.975	9.696
2.978	12.927
2.978	13.443
2.993	11.007
2.993	11.288
2.993	11.850
2.994	12.506
2.994	12.834
3.009	11.382
3.010	11.663
3.010	11.756
3.012	15.129
3.026	11.991
3.026	12.178
3.027	12.693
3.040	8.806
3.961	12.693
3.962	13.489
3.962	13.489
3.963	14.192
3.963	14.660
3.979	14.848
3.981	16.534
3.993	11.944
3.994	12.506
3.995	13.302
3.995	13.770
3.995	13.770
3.995	14.052
4.009	11.054
4.009	11.429
4.011	13.817
4.012	14.988
4.964	16.019
4.964	16.206
4.982	17.518
4.997	15.738
4.998	17.143
5.029	15.176
5.030	16.440
5.030	16.487
5.030	16.628
5.983	19.438
6.000	19.625];
data.tL_m(:,1) = 365 * (0.5+data.tL_m(:,1)); % covert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SoofPoor2014'; 

% length-weight
data.LW_f = [ ... % fork length (cm), weight (g)
10.464	18.233
10.880	19.625
10.880	16.312
11.008	18.524
11.104	22.944
11.136	17.976
11.216	17.426
11.296	15.772
11.376	19.639
11.408	17.983
11.424	24.886
11.504	24.059
11.520	18.538
11.584	22.681
11.664	22.131
11.680	23.788
11.728	24.618
11.744	19.373
11.792	22.963
11.856	18.272
11.888	23.518
11.920	21.586
11.952	24.348
11.952	19.379
12.064	27.940
12.112	21.592
12.112	26.561
12.208	18.557
12.256	24.632
12.256	22.424
12.320	24.634
12.448	27.122
12.480	23.534
12.496	24.639
12.496	21.878
12.496	21.602
12.544	25.469
12.624	26.575
12.704	27.406
12.784	22.991
12.864	25.201
12.864	27.410
12.896	30.172
12.944	27.964
13.072	25.483
13.104	32.662
13.136	30.178
13.152	25.761
13.248	31.286
13.312	23.833
13.344	27.423
13.392	33.222
13.440	31.567
13.504	29.084
13.568	31.018
13.568	34.055
13.584	28.258
13.648	28.536
13.792	32.957
13.968	32.134
14.000	36.000
14.048	28.547
14.176	33.244
14.256	45.393
14.288	38.768
14.304	40.425
14.464	37.393
14.480	40.154
14.544	43.745
14.656	57.827
14.688	38.503
14.704	43.473
14.704	36.571
14.976	40.996
14.976	45.413
14.992	26.364
15.056	42.102
15.072	36.029
15.392	24.719
15.488	47.636
15.488	44.599
15.600	61.166
15.680	44.604
15.712	58.961
15.712	46.538
15.808	50.129
16.000	57.312
16.000	49.030
16.016	51.239
16.160	40.752
16.192	60.907
16.224	58.699
16.224	37.165
16.288	57.044
16.336	36.616
16.352	56.218
16.448	51.803
16.480	58.154
16.496	62.019
16.640	66.441
16.688	50.982
16.736	58.989
16.736	55.400
16.768	63.683
16.800	62.028
16.864	66.999
16.912	60.098
16.976	62.033
17.280	82.470
17.456	85.512
17.552	65.085
18.048	67.584];
units.LW_f = {'cm', 'g'}; label.LW_f = {'fork length','weight','females'};  
bibkey.LW_f = 'SoofPoor2014'; 
%
data.LW_m = [ ... % fork length (cm), weight (g)
10.692	16.721
10.818	17.377
10.896	18.033
10.928	14.754
11.069	19.344
11.085	16.721
11.195	20.328
11.274	17.049
11.274	18.689
11.478	20.656
11.509	18.033
11.509	21.311
11.572	17.049
11.635	19.344
11.667	20.984
11.714	22.295
11.792	20.656
11.824	18.689
11.934	22.295
11.981	18.689
12.107	20.984
12.186	25.246
12.280	19.672
12.327	25.902
12.327	21.639
12.358	23.279
12.406	24.918
12.516	28.197
12.626	22.623
12.689	27.213
12.736	23.607
12.814	25.902
12.862	28.197
12.893	22.951
12.909	29.508
12.925	25.246
13.050	30.492
13.097	31.803
13.113	28.197
13.129	25.574
13.160	30.492
13.192	25.902
13.302	31.475
13.459	33.115
13.506	28.852
13.538	33.115
13.648	31.803
13.742	34.754
13.994	33.770
14.497	41.311
14.686	40.656
14.764	42.623
14.780	32.459
14.984	47.213
15.000	43.607
15.519	49.836
15.865	54.426
15.991	48.852
16.164	55.410
16.462	53.115
16.478	59.016
16.525	53.770
16.997	58.033
17.280	64.590
19.198	86.230
19.355	86.557];
units.LW_m = {'cm', 'g'}; label.LW_m = {'fork length','weight','males'};  
bibkey.LW_m = 'SoofPoor2014'; 

% length-fecundit
data.LN = [ ... % fork length (cm), fecundity (#)
10.462	919.370
10.922	1596.310
10.999	1634.192
11.086	1259.947
11.086	1672.125
11.086	1784.537
11.307	2610.075
11.403	1392.791
11.479	1505.614
11.479	1243.319
11.479	999.759
11.508	1374.621
11.556	943.965
11.643	1675.106
11.662	1319.237
11.691	1975.129
11.748	1731.878
11.758	1188.604
11.787	1807.025
11.806	1394.950
11.806	2031.952
11.854	1207.853
11.883	1976.157
11.902	2107.408
11.969	1714.325
11.998	2257.804
12.056	1602.375
12.094	2314.525
12.104	1359.072
12.180	1790.397
12.296	1847.220
12.392	2503.471
12.401	1660.431
12.430	1979.087
12.468	1286.084
12.488	2466.515
12.507	2185.587
12.507	1942.028
12.641	1961.482
12.680	2692.367
12.757	2130.718
12.853	2374.791
12.997	2319.356
13.256	1234.093
13.275	2845.437
13.275	1983.610
13.486	3015.186
13.553	2565.897
13.602	2172.711
13.611	1835.526
13.995	2399.643
14.206	2944.100
14.283	4424.604
14.302	4687.002
14.495	4238.382
14.639	5063.508
14.706	3134.126
14.898	3865.833
15.676	4169.762
15.762	4825.962
16.175	5127.938
16.309	3461.211
16.425	6309.602
16.578	6179.277
16.780	4831.410
16.914	5581.545
17.298	7251.048
17.385	7719.895];
units.LN = {'cm', '#'}; label.LN = {'fork length', 'fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SoofPoor2014'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69ZDW'; % Cat of Life
metaData.links.id_ITIS = '688883'; % ITIS
metaData.links.id_EoL = '219286'; % Ency of Life
metaData.links.id_Wiki = 'Chondrostoma_regium'; % Wikipedia
metaData.links.id_ADW = 'Chondrostoma_regium'; % ADW
metaData.links.id_Taxo = '170980'; % Taxonomicon
metaData.links.id_WoRMS = '1418527'; % WoRMS
metaData.links.id_fishbase = 'Chondrostoma-regium'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chondrostoma_regium}}';  
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
bibkey = 'SoofPoor2014'; type = 'article'; bib = [ ...  
'author = {Mahboobi Soofiani, N. and M. Pooramini and S. Asadollah Nasrabadi and S. Ahmadi and R. Hatami}, ' ...
'year = {2014}, ' ...
'title = {Age, growth and reproduction of \emph{Chondrostoma regium} ({H}eckel, 1843) from the {Z}ayandeh {R}oud {R}iver, {I}ran}, ' ... 
'journal = {Iran. J. Fish. Sci.}, ' ...
'pages = {810-822}, ' ...
'volume = {13(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Chondrostoma-regium.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
