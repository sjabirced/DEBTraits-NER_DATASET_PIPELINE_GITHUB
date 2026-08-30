function [data, auxData, metaData, txtData, weights] = mydata_Sargocentron_coruscum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Sargocentron_coruscum'; 
metaData.species_en = 'Reef squirrelfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.92 mm: pi/6*0.092^3';
data.Wwp = 4.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwi = 46;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1';

data.Ri  = 4.8e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Holocentrus_adscensionis: 249863*46/2408';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
34.939	2.609
37.377	2.609
39.838	2.917
65.909	3.778
67.318	3.606
68.776	4.085
69.153	3.699
69.571	3.846
69.800	4.192
70.979	3.660
71.211	4.046
71.394	3.780
71.986	3.554
72.026	4.073
72.811	3.714
72.820	3.834
72.833	4.007
75.194	2.996
83.410	4.171
96.856	4.655
97.192	3.736
98.057	4.416
98.661	4.349
99.460	4.177
99.872	4.243
103.365	4.764];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TyleJohn1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Bermuda and Florida, USA to northern South America'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79MMR'; % Cat of Life
metaData.links.id_ITIS = '622125'; % ITIS
metaData.links.id_EoL = '46567275'; % Ency of Life
metaData.links.id_Wiki = 'Sargocentron_coruscum'; % Wikipedia
metaData.links.id_ADW = 'Sargocentron_coruscum'; % ADW
metaData.links.id_Taxo = '571660'; % Taxonomicon
metaData.links.id_WoRMS = '272207'; % WoRMS
metaData.links.id_fishbase = 'Sargocentron_coruscum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sargocentron_coruscum}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Sargocentron_coruscum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

