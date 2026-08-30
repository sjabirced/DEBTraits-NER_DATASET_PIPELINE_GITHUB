function [data, auxData, metaData, txtData, weights] = mydata_Ballerus_sapa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ballerus_sapa'; 
metaData.species_en = 'White-eye bream'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 02];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'KompBlas1997';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 35;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1.575 mm of Brama brama: pi/6*.1575^3';
data.Wwp = 88;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^3.10, see F1';
data.Wwi = 584;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.10, see F1; max. published weight: 1.1 kg';

data.Ri  = 1e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    2 15.054	62.627
    3 20.986	164.926];
data.tLW(:,1) = 365 * (0 + data.tLW(:,1)); % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(12);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'KakaKoba2008'; treat.tLW = {1 {'lnegth','weight'}};

% length-weight
data.LW = [ ... % std length (cm), weight (g)
14.225	53.479
14.228	100.162
14.443	54.235
14.508	47.344
14.509	66.477
14.531	61.119
14.639	53.461
14.683	49.633
14.814	51.158
14.924	71.051
15.032	58.801
15.054	64.923
15.075	54.208
15.118	46.553
15.162	51.908
15.207	65.682
15.249	45.017
15.272	71.036
15.316	65.677
15.337	58.789
15.403	65.673
15.468	58.018
15.534	68.729
15.556	77.912
15.664	56.479
15.664	70.254
15.838	61.828
15.839	71.777
15.883	74.071
15.905	85.550
15.947	61.824
16.079	75.594
16.319	80.941
16.340	66.399
16.383	50.326
16.406	84.763
16.602	75.571
16.623	71.744
16.820	92.399
16.929	88.568
17.017	103.105
17.541	119.919
17.714	96.953
18.739	117.572
19.067	125.212
19.197	122.145
19.242	140.510
19.328	122.139
19.372	129.790
19.416	137.442
19.438	142.798
19.525	135.906
19.526	157.335
19.634	142.789
19.743	140.489
19.764	130.539
19.764	133.600
19.962	161.143
20.027	151.956
20.070	146.598
20.179	155.777
20.222	138.173
20.245	164.192
20.331	143.525
20.354	160.361
20.506	154.997
20.551	168.771
20.551	184.842
20.615	146.574
20.616	161.880
20.636	136.624
20.638	178.716
20.659	168.001
20.726	184.835
20.790	156.516
20.965	170.284
20.988	195.538
21.008	158.803
21.009	187.884
21.052	177.168
21.052	180.995
21.138	157.266
21.183	173.336
21.184	201.652
21.248	162.619
21.270	178.689
21.291	158.025
21.292	183.280
21.293	192.464
21.358	193.226
21.401	183.276
21.509	159.547
21.553	171.024
21.554	180.208
21.623	255.205
21.641	182.500
22.012	193.199
22.012	202.382
22.015	265.137
22.055	177.125
22.186	196.252
22.404	191.651
22.951	238.312
22.995	252.085
23.039	257.441
23.628	266.599
23.978	300.258
24.019	248.981
24.371	315.547
24.478	262.737
24.544	284.928
24.762	287.214
25.286	296.376
25.614	320.852
25.614	328.505
25.832	323.138
25.986	354.509
26.707	398.101
26.835	348.351
27.423	339.142
27.687	383.519];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'KakaKoba2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KHGW'; % Cat of Life
metaData.links.id_ITIS = '1199668'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Ballerus_sapa'; % Wikipedia
metaData.links.id_ADW = 'Ballerus_sapa'; % ADW
metaData.links.id_Taxo = '1682620'; % Taxonomicon
metaData.links.id_WoRMS = '1014943'; % WoRMS
metaData.links.id_fishbase = 'Ballerus-sapa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ballerus_sapa}}';
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
bibkey = 'KakaKoba2008'; type = 'Article'; bib = [ ... 
'author = {Tomasz Kakareko and Jaros{\l}aw Kobak and Janusz Terlecki and Marcin Hadowski}, ' ... 
'year = {2008}, ' ...
'title = {External morphology and growth rate of white-eye bream \emph{Ballerus sapa} ({C}yprinidae, {T}eleostei) in a lowland dam reservoir on the lower {V}istula {R}iver ({W}{\l}oc{\l}awek Reservoir, central {P}oland)}, ' ...
'journal = {Folia Zool.}, ' ...
'volume = {57(4)}, ' ...
'pages = {435–451}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ballerus-sapa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
