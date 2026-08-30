  function [data, auxData, metaData, txtData, weights] = mydata_Spinibarbus_sinensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Spinibarbus_sinensis'; 
metaData.species_en = 'Quingbo'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 01];

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 61;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 1.25 mm of Barbus barbus: 4/3*pi*0.062^3';
data.Wwp = 410;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'fishbase','fishbase'};
  comment.Wwp = 'based on 0.00912*Lp^3.15, see F1';
data.Wwi = 3.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Weim2007';
  comment.Wwi = 'based on 0.00912*Li^3.15, see F1; max. published weight: 2.9 kg';
    
data.Ri  = 1e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Barbus barbus';

data.sgr = 0.0083; units.sgr = '1/d'; label.sgr = 'specific growth rate at  Ww = 9.76 g, TL = 7.92 cm'; bibkey.sgr = 'ZengWang2017';
  temp.sgr = C2K(25); units.temp.sgr = 'K'; label.temp.sgr = 'temperature';

% univariate data

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g =  0.00912*(TL in mm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'China';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4Z5D3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '985743'; % Ency of Life
metaData.links.id_Wiki = 'Spinibarbus_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Spinibarbus_sinensis'; % ADW
metaData.links.id_Taxo = '1803033'; % Taxonomicon
metaData.links.id_WoRMS = '1020560'; % WoRMS
metaData.links.id_fishbase = 'Spinibarbus_sinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Spinibarbus_sinensis}}';  
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
bibkey = 'ZengWang2017'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.cbpa.2017.07.005}, ' ...
'author = {Zeng, L.-Q. and Wang, L. and Wang, G.-N. and Zeng, Y. and Fu, S.-J.}, ' ... 
'year = {2017}, ' ...
'title = {The relationship between growth performance and metabolic rate flexibility varies with food availability in juvenile qingbo (\emph{Spinibarbus sinensis})}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Molecular \& Integrative Physiology}, ' ...
'volume = {212}, ' ...
'pages = {56–63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Spinibarbus_sinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

