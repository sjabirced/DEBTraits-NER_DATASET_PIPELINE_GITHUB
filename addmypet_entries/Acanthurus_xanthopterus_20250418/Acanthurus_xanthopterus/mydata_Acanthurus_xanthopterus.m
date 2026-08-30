function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_xanthopterus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_xanthopterus'; 
metaData.species_en = 'Yellowfin surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
% zero-variate data

data.am = 34*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 34; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 809; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02455*Lp^2.95, see F1';
data.Wwi = 6809; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02455*Li^2.95, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(27.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.140	2.204
1.033	20.930
1.160	14.786
2.121	17.606
2.132	25.165
2.173	22.487
3.001	27.671
3.029	16.017
3.039	22.946
3.093	28.772
3.098	31.921
3.100	33.338
3.104	35.386
3.108	38.378
3.142	30.976
3.193	34.282
3.322	29.555
4.008	31.592
4.043	24.662
4.048	27.654
4.058	34.426
4.091	26.079
4.097	30.016
4.101	33.008
4.106	35.842
4.113	40.882
4.187	29.384
4.245	37.887
4.969	34.884
5.004	27.954
5.017	36.615
5.052	29.528
5.056	32.205
5.064	37.559
5.077	45.591
5.081	48.268
5.104	33.464
5.145	30.472
6.058	32.189
6.059	32.977
6.170	45.889
6.192	30.613
6.243	34.234
6.882	35.169
7.026	40.206
7.038	48.237
7.119	41.307
8.133	49.637
9.088	49.465
10.086	47.087
12.138	49.259
13.003	49.403
13.047	48.142
13.178	44.361
17.099	48.551
18.063	53.733
21.161	55.101
23.112	51.134
23.246	49.242
29.027	48.993];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PardWile2022'; comment.tL_f = 'Data from Oahu, Maui, Hawaii';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.931	13.373
1.156	11.952
1.252	15.257
2.038	23.276
2.085	24.063
2.091	28.000
2.093	29.417
2.170	20.282
2.225	26.738
3.013	36.017
3.057	34.599
3.099	32.236
3.181	26.565
3.184	28.298
3.189	31.447
3.229	27.825
3.232	30.344
3.267	23.100
3.915	30.019
3.920	33.168
4.009	32.064
4.015	36.001
4.069	41.355
4.089	24.819
4.108	37.260
4.150	34.739
4.924	35.042
5.029	44.489
5.056	32.363
5.059	33.780
5.062	36.300
5.112	38.661
5.114	40.551
5.246	37.242
6.022	38.962
6.117	41.480
6.119	42.897
6.215	45.888
9.987	41.261
10.001	50.710
11.269	46.438
12.046	48.158
12.177	44.849
13.225	45.147
15.275	46.375
16.048	45.890
21.103	46.913
22.106	48.157];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PardWile2022'; comment.tL_m = 'Data from Oahu, Maui, Hawaii';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'weight-length relationship: W in g = 0.02455*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: coast of East Africa to the Hawaiian Islands and French Polynesia, north to southern Japan, south to the Great Barrier Reef and New Caledonia. Eastern Pacific: lower Gulf of California and Clipperton Island to Panama and the Galapagos Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '92RN'; % Cat of Life
metaData.links.id_ITIS = '172259'; % ITIS
metaData.links.id_EoL = '47060561'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_xanthopterus'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_xanthopterus'; % ADW
metaData.links.id_Taxo = '159975'; % Taxonomicon
metaData.links.id_WoRMS = '219634'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-xanthopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_xanthopterus}}';
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
bibkey = 'PardWile2022'; type = 'Article'; bib = [ ... 
'doi = {}, 10.1007/s10641-022-01216-w' ...
'author = {Cassandra Pardee and John Wiley and Eva Schemmel and Taylor Fendrick and Joseph Giglio}, ' ...
'year = {2022}, ' ...
'title = {Comparative demography of four large‑bodied surgeonfish}, '...
 'journal = {Environ. Biol. Fish}, ' ...
'volume = {105}, ' ...
'pages = {231–245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthurus-xanthopterus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
