function [data, auxData, metaData, txtData, weights] = mydata_Nibea_maculata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Nibea_maculata'; 
metaData.species_en = 'Blotched croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 72;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00813*Lp^3.15, see F1';
data.Wwi = 366;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.15, see F1';

data.Ri = 475043/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.174	0.438
0.348	0.822
0.625	1.700
0.698	1.150
1.010	2.192
1.044	2.467
1.392	3.180
1.429	2.959
1.637	3.508
1.671	3.728
1.843	4.606
2.159	4.769
2.404	5.097
2.647	5.646
2.892	5.974
3.134	6.962
3.555	7.069
3.799	7.617
3.974	7.836
4.149	8.055
4.499	8.382
4.778	8.985
5.057	9.478
5.230	9.972
5.441	10.136
5.721	10.409
5.895	10.738
6.245	11.175
6.665	11.557
6.805	11.831
7.084	12.269
7.365	12.267
7.541	12.321
7.680	12.650
7.749	12.925
8.065	12.977
8.274	13.581
8.415	13.525
8.483	13.909
8.834	14.127
9.009	14.346
9.254	14.564
9.675	14.836
9.885	15.000
9.990	15.054
10.128	15.603
10.586	15.435
10.725	15.929
10.761	15.709
11.040	16.202
11.180	16.311
11.285	16.365
11.671	16.528
11.986	16.855
12.337	17.183
12.582	17.291
12.758	17.400
13.002	17.673
13.247	18.002
13.599	18.054
13.879	18.272
14.159	18.546
14.369	18.764
14.755	19.036
15.071	19.089
15.246	19.308
15.280	19.528
15.455	19.692
15.806	19.854
16.087	19.907
16.157	19.907
16.578	20.179
16.823	20.342
16.892	20.672
17.350	20.559
17.735	20.941
17.841	20.776
18.156	21.213
18.648	21.210
18.682	21.485
18.928	21.483
19.245	21.481
19.489	21.919
19.525	21.589
20.121	22.025
20.297	22.079
20.542	22.187
20.682	22.406
21.034	22.349
21.421	22.346
21.666	22.455
21.805	22.894
22.122	22.782
22.227	22.891
22.474	22.724
22.650	22.778
22.789	22.997
22.965	23.051
23.350	23.378
23.526	23.267
23.667	23.211
23.913	23.210
24.193	23.538
24.332	23.977
24.649	23.755
24.930	23.918];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantJawa2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RXRT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579169'; % Ency of Life
metaData.links.id_Wiki = 'Nibea'; % Wikipedia
metaData.links.id_ADW = 'Nibea_maculata'; % ADW
metaData.links.id_Taxo = '181327'; % Taxonomicon
metaData.links.id_WoRMS = '281751'; % WoRMS
metaData.links.id_fishbase = 'Nibea-maculata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nibea}}';
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
bibkey = 'SantJawa2011'; type = 'article'; bib = [ ... 
'author = {S. Santhoshkumar and P. Jawahar and C.B.T. Rajagopalsamy and M. Venkatasamy}, ' ... 
'year = {2011}, ' ...
'title = {Growth and mortality characteristics of \emph{Nibea maculata} ({B}loch \& {S}chneider, 1801) exploited off {T}hoothukudi coast, {T}amil {N}adu}, ' ...
'journal = {Indian J. Fish.}, ' ...
'vplume = {58(4)}, ' ...
'pages = {17-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Nibea-maculata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

