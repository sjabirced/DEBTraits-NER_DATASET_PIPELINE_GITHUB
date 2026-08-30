function [data, auxData, metaData, txtData, weights] = mydata_Trachipterus_arcticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lampriformes'; 
metaData.family     = 'Trachipteridae';
metaData.species    = 'Trachipterus_arcticus'; 
metaData.species_en = 'Dealfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bpPz', 'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 29];

%% set data
% zero-variate data

data.tp = 14*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';
  temp.tp = C2K(5.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 60*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(5.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 200;     units.Lp  = 'cm';  label.Lp  = 'total fork at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 300;       units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0031;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.8 mm of Zu cristatus: pi/6*0.18^3';
data.Wwp = 11.2e3;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02239*Lp^3.02, see F1';
data.Wwi = 38.8e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02239*Li^3.02, see F1';

data.Ri  = 5e5/365;  units.Ri  = '#/d';  label.Ri  = 'max repoduction rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(5.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length Ww in g = 0.00102*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northeast Atlantic: Norway and Iceland to Madeira Islands; one report from Spain in the Mediterranean. Western Atlantic: New York to southern Florida in USA';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57PF2'; % Cat of Life
metaData.links.id_ITIS = '166342'; % ITIS
metaData.links.id_EoL = '46564355'; % Ency of Life
metaData.links.id_Wiki = 'Trachipterus_arcticus'; % Wikipedia
metaData.links.id_ADW = 'Trachipterus_arcticus'; % ADW
metaData.links.id_Taxo = '189237'; % Taxonomicon
metaData.links.id_WoRMS = '126527'; % WoRMS
metaData.links.id_fishbase = 'Trachipterus_arcticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachipterus_arcticus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trachipterus_arcticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
