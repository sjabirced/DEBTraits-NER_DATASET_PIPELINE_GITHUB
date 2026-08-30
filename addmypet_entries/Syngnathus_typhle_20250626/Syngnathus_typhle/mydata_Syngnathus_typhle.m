function [data, auxData, metaData, txtData, weights] = mydata_Syngnathus_typhle
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Syngnathus_typhle'; 
metaData.species_en = 'Broadnosed pipefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 26];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'FranMacc2003';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMacc2003';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';  
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'FranMacc2003';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.74;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00026*Lp^3.20, see F1';
data.Wwi = 7.7;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00026*Li^3.20, see F1';

data.Ri  = 250/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'FranMacc2003';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on # eggs per female';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (d), std length (cm), wet weight (g)
    0  4.475 0.047
   10  6.745 0.097
   20  7.573 0.123
   30  8.557 0.180
   40  9.426 0.233
   50 10.038 0.331
   60 12.002 0.475];
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'std length', 'wet weight'};  
temp.tLW    = C2K(23.3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'CorrPalm2016'; treat.tLW = {1 {'length','weight'}}; 
init.tLW = 4.475; units.init.tLW = 'cm'; label.init.tLW = 'initial std length';
comment.tLW = 'food: dried P. varians';
%
data.tLW1 = [ ... % time (d), std length (cm), wet weight (g)
    0 12.595 0.499
   10 14.819 1.153
   20 16.068 1.775
   30 16.949 2.373
   40 18.191 3.059];
units.tLW1   = {'d', 'cm', 'g'};  label.tLW1 = {'time', 'std length', 'wet weight'};  
temp.tLW1    = C2K(23.3);  units.temp.tLW1 = 'K'; label.temp.tLW1 = 'temperature';
bibkey.tLW1 = 'CorrPalm2016'; treat.tLW1 = {1 {'length','weight'}}; 
init.tLW1 = 12.595; units.init.tLW1 = 'cm'; label.init.tLW1 = 'initial std length';
comment.tLW1 = 'food: P. varians';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.tLW1 = 10 * weights.tLW1;
%weights.Wwi = 0 * weights.Wwi;
%weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.init = init;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00026*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic: Vardo, Norway, Baltic Sea and the British Isles to Morocco. Also throughout the Mediterranean, Black Sea and Sea of Azov. Record ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7B8JC'; % Cat of Life
metaData.links.id_ITIS = '166467'; % ITIS
metaData.links.id_EoL = '46567514'; % Ency of Life
metaData.links.id_Wiki = 'Syngnathus_typhle'; % Wikipedia
metaData.links.id_ADW = 'Syngnathus_typhle'; % ADW
metaData.links.id_Taxo = '188607'; % Taxonomicon
metaData.links.id_WoRMS = '127393'; % WoRMS
metaData.links.id_fishbase = 'Syngnathus_typhle-abaster'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Syngnathus_typhle}}';
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
bibkey = 'CorrPalm2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.12635}, ' ...
'author = {Miguel Correia and Jorge Palma and Jos\''{e} Pedro Andrade}, ' ... 
'year = {2016}, ' ...
'title = {Growth performance of the early life stages of broad-nosed pipefish, \emph{Syngnathus typhle} ({L}.) fed different live or frozen diets}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {47}, ' ...
'pages = {1652–1660}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Syngnathus_typhle}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

