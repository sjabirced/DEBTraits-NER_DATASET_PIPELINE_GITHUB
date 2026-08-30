function [data, auxData, metaData, txtData, weights] = mydata_Miichthys_miiuy

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Miichthys_miiuy'; 
metaData.species_en = 'Mi-iuy croaker'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li';  'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 07];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(21.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(21.9);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 73.8;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'Value for Argyrosomus_regius';
data.Wwp = 451.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00851*Lp^3.06, see F1';
data.Wwi = 4.4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.06, see F1; max. published weight: 3.8 kg';

data.GSI = 0.4; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'LeeChun2017';
  temp.GSI = C2K(21.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
data.tL =	[ ... % year class (yr), total length (cm)
    1 31.4
    2 43.7
    3 51.7
    4 59.3
    5 66.3
    6 72.8
    7 78.8
    8 85.6
    9 92.3
   10 99.8];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeeChun2017';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
30.133	227.472
30.253	427.503
31.580	427.835
32.545	278.076
33.148	453.226
34.355	528.528
34.475	303.558
35.320	478.769
36.164	303.980
36.888	629.161
38.094	504.463
38.215	704.493
39.903	454.915
40.024	729.946
40.748	730.127
41.834	530.398
42.919	905.669
42.919	630.669
44.005	780.941
44.608	1006.092
45.694	731.363
46.417	856.544
46.538	1056.574
47.986	756.936
48.106	1131.966
48.830	1157.147
49.192	882.238
50.157	1307.479
50.277	982.509
51.363	1082.780
52.328	1433.021
52.449	1208.051
53.534	1008.323
53.534	1258.324
54.741	1608.625
55.223	1433.745
55.585	1233.836
56.309	1884.017
57.033	1634.198
57.033	709.198
57.153	2059.228
57.394	1259.289
57.998	1834.439
58.239	1484.500
59.204	1984.741
60.169	1709.982
60.772	2160.133
61.616	1910.344
62.461	2135.555
64.270	2386.008
64.873	2086.158
65.718	2536.370
66.562	2611.581
67.045	3036.701
67.648	2586.852
67.889	3486.912
69.095	2962.214
69.698	3162.364
69.819	3537.394
70.663	2937.605
70.784	3312.636
71.025	3662.696
76.574	3714.084
77.419	3339.295
78.384	3839.536
79.590	3739.837
80.434	3990.048
81.761	5965.380
83.209	6465.742
83.812	5165.893
84.536	4291.074
85.501	5441.315
85.862	7791.406
86.948	5716.677
88.034	5391.948
88.396	6467.039
88.878	6867.159
89.602	6092.340
90.929	6092.672
91.773	6192.883
92.135	5917.974
92.979	6093.185
93.100	7918.215
96.236	9043.999
99.011	9269.693
103.474	8945.809
104.560	9921.080];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'LeeChun2017';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00851*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Northwest Pacific: western Japan to the East China Sea';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6RKQB'; % Cat of Life
metaData.links.id_ITIS = '646640'; % ITIS
metaData.links.id_EoL = '46579158'; % Ency of Life
metaData.links.id_Wiki = 'Miichthys_miiuy'; % Wikipedia
metaData.links.id_ADW = 'Miichthys_miiuy'; % ADW
metaData.links.id_Taxo = '180129'; % Taxonomicon
metaData.links.id_WoRMS = '281574'; % WoRMS
metaData.links.id_fishbase = 'Miichthys_miiuy'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Miichthys_miiuy}}';
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
bibkey = 'LeeChun2017'; type = 'Article'; bib = [ ... 
'author = {Seung Hwan Lee and Sang Deok Chung and Joon-Taek Yoo and Yeong Hye Kim}, ' ... 
'year = {2017}, ' ...
'title = {Age and Growth of Brown Croaker \emph{Miichthys miiuy} in the South-western Water of {K}orea}, ' ...
'journal = {Korean Journal of Ichthyology}, ' ...
'volume = {29(1)}, ' ...
'pages = {69-74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Miichthys_miiuy}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

