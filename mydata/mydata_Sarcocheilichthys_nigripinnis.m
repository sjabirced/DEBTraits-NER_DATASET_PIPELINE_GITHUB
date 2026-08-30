  function [data, auxData, metaData, txtData, weights] = mydata_Sarcocheilichthys_nigripinnis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Gobionidae';
metaData.species    = 'Sarcocheilichthys_nigripinnis'; 
metaData.species_en = 'Rainbow gudgeon'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data
data.ab = 57;        units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 21*365;   units.am = 'd';  label.am = 'life span'; bibkey.am = 'YanXu2012';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'YanXu2012'; 
data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 0.02;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'YanXu2012';
  comment.Wwb = 'Based on egg diameter of 3.4 mm: pi/6*0.34^3';
data.Wwp = 8.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'Based on 0.00851*Lp^3.13, see F1';
data.Wwi = 50; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Based on 0.00851*Li^3.13, see F1';

data.GSI = 0.14; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'YanXu2012';
  temp.GSI = C2K(11); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
 1	 1.555  5.119
 2	 3.358  7.806
 3	 4.915 10.815
 4	 6.268 13.823
 5	 7.253 16.512
 6	 8.321 19.627
 7	 9.306 22.528
 8	 9.883 24.895
 9	10.623 27.369
10	11.199 29.629
11	11.735 31.570
12	12.189 33.296
13	12.520 35.023
14	12.892 36.428
15	13.223 37.620
16	13.473 39.027
17	13.681 39.898
18.	13.890 41.090
19	14.058 41.427
20	14.144 42.407];
data.tLW(:,1) = 365 * (0 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(18);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'YanXu2012'; treat.tLW = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.ab = 0 * weights.ab;

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
% set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00851*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'China, Taiwan and Korea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79LXL'; % Cat of Life
metaData.links.id_ITIS = '639675'; % ITIS
metaData.links.id_EoL = '356118'; % Ency of Life
metaData.links.id_Wiki = 'Sarcocheilichthys_nigripinnis'; % Wikipedia
metaData.links.id_ADW = 'Sarcocheilichthys_nigripinnis'; % ADW
metaData.links.id_Taxo = '570618'; % Taxonomicon
metaData.links.id_WoRMS = '1016343'; % WoRMS
metaData.links.id_fishbase = 'Sarcocheilichthys_nigripinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sarcocheilichthys_nigripinnis}}';  
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
bibkey = 'YanXu2012'; type = 'article'; bib = [ ...  
'doi = {110.3724/SP.J.1141.2012.04000}, ' ...
'author = {Yan, Yun-Zhi and Xu, Yin-Sheng and Chu, Ling and He, Shan and Chen, Yi-Feng}, ' ...
'year = {2012}, ' ...
'title = {Age, growth and reproduction of \emph{Sarcocheilichys nigripinnis} from the {Q}ingyi {S}tream in the {H}uangshan {M}ountains}, ' ... 
'journal = {Zoological Research}, ' ...
'volume = {33(4)}, '...
'pages = {1−8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sarcocheilichthys_nigripinnis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
