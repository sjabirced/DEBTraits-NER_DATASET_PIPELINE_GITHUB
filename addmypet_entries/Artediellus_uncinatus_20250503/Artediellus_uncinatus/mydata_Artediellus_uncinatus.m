function [data, auxData, metaData, txtData, weights] = mydata_Artediellus_uncinatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Artediellus_uncinatus'; 
metaData.species_en = 'Arctic hookear sculpin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 03];

%% set data
% zero-variate data

data.am = 10 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Artediellus_atlanticus';
  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Artediellus_atlanticus';
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 0.006;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.25 mm of Artediellus_atlanticus: pi/6*0.225^3';
data.Wwp = 0.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00794*Lp^3.12, see F1';
data.Wwi = 10.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00794*Li^3.12, see F1'; 

data.Ri = 22/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Artediellus_atlanticus: 62*10.5/29.8';

% uni-variate data
% time-length
data.tL = [ ... % age (years), std length (cm) 
4.030	3.609
4.051	4.313
4.076	4.098
4.078	3.492
5.010	4.624
5.037	3.979
5.061	4.077
5.084	4.194
6.017	5.013
6.019	4.603
6.930	5.051
7.986	5.284
8.009	5.460
8.010	5.108
8.971	5.126];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(2.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dorr1993';  comment.tL = 'data from N Svalbard';

% time-weight
data.tW = [ ... % age (years), weight (g) (cm) 
4.108	2.249
4.116	1.225
4.135	1.912
4.142	1.049
5.048	1.897
5.065	2.760
5.122	1.633
5.138	2.614
6.051	2.539
6.097	2.861
7.055	3.124
8.015	3.166
8.032	4.103
8.060	3.649
9.048	3.180];
data.tW(:,1) = 365 * (0.3 + data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(2.4);  units.temp.tW = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW = 'Dorr1993';  

% length-weight
data.LW = [ ...
3.505	1.011
3.659	1.215
4.042	1.886
4.062	1.624
4.078	2.672
4.254	1.901
4.311	2.207
4.580	2.586
4.619	2.484
5.003	2.820
5.021	3.111
5.118	3.140
5.211	4.087
5.425	3.607];
units.LW = {'d', 'g'}; label.LW = {'time since birth', 'weight'};  
bibkey.LW = 'Dorr1993';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
% weights.Wwb = weights.Wwb * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Wwp = weights.Wwp * 0;
% weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northwest Atlantic: Labrador in Canada south to Cape Cod in Massachusetts, USA; around Greenland. Also Arctic Alaska westward to Point Barrow. Northeast Atlantic: Greenland';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'GVT5'; % Cat of Life
metaData.links.id_ITIS = '167208'; % ITIS
metaData.links.id_EoL = '46568929'; % Ency of Life
metaData.links.id_Wiki = 'Artediellus_uncinatus'; % Wikipedia
metaData.links.id_ADW = 'Artediellus_uncinatus'; % ADW
metaData.links.id_Taxo = '161825'; % Taxonomicon
metaData.links.id_WoRMS = '127193'; % WoRMS
metaData.links.id_fishbase = 'Artediellus_uncinatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Artediellus_atlanticus}}';
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
bibkey = 'Dorr1993'; type = 'phdthesis'; bib = [ ...
'author = {Christian F. von Dorrien}, ' ... 
'year = {1993}, ' ...
'title = {Ecology and Respiration of selected Arctic enthic Fish Species}, ' ...
'school = {Christian-Albrechts-University of Kiel}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Artediellus_atlanticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

