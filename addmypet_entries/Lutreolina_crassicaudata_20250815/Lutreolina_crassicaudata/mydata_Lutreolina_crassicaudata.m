function [data, auxData, metaData, txtData, weights] = mydata_Lutreolina_crassicaudata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Lutreolina_crassicaudata'; 
metaData.species_en = 'Big lutrine opossum'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 15];

%% set data
% zero-variate data

data.tg = 14;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 84;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'IodiCerv2025';   
  temp.tx = C2K(35.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 183;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 95;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'IodiCerv2025';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'IodiCerv2025';
data.Wwim = 1200;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'IodiCerv2025';

data.Ri  = 9*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-11 pups per litter, 2 litters per yr';
 
% univartia data
% time-weight
data.tW2_f = [ ... % age class (d), wet weight (g)
89.478	95.694
93.861	112.440
101.165	126.794
106.278	143.541
115.774	172.249
117.965	181.818
121.617	203.349
126.730	222.488
136.226	227.273
139.878	227.273
145.722	234.450
153.757	251.196
161.061	263.158
165.443	275.120
172.748	291.866
180.052	291.866
188.817	306.220
196.852	311.005
201.965	315.789
209.270	322.967
214.383	320.574
224.609	322.967
229.722	325.359
237.757	330.144
245.061	322.967
250.904	318.182
256.748	332.536
266.244	334.928
272.087	346.890
279.391	358.852
285.965	363.636
291.078	361.244
300.574	370.813
307.148	382.775
315.183	385.167
322.487	397.129
326.870	385.167
337.096	387.560
342.939	380.383
351.704	392.345
356.087	380.383
362.661	399.522
370.696	382.775
377.270	401.914
384.574	401.914
391.878	413.876
398.452	421.053
405.026	433.014
413.061	449.761
418.174	461.722
426.209	468.900
432.783	478.469
443.009	471.292
448.122	478.469
455.426	485.646
461.270	507.177
469.304	500.000
475.878	502.392
480.991	495.215
491.217	490.431
497.791	480.861
504.365	473.684
511.670	466.507
518.974	502.392
527.739	476.077
534.313	480.861
538.696	473.684
546.000	478.469
553.304	473.684
560.609	459.330
566.452	452.153
573.026	459.330
581.061	449.761
587.635	456.938
594.939	468.900
600.783	476.077
608.087	461.722
616.122	473.684
623.426	483.254
630.730	485.646
638.035	485.646
646.070	485.646];
units.tW2_f   = {'d', 'g'};  label.tW2_f = {'time since birth', 'wet weight', 'female litter 2'};  
temp.tW2_f    = C2K(35.8);  units.temp.tW2_f = 'K'; label.temp.tW2_f = 'temperature';
bibkey.tW2_f  = 'IodiCerv2025';
% 
data.tW2_m = [ ... % age class (d), wet weight (g)
89.478	102.871
95.322	110.048
101.165	126.794
105.548	150.718
112.852	174.641
119.426	193.780
128.922	217.703
134.035	265.550
139.878	279.904
147.913	294.258
153.026	330.144
161.061	346.890
168.365	370.813
174.209	394.737
182.244	411.483
188.087	454.545
194.661	464.115
201.235	480.861
210.730	500.000
216.574	519.139
223.878	526.316
231.183	545.455
237.026	555.024
245.061	574.163
252.365	595.694
260.400	641.148
264.052	665.072
274.278	669.856
280.852	700.957
285.965	696.172
291.809	741.627
300.574	736.842
307.148	751.196
314.452	777.512
321.757	729.665
329.061	779.904
334.174	789.474
341.478	803.828
348.783	796.651
357.548	789.474
361.930	839.713
370.696	727.273
378.730	813.397
384.574	784.689
390.417	808.612
399.183	808.612
406.487	830.144
412.330	870.813
418.174	882.775
425.478	885.167
434.974	846.890
443.009	856.459
447.391	906.699
453.965	873.206
462.000	897.129
467.844	875.598
476.609	892.345
484.644	906.699
490.487	899.522
498.522	887.560
506.557	844.498
510.939	909.091
519.704	882.775
524.817	901.914
532.122	901.914
540.887	870.813
546.730	870.813
554.765	877.990
559.878	892.345
568.643	944.976
573.757	985.646
579.600	1014.354
588.365	1066.986
596.400	1098.086
602.244	1050.239
611.739	1055.024
616.122	1088.517
623.426	1169.856
630.000	1167.464
636.574	1196.172
644.609	1193.780];
units.tW2_m   = {'d', 'g'};  label.tW2_m = {'time since birth', 'wet weight', 'male litter 2'};  
temp.tW2_m    = C2K(35.8);  units.temp.tW2_m = 'K'; label.temp.tW2_m = 'temperature';
bibkey.tW2_m  = 'IodiCerv2025';
% 
data.tW3_f = [ ... % age class (d), wet weight (g)
92.400	100.478
98.243	110.048
107.009	114.833
109.200	119.617
118.696	133.971
124.539	145.933
134.035	167.464
138.417	174.641
143.530	179.426
153.026	193.780
161.061	196.172
166.174	210.526
173.478	215.311
181.513	222.488
189.548	217.703
194.661	224.880
200.504	246.411
210.000	248.804
218.035	251.196
223.878	265.550
231.913	272.727
236.296	279.904
244.330	287.081
249.443	296.651
260.400	308.612
266.244	325.359
272.817	320.574
280.852	313.397
288.157	306.220
292.539	318.182
300.574	320.574
310.070	303.828
313.722	313.397
321.757	318.182
330.522	308.612
335.635	311.005
345.130	339.713
350.244	344.498
359.739	344.498
366.313	332.536
369.965	334.928
378.730	346.890
384.574	356.459
390.417	356.459
398.452	368.421
405.757	356.459
413.061	366.029
419.635	368.421
425.478	373.206
434.244	375.598
443.009	366.029
446.661	366.029
456.157	366.029
462.000	368.421
470.035	361.244
475.148	361.244
483.913	363.636
490.487	366.029
496.330	375.598
503.635	370.813
510.209	368.421
516.783	377.990
527.009	366.029
532.122	356.459
540.157	356.459
543.809	366.029
551.113	375.598
561.339	380.383
565.722	377.990
575.217	377.990
581.791	368.421
587.635	370.813
595.670	370.813
602.244	377.990
610.278	370.813
617.583	385.167
622.696	382.775
629.270	382.775
635.844	387.560
643.878	380.383];
units.tW3_f   = {'d', 'g'};  label.tW3_f = {'time since birth', 'wet weight', 'female litter 3'};  
temp.tW3_f    = C2K(35.8);  units.temp.tW3_f = 'K'; label.temp.tW3_f = 'temperature';
bibkey.tW3_f  = 'IodiCerv2025';
% 
data.tW3_m = [ ... % age class (d), wet weight (g)
90.209	100.478
96.783	129.187
102.626	148.325
109.930	165.072
119.426	193.780
126.000	217.703
133.304	258.373
137.687	279.904
144.261	301.435
154.487	330.144
161.061	349.282
167.635	373.206
175.670	394.737
179.322	387.560
186.626	411.483
193.930	411.483
200.504	437.799
209.270	473.684
218.035	476.077
226.800	502.392
231.913	528.708
237.026	552.632
243.600	578.947
250.174	588.517
259.670	607.655
264.783	619.617
272.817	588.517
280.122	543.062
286.696	538.278
293.270	578.947
303.496	586.124
306.417	612.440
316.643	622.010
321.757	643.541
328.330	677.033
337.096	619.617
343.670	657.895
349.513	610.048
356.087	638.756
364.122	622.010
372.157	662.679
379.461	679.426
385.304	667.464
391.148	662.679
396.991	638.756
407.217	629.187
413.791	660.287
418.174	653.110
428.400	650.718
432.783	696.172
443.739	686.603
448.122	705.742
455.426	748.804
462.730	741.627
470.765	705.742
476.609	708.134
483.913	688.995
491.217	727.273
497.061	734.450
506.557	744.019
510.939	760.766
520.435	770.335
525.548	782.297
532.122	760.766
540.157	779.904
546.000	806.220
551.843	799.043
558.417	811.005
568.643	832.536
576.678	832.536
581.061	851.675
586.174	854.067
594.939	873.206
602.974	894.737
608.087	877.990
615.391	880.383
622.696	921.053
630.000	899.522
636.574	940.191
644.609	940.191];
units.tW3_m   = {'d', 'g'};  label.tW3_m = {'time since birth', 'wet weight', 'male litter 3'};  
temp.tW3_m    = C2K(35.8);  units.temp.tW3_m = 'K'; label.temp.tW3_m = 'temperature';
bibkey.tW3_m  = 'IodiCerv2025';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2_f = 3 * weights.tW2_f;
weights.tW2_m = 3 * weights.tW2_m;
weights.tW3_f = 3 * weights.tW3_f;
weights.tW3_m = 3 * weights.tW3_m;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Group plots
set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WGK7'; % Cat of Life
metaData.links.id_ITIS = '552544'; % ITIS
metaData.links.id_EoL = '290122'; % Ency of Life
metaData.links.id_Wiki = 'Lutreolina_crassicaudata'; % Wikipedia
metaData.links.id_ADW = 'Lutreolina_crassicaudata'; % ADW
metaData.links.id_Taxo = '59834'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10400067'; % MSW3
metaData.links.id_AnAge = 'Lutreolina_crassicaudata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutreolina_crassicaudata}}';
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
bibkey = 'IodiCerv2025'; type = 'Article'; bib = [ ... 
'doi = {10.31687/saremMN.25.32.02.08.e1174}, ' ...
'author = {Omar H. Iodice and Claudio O. Cervino}, ' ... 
'year = {2025}, ' ...
'title = {GROWTH AND COMPENSATORY GROWTH OF \emph{Lutreolina crassicaudata} ({M}ARSUPIALIA-{D}IDELPHIDAE) UNDER ANIMAL FACILITY CONDITIONS}, ' ...
'journal = {Mastozoología Neotropical}, ' ...
'volume = {32(2)}, ' ...
'pages = {e01174}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lutreolina_crassicaudata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

