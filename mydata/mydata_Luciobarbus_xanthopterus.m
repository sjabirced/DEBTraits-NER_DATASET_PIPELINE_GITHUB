  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_xanthopterus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_xanthopterus'; 
metaData.species_en = 'Yellowfin barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 11];

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 498;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^2.98, see F1';
data.Wwi = 29830; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.98, see F1';
    
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'MohaAlJu2020';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 1 15.3
 2 26.3
 3 35.9
 4 42.8
 5 49.0
 6 54.7
 7 57.1];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MohaAlJu2019';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.000	70.025
14.000	41.769
15.048	78.303
16.476	68.650
16.762	68.562
17.238	49.988
17.714	86.697
18.286	40.453
18.667	77.191
19.333	104.627
19.429	141.453
20.286	113.549
21.333	94.799
21.429	159.267
22.000	149.877
22.571	66.778
23.143	167.954
23.238	94.214
24.286	158.389
24.857	130.572
25.048	195.010
25.905	222.388
26.571	139.259
27.333	102.170
27.333	166.667
28.000	138.821
28.286	295.367
28.381	304.551
28.571	378.203
29.238	166.082
29.333	341.114
29.714	304.142
30.095	396.162
30.571	248.596
31.143	331.344
31.333	395.782
31.524	285.159
32.000	404.791
32.381	533.667
32.762	422.985
33.048	293.904
33.333	404.382
33.714	514.830
34.286	330.379
34.571	413.215
35.048	597.344
35.048	284.077
35.143	495.963
35.238	376.156
35.905	541.798
36.095	633.877
36.190	458.787
36.190	283.726
36.286	578.537
37.048	541.447
37.143	799.404
37.333	697.994
37.524	615.011
37.810	697.847
37.810	439.862
37.905	872.879
38.476	752.925
38.476	587.078
38.476	467.299
39.143	439.453
39.333	605.242
39.714	522.201
39.810	761.729
40.000	1084.152
40.000	982.801
40.190	927.460
40.286	862.934
40.857	825.904
40.952	936.440
41.143	706.037
41.238	1000.848
42.000	880.836
42.286	1101.878
42.381	991.284
42.571	1313.707
42.762	1230.724
42.952	1378.086
43.905	889.464
45.905	1220.545
45.905	1137.621
46.190	1275.740
46.286	1515.269
46.381	1017.696
54.952	3198.725
54.952	2848.602
55.619	2986.603
57.905	3299.169
59.714	3418.392
59.810	3206.447
60.095	3068.153];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MohaAlJu2019'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00977*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the Tigris-Euphrates basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WCLF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '208547'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_xanthopterus'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_xanthopterus'; % ADW
metaData.links.id_Taxo = '450014'; % Taxonomicon
metaData.links.id_WoRMS = '1022123'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus-xanthopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_xanthopterus}}';  
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
bibkey = 'MohaAlJu2019'; type = 'Article'; bib = [ ...  
'author = {Abdul-Razak M. Mohamed and Mohanad O.A. Al-Jubouri}, ' ...
'year = {2019}, ' ...
'title = { Growth and Exploitation Rates of Four Cyprinids Fish  in {A}l-{D}iwaniya {R}iver, {I}raq}, ' ... 
'journal = {IOSR Journal of Agriculture and Veterinary Science (IOSR-JAVS)}, ' ...
'volume = {12(8)}, '...
'pages = {58-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MohaAlJu2020'; type = 'Article'; bib = [ ...  
'author = {Abdul-Razak M Mohamed and Mohanad OA Al-Jubouri}, ' ...
'year = {2020}, ' ...
'title = {Biological properties of \emph{Luciobarbus xanthopterus} in the {A}l-{D}iwaniya {R}iver, middle of {I}raq }, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {8(1)}, '...
'pages = {92-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Luciobarbus-xanthopterus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

