function [data, auxData, metaData, txtData, weights] = mydata_Sigmops_gracilis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Gonostomatidae';
metaData.species    = 'Sigmops_gracilis'; 
metaData.species_en = 'Slender fangjaw'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.1); % in K, body temp
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
  temp.am = C2K(5.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';    bibkey.Lp = 'guess';
data.Li = 13.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.13e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tL data and egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 3.9; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 0.00138*Li^3.07, see F3';

data.Ri = 560/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(5.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
2.664	0.437
3.303	0.385
4.571	0.399
4.727	0.437
5.838	0.445
5.840	0.414
6.631	0.452
7.424	0.460
7.898	0.490
8.537	0.437
9.639	0.550
9.645	0.474
9.801	0.505
9.808	0.422
10.751	0.542
11.071	0.504
11.706	0.504
12.817	0.512
13.773	0.466
13.923	0.572
14.084	0.542
14.558	0.564
14.719	0.542
15.675	0.496
15.830	0.542
15.986	0.572
16.140	0.632
16.619	0.594
18.207	0.594
19.156	0.639
19.803	0.488
19.958	0.526
20.745	0.617
21.851	0.677
22.966	0.631
23.915	0.677
24.874	0.586
25.183	0.699
25.663	0.646
25.806	0.850
26.597	0.873
26.778	0.593
26.924	0.759
26.927	0.722
27.711	0.842
27.715	0.789
27.718	0.752
27.727	0.646
28.682	0.608
29.775	0.835
29.945	0.691
29.952	0.608
30.249	0.865
30.412	0.812
31.516	0.902
31.681	0.819
31.684	0.781
32.004	0.744
32.149	0.925
32.305	0.963
33.899	0.872
35.790	1.045
37.225	0.970
38.964	1.052
39.601	1.022
39.926	0.932
42.305	0.961
42.776	1.022
42.929	1.097
44.810	1.391
45.312	1.074
45.475	1.014
47.354	1.338
47.839	1.233
47.841	1.202
47.866	0.893
48.953	1.195
49.119	1.097
49.895	1.323
50.208	1.376
51.800	1.315
52.607	1.157
54.489	1.436
54.657	1.322
58.302	1.397
58.629	1.277];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(5.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SassTaka2018';

% length-dry weight
data.tW = [ ... % time since birth (d), dry weight (mg)
2.755	0.021
4.441	0.006
5.207	-0.001
6.125	0.021
6.584	0.028
6.890	0.035
7.349	0.042
8.266	0.056
8.728	0.035
9.492	0.056
11.330	0.056
12.250	0.041
12.862	0.048
14.239	0.077
15.311	0.077
16.078	0.062
16.227	0.120
17.300	0.098
18.526	0.091
18.982	0.142
19.907	0.061
21.281	0.119
22.202	0.104
23.273	0.119
24.189	0.148
25.106	0.177
25.415	0.140
25.571	0.104
26.323	0.285
26.941	0.220
27.104	0.096
27.700	0.307
27.704	0.256
28.319	0.227
28.326	0.132
29.247	0.110
29.386	0.299
29.701	0.183
30.319	0.110
30.470	0.139
30.921	0.255
31.219	0.364
31.223	0.314
31.844	0.204
31.978	0.452
31.994	0.248
31.998	0.190
32.289	0.386
33.672	0.335
35.950	0.589
36.879	0.458
38.864	0.545
39.164	0.625
40.254	0.392
42.087	0.457
42.832	0.733
43.154	0.522
45.225	1.489
45.749	0.645
45.909	0.550
46.922	1.321
47.763	0.346
48.016	1.045
48.024	0.943
48.489	0.870
48.808	0.695
49.530	1.277
49.821	1.473
51.981	1.269
52.779	0.847
54.554	1.669
54.741	1.232
58.549	1.515
58.883	1.144];
data.tW(:,2) = data.tW(:,2)/1000; % convert mg to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'dry weight'};  
temp.tW = C2K(5.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SassTaka2018';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
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
F1 = 'length-weight: Ww in g = 0.00138*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4XB3H'; % Cat of Life
metaData.links.id_ITIS = '622490'; % ITIS
metaData.links.id_EoL = '46563225'; % Ency of Life
metaData.links.id_Wiki = 'Sigmops'; % Wikipedia
metaData.links.id_ADW = 'Sigmops_gracilis'; % ADW
metaData.links.id_Taxo = '691891'; % Taxonomicon
metaData.links.id_WoRMS = '279336'; % WoRMS
metaData.links.id_fishbase = 'Sigmops_gracilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sigmops}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sigmops_gracilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

