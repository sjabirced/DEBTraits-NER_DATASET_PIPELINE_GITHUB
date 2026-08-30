  function [data, auxData, metaData, txtData, weights] = mydata_Clinostomus_elongatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Clinostomus_elongatus'; 
metaData.species_en = 'Redside dace'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 03];

%% set data
% zero-variate data
data.ab = 14;      units.ab = 'd';  label.ab = 'age at birth';    bibkey.ab = 'guess';
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 12;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1.5 mm of C.nasus: pi/6*0.15^3';
data.Wwp = 1.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00501*Lp^3.11, see F1';
data.Wwi = 11.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.11, see F1';

data.Ri  = 1526/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm= [ ... % time since birth (yr), fork length (cm)
    1 4.6 4.5 4.3 4.4
    2 6.3 6.6 6.6 6.4
    3 7.9 7.7 8.0 7.1
    4 8.6 8.6 8.9 7.5];
data.tL_fm(:,1) = 365 * (0.5+data.tL_fm(:,1)); % covert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DietDela2018'; treat.tL_fm = {1 {'females Linesvill Creek','males Linesvill Creek','females Danby Creek','males Danby Creek'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_fm = 15 * weights.tL_fm;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00501*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '163373'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Clinostomus_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Clinostomus_elongatus'; % ADW
metaData.links.id_Taxo = '171445'; % Taxonomicon
metaData.links.id_WoRMS = '1020946'; % WoRMS
metaData.links.id_fishbase = 'Clinostomus-elongatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Clinostomus_elongatus}}';  
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
bibkey = 'DietDela2018'; type = 'article'; bib = [ ...  
'author = {Douglas J. Dieterman and Steve Delain and Chris Dawald and Andrew Herberg}, ' ...
'year = {2018}, ' ...
'title = {Life History Traits and Status of a Peripheral Redside Dace (\emph{Clinostomus elongatus})}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'pages = {273-289}, ' ...
'volume = {180(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Clinostomus-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
