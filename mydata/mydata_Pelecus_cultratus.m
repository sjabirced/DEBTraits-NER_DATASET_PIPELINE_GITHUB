  function [data, auxData, metaData, txtData, weights] = mydata_Pelecus_cultratus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pelecus_cultratus'; 
metaData.species_en = 'Sichel'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'; 't-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KujaFurg2015';
  comment.Wwb = 'based on egg diameter of 1.7 mm given tW data: pi/6*0.17^3; but alfishes gives 3.8-5.9 mm';
data.Wwp = 315;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 2774;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1; max. published weight: 2.0 kg';

data.Ri = 3e5/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'allfishes';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
1	0.774 0.774 0.774 0.774 0.774
5	1.307 1.127 1.056 0.976 0.936
9	1.811 1.560 1.379 1.228 1.078
13	2.575 2.194 1.742 1.652 1.250
17	2.868 2.486 2.045 1.884 1.312
21	3.331 3.000 2.337 2.116 1.554
25	3.925 3.463 2.720 2.399 1.666
30	4.318 3.886 3.244 2.742 1.948];
units.tL= {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
bibkey.tL = 'KostMane2024'; treat.tL = {1 {'30 C','26 C','22 C','18 C','14 C'}};

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1	0.002 0.002 0.002 0.002 0.002
5	0.011 0.008 0.006 0.003 0.003
9	0.034 0.016 0.013 0.008 0.006
13	0.079 0.052 0.026 0.016 0.008
17	0.128 0.086 0.043 0.030 0.012
21	0.181 0.124 0.062 0.041 0.016
25	0.287 0.193 0.091 0.063 0.022
30	0.376 0.278 0.153 0.097 0.033];
units.tW= {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
bibkey.tW = 'KostMane2024'; treat.tW = {1 {'30 C','26 C','22 C','18 C','14 C'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Black Sea, Caspian Sea and Aral Sea basins; Baltic basin from Vistula to Neva drainages, southern Sweden and Finland, Lakes Ladoga and Onega. Occasionally on Baltic coast west of Vistula and on Finnish coast north of 61 N';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '75YLX'; % Cat of Life
metaData.links.id_ITIS = '639627'; % ITIS
metaData.links.id_EoL = '46581669'; % Ency of Life
metaData.links.id_Wiki = 'Pelecus'; % Wikipedia
metaData.links.id_ADW = 'Pelecus_cultratus'; % ADW
metaData.links.id_Taxo = '43713'; % Taxonomicon
metaData.links.id_WoRMS = '282185'; % WoRMS
metaData.links.id_fishbase = 'Pelecus-cultratuss'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pelecus}}';  
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
bibkey = 'KujaFurg2015'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10228-014-0419-6}, ' ...
'author = {Roman Kujawa and Grazyna Furga{\l}a-Selezniow  and Andrzej Mamcarz and Mariusz Lach and Dariusz Kucharczyk}, ' ...
'year = {2015}, ' ...
'title = {Influence of temperature on the growth and survivability of sichel larvae \emph{Pelecus cultratus} reared under controlled conditions}, ' ... 
'journal = {Ichthyol Res}, ' ...
'volume = {62}, '...
'pages = {163–170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pelecus-cultratus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'allfishes'; type = 'Misc'; bib = ...
'howpublished = {\url{https://allfishes.org/dictionary-of-ichthyology/pelecus-cultratus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

