function [data, auxData, metaData, txtData, weights] = mydata_Lampanyctus_macdonaldi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Lampanyctus_macdonaldi'; 
metaData.species_en = 'Rakery beaconlamp'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(5.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'guess';
data.Li = 16;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.3 mm of Lampanyctus_ritteri: pi/6*0.03^3';
data.Wwp = 3.4; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwi = 'based on 0.00479*Lp^3.16, see F1';
data.Wwi = 30.6; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00479*Li^3.16, see F1';

data.Ri = 152e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(5.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (f),standard length (cm)
139.368	0.590
142.089	0.763
187.579	0.671
205.472	0.842
250.517	2.506
261.214	2.461
365.691	2.709
%383.660	3.183
%396.369	4.027
365+16.000	3.249
365+21.575	4.115
365+42.793	3.332
365+140.230	3.971
365+145.723	4.512
365+250.144	4.543
365+260.076	4.997
365+365.644	6.025
365+389.877	6.564];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(5.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KawaMauc1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'scaled functional response for tL data is high, but measured length exceeds L_m';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00479*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Atlantic: between 65N and 47N. South Atlantic: between the Subtropical Convergence and the Antarctic Polar Front (also circumglobal). Southern Ocean: 60-63S, 90-120W and in the Falkland Current region at about 52S, 43W';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3S2NY'; % Cat of Life
metaData.links.id_ITIS = '162647'; % ITIS
metaData.links.id_EoL = '46564168'; % Ency of Life
metaData.links.id_Wiki = 'Lampanyctus_macdonaldi'; % Wikipedia
metaData.links.id_ADW = 'Lampanyctus_macdonaldi'; % ADW
metaData.links.id_Taxo = '178141'; % Taxonomicon
metaData.links.id_WoRMS = '126617'; % WoRMS
metaData.links.id_fishbase = 'Lampanyctus_macdonaldi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampanyctus_macdonaldi}}';
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
bibkey = 'KawaMauc1982'; type = 'article'; bib = [ ...
'doi = {10.1080/01965581.1982.10749447}, ' ...
'author = {Kouichi Kawaguchi and John Mauchline}, ' ... 
'year   = {1982}, ' ...
'title  = {Biology of {M}yctophid Fishes (Family Myctophidae) in the {R}ockall {T}rough, {N}ortheastern {A}tlantic {O}cean}, ' ...
'journal = {Biological Oceanography}, ' ...
'page = {337-373}, ' ...
'volume = {1:4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lampanyctus_macdonaldi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

