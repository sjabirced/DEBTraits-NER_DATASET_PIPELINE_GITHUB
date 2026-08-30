function [data, auxData, metaData, txtData, weights] = mydata_Seriolella_brama
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Centrolophidae';
metaData.species    = 'Seriolella_brama'; 
metaData.species_en = 'Common warehou'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 25];

%% set data
% zero-variate data

data.ab = 14;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(14.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 22*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Horn2001';   
  temp.am = C2K(14.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 37.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 76;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm of Hyperoglyphe antarctica: pi/6*0.075^3';
data.Wwi = 5.86e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1; max. published weight: 4.0 kg';

data.Ri  = 360000/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(14.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    2 31.8 30.8
    3 37.5 35.9
    4 42.7 43.1
    5 47.3 48.2
    6 49.7 51.0
    7 54.9 54.5
    8 56.6 56.3
    9 57.8 57.3
   10 59.4 58.3
   11 60.7 59.3
   12 62.2 61.0
   13 63.9 61.4
   14 63.8 61.8
   15 64.0 62.9
   16 64.4 62.9
   17 64.1 64.2
   18 64.2 63.7
   19 65.0 64.8
   20 NaN  65.4
   21 63.4 61.8
   22 NaN  61.9];
data.tL_fm(:,1) = 365 * (0.7 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(14.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Horn2001'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;
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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assume to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Southwest Pacific: confined to Australian and New Zealand seas.';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Females spawn three batches of eggs in a season';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '4WVB6'; % Cat of Life
metaData.links.id_ITIS = '172534'; % ITIS
metaData.links.id_EoL = '46577446'; % Ency of Life
metaData.links.id_Wiki = 'Seriolella_brama'; % Wikipedia
metaData.links.id_ADW = 'Seriolella_brama'; % ADW
metaData.links.id_Taxo = '187413'; % Taxonomicon
metaData.links.id_WoRMS = '282755'; % WoRMS
metaData.links.id_fishbase = 'Seriolella_brama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriolella_brama}}';
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
bibkey = 'Horn2001'; type = 'article'; bib = [ ... 
'doi = {10.1071/MF00049}, ' ...
'author = {Horn, P.H.}, ' ... 
'year = {2001}, ' ...
'title = {Validated ageing methods for blue warehou (\emph{Seriolella brama) and white warehou (\emph{S. caerulea}) in New Zealand waters}, ' ...
'institution = {Mar. Freshwater Res.}, ' ...
'volume = {52}, ' ...
'pages = {297–309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Seriolella_brama}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
