function [data, auxData, metaData, txtData, weights] = mydata_Phyllotis_darwini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Phyllotis_darwini'; 
metaData.species_en = 'Darwin''s leaf-eared mice'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 25];

%% set data
% zero-variate data

data.tg = 18;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 34;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 57;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LimaBozi1997';
data.Wwi = 50.8;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 8/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'till 4 pups per litter; 2 litters per yr assumed';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
15.892	12.407
19.560	13.762
22.005	15.507
28.117	21.713
31.785	25.593
36.675	28.305
74.572	32.145
78.240	28.063
80.685	52.332
88.020	42.226
88.021	36.789
88.022	39.508
91.687	34.843
92.910	37.949
92.911	33.094
95.355	29.985
95.356	36.004
100.245	51.338
102.690	35.801
105.134	39.294
106.357	32.884
108.802	28.998
114.914	38.700
117.359	33.842
118.582	34.812
133.252	50.523
145.477	32.839
150.367	43.124
163.814	41.944
163.815	37.089
193.154	42.492
201.711	49.084
206.602	46.360
212.714	32.955
287.286	44.712
323.961	48.942
396.088	45.945
399.755	37.785
451.100	42.968
465.770	38.097];
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f   = C2K(36.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'LimaBozi1997'; 
%
data.tW_m = [ ... % time since birth (d), weight (g)
13.447	12.798
17.115	14.153
19.560	15.704
24.450	17.834
26.895	22.297
29.340	23.265
33.007	24.232
36.675	26.169
39.120	28.108
40.342	29.854
42.787	31.599
45.232	33.344
47.677	34.894
53.790	36.441
61.125	34.685
69.682	41.471
73.350	36.418
74.572	38.164
91.687	29.212
96.577	68.430
96.578	52.702
99.022	49.009
100.245	47.260
106.357	42.399
108.802	54.241
108.803	31.716
110.025	45.307
111.247	47.830
112.468	49.770
112.469	43.557
119.803	52.480
119.804	44.325
121.027	40.440
127.139	48.977
138.142	42.362
143.032	42.162
161.369	52.044
162.592	41.168
171.147	48.731
171.148	46.013
171.149	41.158
178.484	47.363
180.929	60.564
220.049	67.898
239.609	64.380
264.059	70.953
328.851	76.314
354.523	68.129];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m   = C2K(36.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'LimaBozi1997'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4HCZX'; % Cat of Life
metaData.links.id_ITIS = '633304'; % ITIS
metaData.links.id_EoL = '1180082'; % Ency of Life
metaData.links.id_Wiki = 'Phyllotis_darwini'; % Wikipedia
metaData.links.id_ADW = 'Phyllotis_darwini'; % ADW
metaData.links.id_Taxo = '62450'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000856'; % MSW3
metaData.links.id_AnAge = 'Phyllotis_darwini'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phyllotis_darwini}}';
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
bibkey = 'LimaBozi1997'; type = 'Article'; bib = [ ... 
'author = {Mauricio Lima and Francisco Bozinovic and Fabian M. Jaksic}, ' ... 
'year = {1997}, ' ...
'title = {Body mass dynamics and growth patterns of leaf-eared mice \emph{Phyllotis darwini} in a semi-arid region of the {N}eotropics}, ' ...
'journal = {Acta Theriologica}, ' ...
'volume = {42(1)}, ' ...
'pages = {15-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phyllotis_darwini}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

