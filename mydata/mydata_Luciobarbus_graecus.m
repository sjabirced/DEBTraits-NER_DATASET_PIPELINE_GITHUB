  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_graecus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_graecus'; 
metaData.species_en = 'Greek barbel'; 

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 72.5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.13, see F1';
data.Wwi = 1939; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.13, see F1';
    
data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'BasiSari2012';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Luciobarbus_xanthopterus';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    1 NaN   16.02
    2 20.80 20.51
    3 24.30 23.61
    4 26.10 26.32
    5 28.39 28.87
    6 30.10 30.61];
data.tL_fm(:,1) = 365 * (1.9 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BasiSari2012'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data from Adiguzel Dam Lake';

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1 NaN     59.84
    2 140.97 136.76
    3 214.96 208.17
    4 286.93 279.88
    5 391.27 398.93
    6 419.35 458.14];
data.tW_fm(:,1) = 365 * (1.9 + data.tW_fm(:,1));
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'BasiSari2012'; treat.tW_fm = {1 {'females','males'}};
comment.tL_fm = 'data from Adiguzel Dam Lake';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.Wwp = weights.Wwp * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00933*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Greece and Turkey';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WCKG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '356660'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_graecus'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_graecus'; % ADW
metaData.links.id_Taxo = '1682765'; % Taxonomicon
metaData.links.id_WoRMS = '1019349'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus-graecus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_graecus}}';  
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
bibkey = 'BasiSari2012'; type = 'Article'; bib = [ ...
'doi = {10.3153/jfscom.2012005}, ' ...
'author = {Seda Ba\c{s}{\i}a\c{c}{\i}k and Hasan M. Sar{\i} and Ali Ilhan and M. Ru\c{s}en Ustao\v{g}lu}, ' ...
'year = {2012}, ' ...
'title = {Some Growth Features of Barbel Fish Population (\emph{Luciobarbus kottelati} {T}uran, {E}kmek\c{c}i, {I}lhan \& {E}ngin, 2008) in {A}d{\i}g\"{u}zel {D}am {L}ake ({D}enizli)}, ' ...
'journal = {Journal of FisheriesSciences.com}, ' ...
'volume = {6(1)}, '...
'pages = {32-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Luciobarbus-graecus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

