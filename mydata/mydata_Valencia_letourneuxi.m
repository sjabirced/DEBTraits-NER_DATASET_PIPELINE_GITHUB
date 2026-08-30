  function [data, auxData, metaData, txtData, weights] = mydata_Valencia_letourneuxi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Valenciidae';
metaData.species    = 'Valencia_letourneuxi'; 
metaData.species_en = 'Corfu toothcarp'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 30];

%% set data
% zero-variate data
data.ab = 29.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 0.8*365;        units.tp = 'd';  label.tp = 'time since birth at puberty';        bibkey.tp = 'BerbDaou2000';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'fishbase';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.14;     units.Lp = 'cm';     label.Lp = 'total length at puberty';  bibkey.Lp = 'BerbDaou2000';
  comment.Lp = 'converted from SL using F2';
data.Lpm = 2.01;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty';  bibkey.Lpm = 'BerbDaou2000';
  comment.Lpm = 'converted from SL using F2';
data.Li = 4.16;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'BerbDaou2000';
  comment.Li = 'converted from SL using F2';
data.Lim = 4.42;     units.Lim = 'cm';     label.Lim = 'ultimate total length';  bibkey.Lim = 'BerbDaou2000';
  comment.Lim = 'converted from SL using F2';

data.Wwb = 0.0056;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'BerbDaou2000';   
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwp = 0.16; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'BerbDaou2000';  
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwpm = 0.13; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'BerbDaou2000';  
  comment.Wwpm = 'based on Wwim*(Lpm/Lim)^3';
data.Wwi = 1.18; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'BerbDaou2000';
data.Wwim = 1.4; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';   bibkey.Wwim = 'BerbDaou2000';

data.GSI  = 0.1; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'BerbDaou2000';   
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
D1 = 'temperature in tL data variet from 11.3 C (Dec) to 28.5 C (Aug)';
D2 = 'males are supposed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'weight length relationship: Ww in g = 0.00490*(TL in cm)^3.14';  
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length relationship: TL in cm = 0.078 + 1.20 * SL';  
  metaData.bibkey.F2 = 'BerbDaou2000';
F3 = 'Albania and western Greece, from Lake Butrint to Alfios drainages, and Corfu and Lefkas islands where it has been extirpated';
  metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '7F9RD'; % Cat of Life
metaData.links.id_ITIS = '646927'; % ITIS
metaData.links.id_EoL = '205747'; % Ency of Life
metaData.links.id_Wiki = 'Valencia_letourneuxi'; % Wikipedia
metaData.links.id_ADW = 'Valencia_letourneuxi'; % ADW
metaData.links.id_Taxo = '189851'; % Taxonomicon
metaData.links.id_WoRMS = '1020039'; % WoRMS
metaData.links.id_fishbase = 'Valencia_letourneuxi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Valencia_letourneuxi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Valencia_letourneuxi}}';
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
bibkey = 'BerbDaou2000'; type = 'Article'; bib = [ ...
'author = {R. Barbieri and Ch. Daoulas and Th. Psarras and M. Th. Stoumboudi and A. Economou}, ' ...
'year = {2000}, ' ...
'title = {The biology and ecology of \emph{Valencia letourneuxi} {S}auvage 1880 ({V}alenciidae) - {P}rospects for conservation}, ' ...
'journal = {Mediterranean Marine Science}, ' ...
'volume = {1/2}, '...
'pages = {75-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

