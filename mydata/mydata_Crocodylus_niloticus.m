function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_niloticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodilidae';
metaData.species    = 'Crocodylus_niloticus'; 
metaData.species_en = 'Nile crocodile'; 

metaData.ecoCode.climate = {'Am', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFl', 'biFp', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-Le'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1      = [2025 07 16];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 16];

%% set data
% zero-variate data

data.ab = 90;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'crocodilian';   
  temp.ab = C2K(35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 14*365;  units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'Wiki';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 90*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 29;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 280;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 330;     units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 427;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 610;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 70;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwpm = 155e3;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty';  bibkey.Wwpm = 'Wiki';
data.Wwi = 763e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
data.Wwim = 1.09e6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 95/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% length-weight
data.LW = [ ... % weight (g), total length (cm)
1116.615	68.147
1229.806	73.457
1452.855	76.555
1671.981	70.804
1675.316	78.326
1899.344	83.637
1900.325	85.849
2118.862	78.771
2677.367	88.508
2784.869	80.987
3123.660	95.148
4011.539	97.807
4012.716	100.462
4569.454	106.217
5683.127	118.169
6235.941	115.074
6899.006	110.653
7567.759	119.063
7903.411	126.144
8342.643	116.855
9016.105	135.884
9455.533	127.037
10456.407	134.564
13014.109	153.603
13569.866	157.146
13675.211	144.757
16115.797	149.636
17115.102	153.623
17227.510	157.164
19116.458	167.793
19780.503	165.583
20557.152	167.357
22996.367	169.139
25550.930	181.099
28325.402	189.077
29547.561	195.720
37085.109	197.084
38194.470	199.302
38635.465	193.995
38971.313	201.518
55386.276	226.378
70464.708	236.629
70913.751	249.463
72355.233	250.798
75124.011	245.944
86098.512	249.538
89872.294	261.503];
data.LW = data.LW(:,[2 1]); % interchange cols
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = {'NgwePatz2013'};

% time-weight for embryo
data.tWe = [ ... % dpo (d), weight (g)
 6.931	0.065
 8.121	0.068
 9.172	0.075
10.082	0.095
11.062	0.194
11.902	0.065
13.162	0.129
14.142	0.517
15.193	0.388
16.243	0.647
17.013	0.453
17.083	0.582
17.853	0.582
18.203	0.388
18.903	0.582
18.904	0.388
19.953	0.582
20.163	1.099
20.933	1.034
20.934	1.228
21.984	1.034
22.054	1.358
23.104	0.970
23.105	0.905
23.314	1.875
23.874	0.711
23.944	1.681
24.014	0.582
24.154	1.293
24.155	2.004
24.994	0.647
25.064	2.069
25.065	1.099
25.134	1.293
25.204	1.552
25.974	2.004
25.975	1.228
26.184	1.487
26.954	1.422
26.955	1.875
27.095	2.522
27.935	3.103
27.936	2.586
28.005	1.940
28.145	1.228
28.215	2.457
29.055	3.168
29.056	2.716
29.895	1.616
29.896	3.362
30.104	0.517
30.105	2.392
30.106	3.491
30.945	3.685
30.946	1.358
31.015	2.974
31.225	2.392
31.855	4.526
31.856	3.168
31.925	2.716
32.135	4.073
33.046	3.427
33.116	3.103
33.117	2.845
33.956	5.237
34.096	3.750
34.866	2.780
35.006	3.427
35.007	4.461
36.126	5.625
36.966	7.177
37.036	3.556
37.246	5.108
38.016	5.690
38.017	3.297
38.856	7.694
38.996	3.621
38.997	7.112
39.907	6.530
39.908	4.138
40.047	8.276
40.117	5.819
41.237	7.241
41.307	7.629
42.987	11.379
44.946	8.987
44.947	11.250
44.948	12.026
45.018	12.996
50.058	22.047
50.059	13.836
50.198	17.263
51.949	12.414
52.789	24.310
52.928	20.948
52.929	20.625
53.069	22.500
55.027	24.828
55.028	24.181
55.029	23.664];
units.tWe   = {'d', 'g'};  label.tWe = {'days post oviposition', 'embryo weight'};  
temp.tWe    = C2K(32);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'PeteYves2010';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tWe data added';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'temperature effects sex of neonate: below  31.7 C or above 34.5 C neonates are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNK'; % Cat of Life
metaData.links.id_ITIS = '202200'; % ITIS
metaData.links.id_EoL = '795278'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_niloticus'; % ADW
metaData.links.id_Taxo = '50633'; % Taxonomicon
metaData.links.id_WoRMS = '1034995'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=niloticus'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_niloticus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_niloticus}}';
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
bibkey = 'NgwePatz2013'; type = 'Article'; bib = [ ... 
'author = {A. Ngwanya and N. Patzke and M. A. Sprocter and J.-L. Kruger and L.-A. Dell and R. Chawana and P. Mazengenya and B. K. Billings and O. Olaleye and S. Herculano-Houzel and P. R. Manger}, ' ... 
'year = {2013}, ' ...
'title = {The Continuously Growing Central Nervous System of the {N}ile Crocodile (\emph{Crocodylus niloticus})}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {296}, ' ...
'pages = {1489-1500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeteYves2010'; type = 'Article'; bib = [ ... 
'author = {Peterka, M. and Yves, Sire J. and Hovorakova, M. and Prochazka, J. and Fougeirol, L. and Peterkova, R and Viriot, L.}, ' ... 
'year = {2010}, ' ...
'title = {Prenatal development of \emph{Crocodylus niloticus niloticus} {L}aurenti, 1768}, ' ...
'journal = {J. Exp. Zool. (Mol. Dev. Evol.)}, ' ...
'volume = {314B}, ' ...
'pages = {1-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
