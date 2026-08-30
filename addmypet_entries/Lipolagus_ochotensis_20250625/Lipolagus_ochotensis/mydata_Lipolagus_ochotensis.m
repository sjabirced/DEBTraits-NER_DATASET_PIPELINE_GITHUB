function [data, auxData, metaData, txtData, weights] = mydata_Lipolagus_ochotensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Argentiniformes'; 
metaData.family     = 'Bathylagidae';
metaData.species    = 'Lipolagus_ochotensis'; 
metaData.species_en = 'Eared blacksmelt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.8); % in K, body temp
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
  temp.am = C2K(1.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess';
data.Li = 17.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.13e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tL data and egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 31.1; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00617*Li^2.99, see F3';

data.Ri = 1.2e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(1.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
2.300	0.346
3.294	0.368
3.490	0.488
3.942	0.495
4.110	0.405
4.115	0.442
4.832	0.419
5.116	0.517
5.284	0.426
6.201	0.546
6.362	0.403
6.372	0.478
6.453	0.410
6.458	0.448
7.084	0.417
7.101	0.538
7.181	0.463
7.287	0.583
7.814	0.485
8.184	0.553
8.283	0.620
8.903	0.544
8.908	0.582
9.079	0.514
9.636	0.634
9.912	0.672
9.996	0.627
10.439	0.573
10.879	0.498
10.976	0.550
10.981	0.588
11.075	0.611
11.356	0.694
11.990	0.716
12.068	0.633
13.422	0.647
14.158	0.759
14.225	0.593
14.433	0.797
15.056	0.744
15.248	0.826
15.302	0.562
15.434	0.872
16.142	0.780
16.396	0.660
16.848	0.667
16.865	0.795
16.979	0.969
17.037	0.735
18.333	0.990
18.490	0.816
18.676	0.862
18.757	0.794
19.060	1.035
19.104	0.695
19.322	0.974
19.681	0.966
19.843	0.831
19.945	0.921
21.018	0.860
21.032	0.965
21.219	1.011
21.909	1.455
21.951	1.093
22.190	0.866
23.140	1.228
23.161	1.386
24.021	1.084
24.027	1.129
25.040	1.287
28.163	1.730
30.171	1.260
32.978	1.364];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(1.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SassTaka2018';

% length-dry weight
data.tW = [ ... % time since birth (d), dry weight (mg)
3.238	0.073
4.219	0.084
5.197	0.054
6.083	0.096
6.963	0.066
6.966	0.106
8.235	0.036
8.438	0.128
9.221	0.108
9.324	0.169
9.716	0.169
10.005	0.109
10.893	0.170
11.278	0.089
11.476	0.110
12.071	0.201
12.260	0.110
13.246	0.172
14.126	0.152
14.228	0.193
14.233	0.264
14.909	0.133
14.926	0.345
15.014	0.214
15.017	0.254
16.091	0.204
16.193	0.245
16.876	0.205
16.971	0.165
17.089	0.428
17.274	0.286
17.858	0.226
17.961	0.287
18.169	0.449
19.033	0.207
19.049	0.409
19.056	0.500
19.134	0.247
19.138	0.298
19.257	0.561
19.634	0.369
19.823	0.288
20.031	0.440
20.719	0.461
20.911	0.410
21.003	0.330
21.884	0.310
22.106	0.644
22.256	1.302
23.004	0.837
23.224	1.141
24.160	0.575
24.161	0.595
24.872	0.909
27.811	2.136
30.066	0.883
33.025	1.108];
data.tW(:,2) = data.tW(:,2)/1000; % convert mg to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'dry weight'};  
temp.tW = C2K(1.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SassTaka2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
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
F1 = 'length-weight: Ww in g = 0.00617*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northwest Pacific: Suruga Bay in Japan, Sea of Okhotsk and the Bering Sea. Northeast Pacific: off British Columbia, Canada to northern Baja California, Mexico. Southwest Pacific: Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '72HZ4'; % Cat of Life
metaData.links.id_ITIS = '623625'; % ITIS
metaData.links.id_EoL = '46562944'; % Ency of Life
metaData.links.id_Wiki = 'Lipolagus_ochotensis'; % Wikipedia
metaData.links.id_ADW = 'Lipolagus_ochotensis'; % ADW
metaData.links.id_Taxo = '691238'; % Taxonomicon
metaData.links.id_WoRMS = '281374'; % WoRMS
metaData.links.id_fishbase = 'Lipolagus_ochotensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lipolagus_ochotensis}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Lipolagus_ochotensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

