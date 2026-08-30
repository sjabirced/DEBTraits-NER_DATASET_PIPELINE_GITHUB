function [data, auxData, metaData, txtData, weights] = mydata_Gymnocranius_grandoculis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Gymnocranius_grandoculis'; 
metaData.species_en = 'Blue-lined large-eye bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data

data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Gymnocranius audleyi';
data.Wwi = 6023; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01905*Li^2.89, see F1; max. published weight: 5.5 kg';

data.Ri  = 77e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lethrinus lentjan';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 11.5
    2 17.8
    3 22.5
    4 26.1
    5 28.8
    6 30.8
    8 33.5
   10 35.0];
data.tL(:,1) = 365 * (data.tL(:,1)+0);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Loub1980';

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length=weight: Ww in  g = 0.01905*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HR9Y'; % Cat of Life
metaData.links.id_ITIS = '550897'; % ITIS
metaData.links.id_EoL = '46580969'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocranius_grandoculis'; % Wikipedia
metaData.links.id_ADW = 'Gymnocranius_grandoculis'; % ADW
metaData.links.id_Taxo = '175554'; % Taxonomicon
metaData.links.id_WoRMS = '218579'; % WoRMS
metaData.links.id_fishbase = 'Gymnocranius_grandoculis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocranius_grandoculis}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Gymnocranius-grandoculis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
