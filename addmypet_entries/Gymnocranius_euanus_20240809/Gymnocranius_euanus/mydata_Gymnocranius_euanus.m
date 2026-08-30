function [data, auxData, metaData, txtData, weights] = mydata_Gymnocranius_euanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Gymnocranius_euanus'; 
metaData.species_en = 'Japanese large-eye bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
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
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Gymnocranius audleyi';
data.Wwi = 1572; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01862*Li^2.98, see F1';

data.Ri  = 77e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lethrinus lentjan';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    4 23.9
    5 28.0
    6 30.9
    7 32.0
    8 34.0
    9 35.5
   11 37.4
   12 38.2
   15 39.5];
data.tL(:,1) = 365 * (data.tL(:,1)-0.2);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'length=weight: Ww in  g = 0.01862*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L6TT'; % Cat of Life
metaData.links.id_ITIS = '550895'; % ITIS
metaData.links.id_EoL = '46580971'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocranius_euanus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocranius_euanus'; % ADW
metaData.links.id_Taxo = '175552'; % Taxonomicon
metaData.links.id_WoRMS = '278870'; % WoRMS
metaData.links.id_fishbase = 'Gymnocranius-euanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocranius_euanus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Gymnocranius-euanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
