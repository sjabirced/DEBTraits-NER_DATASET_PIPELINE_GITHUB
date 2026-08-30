function [data, auxData, metaData, txtData, weights] = mydata_Parantechinus_apicalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Parantechinus_apicalis'; 
metaData.species_en = 'Dibbler'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 22];

%% set data
% zero-variate data

data.tg = 48;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 315;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0164;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 70;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 40-125 g';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-weight
data.tW_f = [ ... % time (d), weight^(1/3) (g^(1/3))
72.430	11.886
72.430	10.577
72.430	8.722
72.430	7.304
72.645	12.976
72.645	9.703
77.806	13.280
78.237	12.405
78.452	14.368
78.667	11.312
79.527	17.199
84.903	14.993
85.548	17.717
85.548	16.954
85.548	12.808
85.978	20.115
85.978	18.915
86.194	14.005
91.785	16.271
92.000	15.397
92.000	19.433
92.215	20.196
92.645	14.085
93.935	22.916
99.097	20.383
99.097	17.874
99.312	23.437
99.527	23.981
99.527	19.399
100.387	25.613
100.817	26.157
106.194	21.769
106.839	22.639
107.054	26.238
107.054	27.220
107.269	27.873
107.699	28.853
113.075	25.447
113.720	29.153
113.720	29.589
113.935	24.243
113.935	30.461
115.656	29.908
115.871	31.107
116.301	31.868
120.817	29.884
121.032	30.974
121.032	26.611
121.247	25.191
121.462	32.063
121.677	33.044
121.677	27.262
126.839	26.148
126.839	30.948
127.054	27.020
127.054	27.783
127.054	32.474
127.269	33.128
127.269	34.219
127.699	35.526
129.849	34.207
130.710	37.148
131.140	36.165
135.441	39.963
135.871	30.034
136.086	28.833
136.301	37.014
136.516	35.486
136.516	27.849
136.731	33.194
136.946	33.956
142.108	36.115
142.108	40.369
142.323	28.914
142.323	29.896
142.323	34.041
142.323	35.132
142.323	37.968
155.871	39.216
156.086	40.197
156.301	41.068
156.301	37.141
156.301	30.814
156.731	36.266
156.731	34.630
156.731	33.212
162.968	30.565
163.183	34.164
163.183	37.328
163.183	39.946
163.398	31.109
163.398	32.091
163.398	33.182
163.613	36.235
163.828	40.707
164.043	39.070
169.634	39.699
170.065	38.497
170.280	37.732
170.495	40.568
170.495	36.858
170.495	35.986
170.495	29.877
170.710	33.694
170.710	32.712
170.710	30.857
175.656	33.017
176.516	37.922
176.731	31.266
176.731	31.703
176.731	36.066
176.946	41.193
177.376	30.064];
for i=2:size(data.tW_f(:,1)); if data.tW_f(i,1)<=data.tW_f(i-1,1);data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3;end;end
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(35);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MillGerm2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight^(1/3) (g^(1/3))
72.645	6.976
72.645	9.485
73.075	12.865
78.452	12.186
78.452	8.804
79.097	17.747
85.763	11.934
86.194	13.569
86.624	21.094
92.000	14.088
92.645	16.812
93.075	25.210
99.742	21.144
100.172	29.651
100.172	18.305
100.817	31.284
106.409	26.350
106.839	22.530
107.484	35.290
107.484	34.418
113.505	26.754
114.581	30.131
115.011	39.838
115.441	38.091
121.462	43.190
121.462	41.663
121.462	29.009
122.108	34.024
127.484	29.745
127.699	35.526
129.849	47.080
130.065	45.660
136.301	38.978
136.516	48.358
137.376	34.391
142.753	51.057
142.968	52.147
143.613	39.053
156.516	51.758
156.516	42.813
156.946	38.120
157.161	55.028
163.613	39.181
163.828	44.961
164.043	53.906
170.710	54.748
170.710	49.730
170.710	37.839
171.140	40.346
176.946	37.811
176.946	41.956
177.376	50.682
177.591	56.790];
for i=2:size(data.tW_m(:,1)); if data.tW_m(i,1)<=data.tW_m(i-1,1);data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3;end;end
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(35);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MillGerm2000';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Once widely distributed, but presently confined to a small area SW Australia';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D6GM'; % Cat of Life
metaData.links.id_ITIS = '552594'; % ITIS
metaData.links.id_EoL = '323735'; % Ency of Life
metaData.links.id_Wiki = 'Parantechinus_apicalis'; % Wikipedia
metaData.links.id_ADW = 'Parantechinus_apicalis'; % ADW
metaData.links.id_Taxo = '169197'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800032'; % MSW3
metaData.links.id_AnAge = 'Parantechinus_apicalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parantechinus_apicalis}}';
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
bibkey = 'MillGerm2000'; type = 'Article'; bib = [ ... 
'doi = {110.1071/AM00239}, ' ...
'author = {Harriet Mills and Rebecca Z. German and Cathy Lambert and Mark P. Bradley}, ' ... 
'year = {1961}, ' ...
'title = {GROWTH AND SEXUAL DIMORPIDSM IN THE DIBBLER, \emph{Parantechinus apicalis} ({M}ARSUPIALIA, {D}ASYURIDAE)}, ' ...
'journal = {Australian Mammalogy}, ' ...
'volume = {21}, ' ...
'pages = {239-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Parantechinus_apicalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

