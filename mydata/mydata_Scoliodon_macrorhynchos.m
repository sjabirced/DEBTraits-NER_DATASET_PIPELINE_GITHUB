function [data, auxData, metaData, txtData, weights] = mydata_Scoliodon_macrorhynchos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Scoliodon_macrorhynchos'; 
metaData.species_en = 'Pacific spadenose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 24];


%% set data
% zero-variate data

data.ab = 5.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ZhaoJian2022';   
  temp.ab = C2K(28.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20.4;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ZhaoJian2022';
  comment.Lb = '19.0–21.8 cm';
data.Lp  = 42.4;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'ZhaoJian2022'; 
data.Lpm  = 46.4;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'ZhaoJian2022'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 71.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';

data.Wwb = 28.7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00309*Lb^3.03, see F1';
data.Wwp = 263.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00309*Lp^3.03, see F1';
data.Wwi = 1.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.03, see F1; max. published weight: 220.88 g';
 
% uni-variate data
% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
28.906	98.537
29.345	72.308
29.569	106.116
30.082	91.156
30.377	102.449
30.894	132.534
31.700	91.329
32.364	125.184
32.804	106.463
33.172	110.256
35.676	155.569
35.971	163.109
36.929	193.241
37.222	174.504
38.254	208.398
38.763	148.393
39.061	189.716
39.285	223.524
39.353	159.717
40.168	234.880
41.050	227.467
41.860	246.323
42.085	287.638
42.450	261.401
42.594	227.633
43.187	284.003
43.336	306.541
43.849	280.320
43.992	239.044
44.956	325.484
45.023	257.923
45.401	374.330
45.477	400.615
45.913	340.601
46.725	381.980
46.939	306.928
47.677	337.037
48.563	382.177
48.643	453.507
48.699	250.810
48.778	318.386
48.996	288.379
49.302	423.547
49.590	344.749
49.666	374.788
49.681	543.708
49.730	273.443
50.553	431.189
50.853	502.543
51.287	420.006
51.737	510.145
51.816	581.475
51.821	637.781
51.878	450.100
52.619	510.239
52.757	405.149
53.131	484.018
53.419	412.728
53.502	517.842
53.579	559.141
54.098	604.242
54.536	566.751
54.747	457.915
54.964	416.647
55.194	529.284
55.862	604.431
56.000	499.341
56.014	649.492
56.523	585.733
56.739	540.711
56.822	642.072
57.102	488.198
57.333	608.343
57.488	694.696
57.916	548.345
58.292	638.475
58.446	717.321
58.669	739.867
58.799	548.440
58.964	754.914
59.399	679.885
59.682	563.550
59.825	511.012
60.139	740.025
60.206	661.203
60.276	619.919
60.861	589.952
61.104	845.234
61.244	758.912
61.985	830.313
62.494	762.800
62.503	867.906
62.508	920.459
62.962	1066.904
63.534	883.032
63.686	935.600
64.348	939.425
64.490	886.888
64.946	1052.102
66.184	913.346
66.792	1134.883
66.800	1224.973
67.074	1003.531
68.843	1048.766
68.924	1135.111
69.811	1184.005
70.300	895.019
70.327	1202.829
71.346	1086.572
71.664	1356.877
74.196	1713.755
75.121	1364.755
77.167	2051.911
80.342	2206.156];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ZhaoJian2022'; 
%
data.LW_m = [ ...
25.226	53.097
29.272	79.808
31.776	125.121
32.291	132.684
34.424	136.666
36.703	129.403
39.714	88.435
40.676	159.859
41.049	216.206
41.855	186.262
43.702	287.812
43.931	381.680
44.726	227.861
46.347	258.065
46.861	250.613
47.088	329.466
47.243	415.819
47.304	269.429
47.968	295.777
48.194	359.615
49.514	322.219
49.518	371.018
50.261	449.926
50.547	363.621
51.430	374.977
52.164	356.287
52.912	495.256
53.421	435.250
53.645	476.566
53.934	420.290
55.205	649.406
55.416	540.569
55.785	563.132
58.735	661.046
58.876	589.739
59.622	717.447
59.626	758.739
60.574	664.996
60.871	706.320
61.247	792.696
61.454	646.322
62.123	725.223
62.796	845.415
63.006	729.071
63.452	789.179
63.604	845.502
64.556	796.805
65.665	868.245
66.262	962.153
67.016	1176.198
69.573	985.031
70.304	943.818
71.561	1019.028];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ZhaoJian2022'; 

% length-fecundity
data.LN = [ ... total legnth (cm), fecundity (#)
42.207	6.003
43.267	2.005
43.444	5.925
44.119	6.126
45.010	2.048
45.755	8.049
46.020	0.969
46.209	10.050
47.091	1.971
47.896	10.012
48.504	4.973
49.181	6.055
49.456	3.135
49.584	10.015
49.971	6.936
50.353	2.016
50.587	5.937
50.803	1.977
50.817	8.097
51.881	6.059
51.890	9.939
51.892	11.099
52.101	4.019
52.153	2.059
52.180	14.019
52.621	9.940
53.413	12.141
53.573	8.102
53.746	10.062
53.910	8.022
54.074	6.062
54.585	8.263
54.979	8.104
55.489	10.105
55.991	7.985
56.117	14.066
56.284	13.146
56.666	8.026
56.670	10.066
56.936	2.987
57.462	12.108
58.297	8.029
58.859	8.070
60.097	7.952
61.226	10.074
61.737	12.195
61.892	6.115
63.555	20.118
63.762	12.038
66.016	14.081
66.841	6.083
66.976	16.083
69.114	16.166
70.023	20.168
71.523	12.170
77.152	14.179
80.124	10.144];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ZhaoJian2022'; 
    
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00309*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Central Pacific: W Indonesia, Malaysia, Gulf of Thailand, Singapore, Borneo, Philippines, China, Hong Kong, Taiwan and Japan; exceptions, E Indonesia, New Guinea, northern Australia, and remainder of the Oceania region.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4VRWC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '20543711'; % Ency of Life
metaData.links.id_Wiki = 'Scoliodon_macrorhynchos'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4974567'; % Taxonomicon
metaData.links.id_WoRMS = '1021742'; % WoRMS
metaData.links.id_fishbase = 'Scoliodon_macrorhynchos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scoliodon_macrorhynchos}}';
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
bibkey = 'ZhaoJian2022'; type = 'Article'; bib = [ ...
'doi = {10.1002/mcf2.10216}, ' ...
'author = {Yu Zhao and Chengpu Jiang and  Peilong Ju and Jiamei Xiao and Mingru Chen}, ' ... 
'year = {2022}, ' ...
'title = {Reproductive Biology of the {P}acific Spadenose Shark \emph{Scoliodon macrorhynchos}, a Heavily Exploited Species in the {S}outhern {T}aiwan {S}trait}, ' ...
'journal = {Marine and Coastal Fisheries}, ' ...
'pages = {e10216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scoliodon_macrorhynchos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

