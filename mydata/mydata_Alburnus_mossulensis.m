  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_mossulensis
  
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_mossulensis'; 
metaData.species_en = 'Mossul bleak'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCii', 'biSii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 01];

%% set data
% zero-variate data
data.ab = 11;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'fishbase';
  comment.Lp = 'based in Alburnus alburnus: 9.9*40/25';
data.Li = 24.2;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 1.0;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.12,  see F1';
data.Wwi = 139.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.12, see F1; max. published weight: 97.60 g';

data.GSI = 0.13;  units.GSI = 'g/g';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = 'AlkaGokc2009'; 
  temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0 13.80 13.54
    1 14.70 14.20
    2 14.94 14.77
    3 15.36 15.07
    4 16.00 15.52];
data.tL_fm(:,1) = 365 * (2.9+data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(24);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AlkaGokc2009'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    0 25.17 23.79
    1 26.89 25.66
    2 29.53 29.12
    3 31.90 31.32
    4 35.20 40.79];
data.tW_fm(:,1) = 365 * (2.9+data.tW_fm(:,1));
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(24);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'AlkaGokc2009'; treat.tW_fm = {1 {'females','males'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 15 * weights.tL_fm;
weights.tW_fm = 15 * weights.tW_fm;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 3 * weights.Lp;

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
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females,males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 2 yrs to age estimates for tL and tW data at arrives at reasonalble fits';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00646*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Tigris-Euphrates basin from the very upper reaches to the delta, Kor, Mand and Kul rivers in Iran';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGYJ'; % Cat of Life
metaData.links.id_ITIS = '641811'; % ITIS
metaData.links.id_EoL = '46581707'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_mossulensis'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_mossulensis'; % ADW
metaData.links.id_Taxo = '240479'; % Taxonomicon
metaData.links.id_WoRMS = '307776'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-mossulensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_mossulensis}}';  
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
bibkey = 'AlkaGokc2009'; type = 'article'; bib = [ ... 
'doi = {10.3906/zoo-1211-13}, ' ...
'author = {Aysel Alkan U]c{c}kun and Didem G\"{o}k\c_{c}e}, ' ...
'year = {2009}, ' ...
'title = {Assessing age, growth, and reproduction of \emph{Alburnus mossulensis} and \emph{Acanthobrama marmid} ({C}yprinidae) populations in {K}arakaya {D}am {L}ake ({T}urkey)}, ' ... 
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {26(4)}, ' ...
'pages = {261–266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-mossulensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

