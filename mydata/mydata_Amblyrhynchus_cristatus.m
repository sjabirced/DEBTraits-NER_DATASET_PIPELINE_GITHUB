function [data, auxData, metaData, txtData, weights] = mydata_Amblyrhynchus_cristatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Amblyrhynchus_cristatus'; 
metaData.species_en = 'Galapagos marine iguana'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 08 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 03];

%% set data
% zero-variate data

data.ab = 4*30.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3-4 mnth; temp is guessed';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HugiSanch2012';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '3-5 yrs';
data.tpm = 7*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty  for males'; bibkey.tpm = 'HugiSanch2012';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '6-8 yrs'; 
data.am = 60*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'HugiSanch2012: 20-30 yrs; AnAge gives 6.4 yrs'; 

data.Lb = 11;  units.Lb = 'g';   label.Lb = 'SVL at birth';    bibkey.Lb = 'Wiki';
  comment.Lb = '9.5–13 cm';
data.Li = 44.5;  units.Li = 'g';   label.Li = 'ultimate SVL for females';    bibkey.Li = 'Wiki';
data.Lim = 56;  units.Lim = 'g';   label.Lim = 'ultimate SVL for males';    bibkey.Lim = 'Wiki';

data.Wwb = 100; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = '80-120 g';
data.Wwi = 6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'Wiki';
data.Wwim = 12e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for females';    bibkey.Wwim = 'Wiki';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 eggs per clutch, 1 clutch per yr'; 

% uni-variate data

% length-change in length
data.LdL_f = [ ... % SVL (cm), SVL (cm) after 17 mnth
16.625	4.725
16.625	3.931
17.211	3.790
18.090	4.477
18.501	2.924
18.618	5.765
19.497	7.424
19.966	3.824
20.084	3.329
20.142	4.529
20.436	4.070
20.611	3.682
20.787	5.111
20.787	3.911
20.963	3.823
21.080	4.829
21.725	4.599
21.725	4.387
21.784	5.817
21.843	2.005
22.370	1.422
22.429	5.287
22.429	3.134
22.487	2.534
23.543	5.286
23.543	2.886
23.894	-1.561
24.012	4.492
24.363	3.186
24.481	2.198
24.481	1.721
24.598	2.321
25.184	-0.203
25.477	0.644
26.064	1.332
26.181	3.873
26.298	-0.238
26.474	0.891
26.709	-0.345
26.884	1.261
27.002	-0.362
27.002	0.185
27.236	0.749
27.236	-0.962
27.529	-0.398
27.529	0.326
27.764	2.267
27.822	0.908
27.881	1.455
28.116	0.749
28.467	0.308
28.760	0.484
28.760	-1.599
28.760	-0.275
28.995	2.143
29.229	-0.399
29.464	0.413
29.698	1.383
30.050	-1.211
30.637	-0.099
30.988	1.065
31.106	1.383
31.106	-0.859
31.750	1.929
32.337	1.276
33.216	0.870];
units.LdL_f   = {'cm', 'cm'};  label.LdL_f = {'SVL', 'change in SVL after 17 mnth','females'};  
temp.LdL_f    = C2K(24);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'WikeCarr1997';
comment.LdL_f = 'data from island Santa Fe';
%
data.LdL_m = [ ... % SVL (cm), SVL (cm) after 17 mnth
16.449	3.084
18.325	5.942
18.384	6.189
18.794	5.624
18.853	6.859
19.146	6.083
20.846	4.335
21.198	4.882
21.198	4.388
21.256	4.758
21.843	5.305
22.253	5.605
22.487	4.422
22.546	3.822
22.898	4.140
23.074	6.046
23.543	3.610
23.601	5.410
23.719	6.486
25.712	4.315
25.946	2.197
26.357	0.997
26.533	1.226
27.002	3.785
27.060	2.779
27.060	1.879
28.350	3.308
28.526	3.943
28.526	1.137
29.640	1.613
30.285	2.583
30.402	4.048
30.930	2.124
31.223	3.359
31.457	2.847
31.868	4.082
32.044	2.970
32.513	1.558
33.099	1.805
35.385	1.063
35.444	0.498
35.561	-1.020
36.147	1.715
36.558	3.286
36.734	1.362
36.792	3.109
37.085	1.574
37.554	1.468
37.613	2.050
37.906	-0.685
37.965	2.791
38.023	0.303
38.082	1.485
38.199	1.820
38.258	1.397
38.551	2.491
38.551	1.061
38.551	0.849
38.610	1.185
38.610	0.602
38.727	2.667
39.020	2.420
39.079	3.779
39.079	0.055
39.137	0.867
39.196	3.108
39.196	0.708
39.489	1.890
39.489	0.531
39.665	1.661
39.782	1.784
39.841	2.349
39.841	1.961
39.841	0.725
39.841	0.355
39.899	1.890
40.017	3.708
40.075	-0.934
40.134	0.160
40.193	1.572
40.193	-0.281
40.251	3.460
40.310	2.560
40.369	2.102
40.427	1.837
40.427	0.319
40.603	-1.146
40.662	1.025
40.779	1.660
40.838	0.919
40.896	1.801
40.955	1.589
41.131	4.166
41.131	0.672
41.189	0.954
41.482	2.013
41.658	2.419
41.658	0.142
41.717	4.536
41.776	2.577
41.776	0.724
41.834	1.871
41.834	0.213
41.893	2.348
41.893	0.318
41.951	3.548
42.010	3.795
42.362	0.830
42.538	2.753
42.596	3.283
42.889	0.724
43.183	0.847
43.241	0.124];
units.LdL_m   = {'cm', 'cm'};  label.LdL_m = {'SVL', 'change in SVL after 17 mnth','males'};  
temp.LdL_m    = C2K(24);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'WikeCarr1997';
comment.LdL_m = 'data from island Santa Fe';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.ab = 3 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

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
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic to Galapogos Islands';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);
metaData.discussion = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5TZN4'; % Cat of Life
metaData.links.id_ITIS = '566844'; % ITIS
metaData.links.id_EoL = '46559659'; % Ency of Life
metaData.links.id_Wiki = 'Amblyrhynchus_cristatus'; % Wikipedia
metaData.links.id_ADW = 'Amblyrhynchus_cristatus'; % ADW
metaData.links.id_Taxo = '49075'; % Taxonomicon
metaData.links.id_WoRMS = '344019'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Amblyrhynchus&species=cristatus'; % ReptileDB
metaData.links.id_AnAge = 'Amblyrhynchus_cristatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amblyrhynchus_cristatus}}';
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
bibkey = 'HugiSanch2012'; type = 'Article'; bib = [ ... 
'author = {Jasmina Hugi and Marcelo R. S\''{a}nchez-Villagra}, ' ... 
'year = {2012}, ' ...
'title = {Life History and Skeletal Adaptations in the {G}alapagos Marine Iguana (\emph{Amblyrhynchus cristatus}) as Reconstructed with Bone Histological Data—A Comparative Study of Iguanines}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {46(3)}, ' ...
'pages = {312–324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WikeCarr1997'; type = 'Article'; bib = [ ... 
'doi = {10.2307/2265956}, ' ...
'author = {Wikelski, M. and Carrillo, V. and Trillmich, F.}, ' ... 
'year = {1997}, ' ...
'title = {Energy Limits to Body Size in a Grazing Reptile, the {G}alapagos Marine Iguana}, ' ...
'journal = {Ecology}, ' ...
'volume = {78(7)}, ' ...
'pages = {2204-2204-2217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Amblyrhynchus_cristatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Amblyrhynchus_cristatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

