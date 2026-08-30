function [data, auxData, metaData, txtData, weights] = mydata_Pseudophoxinus_antalyae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pseudophoxinus_antalyae'; 
metaData.species_en = 'Antalya minnow'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 06];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 19;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 6.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 129;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Inna2014';
  comment.Wwi = 'based on tLW data';

data.Ri = 1800/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(17/46.7)^3';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
 0   4.5   1.2
 1	 7.4   6.2
 2	10.5  17.4
 3	13.3  36.5
 4	15.0  57.3
 5	16.4  74.7
 6	17.7 100.3
 7	18.9 129.5];
data.tLW(:,1) = 365 * (0.2+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(18);  units.temp.tLW = 'K'; label.temp.tL = 'temperature';
bibkey.tLW = 'Inna2014'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
3.862	2.721
4.818	2.745
5.415	2.760
5.973	0.148
6.650	6.292
6.928	4.549
7.287	6.308
8.322	8.960
8.561	11.592
9.596	16.869
10.273	23.013
10.711	16.897
10.910	28.281
11.229	23.912
12.025	31.810
12.065	31.811
12.383	31.819
13.458	47.600
13.896	45.861
14.056	35.361
14.414	60.753
14.454	45.875
14.892	67.768
16.007	66.920
16.286	83.557
16.644	80.065
17.082	94.956
17.918	102.854
18.197	107.237
18.714	126.506
19.113	135.269];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'Inna2014'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Antolia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '78GYL'; % Cat of Life
metaData.links.id_ITIS = '689738'; % ITIS
metaData.links.id_EoL = '46581675'; % Ency of Life
metaData.links.id_Wiki = 'Pseudophoxinus_antalyae'; % Wikipedia
metaData.links.id_ADW = 'Pseudophoxinus_antalyae'; % ADW
metaData.links.id_Taxo = '185255'; % Taxonomicon
metaData.links.id_WoRMS = '282466'; % WoRMS
metaData.links.id_fishbase = 'Pseudophoxinus-antalyae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudophoxinus_antalyae}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pseudophoxinus-antalyae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Inna2014'; type = 'article'; bib = [ ...
'doi = {10.1111/jai.12191}, ' ...
'author = {Innal, D.}, ' ...
'year = {2014}, ' ...
'title  = {Identifying growth parameters for two endemic species [\emph{Capoeta antalyensis} ({B}attalgil, 1943) and \emph{Pseudophoxinus antalyae} {B}ogutskaya, 1992] in {D}uden {C}reek, {A}ntalya, {T}urkey}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {30(2)}, ' ...
'pages = {294-299}'];
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

