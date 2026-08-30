function [data, auxData, metaData, txtData, weights] = mydata_Perca_schrenkii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Perca_schrenkii'; 
metaData.species_en = 'Balkhash perch'; 

metaData.ecoCode.climate = {'Cfa', 'Dfc', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 8;       units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'fishbase';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Perca fluviatilis';
data.am = 22 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Perca fluviatilis';
data.Li  = 50;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g';    label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.75 mm of Perca fluviatilis: pi/6*0.175^3';
data.Wwp = 26; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01047*Lp^3.05, see F1';
data.Wwi = 1.6e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.05, see F1';
 
data.Ri  = 6e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Perca fluvialitis';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since hatch (yr), length (cm)
    1 10.0 10.0
    2 12.9 13.0
    3 14.9 13.7 
    4 16.3 17.1 
    5 19.0 16.8
    6 20.2 17.7
    7 22.6 18.5
    8 25.3 20.0
    9 27.0 NaN
   11 30.0 NaN];
data.tL_fm(:,1) = 365 * (2.4+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since hatch', 'total length'};  
temp.tL_fm    = C2K(8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Mami2016'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data from Lake Alakol';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
%weights.ab = 0 * weights.ab;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I ahs to add 2 yrs to age-estimates to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01047*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Balkhash and Alakol.';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '773PT'; % Cat of Life
metaData.links.id_ITIS = '650183'; % ITIS
metaData.links.id_EoL = '211369'; % Ency of Life
metaData.links.id_Wiki = 'Perca_schrenkii'; % Wikipedia
metaData.links.id_ADW = 'Perca_schrenkii'; % ADW
metaData.links.id_Taxo = '183452'; % Taxonomicon
metaData.links.id_WoRMS = '1020373'; % WoRMS
metaData.links.id_fishbase = 'Perca-schrenkii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perca_schrenkii}}';
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
bibkey = 'Mami2016'; type = 'book'; bib = [ ... 
'doi = {10.1201/b18806-4}, ' ...
'author = {Nadir Mamilov}, ' ... 
'year = {2016}, ' ...
'title = {Biology of Balkhash Perch (Perca schrenkii Kessler, 1874)}, ' ...
'publisher = {Taylor & Francis Group}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Perca-schrenkii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

