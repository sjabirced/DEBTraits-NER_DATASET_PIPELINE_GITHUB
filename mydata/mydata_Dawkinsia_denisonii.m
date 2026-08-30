function [data, auxData, metaData, txtData, weights] = mydata_Dawkinsia_denisonii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Dawkinsia_denisonii'; 
metaData.species_en = 'Denison barb'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 14];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'SajaMerc2015';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'MercMali2013'; 
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MercMali2013';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 4.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'MercMali2013','fishbase'};
  comment.Wwp = 'based on 0.01047*Lp^3.02, see F1';
data.Wwi = 37.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.02, see F1';

data.Ri = 967/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'MercMali2013';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
244.446	6.556
275.314	7.391
305.349	7.643
336.217	8.437
640.731	11.871
672.434	12.289
945.246	13.846];
data.tL(:,1) = 90+data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SajaMerc2015'; 
    

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'length-weight: W in g = 0.01047*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to India';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4TZFG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '65254430'; % Ency of Life
metaData.links.id_Wiki = 'Dawkinsia_denisonii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5650753'; % Taxonomicon
metaData.links.id_WoRMS = '1605391'; % WoRMS
metaData.links.id_fishbase = 'Dawkinsia-denisonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Dawkinsia_denisonii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Dawkinsia-denisonii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SajaMerc2015'; type = 'article'; bib = [ ...
'author = {S. Sajan and T.V. Anna Mercy and V. Malika}, ' ...
'year = {2015}, ' ...
'title  = {Age, Growth and Population Dynamics of an Endangered Fish \emph{Sahyadria denisonii} (Day 1865) from the {W}estern {G}hats {H}otspot of {I}ndia}, ' ...
'journal = {Asian Fisheries Science}, ' ...
'volume = {28}, ' ...
'pages = {130-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MercMali2013'; type = 'article'; bib = [ ...
'author = {T.V. Anna Mercy and  V. Malika and S. Sajan}, ' ...
'year = {2013}, ' ...
'title  = {Reproductive biology of \emph{Puntius denisonii} ({D}ay 1865) – an endemic ornamental cyprinid of the {W}estern {G}hats of {I}ndia}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {60(2)}, ' ...
'pages = {73-78}'];
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

