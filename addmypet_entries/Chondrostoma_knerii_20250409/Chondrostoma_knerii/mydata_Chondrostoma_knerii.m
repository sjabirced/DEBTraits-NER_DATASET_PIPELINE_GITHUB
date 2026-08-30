  function [data, auxData, metaData, txtData, weights] = mydata_Chondrostoma_knerii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chondrostoma_knerii'; 
metaData.species_en = 'Neretvan nase'; 

metaData.ecoCode.climate = {'Csa','BWk','BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.ab = 14;      units.ab = 'd';  label.ab = 'age at birth';    bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'GlamBart2007'; 
data.Li = 29.4;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';
data.Lim = 23;    units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = 'GlamBart2007';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.5 mm of C.nasus: pi/6*0.15^3';
data.Wwp = 68;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.13, see F1';
data.Wwi = 227;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.13, see F1';

data.Ri = 16e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1	10.843
2	15.182
3	17.856
4	20.098
5	21.857
6	23.293
7	24.407];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % covert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GlamBart2007'; 

% length-weight
data.LW_f = [ ... % fork length (cm), weight (g)
11.643	26.540
16.500	41.206
16.664	46.794
16.707	35.619
17.034	50.286
17.241	47.492
17.444	61.460
17.486	55.175
17.529	46.095
17.773	63.556
17.775	52.381
18.105	50.286
18.267	66.349
18.391	60.762
18.432	62.857
18.435	46.095
18.926	66.349
18.969	57.270
19.131	72.635
19.174	60.762
19.253	76.127
19.337	70.540
19.417	84.508
19.462	64.952
19.542	76.825
19.543	69.841
19.584	71.937
19.911	85.206
19.957	59.365
19.992	93.587
19.994	79.619
19.997	63.556
20.198	92.190
20.200	82.413
20.327	64.952
20.405	85.905
20.408	69.143
20.444	95.683
20.571	80.317
20.655	71.238
20.775	91.492
20.894	111.746
21.023	87.302
21.190	70.540
21.224	113.143
21.233	65.651
21.351	90.794
21.355	70.540
21.474	98.476
21.476	84.508
21.518	81.016
21.560	74.730
21.679	101.968
21.683	82.413
21.764	86.603
21.807	79.619
21.886	96.381
21.887	89.397
21.922	122.222
21.970	84.508
22.009	99.175
22.297	99.873
22.377	114.540
22.416	122.222
22.456	130.603
22.462	99.175
22.750	100.571
22.908	137.587
22.953	114.540
22.996	105.460
22.997	99.175
23.366	110.349
23.778	108.952
23.859	118.730
24.095	176.000
24.390	138.984
24.393	124.317
24.429	155.048
24.433	129.905
24.887	125.714
25.414	173.905
25.946	192.762
26.769	194.159];
units.LW_f = {'cm', 'g'}; label.LW_f = {'fork length','weight','females'};  
bibkey.LW_f = 'GlamBart2007'; 
%
data.LW_m = [ ... % fork length (cm), weight (g)
13.995	20.449
14.490	23.974
15.396	26.795
15.519	25.385
15.973	34.551
16.096	29.615
16.467	32.436
16.549	38.077
16.796	36.667
17.085	38.077
17.249	35.256
17.414	40.897
17.661	37.372
17.867	45.128
17.991	44.423
18.114	47.949
18.279	45.128
18.403	47.244
18.444	50.769
18.815	50.064
18.815	45.128
19.021	52.179
19.144	57.821
19.268	57.115
19.309	53.590
19.432	60.641
19.556	65.577
19.680	71.923
19.721	65.577
20.050	65.577
20.050	58.526
20.174	59.231
20.586	72.628
20.627	68.397
20.833	74.744
20.874	78.974
20.957	86.026
21.121	79.679
21.327	73.333
21.698	90.256
21.822	73.333
22.769	121.987
22.851	81.090];
units.LW_m = {'cm', 'g'}; label.LW_m = {'fork length','weight','males'};  
bibkey.LW_m = 'GlamBart2007'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Neretva drainage in Croatia and Bosnia Herzegovina';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '69ZD5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '357178'; % Ency of Life
metaData.links.id_Wiki = 'Chondrostoma_knerii'; % Wikipedia
metaData.links.id_ADW = 'Chondrostoma_knerii'; % ADW
metaData.links.id_Taxo = '170972'; % Taxonomicon
metaData.links.id_WoRMS = '1418517'; % WoRMS
metaData.links.id_fishbase = 'Chondrostoma-knerii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chondrostoma_knerii}}';  
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
bibkey = 'GlamBart2007'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1439-0426.2006.00828.x}, ' ...
'author = {Glamuzina, B. and Bartulovi\''{c}, V. and Dul\v{c}i\''{c}, J. and Conides, A.J. and Tutman, P. and Mati\''{c}-Skoko, S. and Gavrilovi\''{c}, A. and Jug-Dujakovi\''{c}, J. and Haskovi\''{c}, E. and Ivanc, A. and Zovko, N.}, ' ...
'year = {2007}, ' ...
'title = {Some biological characteristics of the endemic {N}eretvan nase, \emph{Chondrostoma knerii} {H}eckel, 1843, in the {H}utovo {B}lato wetlands ({B}osnia and {H}erzegovina)}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'pages = {221-225}, ' ...
'volume = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Chondrostoma-knerii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
