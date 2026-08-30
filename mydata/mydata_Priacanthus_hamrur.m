function [data, auxData, metaData, txtData, weights] = mydata_Priacanthus_hamrur
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Priacanthiformes'; 
metaData.family     = 'Priacanthidae';
metaData.species    = 'Priacanthus_hamrur'; 
metaData.species_en = 'Moontail bullseye'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 07];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 7.4e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.52 mm of Priacanthus_macracanthus: pi/6*0.052^3'; 
data.Wwp = 130.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^2.88, see F1';
data.Wwi = 1026; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^2.88, see F1';

data.Ri  = 245303/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
0.241	6.863
0.501	11.077
0.762	15.525
0.996	19.270
1.250	22.238
1.516	24.504
1.743	26.301
1.984	28.411
2.243	29.586
2.484	30.839
2.769	31.625
3.016	32.722];
data.tL(:,1) = 365*data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chak1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'weight-length relationship: Ww in g = 0.01778*(TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MBWN'; % Cat of Life
metaData.links.id_ITIS = '168185'; % ITIS
metaData.links.id_EoL = '46578898'; % Ency of Life
metaData.links.id_Wiki = 'Priacanthus_hamrur'; % Wikipedia
metaData.links.id_ADW = 'Priacanthus_hamrur'; % ADW
metaData.links.id_Taxo = '106122'; % Taxonomicon
metaData.links.id_WoRMS = '218360'; % WoRMS
metaData.links.id_fishbase = 'Priacanthus-hamrur'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Priacanthus_hamrur}}';
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
bibkey = 'Chak1994'; type = 'Article'; bib = [ ... 
'author = {Sushant Kumak Chakraborty}, ' ... 
'year = {1994}, ' ...
'title = {FISHERY, AGE, GROWTH, MORTALITY AND STOCK ASSESSMENT OF \emph{Priacanthus hamrur} {F}ORSKAL FROM {B}OMBAY WATERS}, ' ...
'journal = {Bull. Cent. Mar. Fish. Res. Inst}, ' ...
'volume = {47}, ' ...
'pages = {121-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Priacanthus-hamrur.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
