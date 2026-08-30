function [data, auxData, metaData, txtData, weights] = mydata_Sminthopsis_macroura
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Sminthopsis_macroura'; 
metaData.species_en = 'Stripe-faced dunnart'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 06];

%% set data
% zero-variate data

data.tg = 14;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'FrigWool1997';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 67;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'FrigWool1997';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '65-70 d';
data.tp = 4*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Wiki';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(35.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.01;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FrigWool1997';
data.Wwx = 7;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'FrigWool1997';
data.Wwi = 20;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '15-25 g';

data.Ri  = 16/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'FrigWool1997';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr (Wiki: possibly 3), 8 pups per litter';

% uni-variate data

% time-weight
data.tWw = [ ... % time (d), weight (g)
0.105	0.020
1.163	0.057
4.863	0.079
10.996	0.103
13.003	0.180
14.906	0.181
20.298	0.242
26.111	0.360
30.020	0.513
32.974	0.835
35.086	0.968
40.035	1.950
41.182	2.721
41.928	2.421
43.084	2.798
43.931	2.742
44.978	3.232
46.866	3.966
48.344	4.062
48.866	4.363
50.021	4.740
50.639	5.530
51.786	6.320
53.289	5.250
54.236	5.457
54.963	6.059
56.131	5.835
56.857	6.531
57.703	6.532
59.098	5.537
60.135	6.534
60.967	7.155
61.927	6.798
62.756	7.588
63.592	8.040
64.755	8.041
65.909	8.474
67.082	8.024
67.696	8.964
68.970	8.759
69.917	8.947];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(35.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'FrigWool1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
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

% %% Group plots
% set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to hold growth since birth for 20 d to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4XWZH'; % Cat of Life
metaData.links.id_ITIS = '552648'; % ITIS
metaData.links.id_EoL = '311876'; % Ency of Life
metaData.links.id_Wiki = 'Sminthopsis_macroura'; % Wikipedia
metaData.links.id_ADW = 'Sminthopsis_macroura'; % ADW
metaData.links.id_Taxo = '59970'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800101'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sminthopsis_macroura}}';
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
bibkey = 'FrigWool1997'; type = 'Article'; bib = [ ... 
'doi = {10.1071/ZO97002}, ' ...
'author = {L. Frigo and P. A. Woolley}, ' ... 
'year = {1997}, ' ...
'title = {An Ecological Study of \emph{Sminthopsis crassicaudata} ({M}arsupialia: {D}asyuridae) {III}. {R}eproduction and Life History}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {45}, ' ...
'pages = {157–170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sminthopsis_crassicaudata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

