  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_chrysophekadion

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_chrysophekadion'; 
metaData.species_en = 'Black sharkminnow'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data
data.ab = 4;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 29;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 65;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'JutaKrud2004';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm for Cirrhinus cirrhosus: pi/6*0.1^3';
data.Wwp = 614;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 7107;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.02, see F1; max. published weight: 7.0 kg';
    
data.GSI = 0.36; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Labeo_boggut';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
100.909	7.284
131.470	9.212
161.065	11.357
194.052	13.499
222.661	14.347
254.184	15.626
348.810	24.219
365+163.722	30.599
365+221.925	33.591
365+251.973	33.141
365+284.478	35.500
365+347.503	36.328
730+348.092	44.976]; 
data.tL(:,1) = 0 + data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JutaKrud2004'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.064	0.034
6.069	0.890
6.920	1.736
7.891	2.675
8.982	3.297
10.560	4.776
11.531	5.208
12.017	6.992
12.867	19.996
13.718	73.383
13.963	127.098
14.566	19.081
15.539	85.864
15.782	112.656
16.268	112.395
16.640	341.041
16.754	139.056
17.485	219.432
17.972	259.554
20.400	285.170
20.887	325.292
21.125	190.549
21.493	311.504
21.977	270.859
21.981	392.010
22.586	324.377
22.593	539.758
24.044	377.439
24.782	646.272
25.274	834.469
25.753	672.672
27.809	469.642
27.934	563.806
28.300	603.993
28.430	859.692
28.792	819.113
29.645	912.884
30.000	656.924
30.855	791.079
31.337	696.589
33.041	843.748
33.537	1166.557
33.765	722.204
33.910	1422.126
34.264	1112.320
34.646	1623.653
34.763	1515.897
35.866	1811.458
35.870	1946.070
36.355	1932.348
37.680	1635.481
38.772	1621.431
39.153	2105.842
39.871	1822.763
40.736	2279.989
40.845	1916.469
41.091	2010.567
42.190	2198.437
42.929	2507.655
43.046	2399.899
44.874	2600.838
45.740	3084.987];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'JutaKrud2004'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.00891*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Mekong and Chao Phraya basins, Malay Peninsula, Sumatra, Java and Borneo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NPVM'; % Cat of Life
metaData.links.id_ITIS = '163689'; % ITIS
metaData.links.id_EoL = '218131'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_chrysophekadion'; % Wikipedia
metaData.links.id_ADW = 'Labeo_chrysophekadion'; % ADW
metaData.links.id_Taxo = '177887'; % Taxonomicon
metaData.links.id_WoRMS = '1020116'; % WoRMS
metaData.links.id_fishbase = 'Labeo-chrysophekadion'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_chrysophekadion}}';  
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
bibkey = 'JutaKrud2004'; type = 'techreport'; bib = [ ... 
'doi = {10.33997/j.afs.2004.17.1.001}, ' ...
'author = {T. Jutagate and C. Krudpan}, ' ... 
'year = {2004}, ' ...
'title = {Population Dynamics of the Black Shark minnow \emph{Morulius chrysophekadion} ({B}leeker): {C}yprinidae, in a''Run-of-the-River'' Reservoir in {T}hailand}, ' ...
'journal = {Asian Fisheries Science}, ' ...
'volume = {17}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-chrysophekadion.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

