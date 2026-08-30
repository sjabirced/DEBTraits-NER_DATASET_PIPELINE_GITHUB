function [data, auxData, metaData, txtData, weights] = mydata_Pristipomoides_typus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Pristipomoides_typus'; 
metaData.species_en = 'Sharptooth jobfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 07];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 28; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 223.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^2.95, see F1';
data.Wwi = 3334; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^2.95, see F1';

data.Ri  = 21e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
 2	24.127  285.112
 3	30.336  589.079
 4	35.061  980.686
 5	38.859 1186.820
 6	41.398 1539.349
 7	44.398 1706.596
 8	45.905 1873.788
 9	47.756 1982.581
10	48.806 2091.238
11	49.511 2141.386];
data.tLW(:,1) = 365 * data.tLW(:,1);  % convert yr to d
units.tLW   = {'d','cm','g'};  label.tLW = {'time since birth','std length','weight'};  
temp.tLW    = C2K(27.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Edwa1985'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.01202*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MJZJ'; % Cat of Life
metaData.links.id_ITIS = '550954'; % ITIS
metaData.links.id_EoL = '46580794'; % Ency of Life
metaData.links.id_Wiki = 'Pristipomoides_typus'; % Wikipedia
metaData.links.id_ADW = 'Pristipomoides_typus'; % ADW
metaData.links.id_Taxo = '184762'; % Taxonomicon
metaData.links.id_WoRMS = '218507'; % WoRMS
metaData.links.id_fishbase = 'Pristipomoides-typus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristipomoides_typus}}';
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
bibkey = 'Edwa1985'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1985.tb04233.x}, ' ...
'author = {Edwards, R. R. C.}, ' ...
'year = {1985}, ' ...
'title = {Growth rates of {L}utjanidae (snappers) in tropical {A}ustralian waters}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {26(1)}, '...
'pages = {1–4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pristipomoides-typus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
