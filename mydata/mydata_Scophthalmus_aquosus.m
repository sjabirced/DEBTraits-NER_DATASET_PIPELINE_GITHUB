function [data, auxData, metaData, txtData, weights] = mydata_Scophthalmus_aquosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Scophthalmidae';
metaData.species    = 'Scophthalmus_aquosus'; 
metaData.species_en = 'Windowpane flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 25];

%% set data
% zero-variate data

data.ab = 21;          units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(4.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7 * 365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21.9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 45.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.6e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CapuCand2001';
  comment.Wwb = 'based on egg diameter of 0.89 mm: pi/6*0.089^3';
data.Wwp = 104;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01023*Lp^2.99, see F1';
data.Wwi = 940;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.99, see F1';

data.Ri  = 2.7e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CapuCand2001';   
  temp.Ri = C2K(4.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 200 g eggs of a 1000 g fish: 200/3.6e-4/1000*4.8e3';
 
% uni-variate data
% time-length
data.tL = [ ... % time (mnth), total length (cm)
1	6.145
2	6.502
3	7.078
4	8.162
5	9.101
6	11.931
7	14.469
8	16.935
9	20.057
10	21.795
11	22.443
12	22.436];    
data.tL(:,1) = 30.5 * (3.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(4.7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorsAble1995';
 
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

% %% Group plots
% set1 = {'tL'};  subtitle1 = {'IMARES data (frisbe) from Northsea'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Gulf of St. Lawrence in Canada to northern Florida in USA';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4VVCG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570247'; % Ency of Life
metaData.links.id_Wiki = 'Scophthalmus_aquosus'; % Wikipedia
metaData.links.id_ADW = 'Scophthalmus_aquosus'; % ADW
metaData.links.id_Taxo = '46898'; % Taxonomicon
metaData.links.id_WoRMS = '158907'; % WoRMS
metaData.links.id_fishbase = 'Scophthalmus_aquosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scophthalmus_aquosus}}';
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
bibkey = 'MorsAble1995'; type = 'Article'; bib = [ ...  
'author = {Wallace W. Morse and Kenneth W. Able}, ' ...
'year = {1995}, ' ...
'title  = {Distribution and life history of windowpane, \emph{Scophthalmus aquosus}, off the northeastern {U}nited {S}tates}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {93}, ' ...
'pages = {675-693}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scophthalmus_aquosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
