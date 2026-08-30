function [data, auxData, metaData, txtData, weights] = mydata_Seriolella_caerulea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Centrolophidae';
metaData.species    = 'Seriolella_caerulea'; 
metaData.species_en = 'White warehou'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MPSE','MASW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
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

data.ab = 20;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(9.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 21*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Horn2001';   
  temp.am = C2K(9.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 65;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm of Hyperoglyphe antarctica: pi/6*0.075^3';
data.Wwi = 3.64e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1; max. published weight: 6.0 kg';

data.Ri  = 2.23e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Seriolella_brama: 3.6e5*3.64e3/5.86e3';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0 21.9 22.3
    1 31.9 32.4
    2 38.3 38.6
    3 43.0 42.5
    4 45.5 45.0
    5 47.6 47.3
    6 48.3 48.6
    7 51.3 50.2
    8 52.1 51.0
    9 54.1 51.6
   10 55.5 51.9
   11 55.8 54.6
   12 57.7 55.2
   13 60.5 55.8
   14 59.3 56.3 
   15 61.3 57.3
   16 62.0 64.8
   17 60.8 NaN
   18 60.0 54.9
   19 67.0 NaN
   20 62.3 NaN
   21 68.0 NaN];
data.tL_fm(:,1) = 365 * (2.9 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(9.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Horn2001'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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
D2 = 'I had to add 2 yrs to age-estimates in tL data to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Southwest Pacific: southern Australia and New Zealand. Southeast Pacific: Chile, including the Juan Fernandez Islands. Southwest Atlantic: Argentina.';
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
