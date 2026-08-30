function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_holbrookii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_holbrookii'; 
metaData.species_en = 'Spottail seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

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

data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(24.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'ManoPott1996';   
  temp.am = C2K(24.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';  
data.Li  = 46;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodus sargus: pi/6*0.085^3';
data.Wwp = 170;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.01230*Lp^3.04, see F1';
data.Wwi = 1395;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01230*Li^3.04, see F1; max. published weight: 6.5 kg';

data.GSI  = 0.05; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
 temp.GSI = C2K(24.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (cm),total length (cm)
    1 15.1
    2 18.0
    3 21.1
    4 23.4
    5 24.6
    6 25.8
    7 27.5
    8 30.8
    9 31.9
   10 33.8
   11 34.7];
data.tL(:,1) = (0.5+data.tL(:,1))*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ManoPott1996';
  
% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.620	5.224
7.245	6.940
8.124	11.629
13.793	53.580
13.837	61.233
13.968	47.481
14.408	61.299
14.539	55.195
14.848	65.938
14.935	56.770
15.244	78.221
15.375	65.999
15.550	62.959
15.727	79.806
16.123	79.851
16.694	89.095
16.871	101.352
17.134	98.323
17.353	90.700
18.101	104.552
18.103	121.379
18.323	122.933
18.499	130.602
18.673	112.266
18.763	135.221
19.026	133.722
19.419	110.822
19.509	129.188
20.124	133.847
20.299	126.219
20.390	155.293
21.049	161.487
21.269	163.042
21.833	103.451
21.884	167.701
22.148	173.850
22.326	192.226
22.543	166.247
22.545	184.603
22.635	206.028
22.719	176.975
22.853	193.816
22.898	199.940
22.944	219.831
22.986	206.069
23.034	241.256
23.291	184.689
23.294	215.282
23.513	207.659
23.647	226.030
23.775	189.333
23.827	264.291
23.912	244.416
23.953	213.828
23.989	144.998
24.119	123.598
24.120	135.835
24.177	259.743
24.214	193.972
24.260	207.744
24.306	232.224
24.439	238.358
24.481	221.537
24.571	249.080
24.572	253.669
24.657	232.264
24.670	346.988
24.788	226.161
24.834	242.992
24.881	267.472
25.016	302.669
25.049	200.187
25.230	252.215
25.238	322.579
25.247	405.181
25.272	233.864
25.324	304.234
25.358	210.930
25.496	267.542
25.532	203.302
25.626	253.790
25.674	290.507
25.800	244.632
25.804	278.285
26.023	276.780
26.064	246.192
26.201	298.216
26.242	264.568
26.291	316.582
26.323	204.922
26.331	282.934
26.382	342.596
26.550	275.311
26.556	330.379
26.641	305.914
26.643	321.211
27.088	371.740
27.126	321.266
27.212	304.450
27.350	361.063
27.388	312.119
27.527	373.320
27.596	202.009
27.609	319.792
27.699	342.747
27.789	358.054
28.047	315.254
28.049	325.961
28.096	358.089
28.098	377.974
28.138	336.679
28.182	341.273
28.448	364.248
28.614	274.018
28.619	324.497
28.670	385.688
28.710	347.452
28.799	365.818
28.891	401.010
29.244	411.758
29.331	405.649
29.361	284.812
29.554	436.268
29.599	446.980
29.722	367.453
29.909	474.549
29.991	424.081
30.121	408.799
30.177	511.291
30.213	442.462
30.252	395.048
30.343	431.769
30.393	482.253
30.610	459.333
30.692	405.805
30.696	442.517
30.744	485.353
30.782	430.290
31.221	422.692
31.234	542.005
31.546	583.341
31.581	502.275
31.850	560.432
31.884	462.539
31.890	520.666
31.897	581.852
31.924	430.421
31.931	494.667
32.460	513.083
33.302	586.602
34.448	621.915
34.942	724.458
35.289	681.667
36.785	712.432];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'ManoPott1996';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Chesapeake Bay to Florida and northeastern Gulf of Mexico. Not known from the West Indies';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CY2H'; % Cat of Life
metaData.links.id_ITIS = '169192'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_holbrookii'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_holbrookii'; % ADW
metaData.links.id_Taxo = '173230'; % Taxonomicon
metaData.links.id_WoRMS = '273972'; % WoRMS
metaData.links.id_fishbase = 'Diplodus_holbrookii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus_holbrookii}}';
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
bibkey = 'ManoPott1996'; type = 'Article'; bib = [ ... 
'author = {Charles S. Manooch and Jennifer C. Potts}, ' ... 
'year = {1996}, ' ...
'title = {GROWTH CHARACTERISTICS OF THE SPOTTAIL PINFISH, \emph{Diplodus holbrooki}, OFF {N}ORTH {C}AROLINA}, ' ...
'journal = {The Journal of the Elisha Mitchell Scientific Society}, ' ...
'volume = {112(1)}, ' ...
'pages = {7-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Diplodus_holbrookii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

