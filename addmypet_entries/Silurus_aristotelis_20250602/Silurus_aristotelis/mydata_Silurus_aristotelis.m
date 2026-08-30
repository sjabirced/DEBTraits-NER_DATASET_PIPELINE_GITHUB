  function [data, auxData, metaData, txtData, weights] = mydata_Silurus_aristotelis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Silurus_aristotelis'; 
metaData.species_en = 'Aristotle''s catfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

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
data.ab = 5;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'fishbase';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2.5*365;    units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from tL-data for L = 87.5 cm';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'for females';
data.Li = 46;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 1.3 mm: pi/6*0.13^3';
data.Wwp = 68.4;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00562*Lp^3.00, see F1';
data.Wwi = 547;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.00, see F1';
  
data.Ri = 18000/ 365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
0.413	10.167
0.669	14.409
0.903	15.662
0.925	20.716
1.174	19.469
1.415	21.646
1.664	20.942
1.913	22.521
1.920	20.836
2.155	23.012
2.404	23.667
2.909	25.738
2.923	23.890
3.172	26.121
3.414	27.048
3.656	29.279
3.898	25.640
3.905	31.455
4.175	31.784
4.410	31.841
4.829	30.976];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeonTsik2009';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.197	13.500
14.286	19.522
14.749	27.726
15.058	32.417
15.753	27.785
16.062	40.653
16.293	32.489
16.525	27.830
16.757	37.189
17.220	44.226
17.220	31.375
17.452	46.576
17.606	37.239
17.683	32.570
18.069	47.780
18.069	54.789
18.378	57.144
18.378	43.125
18.764	41.979
18.842	46.657
18.996	68.862
19.073	36.156
19.228	59.530
19.691	58.389
19.846	47.884
20.077	59.579
20.309	66.602
20.309	45.574
20.541	53.765
20.618	86.480
20.772	72.470
20.849	59.625
21.236	77.170
21.236	59.647
21.544	92.375
21.776	80.707
21.853	81.879
22.008	65.533
22.162	91.243
22.239	119.285
22.471	94.766
22.548	85.425
22.548	64.397
22.703	70.247
23.166	86.629
23.398	97.157
23.475	79.638
23.629	84.320
23.707	117.034
23.938	101.861
24.015	106.538
24.247	87.860
24.479	125.257
24.633	114.752
24.788	122.939
24.942	101.920
25.097	129.966
25.097	89.078
25.251	125.302
25.714	149.862
25.714	113.647
25.792	132.343
25.869	107.815
25.946	142.866
26.023	120.674
26.255	138.211
26.409	130.043
26.486	123.038
26.486	117.197
26.718	148.752
26.795	156.934
26.795	132.402
26.795	124.224
27.104	142.934
27.104	132.420
27.259	133.597
27.259	124.251
27.336	156.966
27.413	179.167
27.568	124.269
27.799	180.358
27.799	153.488
27.876	142.979
28.108	134.815
28.185	158.184
28.185	167.530
28.185	124.305
28.417	174.553
28.803	124.341
28.958	147.715
29.344	169.934
29.421	238.863
29.575	187.471
29.575	181.630
29.961	216.699
30.039	265.769
30.193	139.610
30.656	208.562
30.734	219.080
31.351	249.490
31.506	227.303
32.124	277.573
32.510	270.586
32.819	275.277
32.819	258.922
32.896	286.964
33.205	337.215
33.205	249.599
33.282	253.108
33.514	274.149
35.290	398.085];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','wet weight', 'females'}; 
bibkey.LW_f = {'AlpKara2011'};
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
14.319	17.523
15.175	19.860
15.175	45.561
15.409	19.860
15.642	23.364
16.342	23.364
16.654	23.364
16.654	32.710
16.887	31.542
17.432	28.037
17.588	36.215
17.821	39.720
17.977	31.542
18.054	56.075
18.444	32.710
18.521	39.720
18.911	33.878
19.066	43.224
19.455	50.234
19.533	39.720
19.611	67.757
19.844	56.075
20.078	43.224
20.233	59.579
20.233	47.897
20.389	63.084
20.700	72.430
20.700	65.421
20.700	51.402
20.856	60.748
20.934	89.953
21.012	72.430
21.245	51.402
21.323	63.084
21.401	81.776
21.790	73.598
22.257	67.757
22.257	64.252
22.335	92.290
22.412	122.664
22.490	81.776
22.802	88.785
22.802	47.897
22.879	74.766
23.113	91.122
23.268	59.579
23.502	82.944
23.502	73.598
23.735	100.467
24.125	115.654
24.202	93.458
24.591	110.981
24.591	88.785
24.669	99.299
24.903	103.972
24.981	95.794
25.136	133.178
25.292	102.804
25.370	93.458
25.603	141.355
25.681	123.832
25.681	100.467
25.992	147.196
25.992	112.150
26.148	122.664
26.304	130.841
26.304	120.327
26.615	132.009
26.615	142.523
27.160	137.850
27.393	148.364
28.093	184.579
28.093	120.327
28.171	147.196
28.249	170.561
28.405	191.589
28.482	132.009
30.117	262.850
31.128	235.981
33.696	373.832
36.732	435.748];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','wet weight', 'males'}; 
bibkey.LW_m = {'AlpKara2011'};
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Acheloos drainage in Greece. Introduced in Lakes Pamvotis and Volvi';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6YQ6H'; % Cat of Life
metaData.links.id_ITIS = '681957'; % ITIS
metaData.links.id_EoL = '1156756'; % Ency of Life
metaData.links.id_Wiki = 'Silurus_aristotelis'; % Wikipedia
metaData.links.id_ADW = 'Silurus_aristotelis'; % ADW
metaData.links.id_Taxo = '44027'; % Taxonomicon
metaData.links.id_WoRMS = '1287492'; % WoRMS
metaData.links.id_fishbase = 'Silurus_aristotelis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Silurus_aristotelis}}';  
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
bibkey = 'LeonTsik2009'; type = 'Article'; bib = [ ...    
'doi = {10.1111/j.1439-0426.2009.01311.x}, ' ...
'author = {Leonardos, I. D. and Tsikliras, A. C. and Batzakas, I. and Ntakis, A. and Liousia, V.}, ' ...
'year  = {2009}, ' ...
'title = {Life-history characteristics of the endangered {A}ristotle''s catfish (\emph{Silurus aristotelis} {G}arman, 1890), {L}ake {P}amvotis, north-western {G}reece}, ' ...  
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {25(6)}, ' ...
'pages = {746–751}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Silurus_aristotelis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

