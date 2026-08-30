  function [data, auxData, metaData, txtData, weights] = mydata_Dichistius_capensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Dichistiidae';
metaData.species    = 'Dichistius_capensis'; 
metaData.species_en = 'Galjoen'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE','MISW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 26];

%% set data
% zero-variate data
data.am = 21*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'saambr';
  temp.am = C2K(16.7); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 34;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 80;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'LeeChan1981';   
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 660;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.01622*Lp^3.01, see F1';
data.Wwi = 8677;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01622*Li^3.01, see F1; max. published weight: 6.5 kg';

data.GSI  = 0.055; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(16.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.Ri = 'based on Girella_tricuspidata';

% uni-variate data
% length - change in length
data.LdL = [ ... % total length (cm), change in total length (cm/yr)
25.041	1.776
25.947	2.831
26.076	0.017
26.590	3.288
26.596	2.162
27.282	1.828
27.989	4.553
28.188	2.882
28.381	2.337
28.599	4.148
28.611	2.038
28.641	3.410
28.650	1.791
28.652	1.405
28.685	2.372
28.761	2.301
28.828	4.060
28.836	2.583
28.876	2.178
28.889	-0.337
28.906	3.673
28.923	0.507
28.988	2.495
29.061	3.005
29.207	4.130
29.260	1.404
29.291	2.582
29.302	0.613
29.334	1.685
29.455	0.384
29.473	4.077
29.484	2.055
29.640	1.404
29.675	1.861
29.827	1.843
29.859	2.951
29.938	2.406
30.065	0.049
30.087	3.092
30.162	3.162
30.173	1.175
30.360	1.650
30.365	0.788
30.469	2.564
30.475	1.597
30.478	1.069
30.506	2.898
30.535	4.446
30.546	2.371
30.547	2.335
30.556	0.577
30.559	0.049
30.592	0.928
30.653	3.795
30.665	1.473
30.742	1.298
30.762	4.586
30.769	3.303
30.812	2.353
30.848	2.792
30.862	0.260
30.868	6.169
30.927	2.212
30.994	3.971
30.999	2.968
31.033	3.742
31.044	1.737
31.123	1.104
31.172	-0.849
31.179	4.780
31.195	1.966
31.197	1.543
31.303	3.021
31.349	1.579
31.461	1.948
31.574	1.983
31.615	1.561
31.681	3.425
31.686	2.405
31.692	1.332
31.718	3.601
31.728	1.613
31.729	1.490
31.730	1.367
31.754	3.900
31.773	0.400
31.830	3.794
31.946	3.530
32.032	1.754
32.073	1.086
32.110	1.279
32.126	5.430
32.145	1.859
32.153	0.400
32.155	0.048
32.171	4.005
32.210	3.829
32.221	1.930
32.264	1.015
32.269	-0.040
32.289	3.249
32.292	2.809
32.293	2.668
32.304	0.540
32.336	1.666
32.377	1.138
32.489	1.437
32.490	1.226
32.521	2.633
32.600	2.070
32.605	1.050
32.669	3.354
32.753	1.894
32.793	1.419
32.818	3.917
32.875	0.329
32.945	1.437
32.947	1.103
32.980	1.929
33.124	3.459
33.167	2.474
33.178	0.540
33.196	4.180
33.285	1.894
33.391	3.266
33.398	2.052
33.476	1.647
33.481	0.645
33.515	1.384
33.552	1.542
33.585	2.597
33.586	2.280
33.631	1.120
33.656	3.388
33.673	0.363
33.748	0.592
33.765	4.426
33.781	1.524
33.782	1.278
33.814	2.386
33.855	1.717
33.861	0.662
33.893	1.876
33.901	0.363
34.166	0.486
34.190	3.036
34.242	0.433
34.263	3.581
34.316	0.890
34.317	0.679
34.321	-0.112
34.350	1.541
34.504	1.277
34.573	2.579
34.574	2.403
34.615	1.840
34.620	0.890
34.639	4.373
34.709	5.445
34.845	1.365
34.875	2.965
34.881	1.682
34.965	0.292
34.992	2.403
34.999	1.013
35.000	0.802
35.021	4.038
35.071	1.752
35.075	0.960
35.110	1.541
35.112	1.277
35.215	3.317
35.442	3.493
35.460	0.010
35.531	0.925
35.533	0.608
35.606	1.241
35.684	0.819
35.714	2.332
35.717	1.716
35.751	2.437
35.788	2.631
35.830	1.980
35.841	-0.078
35.914	0.450
35.949	1.048
35.976	3.105
36.167	2.912
36.179	0.661
36.294	0.449
36.318	2.982
36.442	1.082
36.507	3.211
36.513	2.120
36.515	1.663
36.546	3.052
36.559	0.678
36.562	0.115
36.589	2.015
36.591	1.716
36.623	2.806
36.633	0.994
36.785	1.065
36.891	2.366
36.899	0.889
36.924	3.386
36.927	2.771
36.971	1.750
37.093	0.220
37.103	5.321
37.162	1.434
37.204	0.748
37.207	7.255
37.277	1.275
37.320	0.396
37.342	3.298
37.347	2.366
37.350	1.803
37.431	0.959
37.466	1.504
37.545	1.011
37.579	1.680
37.619	1.398
37.642	4.142
37.667	-0.519
37.701	0.290
37.775	0.571
37.795	3.860
37.884	1.451
37.999	1.398
38.104	2.963
38.187	1.662
38.266	1.187
38.270	0.360
38.340	1.450
38.561	2.734
38.606	1.503
38.614	0.043
38.643	1.732
38.687	0.606
38.791	2.312
38.873	1.292
38.938	3.244
39.022	1.784
39.032	0.043
39.062	1.397
39.161	4.246
39.244	2.945
39.349	4.510
39.406	1.080
39.452	-0.467
39.522	7.658
39.550	2.505
39.708	1.362
39.891	2.645
40.020	0.042
40.238	1.783
40.243	0.798
40.271	2.751
40.283	0.429
40.315	1.660
40.415	4.210
40.807	2.029
40.808	1.800
40.836	3.682
40.889	0.851
40.923	1.519
41.115	1.185
41.188	1.800
41.341	1.554
41.542	-0.363
41.615	0.024
41.705	4.473
41.730	-0.117
41.943	2.609
41.948	1.817
41.991	0.815
42.033	0.058
42.364	2.134
42.366	1.711
42.368	1.377
42.374	0.340
42.409	0.762
42.504	4.244
42.517	1.975
42.787	1.254
42.859	1.817
42.968	2.837
43.007	2.661
43.039	3.681
43.394	1.289
43.436	0.673
43.588	0.532
43.614	2.819
43.814	0.972
43.848	1.605
44.001	1.570
44.006	0.550
44.047	0.075
44.148	2.361
44.382	1.323
44.535	1.059
44.685	1.499
45.176	1.956
45.179	1.516
45.328	1.938
45.515	2.589
45.556	2.026
45.604	0.161
46.023	0.056
46.089	1.744
46.130	1.322
46.201	2.113
46.340	4.540
46.433	1.410
46.584	1.621
46.726	3.432
46.770	2.429
46.971	0.266
47.160	0.407
47.498	1.145
47.500	0.776
47.984	2.604
48.030	1.233
48.074	0.001
48.370	1.567
48.411	1.092
48.413	0.564
49.549	1.407
50.006	1.091
50.578	0.756
53.618	0.613
53.775	-0.231
54.492	0.577
54.722	0.190
55.592	1.016
56.011	0.735];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert cm/yr to cm/d
units.LdL = {'cm', 'cm/d'}; label.LdL = {'total length', 'change in total length'};  
temp.LdL = C2K(16.7);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'AttwSwar2000'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
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
               
%% Discussion
D1 = 'males as supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01622*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southeast Atlantic to southwestern Indian Ocean: southern Angola to Natal, South Africa';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CSHY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46581112'; % Ency of Life
metaData.links.id_Wiki = 'Dichistius_capensis'; % Wikipedia
metaData.links.id_ADW = 'Dichistius_capensis'; % ADW
metaData.links.id_Taxo = '173135'; % Taxonomicon
metaData.links.id_WoRMS = '221426'; % WoRMS
metaData.links.id_fishbase = 'Dichistius-capensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dichistius_capensis}}';
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
bibkey = 'AttwSwar2000'; type = 'Article'; bib = [ ... 
'author = {C. G. Attwood and L. Swart}, ' ...
'year = {2000}, ' ...
'title = {DISCREPANCY BETWEEN OTOLITH AND TAG-RECOVERY ESTIMATES OF GROWTH FOR TWO {S}OUTH {A}FRICAN SURF-ZONE TELEOST SPECIES}, ' ... 
'journal = {S. Afr. J. mar. Sci.}, ' ...
'volume = {22}, ' ...
'pages = {9–15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dichistius-capensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'saambr'; type = 'Misc'; bib = [ ...
'title = {Fact Sheet Galjoen}' ...
'howpublished = {\url{https://saambr.org.za/wp-content/uploads/2023/03/ORI-Fish-Fact-Sheet-Galjoen.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

