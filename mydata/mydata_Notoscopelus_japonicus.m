function [data, auxData, metaData, txtData, weights] = mydata_Notoscopelus_japonicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Notoscopelus_japonicus'; 
metaData.species_en = 'Japanese lanternfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Wd'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 24];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(2.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess';
data.Li = 13.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tL data and egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwi = 16.3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00437*Li^3.16, see F3';

data.Ri = 1e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(2.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
0.733	0.274
0.978	0.247
1.059	0.287
2.200	0.290
2.281	0.270
2.933	0.314
3.014	0.270
3.747	0.338
3.828	0.358
3.829	0.300
5.051	0.364
5.214	0.348
5.215	0.344
6.110	0.347
7.006	0.371
7.007	0.358
8.228	0.371
9.043	0.418
9.124	0.354
9.125	0.401
9.206	0.378
9.939	0.398
10.020	0.381
10.183	0.357
11.160	0.344
11.161	0.371
11.162	0.388
11.324	0.408
11.976	0.421
12.138	0.398
12.139	0.374
12.872	0.435
12.953	0.455
12.954	0.414
13.035	0.394
13.849	0.411
13.931	0.428
14.012	0.445
14.094	0.381
14.827	0.462
14.908	0.489
15.070	0.441
15.071	0.428
15.072	0.397
15.073	0.387
15.153	0.411
15.886	0.485
15.967	0.401
15.968	0.391
16.048	0.451
16.049	0.421
16.130	0.441
16.782	0.438
16.864	0.421
16.865	0.475
16.945	0.411
18.002	0.461
18.003	0.448
18.004	0.444
18.005	0.431
18.086	0.529
18.248	0.492
18.982	0.515
19.063	0.495
19.064	0.485
19.878	0.532
19.879	0.539
19.958	0.478
19.959	0.508
20.040	0.573
20.041	0.613
20.042	0.623
21.181	0.579
21.263	0.444
21.343	0.525
21.344	0.505
21.345	0.495
21.833	0.461
21.914	0.427
21.915	0.583
21.996	0.610
22.077	0.545
22.159	0.522
22.892	0.704
22.893	0.664
22.972	0.579
22.973	0.562
22.974	0.508
23.055	0.464
23.299	0.610
23.950	0.532
23.951	0.586
23.952	0.650
24.929	0.711
25.092	0.592
25.093	0.562
25.173	0.616
25.825	0.596
25.826	0.623
25.906	0.839
25.988	0.569
26.965	0.768
26.966	0.542
27.047	0.653
27.048	0.515
27.862	0.633
28.024	0.768
28.106	0.704
29.002	0.802
29.980	0.649
30.061	0.602
31.039	0.818
31.120	0.680
33.075	0.636
33.157	0.700
33.971	0.798];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(2.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SassTaka2018';

% length-dry weight
data.tW = [ ... % time since birth (d), dry weight (mg)
1.490	0.022
1.665	0.022
3.243	0.036
3.944	0.044
5.259	0.058
6.225	0.044
6.751	0.044
8.242	0.044
8.944	0.051
10.083	0.058
11.051	0.029
11.135	0.066
12.188	0.066
13.061	0.117
13.151	0.080
14.206	0.058
14.377	0.109
15.076	0.146
15.255	0.095
15.259	0.051
15.952	0.153
16.131	0.117
16.834	0.095
16.918	0.146
17.010	0.095
17.965	0.204
17.970	0.146
17.974	0.102
18.753	0.226
18.848	0.139
19.800	0.285
19.880	0.372
20.139	0.423
20.159	0.190
20.162	0.161
20.163	0.153
21.025	0.321
21.043	0.117
21.117	0.277
21.208	0.241
21.302	0.168
21.814	0.328
21.914	0.190
21.923	0.088
21.984	0.387
22.748	0.679
22.846	0.562
22.861	0.387
22.970	0.153
23.044	0.307
23.134	0.285
23.142	0.190
24.008	0.314
24.080	0.496
24.085	0.438
24.191	0.234
24.969	0.365
25.026	0.715
25.050	0.438
25.061	0.307
25.745	1.511
25.841	0.416
25.850	0.321
25.852	0.299
25.926	0.453
25.934	0.358
27.089	0.197
27.101	1.058
27.149	0.511
27.171	0.263
27.918	0.737
28.031	0.453
28.063	1.088
28.755	1.204
30.054	0.387
30.307	0.504
31.023	1.350
31.169	0.679
33.096	0.715
33.117	0.474
34.009	1.299];
data.tW(:,2) = data.tW(:,2)/1000; % convert mg to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'dry weight'};  
temp.tW = C2K(2.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SassTaka2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '47YQ2'; % Cat of Life
metaData.links.id_ITIS = '623859'; % ITIS
metaData.links.id_EoL = '46564222'; % Ency of Life
metaData.links.id_Wiki = 'Notoscopelus'; % Wikipedia
metaData.links.id_ADW = 'Notoscopelus_japonicus'; % ADW
metaData.links.id_Taxo = '181457'; % Taxonomicon
metaData.links.id_WoRMS = '272727'; % WoRMS
metaData.links.id_fishbase = 'Notoscopelus_japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notoscopelus}}';
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
bibkey = 'SassTaka2018'; type = 'article'; bib = [ ...
'author = {Chiyuki Sassa and Motomitsu Takahashi}, ' ... 
'year   = {2018}, ' ...
'title  = {Comparative larval growth and mortality of mesopelagic fishes and their predatory impact on zooplankton in the {K}uroshio region}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'page = {121-132}, ' ...
'volume = {131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Notoscopelus_japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

