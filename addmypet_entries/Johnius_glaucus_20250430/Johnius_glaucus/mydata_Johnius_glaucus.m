function [data, auxData, metaData, txtData, weights] = mydata_Johnius_glaucus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Johnius_glaucus'; 
metaData.species_en = 'Pale spotfin croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.3e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 76;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 309; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1; max. published weight: 257 g';

data.Ri = 66139/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
177.621	12.528
211.540	13.203
277.921	15.417
300.529	15.958
365.524	17.581
402.255	18.619
467.241	20.423
522.398	20.774];
data.tL(:,1) = data.tL(:,1) + 0; % est origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KamaDeva1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: northwest coast of India. Reported from Pakistan';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3QQ5T'; % Cat of Life
metaData.links.id_ITIS = '646610'; % ITIS
metaData.links.id_EoL = '46579017'; % Ency of Life
metaData.links.id_Wiki = 'Johnius_glaucus'; % Wikipedia
metaData.links.id_ADW = 'Johnius_glaucus'; % ADW
metaData.links.id_Taxo = '177658'; % Taxonomicon
metaData.links.id_WoRMS = '276109'; % WoRMS
metaData.links.id_fishbase = 'Johnius_glaucus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Johnius_glaucus}}';
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
bibkey = 'KamaDeva1995'; type = 'Article'; bib = [ ... 
'author = {S. S. Kamat and M. Devaraj}, ' ... 
'year = {1995}, ' ...
'title = {STOCK ASSESSMENT AND BIOLOGY OF \emph{Johnius glaucus} ({D}AY) OFF THE NORTHWEST COAST OF {I}NDIA}, ' ...
'journal = {Journal of the Indian Fisheries Association}, ' ...
'volume = {25}, ' ...
'pages = {15-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Johnius_glaucus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

