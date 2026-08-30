function [data, auxData, metaData, txtData, weights] = mydata_Dasyuroides_byrnei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Dasyuroides_byrnei'; 
metaData.species_en = 'Kowari'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
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

data.tg = 33;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 102;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 10.5*30.6;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10-11 mnth';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.027;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 45;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 105;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';

data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr, 6 pups per litter';
 
  % univariate data
  % time-weight
  data.tWw_f = [ ... % time since release from teats (d), weight (g)
57.758	6.434
62.655	10.089
63.022	9.363
64.762	11.188
66.531	11.377
67.903	13.928
67.929	12.473
68.264	13.565
70.387	13.756
78.091	19.058
82.276	22.893
83.349	22.352
84.715	25.266
85.437	24.541
86.848	24.911
95.946	31.491
96.633	32.767
96.658	31.312
97.029	30.405
99.110	32.958
104.317	39.160
104.372	36.070
104.703	37.344
105.789	36.075
114.762	49.747
115.042	53.930
116.122	53.025
117.214	51.393
135.385	66.009
137.586	61.836
139.951	68.390
164.795	66.487
166.054	75.401
172.543	69.244
201.015	82.628
201.743	81.540];
  data.tWw_f(:,1) = data.tWw_f(:,1)-30; % set time since release to time since birth
  units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
  temp.tWw_f  = C2K(35.2);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
  bibkey.tWw_f = 'GeisMatw1986';
  comment.tWw_f = 'Data for females';
  %
  data.tWw_m = [ ... % time since release from teats (d), weight (g)
64.420	10.460
66.846	13.560
70.719	15.030
76.319	19.051
85.417	25.632
85.807	23.634
90.366	26.379
93.118	31.117
104.694	37.889
116.470	53.390
132.795	72.181
133.807	75.094
139.422	78.206
164.946	97.942
168.928	93.230
170.033	90.871
199.236	102.985
199.919	104.442
200.519	110.626
201.704	103.722];
data.tWw_m(:,1) = data.tWw_m(:,1)-30; % set time since release to time since birth
  units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
  temp.tWw_m  = C2K(35.2);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
  bibkey.tWw_m = 'GeisMatw1986';
  comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6CF7Q'; % Cat of Life
metaData.links.id_ITIS = '709391'; % ITIS
metaData.links.id_EoL = '311786'; % Ency of Life
metaData.links.id_Wiki = 'Dasyuroides_byrnei'; % Wikipedia
metaData.links.id_ADW = 'Dasyuroides_byrnei'; % ADW
metaData.links.id_Taxo = '59929'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800025'; % MSW3
metaData.links.id_AnAge = 'Dasyuroides_byrnei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyurus_viverrinus}}';
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
bibkey = 'GeisMatw1986'; type = 'Article'; bib = [ ... 
'author = {Fritz Geiser and Louisa Matwiejczyk and R. V. Baudinette}, ' ... 
'year = {1986}, ' ...
'title = {FROM ECTOTHERMY TO HETEROTHERMY: THE ENERGETICS OF THE KOWARI, \emph{Dasyuroides byrnei} ({M}ARSUPIALIA: {D}ASYURIDAE)}, ' ...
'journal = {Physiol. Zool.}, ' ...
'volume = {59(2)}, ' ...
'pages = {220-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dasyurus_viverrinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

