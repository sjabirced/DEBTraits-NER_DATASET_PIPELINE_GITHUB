function [data, auxData, metaData, txtData, weights] = mydata_Seriolella_punctata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Centrolophidae';
metaData.species    = 'Seriolella_punctata'; 
metaData.species_en = 'Silver warehou'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 01];

%% set data
% zero-variate data

data.ab = 15.5;   units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 23*365;   units.am = 'd';   label.am = 'life span';              bibkey.am = 'HornSutt1995';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 66;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.75 mm of Hyperoglyphe antarctica: pi/6*0.075^3';
data.Wwi = 4733;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.13, see F`1';

data.Ri  = 5.7e5/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
 0 20.3 20.2
 1 30.7 30.5 
 2 38.1 38.8
 3 42.4 43.1
 4 44.3 45.1
 5 47.2 46.9
 6 50.0 48.8
 7 50.5 49.1
 8 51.6 50.7
 9 52.6 51.9
10 54.3 52.0
11 54.3 51.5
12 54.1 52.0
13 53.4 53.5
14 56.5 53.1
15 54.8 53.9
16 55.4 53.9
17 52.3 53.0
18 56.4 56.7
19 56.9 55.2
20 56.0 NaN
22 57.0 NaN
23 54.4 NaN];
data.tL_fm(:,1) = 365 * (1.7 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(13);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HornSutt1995'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Ri = 0 * weights.Ri;
weights.Li = 3 * weights.Li;
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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'juveniles associate with jellyfish, adults are bottom-dwellers';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4WVBF'; % Cat of Life
metaData.links.id_ITIS = '172534'; % ITIS
metaData.links.id_EoL = '46577449'; % Ency of Life
metaData.links.id_Wiki = 'Seriolella_punctata'; % Wikipedia
metaData.links.id_ADW = 'Seriolella_punctata'; % ADW
metaData.links.id_Taxo = '187416'; % Taxonomicon
metaData.links.id_WoRMS = '282758'; % WoRMS
metaData.links.id_fishbase = 'Seriolella-punctata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriolella_punctata}}';
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
bibkey = 'HornSutt1995'; type = 'techreport'; bib = [ ... 
'author = {Horn, P.H. and C.P. Sutton}, ' ... 
'year = {1995}, ' ...
'title = {An ageing methodology and growth parameters for silver warehou (\emph{Seriolella punctata}) from off the southeast coast of the {S}outh {I}sland, {N}ew {Z}ealand}, ' ...
'institution = {N.Z. Fish. Assess. Res.}, ' ...
'volume = {95/15}, ' ...
'pages = {16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Seriolella-punctata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
