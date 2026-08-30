function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_quinquelineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_quinquelineatus'; 
metaData.species_en = 'Five-lined snapper'; 

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

data.am = 31*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 38;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.8 mm of L. stellatus: pi/6*0.08^3'; 
data.Wwi = 688; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.98, see F1';

data.Ri  = 389880/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 NaN   NaN   11.30 NaN   NaN   NaN
    2 16.30 16.05 15.43 NaN   NaN   15.50
    3 17.99 16.76 16.68 16.30 17.40 17.20
    4 18.50 17.91 18.00 18.00 18.11 17.30
    5 18.87 18.68 19.17 19.17 18.78 19.36
    6 19.34 19.57 19.34 19.34 18.94 19.30];
data.tL(:,1) = 365 * (1.2+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NewmWill1996'; treat.tL = {1 {'Rib','John Brewer','Lodestone','Davies','Myrmidon','Kelso'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_Nf','tL_Nm'}; subtitle1 = {'Data for females, males from northern West Australia'};
% set2 = {'tL_Wf','tL_Wm'}; subtitle2 = {'Data for females, males from north-west West Australia'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^2.98';
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
bibkey = 'NewmWill1996'; type = 'Article'; bib = [ ... 
'author = {Newman, S.J. and D.McB. Williams and G.R. Russ}, ' ... 
'year = {1996}, ' ...
'title = {Variability in the population structure of \emph{Lutjanus adetii} ({C}astelnau, 1873) and \emph{L. quinquelineatus} ({B}loch, 1790) among reefs in the central {G}reat {B}arrier {R}eef, {A}ustralia}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {94}, ' ...
'pages = {313-329}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-rivulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
