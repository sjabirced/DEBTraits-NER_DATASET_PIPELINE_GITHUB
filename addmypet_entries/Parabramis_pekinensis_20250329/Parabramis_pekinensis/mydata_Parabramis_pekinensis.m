function [data, auxData, metaData, txtData, weights] = mydata_Parabramis_pekinensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Parabramis_pekinensis'; 
metaData.species_en = 'White amur bream'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data

data.am = 17*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 35;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 55;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 556;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.01047*Lp^3.06,, see F1';
data.Wwi = 2215;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.06, see F1; max. published weight: 4.1 kg ';

data.Ri = 8.8e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Xenocypris_macrolepis: 6377*2215/160';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
  1  6.70  7.80
  2 11.80 13.00
  3 16.50 17.70
  4 20.70 21.60
  5 24.20 24.90
  6 27.20 27.30
  7 29.60 29.20
  8 31.70 30.70
  9 33.60 32.00
 10 35.20 33.10
 11 36.60 34.30
 12 38.20 35.00
 13 39.60 36.10
 14 40.80 NaN
 15 41.20 NaN
 16 43.90 NaN];
data.tL_fm(:,1) = 365*(0.3 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'LiLiu2024'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (yr), weight (g)
  1    4.90   8.40
  2   28.30  37.90
  3   80.70  94.50
  4  161.50 170.60 
  5  261.50 259.20
  6  375.30 341.10
  7  483.20 414.80
  8  601.50 484.00
  9  717.20 548.00
 10  825.20 602.30
 11  940.00 674.70
 12 1074.10 714.90
 13 1198.90 781.40
 14 1311.20 NaN
 15 1344.30 NaN
 16 1639.70 NaN];
data.tW_fm(:,1) = 365*(0.3 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(28.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'LiLiu2024'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: W in g = 0.01047*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4CN2L'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '205254'; % Ency of Life
metaData.links.id_Wiki = 'Parabramis_pekinensis'; % Wikipedia
metaData.links.id_ADW = 'Parabramis_pekinensis'; % ADW
metaData.links.id_Taxo = '182634'; % Taxonomicon
metaData.links.id_WoRMS = '1013562'; % WoRMS
metaData.links.id_fishbase = 'Parabramis-pekinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parabramis_pekinensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Parabramis-pekinensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Seme2018'; type = 'article'; bib = [ ... 
'author = {Semenchenko, N.N.}, ' ...
'year = {2018}, ' ...
'title  = {Group growth, natural mortality, age of maturation, and commercial size of white amur bream \emph{Parabramis pekinensis} ({B}asilewsky, 1855) in the {A}mur {R}iver}, ' ...
'journal = {Izv. TINRO}, ' ...
'pages = {192}, ' ...
'volume = {89-102}'];
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

