  function [data, auxData, metaData, txtData, weights] = mydata_Alburnus_vistonicus
  
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnus_vistonicus'; 
metaData.species_en = 'Lake Vistonis bleak'; 

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
metaData.data_1     = {'t-L'}; 

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
data.ab = 12.5;        units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.3;    units.Lp = 'cm'; label.Lp = 'total length at puberty';       bibkey.Lp = 'BoboTsak2018';
  comment.Lp = 'based in Alburnus alburnus: 9.9*40/25';
data.Li = 21.7;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 12.76;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BoboTsak2018','fishbase'};
  comment.Wwp = 'based on 0.00661*Lp^3.12,  see F1';
data.Wwi = 97.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.12, see F1; max. published weight: 97.60 g';

data.GSI = 0.13;  units.GSI = 'g/g';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = 'BoboTsak2018'; 
  temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
1 10.5 11.0
2 13.6 13.7
3 16.6 16.6
4 20.4 20.1
5 22.3 22.3
6 24.8 23.2
7 26.2 NaN
8 27.5 28.8];
data.tL_fm(:,1) = 365 * (0.3+data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(24);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BoboTsak2018'; treat.tL_fm = {1 {'females','males'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 15 * weights.tL_fm;
weights.ab = 0 * weights.ab;
%weights.Wwp = 0 * weights.Wwp;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00661*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = ' Lake Vistonis drainage in Greece';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGZS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4625894'; % Ency of Life
metaData.links.id_Wiki = 'Alburnus_vistonicus'; % Wikipedia
metaData.links.id_ADW = 'Alburnus_vistonicus'; % ADW
metaData.links.id_Taxo = '1682616'; % Taxonomicon
metaData.links.id_WoRMS = '1008625'; % WoRMS
metaData.links.id_fishbase = 'Alburnus-vistonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnus_vistonicus}}';  
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
bibkey = 'BoboTsak2018'; type = 'article'; bib = [ ... 
'doi = {10.3906/zoo-1211-13}, ' ...
'author = {Dimitra C. Bobori and Emmanouil Tsakoumis and Foivos-Alexandros Mouchlianitis and Efthimia Antonopoulou and Konstantinos Ganias}, ' ...
'year = {2018}, ' ...
'title = {Growth and Reproductive Ecology of the Endemic Freshwater Fish \emph{Alburnus vistonicus} {F}reyhof \& {K}ottelat, 2007 ({A}ctinopterygii: {C}yprinidae) in {L}ake {V}istonis {S}ystem, {N}orthern {G}reece}, ' ... 
'journal = {Acta zool. bulg.}, ' ...
'volume = {70(4)}, ' ...
'pages = {569-574}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnus-vistonicus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

