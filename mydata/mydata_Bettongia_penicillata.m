function [data, auxData, metaData, txtData, weights] = mydata_Bettongia_penicillata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Potoroidae';
metaData.species    = 'Bettongia_penicillata'; 
metaData.species_en = 'Woylie'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TAt'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 05];

%% set data
% zero-variate data

data.tg = 18;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 150;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.29;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 500;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 1500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 litters per yr, 1 pup per litter';

% uni-variate data
% time-weight
data.tWw = [ ... % time (d), weight (g)
4.584	0.147
6.108	2.124
10.349	3.546
11.203	1.003
13.406	3.001
14.594	3.682
16.295	1.809
17.991	2.506
19.173	5.757
20.197	3.220
22.061	5.208
23.589	5.257
25.290	3.383
25.964	5.976
27.325	4.734
27.489	7.310
28.851	5.426
29.867	6.744
30.375	7.403
31.398	5.508
31.903	7.452
33.094	6.205
36.829	6.325
37.498	11.488
38.857	10.889
39.706	10.916
42.930	11.662
44.794	13.650
45.805	17.539
46.490	14.347
50.046	18.960
51.407	17.719
52.757	21.618
55.634	26.209
55.645	21.068
56.482	26.879
58.014	25.000
59.872	29.559
61.233	28.317
62.067	35.413
63.762	36.753
64.452	31.634
65.291	36.160
67.144	43.289
68.339	40.114
70.211	38.246
70.686	54.971
71.215	45.348
71.893	46.012
73.040	65.972
74.917	61.533
77.302	57.754
77.435	75.753
77.632	62.263
79.156	64.240
80.788	96.426
81.981	94.537
83.540	79.163
84.656	114.546
85.223	86.286
85.543	95.936
87.084	89.559
87.417	92.783
88.314	152.581
89.180	144.254
90.737	130.165
91.513	165.537
92.116	119.927
93.078	147.592
94.175	192.615
96.700	202.979
98.237	198.529
99.027	227.475
99.415	203.709];
for i=2:size(data.tWw,1); if data.tWw(i,1)<=data.tWw(i-1,1); data.tWw(i,1)=data.tWw(i-1,1)+1e-3; end; end
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(37.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MercLibk1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '68JYM'; % Cat of Life
metaData.links.id_ITIS = '552701'; % ITIS
metaData.links.id_EoL = '128419'; % Ency of Life
metaData.links.id_Wiki = 'Bettongia_penicillata'; % Wikipedia
metaData.links.id_ADW = 'Bettongia_penicillata'; % ADW
metaData.links.id_Taxo = '60282'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000182'; % MSW3
metaData.links.id_AnAge = 'Bettongia_penicillata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bettongia_penicillata}}';
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
bibkey = 'MercLibk1994'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00360-002-0315-7}, ' ...
'author = {J. C. Merchant and J. A. Libke and M. J. Smit}, ' ... 
'year = {1994}, ' ...
'title = {Lactation and Energetics of Growth in the Brush-tailed Bettong, \emph{Bettongia penicillata} ({M}arsupialia: {P}otoroidae) in Captivity}, ' ...
'journal = {Aust. J. Zool., , , }, ' ...
'volume = {42}, ' ...
'pages = {125–133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bettongia_penicillata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

