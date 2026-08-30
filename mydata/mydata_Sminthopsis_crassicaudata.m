function [data, auxData, metaData, txtData, weights] = mydata_Sminthopsis_crassicaudata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Sminthopsis_crassicaudata'; 
metaData.species_en = 'Fat-tailed dunnart'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

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

data.tg = 14;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 69;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 115;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.01;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 15;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 14/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr, 7 pups per litter';

% uni-variate data

% time-length
data.tL = [ ... % time (d), head+body length (cm)
0.079	0.400
0.080	0.379
0.082	0.344
0.100	0.437
0.171	0.376
0.294	0.400
2.052	0.483
4.008	0.487
5.003	0.642
8.034	0.631
10.803	0.742
11.053	0.789
12.946	0.790
15.209	0.944
17.096	1.079
18.042	1.089
18.989	1.100
20.062	1.100
20.937	1.303
25.036	1.414
26.175	1.341
28.950	1.417
29.957	1.495
32.096	1.694
35.815	1.888
35.998	2.137
37.891	2.177
40.020	2.972
41.910	3.193
43.052	2.873
44.936	3.495
49.234	3.150
49.916	4.002];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL  = C2K(35.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Marl1961';

% time-weight
data.tWw_f = [ ... % time (mnth), weight (g)
 0	9.480
 1	10.243
 2	10.001
 4	12.766
 5	12.347
 6	13.521
 7	15.406
 8	15.696
 9	17.285
10	16.335
11	16.329];
data.tWw_f(:,1) = 30.5*(3.5+data.tWw_f(:,1)); % convert mnth to d
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(35.2);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Mort1978';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time (mnth), weight (g)
 0	10.236
 1	10.589
 2	11.778
 3	12.907
 4	13.618
 5	12.656
 6	17.070
 7	17.661
 8	16.760
 9	17.113
10	17.406
11	17.222];
data.tWw_m(:,1) = 30.5*(3.5+data.tWw_m(:,1)); % convert mnth to d
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(35.2);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Mort1978';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;
weights.Wwi = 5 * weights.Wwi;

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

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4XWZ6'; % Cat of Life
metaData.links.id_ITIS = '552637'; % ITIS
metaData.links.id_EoL = '323752'; % Ency of Life
metaData.links.id_Wiki = 'Sminthopsis_crassicaudata'; % Wikipedia
metaData.links.id_ADW = 'Sminthopsis_crassicaudata'; % ADW
metaData.links.id_Taxo = '59959'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800091'; % MSW3
metaData.links.id_AnAge = 'Sminthopsis_crassicaudata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sminthopsis_crassicaudata}}';
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
bibkey = 'Mort1978'; type = 'Article'; bib = [ ... 
'author = {S. R. Morton}, ' ... 
'year = {1978}, ' ...
'title = {An Ecological Study of \emph{Sminthopsis crassicaudata} ({M}arsupialia: {D}asyuridae) {III}. {R}eproduction and Life History}, ' ...
'journal = {Aust. Wildl. Res.}, ' ...
'volume = {5}, ' ...
'pages = {183-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sminthopsis_crassicaudata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

