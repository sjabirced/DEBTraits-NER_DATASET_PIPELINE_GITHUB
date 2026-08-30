  function [data, auxData, metaData, txtData, weights] = mydata_Tor_khudree
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Tor_khudree'; 
metaData.species_en = 'Deccan mahseer'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 28];

%% set data
% zero-variate data
data.ab = 11;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 41;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 83;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'fishbase also gives TL 275 cm';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 2-2.5 mm of Tor tor: pi/6*0.225^3';
data.Wwp = 647;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00871*Lp^3.02, see F1';
data.Wwi = 5440;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.02, see F1; max. published weight: 2.8 kg';

data.Ri  = 17500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
 0	1.278 0.039
30	3.027 0.354
60	4.688 1.081
90	6.111 2.953];
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time', 'total length', 'weight'};  
temp.tLW = C2K(23);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'BarlRagh2023'; treat.tLW = {1 {'females','males'}};
comment.tLW = 'data from Paisuni river';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'India';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7CHBZ'; % Cat of Life
metaData.links.id_ITIS = '690193'; % ITIS
metaData.links.id_EoL = '1000856'; % Ency of Life
metaData.links.id_Wiki = 'Tor_khudree'; % Wikipedia
metaData.links.id_ADW = 'Tor_khudree'; % ADW
metaData.links.id_Taxo = '189126'; % Taxonomicon
metaData.links.id_WoRMS = '1026321'; % WoRMS
metaData.links.id_fishbase = 'Tor_khudree'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tor_khudree}}';  
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
bibkey = 'BarlRagh2023'; type = 'article'; bib = [ ...  
'doi = {10.21077/ijf.2023.70.1.127811-20}, ' ...
'author = {Gangadhar Barlaya and C. H. Raghavendra and K. Anantharaja and B. S. Ananda Kumar and K. Hemaprasanth}, ' ...
'year = {2023}, ' ...
'title = {Effect of stocking density on the survival and growth of tank-reared Deccan mahseer \emph{Tor khudree} ({S}ykes, 1849)}, ' ... 
'journal = {Indian J. Fish.}, ' ...
'volume = {70(1)}, ' ...
'pages = {142-146}, ' ...
'howpublished = {url{https://aquadocs.org/handle/1834/33381}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tor_khudree}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

