function [data, auxData, metaData, txtData, weights] = mydata_Holocentrus_rufus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Holocentrus_rufus'; 
metaData.species_en = 'Longspine squirrelfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 35;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.92 mm: pi/6*0.092^3';
data.Wwp = 21;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01175*Lp^2.88, see F1';
data.Wwi = 329;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.88, see F1';

data.Ri  = 3.4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Holocentrus_adscensionis: 249863*329/2408';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
58.390	6.424
58.972	6.065
59.625	6.638
60.039	6.731
60.848	6.691
61.673	6.851
63.502	6.852
64.707	6.666
66.971	7.053
67.960	6.707
67.974	6.894
68.010	7.360
68.785	6.867
84.174	6.194
91.736	6.783
170.319	6.266
180.102	6.669];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TyleJohn1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; weights.tL(end-(0:4)) = 0;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';    
D2 = 'the last 4 data points in tL are ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Bermuda and southern Florida, USA to northern South America and Brazil; throughout the West Indies. Antilles, northwestern Gulf of Mexico, Yucatan to Colombia'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6LXXD'; % Cat of Life
metaData.links.id_ITIS = '166173'; % ITIS
metaData.links.id_EoL = '46567292'; % Ency of Life
metaData.links.id_Wiki = 'Holocentrus_rufus'; % Wikipedia
metaData.links.id_ADW = 'Holocentrus_rufus'; % ADW
metaData.links.id_Taxo = '176798'; % Taxonomicon
metaData.links.id_WoRMS = '276189'; % WoRMS
metaData.links.id_fishbase = 'Holocentrus_rufus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Holocentrus_rufus}}';
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
bibkey = 'TyleJohn1993'; type = 'Article'; bib = [ ... 
'author = {James C. Tyler and G. David Johnson and Edward B. Brothers and Diane M. Tyler and C. Lavett Smith}, ' ... 
'year = {1993}, ' ...
'title = {COMPARATIVE EARLY LIFE HISTORIES OF WESTERN {A}TLANTIC SQUIRRELFISHES ({H}OLOCENTRIDAE): AGE AND SETTLEMENT OF RHYNCHICHTHYS, MEEKI, AND JUVENILE STAGES}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {53(3}, ' ...
'pages = {71126-1150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Holocentrus_rufus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

