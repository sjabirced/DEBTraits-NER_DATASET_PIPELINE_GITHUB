function [data, auxData, metaData, txtData, weights] = mydata_Sillago_analis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_analis'; 
metaData.species_en = 'Golden-lined sillago';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 2];

%% set data
% zero-variate data

data.ab = 3.5;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'CoulHesp2005';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.5; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 45;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 990;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00832*Li^3.07, see F1';
 
data.Ri  = 217e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sillago schomburgkii';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.319	6.344
0.320	4.785
0.349	5.519
0.350	4.143
0.352	1.849
0.377	7.263
0.380	2.767
0.406	8.548
0.407	6.805
0.582	9.010
0.583	8.459
0.584	7.267
0.584	6.257
0.612	9.010
0.612	8.185
0.640	10.387
0.670	9.653
0.672	7.910
0.703	5.617
0.729	10.572
0.731	6.811
0.753	17.086
0.754	16.077
0.755	15.160
0.756	13.783
0.759	9.839
0.761	7.362
0.783	16.445
0.815	12.959
0.817	11.308
0.818	9.197
0.844	14.336
0.847	10.482
0.905	12.135
0.932	14.429
0.933	13.878
0.934	12.044
0.964	11.677
0.965	10.118
0.991	15.072
0.994	11.036
1.016	20.761
1.019	16.908
1.049	16.633
1.051	13.055
1.076	19.202
1.081	12.505
1.106	18.377
1.108	16.175
1.108	15.625
1.135	20.121
1.139	14.433
1.163	21.406
1.166	17.644
1.166	17.186
1.193	20.489
1.194	19.755
1.311	20.950
1.312	20.307
1.314	16.271
1.316	14.252
1.319	10.308
1.343	17.372
1.345	15.537
1.373	16.639
1.487	22.512
1.487	21.962
1.488	21.503
1.548	19.578
1.550	16.459
1.578	19.120
1.580	15.725
1.581	15.083
1.607	20.221
1.609	16.827
1.611	14.533
1.634	23.524
1.635	21.231
1.663	24.351
1.665	21.323
1.667	18.754
1.695	20.406
1.726	18.297
1.727	17.563
1.751	24.260
1.753	22.242
1.754	19.765
1.757	16.279
1.785	17.931
1.787	15.270
1.811	23.069
1.811	22.885
1.816	15.821
1.842	21.235
1.842	20.592
1.873	18.666
1.874	16.923
1.899	23.896
1.900	22.337
1.901	20.410
1.904	17.566
1.991	19.402
1.992	18.210
2.016	25.091
2.018	22.981
2.018	21.788
2.019	21.146
2.022	16.467
2.049	19.954
2.050	19.128
2.079	19.588
2.107	21.882
2.135	23.442
2.136	22.616
2.139	18.304
2.164	24.452
2.164	24.268
2.167	20.690
2.193	24.911
2.196	21.058
2.221	26.563
2.222	25.829
2.224	22.343
2.341	24.455
2.344	20.235
2.402	21.795
2.431	22.438
2.457	26.842
2.458	26.200
2.458	25.374
2.459	23.815
2.460	23.540
2.461	21.338
2.546	25.743
2.576	25.285
2.578	22.808
2.580	20.881
2.605	26.753
2.606	24.551
2.607	23.726
2.608	21.799
2.609	21.432
2.637	23.451
2.639	20.424
2.639	19.598
2.665	25.103
2.667	22.167
2.726	22.627
2.752	27.673
2.812	25.564
2.814	23.454
2.841	26.666
2.843	23.822
2.902	24.190
2.902	22.997
2.930	26.025
2.960	25.200
2.988	26.485
3.020	23.091
3.050	22.266
3.052	20.615
3.078	24.377
3.079	23.643
3.109	22.359
3.137	24.378
3.139	21.992
3.194	27.590
3.195	25.663
3.196	25.021
3.224	26.673
3.225	25.205
3.252	28.416
3.254	26.398
3.283	27.041
3.343	25.574
3.344	24.290
3.344	23.923
3.371	27.134
3.430	27.502
3.463	23.007
3.488	28.329
3.490	26.586
3.490	25.944
3.491	24.935
3.549	26.128
3.607	28.239
3.608	25.946
3.609	24.295
3.610	23.652
3.640	23.286
3.640	22.919
3.666	27.048
3.697	25.122
3.697	24.938
3.754	27.875
3.815	25.950
3.844	26.501
3.901	28.520
3.963	25.402
4.020	28.155
4.080	26.322
4.080	26.046
4.137	28.800
4.168	27.149
4.170	24.121
4.255	28.802
4.259	24.031
4.287	24.949
4.314	29.353
4.316	26.785
4.317	25.041
4.318	23.849
4.433	26.970
4.493	26.054
4.493	26.054
4.550	28.257
4.609	28.441
4.640	26.515
4.641	25.873
4.641	25.506
4.642	24.497
4.669	27.525
4.669	27.342
4.700	25.782
4.727	29.086
4.785	29.821
4.815	29.546
4.905	26.979
4.935	27.438
4.962	30.191
4.964	27.989
5.083	26.707
5.494	29.283
5.522	31.119
5.642	28.460
5.966	29.384
6.087	25.257
6.231	29.205
6.465	32.329
6.498	28.017];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length','females'};  
temp.tL_f  = C2K(27.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHesp2005';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.355	4.925
0.386	7.299
0.413	3.281
0.413	4.012
0.415	6.021
0.441	2.276
0.472	4.924
0.473	5.837
0.559	4.010
0.562	7.937
0.589	4.558
0.591	6.567
0.593	10.494
0.650	7.297
0.680	8.758
0.708	7.753
0.712	12.776
0.738	8.392
0.740	10.401
0.740	11.406
0.771	13.780
0.772	14.237
0.772	14.785
0.796	7.022
0.797	9.122
0.826	7.935
0.827	9.487
0.827	10.583
0.889	14.692
0.918	14.966
0.977	15.239
0.977	15.696
1.004	12.043
1.032	10.033
1.036	16.243
1.063	13.321
1.091	10.763
1.091	11.311
1.151	13.777
1.180	13.046
1.211	15.602
1.212	16.242
1.212	17.064
1.240	14.689
1.325	11.857
1.382	9.573
1.386	14.688
1.412	10.395
1.442	10.669
1.446	17.061
1.534	16.513
1.595	20.530
1.596	21.718
1.625	22.265
1.650	15.690
1.651	16.512
1.679	14.868
1.680	17.333
1.708	15.233
1.710	18.246
1.711	19.251
1.741	19.707
1.770	20.438
1.771	21.077
1.798	18.793
1.799	19.981
1.800	21.533
1.830	22.263
1.856	17.332
1.884	15.870
1.885	16.875
2.001	16.326
2.004	20.070
2.032	17.878
2.032	18.243
2.033	19.157
2.033	19.522
2.120	19.247
2.148	16.964
2.149	18.516
2.150	20.251
2.151	20.799
2.151	21.256
2.152	22.443
2.206	16.781
2.239	21.712
2.268	20.616
2.297	20.250
2.299	23.629
2.326	21.254
2.354	19.336
2.357	23.081
2.413	20.249
2.443	20.066
2.443	20.797
2.445	22.714
2.473	21.801
2.473	22.166
2.528	17.508
2.531	20.979
2.591	23.535
2.648	21.251
2.676	18.877
2.679	22.895
2.679	24.174
2.736	21.799
2.737	22.529
2.764	19.607
2.765	20.885
2.767	23.351
2.794	20.154
2.941	22.527
3.057	21.065
3.086	20.152
3.116	21.886
3.117	22.069
3.207	25.447
3.233	21.063
3.264	23.712
3.294	25.081
3.322	23.346
3.324	26.268
3.325	26.725
3.352	23.711
3.352	24.259
3.379	20.971
3.409	21.518
3.409	22.523
3.440	24.988
3.441	25.445
3.441	25.536
3.527	23.618
3.614	23.252
3.643	21.699
3.644	24.165
3.675	26.082
3.704	25.443
3.732	23.342
3.818	22.063
3.819	22.793
3.967	25.532
4.024	24.070
4.083	23.704
4.111	22.973
4.173	27.448
4.258	23.063
4.258	23.794
4.317	24.706
4.491	21.874
4.493	24.431
4.523	25.892
4.610	25.343
4.638	23.973
4.639	24.704
4.725	22.968
4.873	25.341
4.989	23.057
5.105	22.781
5.106	23.969
5.163	22.142
5.254	26.616
5.370	24.332
5.546	26.065
5.574	23.873
5.693	26.429
7.066	24.681
8.150	28.050];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length','males'};  
temp.tL_m  = C2K(27.8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHesp2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Central Pacific: northern Australia, from Shark Bay, Western Australia to Moreton Bay, Queensland. Also known from the southern coast of New Guinea. Sillago nierstraszi is almost certainly a synonym of this species';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4XDNP'; % Cat of Life
metaData.links.id_ITIS = '168528'; % ITIS
metaData.links.id_EoL = '46579888'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_analis'; % Wikipedia
metaData.links.id_ADW = 'Sillago_analis'; % ADW
metaData.links.id_Taxo = '187637'; % Taxonomicon
metaData.links.id_WoRMS = '273931'; % WoRMS
metaData.links.id_fishbase = 'Sillago_analis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_analis}}';
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
bibkey = 'CoulHesp2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-004-4568-8}, ' ...
'author = {Peter G. Coulson and S. Alex Hesp and Ian C. Potter  and Norman G. Hall}, ' ... 
'year = {2005}, ' ...
'title = {Comparisons between the biology of two co-occurring species of whiting ({S}illaginidae) in a large marine embayment}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {73}, ' ...
'pages = {125–139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago_analis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
