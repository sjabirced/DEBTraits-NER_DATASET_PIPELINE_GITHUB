  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_namaki

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_namaki'; 
metaData.species_en = 'Namak Lake chub'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 01];

%% set data
% zero-variate data
data.ab = 6;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;  units.Lp = 'cm'; label.Lp = 'total length at puberty';        bibkey.Lp = 'guess'; 
data.Li = 10.1; units.Li = 'cm'; label.Li = 'ultimate total length';        bibkey.Li = 'TabaHash2014';

data.Wwb = 1.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TahaEsma2018';
  comment.Wwb = 'Based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 0.57;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.15,  see F1';
data.Wwi = 10.55; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'TahaEsma2018';
  comment.Wwi = 'based on 0.00724*Li^3.15, see F1';

data.Ri = 2368/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size'; bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Alburnoides_qanati';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    0 2.271  3.097 3.021
    1 4.631  5.414 5.281
    2 6.432  7.147 6.972
    3 7.807  8.445 8.238
    4 8.857  9.416 9.185
    5 9.658 10.142 9.894];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'females'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TabaHash2014'; treat.tL = {1 {'Ghara-Chai','Jajrud','Cheshmeh-Ali Spring'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00724*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic from Kor River basin, Iran';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGVD'; % Cat of Life
metaData.links.id_ITIS = '1199755'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_namaki'; % Wikipedia
metaData.links.id_ADW = 'Alburnoides_namaki'; % ADW
metaData.links.id_Taxo = '2702170'; % Taxonomicon
metaData.links.id_WoRMS = '1008212'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-namaki'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnoides_namaki}}';  
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
bibkey = 'TabaHash2014'; type = 'Article'; bib = [ ...  
'author = {Seyedeh Narjes Tabatabaei and Iraj Hashemzadeh-Segherloo and Asghar Abdoli and Maryam Milani and Rouhollah Mirzaei}, ' ...
'year = {2014}, ' ...
'title = {Age and growth of spirlins, \emph{Alburnoides eichwaldii} and \emph{A. namaki}, from the {C}aspian, {K}avir and {N}amak basins of {I}ran}, ' ... 
'journal = {Iran. J. Ichthyol.}, ' ...
'volume = {1(4)}, '...
'pages = {266–273}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnoides-namaki.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

