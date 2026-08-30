function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_abdominalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_abdominalis'; 
metaData.species_en = 'Big-belly seahorse'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.55;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'Wood2000'; 
  comment.Lb = 'based on tL data';
data.Lp  = 8.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 0.0166; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'JobBuu2006';
  comment.Wwb = 'based on 0.00447*Lb^2.99, see F1; egg diameter 2 mm';
data.Wwp = 2.88;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^2.99, see F1';
data.Wwi = 185;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^2.99, see F1';

data.Ri  = 1116/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since release (d), std length (cm)
0.721	1.552
7.030	1.945
13.835	2.152
20.115	2.322
27.451	2.604
35.312	2.905
43.173	3.205
49.469	3.506
55.246	3.825
66.248	4.219
73.587	4.520
78.304	4.708
86.153	4.915
90.346	5.084
97.666	5.235
107.125	5.798
112.890	6.023
118.648	6.193
121.793	6.324
126.006	6.643
133.346	6.943
141.196	7.169
147.495	7.488
155.348	7.733
162.675	7.940
168.436	8.128
176.803	8.317
184.115	8.412
189.357	8.618
196.664	8.676
203.458	8.789
211.294	8.903
217.558	8.961
226.442	9.112
232.712	9.207
238.460	9.301
247.334	9.378
253.082	9.473
259.871	9.549
268.224	9.625
275.017	9.739
282.337	9.890
289.656	10.041
297.490	10.136
303.238	10.230
310.024	10.288
316.296	10.401
324.654	10.515
331.445	10.610
337.710	10.667
345.548	10.800
351.299	10.913
358.092	11.027
366.452	11.159];
units.tL   = {'d', 'cm'};  label.tL = {'time since release', 'standard length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wood2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
% weights.ab = 3 * weights.ab;
% weights.Wwi = 3 * weights.Wwi;
% weights.Wwb = 3 * weights.Wwb;
% weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southwest Pacific: Australia and New Zealand. Occurrence in Thailand and the Philippines needs verification';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3LZK2'; % Cat of Life
metaData.links.id_ITIS = '166499'; % ITIS166493
metaData.links.id_EoL = '46567781'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_abdominalis'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_abdominalis'; % ADW
metaData.links.id_Taxo = '176680'; % Taxonomicon
metaData.links.id_WoRMS = '275182'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus_abdominalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_abdominalis}}';
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
bibkey = 'Wood2000'; type = 'Article'; bib = [ ... 
'author = {C. M. C. Woods}, ' ... 
'year = {2000}, ' ...
'title = {Preliminary observations on breeding and rearing the seahorse \emph{Hippocampus abdominalis} ({T}eleostei: {S}yngnathidae) in captivity}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {34}, ' ...
'pages = {475-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus_abdominalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

