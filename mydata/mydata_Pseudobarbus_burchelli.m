  function [data, auxData, metaData, txtData, weights] = mydata_Pseudobarbus_burchelli

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Pseudobarbus_burchelli'; 
metaData.species_en = 'Burchell''s redfin'; 

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 17];

%% set data
% zero-variate data
data.am = 6*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 13.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'CambStua1985';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 2.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^3.01, see F1';
data.Wwi = 29.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.01, see F1';
    
data.Ri = 2300/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'CambStua1985';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
1	 4.628  4.627
2	 7.513  7.032
3	 8.748  8.507
4	10.193 10.972
5	11.638 NaN
6	11.523 NaN];
data.tL_fm(:,1) = 365 * (0.2 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CambStua1985'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;

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

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.01175*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'middle and upper reaches of Yangtze River, China.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4NPJ8'; % Cat of Life
metaData.links.id_ITIS = '639632'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pseudobarbus_burchelli'; % Wikipedia
metaData.links.id_ADW = 'Pseudobarbus_burchelli'; % ADW
metaData.links.id_Taxo = '185049'; % Taxonomicon
metaData.links.id_WoRMS = '1026303'; % WoRMS
metaData.links.id_fishbase = 'Pseudobarbus-burchelli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudobarbus_burchelli}}';  
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
bibkey = 'CambStua1985'; type = 'Article'; bib = [ ...
'doi = {10.1080/02541858.1985.11447929}, ' ...
'author = {J.A. Cambray  and C.T. Stuart}, ' ...
'year = {1985}, ' ...
'title = {Aspects of the biology of a rare redfin minnow, \emph{Barbus burchelli} ({P}isces, {C}yprinidae), from {S}outh {A}frica}, ' ...
'journal = {South African Journal of Zoology}, ' ...
'volume = {20(3)}, '...
'pages = {155-165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pseudobarbus-burchelli}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

