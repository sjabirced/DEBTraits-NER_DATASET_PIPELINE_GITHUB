function [data, auxData, metaData, txtData, weights] = mydata_Pseudophoxinus_callensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pseudophoxinus_callensis'; 
metaData.species_en = 'Algerian minnow'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 07];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 10.7;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 1.17;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00794*Lp^3.10, see F1';
data.Wwi = 12.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.10, see F1';

data.Ri = 430/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(10.7/46.7)^3';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm), weight (g)
    1 1.912 3.400
    2 2.515 4.054
    3 3.461 4.984
    4 NaN   5.759
    5 NaN   6.560];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SamaBoum2022'; treat.tL = {1 {'Blue Lake','Bouhchicha wadi'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00794*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Algeria and Tunisia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '78GYM'; % Cat of Life
metaData.links.id_ITIS = '689741'; % ITIS
metaData.links.id_EoL = '217081'; % Ency of Life
metaData.links.id_Wiki = 'Pseudophoxinus_callensis'; % Wikipedia
metaData.links.id_ADW = 'Pseudophoxinus_callensis'; % ADW
metaData.links.id_Taxo = '185258'; % Taxonomicon
metaData.links.id_WoRMS = '1016888'; % WoRMS
metaData.links.id_fishbase = 'Pseudophoxinus-callensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudophoxinus_callensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pseudophoxinus-callensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SamaBoum2022'; type = 'article'; bib = [ ...
'doi = {10.53550/EEC.2022.v28i04s.001}, ' ...
'author = {Mohamed Faouzi Samar and Mahieddine Boumendjel and Mohamed Lamine Khireddine and Abdallah Metai and Abderrafik Meddour}, ' ...
'year = {2022}, ' ...
'title  = {Population dynamics of \emph{Pseudophoxinus callensis} ({G}uichenot, 1850) ({C}yprinidae) in the National Park of {E}l {K}ala ({N}ortheast {A}lgeria)}, ' ...
'journal = {Eco. Env. \& Cons.}, ' ...
'volume = {28}, ' ...
'pages = {S1-S9}'];
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

