  function [data, auxData, metaData, txtData, weights] = mydata_Hemigrammopetersius_barnardi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Hemigrammopetersius_barnardi'; 
metaData.species_en = 'Barnard''s robber'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data
data.ab =  4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 7;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Alestes_baremoze: pi/6*0.08^3';
data.Wwp = 0.47;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01072*Lp^3.02, see F1';
data.Wwi = 3.8;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.02, see F1';
  
data.Ri = 619/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Brachyalestes_imberi: 14000*(7/19.8)^3';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
34.077	2.004
45.150	2.355
48.112	3.158
48.755	3.181
49.785	2.762
49.914	3.238
50.944	2.547
53.004	3.600
53.133	2.921
53.906	3.091
53.906	2.672
54.807	3.181
55.193	2.898
55.451	3.385
56.223	2.887
56.352	3.306
56.738	2.638
57.768	3.215
57.897	3.034
58.026	2.932
58.026	2.853
58.155	3.543
58.927	3.294
59.700	3.045
59.700	2.785
61.116	3.657
64.077	3.125
64.721	3.792
65.751	3.702
67.039	4.008
67.039	3.487
67.811	3.668
67.811	3.815
68.841	3.702
68.841	3.928
69.742	3.475
70.258	3.713
70.773	3.996
70.901	3.396
71.159	3.781
72.961	3.306
73.090	3.792
73.863	3.498
74.893	4.325
75.150	3.509
77.082	3.136
78.112	4.098
79.914	3.804
79.914	4.381
80.043	3.091
83.004	3.962
84.292	4.019
84.936	3.826
85.064	3.747
86.867	4.472
87.124	3.408
89.957	4.789
89.957	4.042
95.107	4.404
96.137	4.245
100.000	4.868
101.931	4.426
104.764	4.619
104.893	5.049
106.953	4.562
107.983	4.619
110.043	5.151
111.073	5.004
114.936	5.208];
data.tL(:,1) = data.tL(:,1) - 5; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoriMats2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight Ww in g = 0.01072*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Lower Zambezi, Pungwe and Buzi systems; also upper Shire and lakes Malawi, Chilwa and Chiuta. Also Rovuma and Rufiji';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KNX5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '208909'; % Ency of Life
metaData.links.id_Wiki = 'Hemigrammopetersius'; % Wikipedia
metaData.links.id_ADW = 'Hemigrammopetersius_barnardi'; % ADW
metaData.links.id_Taxo = '176328'; % Taxonomicon
metaData.links.id_WoRMS = '1525332'; % WoRMS
metaData.links.id_fishbase = 'Hemigrammopetersius-barnardi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brycinus}}';  
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
bibkey = 'MoriMats2008'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1365-2028.2007.00908.x}, ' ...
'author = {Shinsuke Morioka and Seiji Matsumoto}, ' ... 
'year = {2008}, ' ...
'title = {A note on the hatching period and growth in juvenile \emph{Brycinus imberi} ({P}isces: {A}lestiidae) in the shallow habitats of {L}ake {M}alawi}, ' ...
'institution = {African Journal of Ecology}, ' ...
'volume = {46(4)}, ' ...
'pages = {690–692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Hemigrammopetersius-barnardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

