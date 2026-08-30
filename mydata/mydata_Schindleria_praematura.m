function [data, auxData, metaData, txtData, weights] = mydata_Schindleria_praematura
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Schindleriidae';
metaData.species    = 'Schindleria_praematura'; 
metaData.species_en = 'Schindler''s fish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data

data.ab = 5;   units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 180;   units.am = 'd';   label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'LandVeas2002 gives 90 d';
  
data.Lp  = 1.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 2.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.0069;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 0.0678;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ni  = 110;    units.Ni  = '#'; label.Ni  = 'total number of eggs';     bibkey.Ni  = 'fishbase';   
  temp.Ni = C2K(27.6); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time (d), std length (cm)
    26 1.500
    29 1.575
    31 1.340
    42 1.875];
data.tL(:,1) = data.tL(:,1) + 0; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time', 'std length', 'females'};  
temp.tL   = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LandVeas2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific from South Africa, Madagascar and India to southern Japan, South China Sea, Australia, Fiji, Marshall Islands, Line Islands, Hawaii, and seamounts of eastern South Pacific'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6XW3M'; % Cat of Life
metaData.links.id_ITIS = '637994'; % ITIS
metaData.links.id_EoL = '46576793'; % Ency of Life
metaData.links.id_Wiki = 'Schindleria_praematura'; % Wikipedia
metaData.links.id_ADW = 'Schindleria_praematura'; % ADW
metaData.links.id_Taxo = '195604'; % Taxonomicon
metaData.links.id_WoRMS = '282679'; % WoRMS
metaData.links.id_fishbase = 'Schindleria_praematura'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Schindleria_praematura}}';
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
bibkey = 'LandVeas2002'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2002.tb01753.x}, ' ...
'author = {Landaeta, M. F. and Veas, R. and Castro, L. R.}, ' ... 
'year = {2002}, ' ...
'title = {First record of the paedomorphic goby \emph{Schindleria praematura}, {E}aster {I}sland, {S}outh {P}acific}, ' ...
'journal = {Journal of Fish Biology}, ', ...
'volume = {61(1)}, ' ...
'pages = {289–292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schindleria_praematura}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

