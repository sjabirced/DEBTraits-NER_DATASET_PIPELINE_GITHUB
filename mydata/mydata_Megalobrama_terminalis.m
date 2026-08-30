function [data, auxData, metaData, txtData, weights] = mydata_Megalobrama_terminalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Megalobrama_terminalis'; 
metaData.species_en = 'Black amur bream'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'AihuQing2022';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 30;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 63.5;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 337;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00776*Lp^3.14, see F1';
data.Wwi = 3553;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.14, see F1; max. published weight: 4.0 kg';

data.Ri = 1.4e5/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Xenocypris_macrolepis: 6377*3553/160';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
 1   9.630
 2	21.255
 3	30.470
 4	38.073
 5	45.273
 6	50.468
 7	56.063
 8	59.647
 9	62.429
10	64.806
11	67.989
12	68.764
13	70.738];
data.tL(:,1) = 365*(0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AihuQing2022'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
7.521	62.500
8.524	20.833
9.192	83.333
9.526	83.333
9.861	83.333
10.696	83.333
11.198	83.333
11.866	145.833
12.869	145.833
13.538	104.167
14.540	104.167
14.875	104.167
16.379	104.167
16.546	125.000
17.214	145.833
18.050	270.833
18.217	145.833
18.719	208.333
19.889	208.333
20.056	229.167
20.390	291.667
21.393	229.167
21.894	333.333
22.396	250.000
22.897	333.333
23.064	291.667
24.234	395.833
24.568	375.000
25.404	479.167
25.738	354.167
26.240	416.667
26.574	458.333
27.242	479.167
27.744	500.000
28.412	520.833
28.914	583.333
29.081	645.833
29.749	625.000
30.418	604.167
30.418	687.500
31.086	645.833
31.755	854.167
31.922	1083.333
32.256	729.167
32.925	1166.667
32.925	791.667
33.593	854.167
33.760	937.500
33.760	1250.000
34.429	916.667
34.429	1083.333
35.097	1208.333
35.097	979.167
35.097	770.833
35.766	1104.167
35.766	895.833
36.100	1020.833
36.267	1333.333
36.769	1104.167
37.103	1291.667
37.604	1125.000
37.772	1354.167
38.106	1416.667
38.942	1625.000
39.276	1375.000
39.276	1270.833
40.111	1708.333
40.111	1458.333
40.446	1937.500
41.281	2020.833
41.281	1395.833
41.281	1604.167
41.783	1458.333
41.950	1875.000
41.950	1687.500
42.618	2145.833
42.618	1750.000
42.786	1625.000
43.287	1895.833
43.621	2458.333
43.955	2791.667
43.955	1854.167
44.290	2520.833
44.290	2062.500
44.624	1666.667
45.292	2062.500
45.460	2250.000
45.627	1937.500
45.794	2395.833
46.462	2208.333
46.630	2770.833
46.797	2416.667
47.298	2687.500
47.298	2291.667
47.298	2104.167
47.799	2562.500
48.301	2562.500
48.635	2791.667
48.635	2458.333
48.969	3125.000
49.304	2645.833
49.972	2645.833
51.142	3000.000
51.643	3354.167
54.485	3104.167
55.822	3645.833];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'AihuQing2022'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
D2 = 'data Wwp and Wwi are ignored due to inconsistemncy with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00776*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '6QVQJ'; % Cat of Life
metaData.links.id_ITIS = '689440'; % ITIS
metaData.links.id_EoL = '217144'; % Ency of Life
metaData.links.id_Wiki = 'Megalobrama_terminalis'; % Wikipedia
metaData.links.id_ADW = 'Megalobrama_terminalis'; % ADW
metaData.links.id_Taxo = '179688'; % Taxonomicon
metaData.links.id_WoRMS = '1015822'; % WoRMS
metaData.links.id_fishbase = 'Megalobrama-terminalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Megalobrama_terminalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Megalobrama-terminalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'AihuQing2022'; type = 'article'; bib = [ ... 
'doi = {10.14012/j.cnki.fjsc.2022.05.004}, ' ...
'author = {Guo, Aihuan and Lian, Qingping and Luo, Wei, et al.}, ' ...
'year = {2022}, ' ...
'title  = {Growth characteristics and exploitation status of \emph{Megalobrama terminalis} based on {YPR} models in the {Q}iantang {R}iver}, ' ...
'journal = {Journal of Fisheries Research}, ' ...
'pages = {459-466}, ' ...
'volume = {44(5)}'];
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

