function [data, auxData, metaData, txtData, weights] = mydata_Pleurogrammus_monopterygius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Hexagrammidae';
metaData.species    = 'Pleurogrammus_monopterygius'; 
metaData.species_en = 'Atka mackerel';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 11];

%% set data
% zero-variate data

data.ab = 169;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Lowe2011';   
  temp.ab = C2K(1.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'Lowe2011';   
  temp.am = C2K(3.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 32.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 56.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.4e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'McDeMasl2007';
  comment.Wwb = 'based on egg diameter of 2.3 mm: pi/6*0.23^3';
data.Wwp = 404;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'ShesNaza2006';
  comment.Wwp = 'based on 0.00955*Lp^3.06, see F1';
data.Wwi = 2171;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.06, see F1';
 
data.Ri = 4.6*16e3/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'McDeMasl2007';
  temp.Ri = C2K(3.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '4.6 batches over 12 weeks spawning period, 16e3 eggs per batch';

% uni-variate data
% time-length-weight
data.tLW = [ ... %  time since birth (yr), total length(cm)
    1 14.89   50
    2 29.67  380
    3 37.71  770
    4 42.08 1070
    5 44.45 1260
    6 45.74 1370
    7 46.44 1430
    8 46.82 1470
    9 47.02 1490
   10 47.14 1500
   11 47.20 1500
   12 47.23 1510
   13 47.25 1510
   14 47.26 1510
   15 47.26 1510];
data.tLW(:,1) = (0.3 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(3.7); units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Lowe2011'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

% Facts
F1 = 'length-weight: Ww in g  = 0.00955*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W42M'; % Cat of Life
metaData.links.id_ITIS = '167120'; % ITIS
metaData.links.id_EoL = '46568834'; % Ency of Life
metaData.links.id_Wiki = 'Pleurogrammus_monopterygius'; % Wikipedia
metaData.links.id_ADW = 'Pleurogrammus_monopterygius'; % ADW
metaData.links.id_Taxo = '184147'; % Taxonomicon
metaData.links.id_WoRMS = '282289'; % WoRMS
metaData.links.id_fishbase = 'Pleurogrammus-monopterygius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurogrammus_monopterygius}}';
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
bibkey = 'Lowe2011'; type = 'techreport'; bib = [ ... 
'author = {Lowe, Sandra A.}, ' ... 
'year = {2011}, ' ...
'title = {Assessment of the {A}tka mackerel stock in the {G}ulf of {A}laska}, ' ...
'institution = {NPFMC Gulf of Alaska SAFE}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McDeMasl2007'; type = 'Article'; bib = [ ... 
'author = {Susanne F. McDermott and Katherine P. Maslenikov and Donald R. Gunderson}, ' ... 
'year = {2007}, ' ...
'title = {Annual fecundity, batch fecundity, and oocyte atresia of {A}tka mackerel (\emph{Pleurogrammus monopterygius}) in {A}laskan waters}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {105}, ' ...
'pages = {19–29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pleurogrammus-monopterygius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

