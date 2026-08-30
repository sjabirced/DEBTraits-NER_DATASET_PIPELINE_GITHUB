function [data, auxData, metaData, txtData, weights] = mydata_Siganus_guttatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_guttatus'; 
metaData.species_en = 'Orange-spotted spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 01];

%% set data
% zero-variate data
data.ab = 2.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WestRose1976'; 
data.Li  = 42;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.55 mm: pi/6*0.055^3'; 
data.Wwp = 383; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'WestRose1976';
data.Wwi = 1598; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^3.07, see F1';

data.Ri = 618603/365;  units.Ri = '#/d';    label.Ri = 'max reprodion rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Siganus_fuscescens';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
28.899	0.846
55.827	3.538
111.654	7.077
132.672	13.007
146.464	15.734
181.931	25.771
195.723	32.181
222.652	40.398
256.148	71.158
300.810	81.632
329.052	90.306
447.931	110.716
537.254	139.950];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(28.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WestRose1976';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
4.517	2.176
4.695	1.937
6.699	6.540
7.340	6.791
7.341	7.241
7.944	9.598
8.051	10.499
8.828	14.462
9.055	11.621
9.427	17.078
9.551	17.520
9.679	18.921
9.683	22.360
12.760	48.189
13.265	43.465
14.537	49.376
14.933	64.647
17.255	98.626
19.676	137.545
21.295	184.671
24.295	308.286
25.947	383.261
28.061	397.993
37.482	1039.854];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'WestRose1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01660*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YN5S'; % Cat of Life
metaData.links.id_ITIS = '172331'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Siganus_spinus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_spinus'; % ADW
metaData.links.id_Taxo = '187608'; % Taxonomicon
metaData.links.id_WoRMS = '219689'; % WoRMS
metaData.links.id_fishbase = 'Siganus-spinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_spinus}}';
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
bibkey = 'WestRose1976'; type = 'Article'; bib = [ ... 
'author = {H. Von Westernhagen and H. Rosenthal}, ' ... 
'year = {1976}, ' ...
'title = {SOME ASPECTS OF THE SUITABILITY OF VARIOUS PHILIPPINE SIGANID SPECIES ({S}IGANIDAE) FOR MARICULTURE}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {9}, ' ...
'pages = {297-311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Siganus-spinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

