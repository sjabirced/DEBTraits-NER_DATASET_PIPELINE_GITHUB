function [data, auxData, metaData, txtData, weights] = mydata_Diaphus_fulgens
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Diaphus_fulgens'; 
metaData.species_en = 'Lanternfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Wd'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 25];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(11.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.25;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess';
data.Li = 4.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tL data and egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwi = 0.71; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00759*Li^3.02, see F3';

data.Ri = 1e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(11.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
0.884	0.280
0.982	0.302
2.095	0.306
3.065	0.370
3.839	0.376
3.936	0.364
3.982	0.322
4.807	0.376
4.999	0.356
5.003	0.425
5.967	0.360
5.969	0.399
6.935	0.387
6.938	0.435
8.099	0.433
8.971	0.465
9.791	0.419
9.936	0.433
9.986	0.449
10.904	0.431
11.144	0.407
11.921	0.467
11.968	0.437
12.888	0.467
12.889	0.486
12.983	0.427
13.032	0.441
13.952	0.445
14.048	0.439
14.049	0.461
14.050	0.480
14.967	0.431
14.968	0.445
14.969	0.472
15.018	0.496
15.938	0.510
15.939	0.534
15.985	0.492
16.033	0.474
16.856	0.486
16.906	0.526
16.953	0.502
16.956	0.554
17.919	0.468
17.925	0.596
18.067	0.526
18.110	0.421
18.162	0.492
18.935	0.474
18.986	0.530
18.987	0.538
19.034	0.516
19.901	0.450
19.907	0.574
19.953	0.520
19.999	0.474
21.066	0.538
21.112	0.494
21.890	0.564
22.904	0.540
22.953	0.556
22.957	0.641
23.000	0.514
23.004	0.605
23.053	0.627
23.101	0.619
24.017	0.550
24.022	0.645
24.068	0.597
24.117	0.619
24.163	0.573
24.164	0.585
24.939	0.609
25.039	0.677
26.002	0.591
27.021	0.645
27.027	0.772
27.068	0.633
27.073	0.738
27.115	0.607
27.942	0.696
27.991	0.706
27.996	0.816
28.040	0.726
28.917	0.861
29.052	0.637
29.103	0.706
30.020	0.668
30.022	0.710
31.914	0.814
32.009	0.778
32.794	0.008
33.123	0.806
33.218	0.786
34.037	0.712
37.088	0.801];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(11.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SassTaka2018';

% length-dry weight
data.tW = [ ... % time since birth (d), dry weight (mg)
0.990	0.011
2.070	0.023
3.150	0.034
4.005	0.034
5.220	0.053
6.165	0.053
7.065	0.038
7.965	0.061
9.001	0.091
9.855	0.068
11.205	0.061
11.925	0.084
12.870	0.057
12.915	0.091
14.086	0.106
14.130	0.069
14.985	0.099
15.030	0.069
15.885	0.095
15.931	0.122
16.021	0.155
16.875	0.118
17.011	0.137
17.012	0.174
18.045	0.088
18.046	0.126
18.134	0.054
18.137	0.216
18.810	0.111
19.034	0.084
19.036	0.156
19.892	0.197
19.934	0.073
19.935	0.126
21.105	0.118
21.151	0.175
21.871	0.178
22.815	0.145
22.863	0.257
22.864	0.314
22.951	0.182
23.044	0.287
23.085	0.115
23.987	0.205
23.989	0.325
24.078	0.261
24.166	0.175
24.980	0.378
25.022	0.246
25.877	0.224
26.965	0.592
26.967	0.685
27.002	0.250
27.003	0.276
27.049	0.333
27.189	0.565
28.041	0.430
28.043	0.520
28.087	0.472
28.142	0.926
28.897	0.491
28.938	0.303
29.002	1.132
29.974	0.363
30.157	0.494
31.828	0.761
31.830	0.851
33.043	0.750
33.225	0.840
33.982	0.483
36.914	0.810];
data.tW(:,2) = data.tW(:,2)/1000; % convert mg to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'dry weight'};  
temp.tW = C2K(11.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SassTaka2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwi = 0 * weights.Wwi;
weights.tW = 3 * weights.tW;
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
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indian Ocean: 08N-10S and the Mozambique Channel southwards to 18S. Also the tropical Pacific including southeast Asian seas. South China Sea';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Species identification is unsure, but Diaphus fulgens is the most abundant Diaphus';
metaData.bibkey.F3 = 'SassTaka2018'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '35CH6'; % Cat of Life
metaData.links.id_ITIS = '162597'; % ITIS
metaData.links.id_EoL = '46564081'; % Ency of Life
metaData.links.id_Wiki = 'Diaphus_fulgens'; % Wikipedia
metaData.links.id_ADW = 'Diaphus_fulgens'; % ADW
metaData.links.id_Taxo = '173059'; % Taxonomicon
metaData.links.id_WoRMS = '217692'; % WoRMS
metaData.links.id_fishbase = 'Diaphus_fulgens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diaphus_fulgens}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Diaphus_fulgens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

