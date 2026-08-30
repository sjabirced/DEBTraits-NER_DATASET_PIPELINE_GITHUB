function [data, auxData, metaData, txtData, weights] = mydata_Parapercis_hexophtalma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Pinguipedidae';
metaData.species    = 'Parapercis_hexophtalma'; 
metaData.species_en = 'Speckled sandperch'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 05];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ThilMcIl2016';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';
  
data.Lp  = 13;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 29;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm: pi/6*0.09^3'; 
data.Wwp  = 23.7;  units.Wwp  = '9';  label.Wwp  = 'weight at puberty'; bibkey.Wwp  = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00813*Lp^3.11, see F1';
data.Wwi  = 287;  units.Wwi  = '9';  label.Wwi  = 'ultimate weight for females'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.11, see F1';

data.Ri = 5.9e4/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  9.5
    2 12.9
    3 14.8
    4 16.0
    5 16.8
    6 17.3];
data.tL(:,1) = 365 * (data.tL(:,1)+0);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Loub1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_my','tL_mg'}; subtitle1 = {'Data females, yellow and gray males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D7LB'; % Cat of Life
metaData.links.id_ITIS = '630561'; % ITIS
metaData.links.id_EoL = '46573396'; % Ency of Life
metaData.links.id_Wiki = 'Parapercis_hexophtalma'; % Wikipedia
metaData.links.id_ADW = 'Parapercis_hexophtalma'; % ADW
metaData.links.id_Taxo = '183012'; % Taxonomicon
metaData.links.id_WoRMS = '219159'; % WoRMS
metaData.links.id_fishbase = 'Parapercis-hexophtalma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parapercis_hexophtalma}}';
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
bibkey = 'Loub1980'; type = 'Article'; bib = [ ... 
'author = {Loubens, G.}, ' ... 
'year = {1980}, ' ...
'title = {Biologie de quelques esp\`{e}ces de poissons du lagon N\''{e}o-Cal\''{e}donien. {III}. Croissance}, ' ...
'journal = {Cah. Indo-Pac.}, ' ...
'volume = {2}, ' ...
'pages = {101-153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Parapercis-hexophtalma.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

