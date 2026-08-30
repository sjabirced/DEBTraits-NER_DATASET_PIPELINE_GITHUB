function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_rivulatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_rivulatus'; 
metaData.species_en = 'Blubberlip snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 13];

%% set data
% zero-variate data

data.am = 55*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'WakeCoul2020';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 81;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.8 mm of L. stellatus: pi/6*0.08^3'; 
data.Wwi = 8988; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.02, see F1; max. published weight: 11 kg';

data.Ri  = 1.9e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lutjanus_sanguineus: 2.6e6*8988/12019';

% uni-variate data
% time-length
data.tL_Nf = [ ... % time since birth (yr), fork length (cm)
8.276	51.103
25.057	76.347
42.299	72.691
55.057	83.406];
data.tL_Nf(:,1) = 365 * (0.5+data.tL_Nf(:,1));  % convert yr to d
units.tL_Nf   = {'d', 'cm'}; label.tL_Nf = {'time since birth', 'fork length', 'females'};  
temp.tL_Nf    = C2K(26.5); units.temp.tL_Nf = 'K'; label.temp.tL_Nf = 'temperature';
bibkey.tL_Nf = 'WakeCoul2020'; 
%
data.tL_Nm = [ ... % time since birth (yr), fork length (cm)
8.130	56.661
17.061	73.712
21.298	78.155
38.473	86.222];
data.tL_Nm(:,1) = 365 * (0.5+data.tL_Nm(:,1));  % convert yr to d
units.tL_Nm   = {'d', 'cm'}; label.tL_Nm = {'time since birth', 'fork length', 'males'};  
temp.tL_Nm    = C2K(26.5); units.temp.tL_Nm = 'K'; label.temp.tL_Nm = 'temperature';
bibkey.tL_Nm = 'WakeCoul2020'; 
%
data.tL_Wf = [ ... % time since birth (yr), fork length (cm)
1.149	24.464
4.138	42.089
5.517	39.873
5.747	47.372
6.322	44.058
6.437	42.293
8.046	51.325
8.391	46.249
19.195	49.479
19.655	53.887
20.460	47.484
21.609	48.358
25.632	51.858
26.207	48.986
26.667	51.409
39.310	52.419
47.816	52.577];
data.tL_Wf(:,1) = 365 * (0.5+data.tL_Wf(:,1));  % convert yr to d
units.tL_Wf   = {'d', 'cm'}; label.tL_Wf = {'time since birth', 'fork length', 'females'};  
temp.tL_Nf    = C2K(26.5); units.temp.tL_Wf = 'K'; label.temp.tL_Wf = 'temperature';
bibkey.tL_Wf = 'WakeCoul2020'; 
%
data.tL_Wm = [ ... % time since birth (yr), fork length (cm)
1.603	24.848
3.550	37.215
5.038	44.726
5.153	47.374
5.725	42.967
5.954	50.248
7.214	46.728
7.328	52.023
9.733	51.820
9.962	50.057
10.076	55.793
11.565	61.318
11.794	56.026
11.908	53.821
13.855	58.688
15.802	59.364
15.803	57.379
16.145	53.852
16.718	60.253
18.092	56.072
19.809	58.291
20.496	54.546
20.954	56.755
21.298	60.949
23.473	59.641
24.160	63.838
24.504	57.443
25.534	59.436
28.168	60.338
30.802	57.710
34.695	62.371
37.901	67.689];
data.tL_Wm(:,1) = 365 * (0.5+data.tL_Wm(:,1));  % convert yr to d
units.tL_Wm   = {'d', 'cm'}; label.tL_Wm = {'time since birth', 'fork length', 'males'};  
temp.tL_Wm    = C2K(26.5); units.temp.tL_Wm = 'K'; label.temp.tL_Wm = 'temperature';
bibkey.tL_Wm = 'WakeCoul2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Nf = 3 * weights.tL_Nf;
weights.tL_Nm = 3 * weights.tL_Nm;
weights.tL_Wf = 3 * weights.tL_Wf;
weights.tL_Wm = 3 * weights.tL_Wm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Nf','tL_Nm'}; subtitle1 = {'Data for females, males from northern West Australia'};
set2 = {'tL_Wf','tL_Wm'}; subtitle2 = {'Data for females, males from north-west West Australia'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WGCC'; % Cat of Life
metaData.links.id_ITIS = '168892'; % ITIS
metaData.links.id_EoL = '46580748'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_rivulatus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_rivulatus'; % ADW
metaData.links.id_Taxo = '106214'; % Taxonomicon
metaData.links.id_WoRMS = '218494'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-rivulatus'; % fishbase

%% References46580743
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_rivulatus}}';
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
bibkey = 'WakeCoul2020'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2020.105634}, ' ...
'author = {Wakefield, C. B. and Coulson, P. G. and Loudon, L. and Newman, S. J.}, ' ... 
'year = {2020}, ' ...
'title = {Latitudinal and sex-specific differences in growth and an exceptional longevity for the {M}aori snapper \emph{Lutjanus rivulatus} from north-western {A}ustralia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {230}, ' ...
'pages = {105634}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-rivulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
