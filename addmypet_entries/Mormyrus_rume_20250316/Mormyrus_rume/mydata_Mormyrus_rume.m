  function [data, auxData, metaData, txtData, weights] = mydata_Mormyrus_rume
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Mormyridae';
metaData.species    = 'Mormyrus_rume'; 
metaData.species_en = 'Mormyrid'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 16];

%% set data
% zero-variate data
data.ab = 15; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 100;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm of Mormyrus kannume: pi/6*0.21^3';
data.Wwp = 203;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^2.83, see F1';
data.Wwi = 4676;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.83, see F1; max. published weight: 5.3 kg ';
  
data.Ri = 31499/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
64.977	24.457
90.841	28.113
121.579	31.771
152.015	35.215
181.244	37.373
211.077	40.175
246.995	43.836
337.709	52.454
365+3.161	54.185
365+90.231	61.517
365+121.585	64.533
365+152.950	66.265
365+182.494	67.353
365+214.469	69.084
365+246.752	70.388
730+34.331	77.330
730+153.108	82.325
730+182.656	82.984
730+214.330	84.288
730+306.325	86.055];
data.tL(:,1) = data.tL(:,1) + 150; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AjagOjoj2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.83'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RRBM'; % Cat of Life
metaData.links.id_ITIS = '649936'; % ITIS
metaData.links.id_EoL = '1156574'; % Ency of Life
metaData.links.id_Wiki = 'Mormyrus_rume'; % Wikipedia
metaData.links.id_ADW = 'Mormyrus_rume'; % ADW
metaData.links.id_Taxo = '472604'; % Taxonomicon
metaData.links.id_WoRMS = '1018696'; % WoRMS
metaData.links.id_fishbase = 'Mormyrus-rume'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Mormyrus_rume}}';  
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
bibkey = 'AjagOjoj2020'; type = 'article'; bib = [ ...
'doi = {10.4314/gjass.v19i1.7}, ' ...
'author = {Ajagbe, Stephen O.  and Ojoj-Fakuade, Folashage F. }, ' ...
'year = {2020}, ' ...
'title = {POPULATION DYNAMICS OF \emph{Mormyrus_rume} ({V}ALENCIENNES, 1847; {O}STEOGLOSSIFORMES; {M}ORMYRIDAE) OF {I}KERE-{G}ORGE, {I}SEYIN, {O}YO {S}TATE, {N}IGERIA}, ' ... 
'journal = {Global Journal of Agricultural Sciencies}, ' ...
'volume = {19}, ' ...
'pages = {51-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mormyrus-rume.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

