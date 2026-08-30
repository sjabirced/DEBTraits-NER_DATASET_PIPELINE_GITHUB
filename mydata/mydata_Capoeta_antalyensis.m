function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_antalyensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_antalyensis'; 
metaData.species_en = 'Antalya barb'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 07];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 14;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 30.6;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 30;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 313;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Inna2014';
  comment.Wwi = 'based on tLW data';

data.Ri = 1e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(30.6/46.7)^3';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
 1	 9.8  11.6
 2	16.2  56.1
 3	19.7  91.9
 4	22.9 143.3
 5	25.9 210.0
 6	28.4 278.3
 7	30.2 311.7];
data.tLW(:,1) = 365 * (0.2+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(18);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Inna2014'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
3.623	1.840
3.942	1.848
4.380	3.610
4.699	0.992
5.097	0.126
5.336	4.509
5.614	2.765
5.893	4.523
6.172	6.280
6.371	1.909
6.610	6.291
6.809	3.670
7.167	10.682
8.242	12.459
8.242	8.083
8.481	10.714
8.760	8.096
8.840	10.723
9.158	11.607
9.556	18.619
9.915	13.376
10.472	16.016
10.791	14.273
13.140	35.339
13.618	31.849
13.817	30.979
15.250	51.146
16.047	53.792
16.325	56.425
16.923	69.569
17.122	62.572
17.600	73.087
17.759	61.712
17.918	78.346
18.237	75.729
18.515	83.613
18.794	80.994
18.914	70.494
18.953	92.377
19.232	76.629
19.312	100.263
19.352	91.511
19.391	96.764
19.670	88.894
19.790	82.770
19.949	93.277
20.068	97.656
20.506	108.170
21.263	122.194
21.303	114.317
21.581	114.324
21.701	124.831
21.820	137.963
22.139	140.596
22.577	139.732
22.577	127.478
22.577	140.607
23.055	141.495
23.373	156.382
23.891	175.651
24.170	162.529
24.209	171.283
24.647	184.423
24.886	177.427
25.245	202.819
25.484	214.203
26.081	210.717
26.200	201.967
26.439	211.601
27.315	248.385
27.713	273.777
28.231	285.169
28.390	274.670
29.226	286.944
29.824	313.217
30.620	311.487];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'Inna2014'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00955*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Antolia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'QRDX'; % Cat of Life
metaData.links.id_ITIS = '688835'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_antalyensis'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_antalyensis'; % ADW
metaData.links.id_Taxo = '165379'; % Taxonomicon
metaData.links.id_WoRMS = '1027011'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-antalyensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_antalyensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-antalyensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Inna2014'; type = 'article'; bib = [ ...
'doi = {10.1111/jai.12191}, ' ...
'author = {Innal, D.}, ' ...
'year = {2014}, ' ...
'title  = {Identifying growth parameters for two endemic species [\emph{Capoeta antalyensis} ({B}attalgil, 1943) and \emph{Pseudophoxinus antalyae} {B}ogutskaya, 1992] in {D}uden {C}reek, {A}ntalya, {T}urkey}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {30(2)}, ' ...
'pages = {294-299}'];
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

