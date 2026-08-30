function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_blochii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_blochii'; 
metaData.species_en = 'Ringtail surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
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

data.am = 35*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 162; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.99, see F1';
data.Wwi = 1833; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.99, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(27.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.039	6.360
0.084	7.559
0.269	5.399
1.856	21.712
1.900	22.792
1.952	16.912
1.994	20.752
2.000	15.112
2.087	19.671
2.088	18.351
2.901	29.388
2.910	20.748
2.999	23.028
3.000	22.068
3.041	26.508
3.052	15.828
3.088	25.427
3.089	24.587
3.146	14.267
3.912	26.144
3.959	25.304
3.961	23.504
4.005	24.704
4.054	22.184
4.055	21.224
4.093	28.543
4.193	20.263
4.961	30.700
4.963	28.540
5.102	27.219
5.875	32.976
5.971	28.536
6.107	29.855
6.929	31.532
6.972	35.012
6.973	33.572
6.978	29.132
6.980	27.332
7.068	30.092
7.166	24.451
7.895	27.808
7.979	35.848
7.983	31.408
8.032	28.768
8.992	30.084
9.952	32.360
10.087	34.759
11.006	31.036
13.020	32.588
14.026	34.264
14.027	33.184
14.939	37.500
14.985	36.540
15.948	36.056
15.992	37.376
26.069	37.336];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(27.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PardWile2022'; comment.tL_f = 'Data from Oahu, Maui, Hawaii';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.897	18.476
0.987	20.396
0.995	11.996
1.853	23.752
1.900	22.912
1.901	21.712
1.944	25.192
1.994	20.272
1.995	19.312
2.039	21.232
3.867	25.424
3.918	20.624
3.950	34.304
3.952	31.664
3.956	28.064
4.003	26.504
4.190	22.663
4.822	31.661
4.875	25.180
4.919	26.860
5.049	33.700
5.055	28.540
6.114	22.655
6.931	29.612
6.979	27.572
7.116	28.651
7.157	33.091
7.982	32.728
8.989	33.324
9.946	37.760
9.950	33.920
10.043	32.360
11.006	31.516
12.011	34.152
13.063	35.108
14.025	35.464
18.052	38.928
20.068	37.480
23.137	37.707];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(27.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'weight-length relationship: W in g = 0.02089*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: East Africa, including the Mascarene Islands to the Hawaiian and Society islands, north to Ryukyu Islands, south to Lord Howe Island';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '92M7'; % Cat of Life
metaData.links.id_ITIS = '172275'; % ITIS
metaData.links.id_EoL = '46577062'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_blochii'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_blochii'; % ADW
metaData.links.id_Taxo = '159945'; % Taxonomicon
metaData.links.id_WoRMS = '219639'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-blochii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_blochii}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Acanthurus-blochii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
