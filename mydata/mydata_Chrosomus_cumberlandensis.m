  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_cumberlandensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_cumberlandensis'; 
metaData.species_en = 'Blackside dace'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 08];

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'StarStar1981';
  comment.Lp = 'based on SL 3.53 cm and F2';
data.Li = 7.6;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li = 'fishbase';

data.Wwb = 1.3e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'StarStar1981';
  comment.Wwb = 'based on egg diameter of 1.36 mm: pi/6*0.136^3';
data.Wwp = 0.59;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','StarStar1981'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 3.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'StarStar1981';
  comment.Wwi = 'based on LW data';

data.Ri = 2872/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'StarStar1981';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % yr class (yr), std length (cm)
    0 2.7
    1 3.54
    2 5.43
    3 6.55];
data.tL(:,1) = 365 * (0.6 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.84; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StarStar1981'; 

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
2.760	0.242
2.761	0.195
2.800	0.242
2.863	0.257
2.871	0.296
2.926	0.351
2.974	0.296
4.010	0.778
4.176	0.872
4.484	1.090
4.659	1.129
4.799	1.527
5.043	1.761
5.123	1.721
5.169	1.995
5.344	1.940
5.492	2.213
5.525	2.025
5.649	2.509
5.714	2.369
6.168	3.133
6.400	2.875];
data.LW_f(:,1) = data.LW_f(:,1)/ 0.84; % convert SL to TL
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'StarStar1981'; 
%
data.LW_m = [ ... % std length (cm), weight (g)
2.538	0.203
2.586	0.125
2.919	0.265
2.974	0.335
3.147	0.507
4.049	0.919
4.387	1.332
4.476	1.121
4.492	1.199
4.647	1.715
4.649	1.425
4.813	1.699
5.137	1.971
5.310	2.198
5.492	2.330
5.609	2.611
5.617	2.478
5.767	2.650
5.804	2.994];
data.LW_m(:,1) = data.LW_m(:,1)/ 0.84; % convert SL to TL
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'females'};  
bibkey.LW_m = 'StarStar1981'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHXY'; % Cat of Life
metaData.links.id_ITIS = '913992'; % ITIS
metaData.links.id_EoL = '208317'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_cumberlandensis'; % Wikipedia
metaData.links.id_ADW = 'Chrosomus_cumberlandensis'; % ADW
metaData.links.id_Taxo = '1682640'; % Taxonomicon
metaData.links.id_WoRMS = '1012646'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-cumberlandensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chrosomus_cumberlandensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chrosomus-cumberlandensis.html}}';  
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
bibkey = 'LianSui2014'; type = 'article'; bib = [ ...
'author = {Yangyang Liang and Xiaoyun Sui and Yifeng Chen and Yintao Jia and Dekui He}, ' ...
'year = {2014}, ' ...
'title  = {Life history traits of the {C}hinese minnow \emph{Rhynchocypris oxycephalus} in the upper branch of {Y}angtze {R}iver, {C}hina}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {53(36)}, ' ...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'StarStar1981'; type = 'article'; bib = [ ...
'doi = {10.2307/2425173}, ' ...
'author = {Starnes, L. B. and Starnes, W. C.}, ' ...
'year = {1981}, ' ...
'title  = {Biology of the Blackside Dace \emph{Phoxinus cumberlandensis}}, ' ...
'journal = {American Midland Naturalist}, ' ...
'volume = {106(2)}, ' ...
'pages = {360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

