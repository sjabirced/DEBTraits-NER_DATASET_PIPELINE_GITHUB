function [data, auxData, metaData, txtData, weights] = mydata_Urolophus_cruciatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Urolophus_cruciatus'; 
metaData.species_en = 'Banded stingaree'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'; 't-Wwe'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 29];

%% set data
% zero-variate data;
data.ab = 10*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'TrinWalk2016';    
  temp.ab = C2K(15.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6*365;    units.tp = 'd';   label.tp = 'time since birth at puperty'; bibkey.tp = 'fishbase';    
  temp.tp = C2K(15.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'TrinWalk2016';
data.Lp = 31.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 35; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'TrinWalk2016'; 
data.Wwp = 335; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00813*Lp^3.08, see F1';
data.Wwi = 1390; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.08, see F1';

data.Ri  = 2/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 4 pups per litter, 1 litter per 2 yrs (TrinWalk2016)';
  
% uni-variate data
% time-length-weight for embryos
data.tLWe = [ ... % time since oct (mnth), total length (cm), weight (g)
1.95	 3.338  0.774
3.95	10.269 13.964
5.02	10.500 14.101
7.02	12.437 31.638];
data.tLWe(:,1) = data.tLWe(:,1) * 30.5; % convert mnth to d
units.tLWe = {'d', 'cm', 'g'};  label.tLWe = {'age', 'total length', 'weight'};  
temp.tLWe = C2K(15.1); units.temp.tLWe = 'K'; label.temp.tLWe = 'temperature';
bibkey.tLWe = 'TrinWalk2016'; treat.tLWe = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLWe = 10 * weights.tLWe;

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

% %% Grouping
% set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00813*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Indian Ocean: southern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DVVP'; % Cat of Life
metaData.links.id_ITIS = '7DVVP'; % ITIS
metaData.links.id_EoL = '46561049'; % Ency of Life
metaData.links.id_Wiki = 'Urolophus_cruciatus'; % Wikipedia
metaData.links.id_ADW = 'Urolophus_cruciatus'; % ADW
metaData.links.id_Taxo = '189790'; % Taxonomicon
metaData.links.id_WoRMS = '283096'; % WoRMS
metaData.links.id_fishbase = 'Urolophus_cruciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urolophus_cruciatus}}'; 
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
bibkey = 'TrinWalk2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-016-2976-x}, ' ...
'author = {Fabian I. Trinnie and Terence I. Walker and Paul L. Jones and Laurie J. Laurenson}, ' ...
'year = {2016}, ' ...
'title  = {Reproductive cycle of \emph{Urolophus cruciatus} in south‑eastern {A}ustralia: {D}oes the species exhibit obligate or facultative diapause?}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {163}, ' ...
'pages = {226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urolophus_cruciatus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 