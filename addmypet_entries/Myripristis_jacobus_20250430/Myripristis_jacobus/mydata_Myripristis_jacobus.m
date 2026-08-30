function [data, auxData, metaData, txtData, weights] = mydata_Myripristis_jacobus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Myripristis_jacobus'; 
metaData.species_en = 'Blackbar soldierfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data

data.ab = 3.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(26.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 25;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.92 mm: pi/6*0.092^3';
data.Wwp = 25.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01445*Lp^3.01, see F1';
data.Wwi = 233;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.01, see F1';

data.Ri  = 2.4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Holocentrus_adscensionis: 249863*233/2408';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
59.228	4.095
60.051	4.229
60.877	4.402
64.956	4.603
70.228	4.472];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(26.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: North Carolina (USA), Bahamas and northern Gulf of Mexico to Brazil; throughout the West Indies and the Caribbean Sea. Eastern Atlantic: St. Paul''s Rocks, Cape Verde, Principe, Ascension and St. Helena islands'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '459FM'; % Cat of Life
metaData.links.id_ITIS = '166211'; % ITIS
metaData.links.id_EoL = '46567207'; % Ency of Life
metaData.links.id_Wiki = 'Myripristis_jacobus'; % Wikipedia
metaData.links.id_ADW = 'Myripristis_jacobus'; % ADW
metaData.links.id_Taxo = '180601'; % Taxonomicon
metaData.links.id_WoRMS = '159385'; % WoRMS
metaData.links.id_fishbase = 'Myripristis_jacobus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myripristis_jacobus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Myripristis_jacobus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

