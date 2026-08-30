function [data, auxData, metaData, txtData, weights] = mydata_Sebastolobus_macrochir

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastolobus_macrochir'; 
metaData.species_en = 'Broadbanded thornyhead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data

data.am = 45 *365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(2.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 44;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 270;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00912*Lp^3.09, see F1';
data.Wwi = 1092;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.09, see F1; max. published weight: 1.2 kg';
  
data.Ri  = 411710/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(2.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
1	 6.842
2	11.110
3	15.219];
data.tL(:,1) = 365*(0.3+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(2.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HattNari2007';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00912*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Pacific: Sagami Bay, Japan to the southern Kuril Islands and off Sakhalin, Russia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4W7ZN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46568235'; % Ency of Life
metaData.links.id_Wiki = 'Sebastolobus_macrochir'; % Wikipedia
metaData.links.id_ADW = 'Sebastolobus_macrochir'; % ADW
metaData.links.id_Taxo = '187358'; % Taxonomicon
metaData.links.id_WoRMS = '282742'; % WoRMS
metaData.links.id_fishbase = 'Sebastolobus_macrochir'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastolobus_macrochir}}';
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
bibkey = 'HattNari2007'; type = 'article'; bib = [ ... 
'author = {Tsutomu Hattori and Yoji Narimatsu and Masaki Ito and Yuji Ueda and Kunihiro Fujiwara and Daiji Kitagawa}, ' ...
'year = {2007}, ' ...
'title = {Growth changes in bighand thornyhead \emph{Sebastolobus macrochir} off the {P}acific coast of northern {H}onshu, {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73}, ' ...
'pages = {341–347}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastolobus_macrochir.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
