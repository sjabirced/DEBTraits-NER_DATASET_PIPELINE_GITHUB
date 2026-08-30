function [data, auxData, metaData, txtData, weights] = mydata_Mylopharyngodon_piceus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Mylopharyngodon_piceus'; 
metaData.species_en = 'Black carp'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 01];

%% set data
% zero-variate data

data.ab = 5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 91.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fisbase'; 
data.Li = 180;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 10490;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.09, see F1';
data.Wwi = 84876;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.09, see F1; max. published weight: 4.0 kg';

data.Ri = 3e6/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.sgr = 0.03; units.sgr = '1/d'; label.sgr = 'specific growth rate at  Ww = 1.54 g'; bibkey.sgr = 'WuYe2016';
  temp.sgr = C2K(30); units.temp.sgr = 'K'; label.temp.sgr = 'temperature'; comment.sgr = 'measured over 9 weeks';

%% univariate data

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00912*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '743PJ'; % Cat of Life
metaData.links.id_ITIS = '639618'; % ITIS
metaData.links.id_EoL = '204589'; % Ency of Life
metaData.links.id_Wiki = 'Mylopharyngodon_piceus'; % Wikipedia
metaData.links.id_ADW = 'Mylopharyngodon_piceus'; % ADW
metaData.links.id_Taxo = '43652'; % Taxonomicon
metaData.links.id_WoRMS = '594789'; % WoRMS
metaData.links.id_fishbase = 'Mylopharyngodon_piceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mylopharyngodon_piceus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Mylopharyngodon_piceus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'WuYe2016'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.fsi.2015.12.030}, ' ...
'author = {Chenglong Wu and Jinyun Ye and Jun''e Gao and Lian Chen and Zhibin Lu }, ' ...
'year = {2016}, ' ...
'title  = {The effects of dietary carbohydrate on the growth, antioxidant capacities, innate immune responses and pathogen resistance of juvenile Black carp \emph{Mylopharyngodon piceus}}, ' ...
'journal = {Fish \& Shellfish Immunology}, ' ...
'pages = {132-142}, ' ...
'volume = {49}'];
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

