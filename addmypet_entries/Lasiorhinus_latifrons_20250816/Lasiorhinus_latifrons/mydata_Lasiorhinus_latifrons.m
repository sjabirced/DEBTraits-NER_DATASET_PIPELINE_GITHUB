function [data, auxData, metaData, txtData, weights] = mydata_Lasiorhinus_latifrons
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Vombatidae';
metaData.species    = 'Lasiorhinus_latifrons'; 
metaData.species_en = 'Southern hairy-nosed wombat'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 313;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 547;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 3633;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 32e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

data.JOi  = 2525;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(36.1);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 25250; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

% univariate data
% time-weight
data.tW = [ ...
5.492	41.129
11.902	82.307
21.053	41.924
27.457	1.402
37.526	1.916
43.018	2.197
56.751	43.746
63.158	44.074
71.405	167.045
80.558	167.513
88.791	86.233
96.116	127.456
105.273	168.775
117.187	373.631
123.582	210.558
136.406	333.761
148.317	497.769
154.728	538.947
162.041	416.770
173.962	703.326
178.553	907.810
180.363	621.953
186.800	1030.780
189.564	1276.018
190.438	704.167
195.050	1194.600
195.936	786.148
196.875	1112.994
200.515	827.232
201.472	1399.176
204.180	868.268
206.079	1807.907
208.762	950.202
212.457	1399.737
214.317	1808.328
217.015	1154.871
221.619	1522.753
227.126	1727.282
228.927	1318.878
233.596	2585.457
235.346	1482.605
239.055	2136.389
239.285	5281.826
242.678	1605.528
243.608	1809.823
245.465	2177.565
248.445	5363.993
251.062	3607.591
252.797	2300.490
253.036	5568.475
253.739	2668.185
260.162	2872.761
261.953	2341.806
262.205	5773.191
263.838	3077.197
264.032	5732.436
270.227	2832.424
273.826	1974.766
273.889	2832.611
273.934	3445.359
274.834	3241.157
280.338	3404.838
282.073	2097.735
282.192	3731.729
283.153	4344.524
288.594	3650.356
288.660	4549.053
289.419	2424.908
295.079	4712.780
295.967	4345.178
297.777	4059.323
297.858	5162.268
298.597	2752.173
299.820	6959.753
301.438	4059.510
304.104	2956.705
304.211	4427.298
304.262	5121.744
306.009	3978.043
306.060	4672.489
308.776	4264.132
308.839	5121.978
310.819	7164.562
311.654	6061.664
313.296	3488.218
314.325	5040.558
314.358	5489.907
316.120	4550.455
318.806	3733.598
320.711	4754.937
322.572	5163.530
322.617	5776.276
325.366	5817.267
329.889	5082.204
331.671	4428.701
331.797	6144.392
333.619	6021.937
333.741	7696.779
338.130	5123.474
339.945	4919.318
341.046	7452.053
341.761	4715.163
342.733	5491.356
345.608	7248.038
347.286	5164.792
349.141	5491.683
350.980	5614.325
351.001	5900.276
355.757	8351.498
360.163	6023.292
360.424	9577.226
364.740	6023.526
365.641	5819.324
373.005	6391.595
378.455	5819.978
383.116	6964.006
386.014	9047.487
386.792	7168.442
392.254	6760.225
395.000	6760.365
402.398	7781.983
408.730	6761.066
418.015	8558.925
433.713	10438.812
434.560	9499.313
441.006	10030.687
452.002	10194.648
460.120	8561.075
488.801	12729.206
498.936	13628.416
509.593	9176.347
535.525	13303.487
546.677	15591.639
551.995	13222.629
605.249	15472.080
625.255	13675.716
628.165	15922.597
652.117	18007.153
665.865	18252.953];
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(36.1); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TaggFinl2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3SG6W'; % Cat of Life
metaData.links.id_ITIS = '552679'; % ITIS
metaData.links.id_EoL = '47048632'; % Ency of Life
metaData.links.id_Wiki = 'Vombatus_ursinus'; % Wikipedia
metaData.links.id_ADW = 'Vombatus_ursinus'; % ADW
metaData.links.id_Taxo = '60453'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000012'; % MSW3
metaData.links.id_AnAge = 'Vombatus_ursinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lasiorhinus_latifrons}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lasiorhinus_latifrons}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/brv.12350}, '... 
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaggFinl2007'; type = 'article'; bib = [ ...  
'doi = {10.1071/zo07056}, '... 
'title = {Growth and development of the southern hairy-nosed wombat, Lasiorhinus latifrons (Vombatidae)}, ' ...
'volume = {55(5)}, ' ...
'year = {2007}, ' ...
'pages = {309–316}, ' ...
'author = {Taggart, D. A. and Finlayson, G. R. and Shimmin, G. and Gover, C. and Dibben, R. and White, C. R. and  Vernon Steele and Temple-Smith, P. D.}' ...
'journal = {Australian Journal of Zoology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

