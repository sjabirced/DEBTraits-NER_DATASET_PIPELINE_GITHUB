function [data, auxData, metaData, txtData, weights] = mydata_Plethodon_glutinosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Plethodon_glutinosus'; 
metaData.species_en = 'Northern slimy salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 08 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 01];

%% set data
% zero-variate data

data.ab = 2*30.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Plethodon_jordani';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'High1956';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Plethodon_jordani';

data.Li  = 8.9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'amphibiaweb';

data.Wwb = 3.35e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'High1956';
  comment.Wwb = 'based on egg diameter of 3.5-4.5 mm : pi/6*0.4^3';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'High1956';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-11, eggs per clutch, 1 clutch each yr assumed';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
65.361	0.860
65.969	0.813
67.823	0.790
69.696	0.836
70.952	0.895
70.974	0.976
73.415	0.824
73.461	0.999
100.192	1.231
100.840	1.336
101.408	1.138
101.485	1.430
104.509	1.138
105.836	1.465
106.450	1.441
108.252	1.219
108.863	1.184
109.536	1.383
110.001	0.799
110.739	1.243
110.798	1.464
113.821	1.172
125.041	1.382
125.717	1.592
125.847	2.082
126.834	1.125
127.485	1.242
127.553	1.498
128.691	1.113
129.380	1.370
131.268	1.475
133.191	1.708
133.681	1.218
134.344	1.381
134.375	1.498
171.697	1.905
171.740	2.068
172.345	2.010
172.835	1.520
172.869	1.648
172.922	1.846
172.993	2.115
173.433	1.438
173.560	1.916
174.196	1.975
174.218	2.056
174.723	1.625
197.132	1.927
200.859	1.950
201.575	2.312
203.359	2.020
203.421	2.253
203.954	1.926
205.331	2.440
206.457	2.008
206.537	2.311
209.638	2.311
228.995	2.800
230.356	3.255
230.691	2.182
231.299	2.135
231.439	2.660
231.457	2.730
233.209	2.322
234.884	1.622
235.014	2.112
235.659	2.205
235.780	2.660
235.805	2.753
236.469	2.917
237.610	2.543
238.174	2.333
238.190	2.391
239.514	2.706
244.466	2.671
246.299	2.566
246.476	3.231
248.867	2.893
249.360	2.414
253.062	2.344
253.732	2.531
253.794	2.764
256.331	2.974
257.395	2.309
259.370	2.740
291.723	3.124
292.244	2.751
292.269	2.844
294.704	2.669
299.538	2.190
299.817	3.240
312.749	2.890
313.890	2.516
314.150	3.496
314.426	2.201
315.847	2.878
315.986	3.403
320.142	2.703
320.939	3.368
323.723	2.177
323.993	3.192
328.936	3.122
332.571	2.795
333.833	2.877
343.210	3.156
343.921	3.495
345.707	3.215
346.256	2.946
346.346	3.285
347.043	3.576
347.546	3.133
348.327	3.740
348.383	3.950
357.382	2.806
359.429	3.506
359.907	2.969
360.638	3.389
361.854	3.296
363.144	3.482
365.439	2.782
366.248	3.494
367.241	2.560
367.361	3.015
367.396	3.144
367.458	3.377
367.696	4.275
370.503	3.167
372.460	3.528
372.512	3.727
376.234	3.727
377.347	3.248
377.579	4.123
379.263	3.458
379.304	3.610
381.816	3.726
394.868	3.831
395.454	3.702
414.188	4.180
416.569	3.806
419.149	4.179
425.255	3.818
435.058	3.362
435.653	3.269
437.542	3.374
437.734	4.097
437.824	4.435
438.751	3.257
438.900	3.817
439.440	3.514
439.464	3.607
441.142	2.918
442.513	3.408
472.599	4.597
472.872	3.290
476.032	3.512
476.612	3.360
478.094	4.270
478.668	4.095
478.842	4.748
482.885	3.628
483.459	3.453
483.723	4.445
515.930	4.280
515.974	4.443
517.034	3.766
517.676	3.848
517.760	4.163
517.834	4.443
518.532	4.735
519.807	4.863
536.345	4.081
536.937	3.976
537.207	4.990
537.712	4.559
538.767	3.859
538.909	4.395
538.981	4.664
539.033	4.862
539.067	4.990
570.611	4.662];
data.tL(:,1) = data.tL(:,1)-45; % set origin at birth
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'High1956';

% length-weight
data.LW = [ ... % SVL (cm), weight (g)
1.411	0.808
1.452	1.616
1.472	0.707
1.533	1.111
1.554	1.515
1.564	1.818
1.584	2.121
1.645	1.515
1.666	2.121
1.726	1.515
1.736	1.313
1.777	1.212
1.777	2.020
1.818	2.121
1.868	1.313
1.909	1.414
1.930	1.818
1.940	2.626
1.960	2.020
1.980	1.717
2.001	3.131
2.052	1.919
2.082	2.626
2.092	2.323
2.093	3.232
2.153	2.323
2.174	3.030
2.174	3.434
2.194	2.727
2.215	3.939
2.225	4.040
2.255	2.828
2.266	3.232
2.296	2.323
2.327	3.838
2.347	2.929
2.347	3.838
2.357	3.434
2.378	3.838
2.429	4.444
2.469	3.131
2.479	3.434
2.479	4.040
2.500	4.747
2.561	5.152
2.581	4.040
2.581	4.848
2.601	3.030
2.663	4.949
2.663	5.253
2.694	6.061
2.713	3.737
2.713	4.343
2.734	5.253
2.754	4.141
2.795	5.354
2.795	6.263
2.826	5.960
2.835	4.444
2.846	5.657
2.897	5.253
2.907	6.667
2.988	6.263
2.989	7.879
3.019	5.253
3.019	6.970
3.029	6.465
3.030	7.273
3.049	6.061
3.079	4.848
3.090	6.566
3.100	5.758
3.111	6.970
3.162	7.980
3.162	8.586
3.171	6.162
3.182	7.576
3.191	5.253
3.274	8.081
3.284	7.677
3.325	9.899
3.345	8.889
3.346	9.596
3.375	8.081
3.376	8.990
3.376	9.899
3.416	8.283
3.478	10.000
3.487	8.182
3.487	8.586
3.497	7.778
3.519	10.707
3.530	12.020
3.539	9.899
3.549	10.303
3.550	11.818
3.560	11.414
3.580	11.212
3.599	7.273
3.601	12.929
3.610	9.192
3.651	10.202
3.723	11.818
3.763	10.505
3.773	10.101
3.794	12.626
3.796	16.465
3.805	14.949
3.815	13.434
3.845	12.525
3.866	13.232
3.876	14.242
3.906	13.838
3.915	10.202
3.916	13.030
3.938	15.455
3.958	14.848
3.969	16.768
3.976	10.707
3.977	12.323
3.977	12.828
3.988	14.444
3.989	15.758
4.029	16.061
4.090	15.657
4.100	14.949
4.132	19.293
4.182	17.273
4.202	15.253
4.202	16.061
4.274	16.970
4.294	17.677
4.295	18.283
4.295	18.990
4.296	21.414
4.303	15.152
4.314	17.273
4.324	15.859
4.388	22.525
4.490	22.626
4.500	24.242
4.582	24.444
4.591	21.919
4.692	20.101
4.692	21.717
4.756	28.687
4.765	25.354
4.765	26.061
4.766	27.071
4.766	28.283
4.795	23.737
4.805	22.929
4.825	21.919
4.876	23.434
4.876	24.040
4.879	29.293
4.894	16.970
4.898	26.364
4.898	26.869
4.910	31.212
4.917	24.949
4.929	29.293
4.959	26.162
4.970	28.081
4.971	31.111
4.980	28.788
4.988	23.737
4.990	27.475
4.990	27.677
4.998	24.242
4.999	25.253
5.012	32.121
5.020	26.364
5.070	25.051
5.070	26.364
5.071	27.071
5.099	22.424
5.100	24.444
5.102	27.778
5.102	28.182
5.103	30.909
5.103	31.414
5.103	32.020
5.111	25.253
5.115	34.545
5.123	30.303
5.145	34.747
5.152	27.475
5.173	28.384
5.183	27.071
5.193	27.980
5.193	28.889
5.194	30.202
5.194	30.707
5.206	33.838
5.216	32.929
5.216	33.434
5.258	36.566
5.272	21.919
5.274	27.677
5.285	29.899
5.287	33.535
5.287	34.343
5.288	34.949
5.289	37.374
5.296	31.212
5.298	35.253
5.303	24.444
5.307	32.525
5.341	40.101
5.349	37.071
5.377	29.798
5.378	33.535
5.389	35.051
5.390	35.960
5.390	37.475
5.409	34.242
5.411	39.394
5.429	33.131
5.455	22.020
5.478	29.495
5.479	31.717
5.481	34.949
5.481	36.263
5.482	38.081
5.482	38.990
5.484	42.727
5.491	34.343
5.499	31.010
5.500	32.626
5.502	36.667
5.502	37.677
5.511	33.636
5.521	34.949
5.543	38.081
5.552	35.455
5.572	33.636
5.572	34.646
5.578	24.444
5.583	36.162
5.586	42.727
5.587	46.162
5.592	32.929
5.593	37.273
5.596	42.020
5.598	24.747
5.609	49.899
5.612	32.525
5.621	30.505
5.624	38.081
5.633	35.758
5.645	39.394
5.649	48.990
5.654	36.465
5.656	39.899
5.657	42.323
5.663	57.778
5.664	34.747
5.664	35.152
5.672	31.313
5.673	33.434
5.675	38.586
5.676	40.101
5.677	41.818
5.680	50.101
5.681	50.909
5.683	32.828
5.692	29.899
5.692	30.707
5.693	32.222
5.705	36.465
5.709	45.859
5.728	42.626
5.765	35.354
5.769	43.535
5.777	38.384
5.780	44.848
5.781	48.889
5.784	54.848
5.787	39.091
5.790	45.758
5.798	41.212
5.799	42.828
5.802	48.283
5.803	28.788
5.811	46.364
5.815	33.030
5.816	34.242
5.816	34.545
5.826	33.636
5.839	40.404
5.868	36.566
5.871	43.636
5.872	47.778
5.873	49.091
5.879	38.889
5.880	40.909
5.880	42.222
5.884	50.303
5.890	41.616
5.902	46.667
5.906	31.010
5.910	41.212
5.912	45.354
5.927	57.172
5.940	39.192
5.952	44.444
5.953	46.465
5.954	47.273
5.960	39.495
5.964	48.687
5.966	53.131
5.967	31.111
5.971	63.030
5.971	41.717
5.972	42.727
5.972	43.737
5.984	24.646
5.987	55.051
5.993	44.747
6.000	36.667
6.001	39.899
6.001	40.404
6.004	45.859
6.006	51.414
6.023	44.444
6.024	44.747
6.059	55.354
6.065	46.061
6.065	46.869
6.074	43.939
6.084	43.535
6.085	44.949
6.089	56.061
6.094	43.030
6.096	48.586
6.096	48.889
6.103	40.707
6.123	38.889
6.136	45.960
6.147	48.485
6.155	43.535
6.158	50.000
6.158	51.212
6.160	55.758
6.167	46.364
6.170	55.253
6.174	41.313
6.185	42.727
6.190	53.434
6.194	39.798
6.195	41.919
6.210	52.626
6.226	43.535
6.255	38.485
6.263	57.677
6.280	51.111
6.283	55.960
6.287	42.727
6.289	47.475
6.299	46.364
6.340	47.475
6.366	61.111
6.374	55.859
6.375	57.879
6.379	44.949
6.396	60.404
6.498	60.909
6.542	69.495
6.575	50.909
6.581	64.747
6.583	45.758
6.592	44.040
6.596	51.616
6.765	68.081
6.847	68.485
6.863	58.182];
units.LW  = {'cm', 'g'}; label.LW = {'SVL','weight'};  
bibkey.LW = 'High1956';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hm only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'found in the Great Smoky Mountains from Mt. Sterling to the mountains north of Bryson City, NC ';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'The larval stage is passed within the egg capsule; reproduction is terrestrial';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'Eric Liebgold kindly helped collecting data for this entry';

%% Links
metaData.links.id_CoL = '6W27T'; % Cat of Life
metaData.links.id_ITIS = '173650'; % ITIS
metaData.links.id_EoL = '333694'; % Ency of Life
metaData.links.id_Wiki = 'Plethodon_glutinosus'; % Wikipedia
metaData.links.id_ADW = 'Plethodon_glutinosus'; % ADW
metaData.links.id_Taxo = '47447'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Plethodon+glutinosus'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plethodon_glutinosus}}';
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
bibkey = 'High1956'; type = 'Article'; bib = [ ... 
'author = {Richard Highton}, ' ... 
'year = {1956}, ' ...
'title = {The Life History of the Slimy Salamander, \emph{Plethodon glutinosus}, in {F}lorida}, ' ...
'journal = {Copeia}, ' ...
'volume = {1956(2)}, ' ...
'pages = {75-93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Plethodon+glutinosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

