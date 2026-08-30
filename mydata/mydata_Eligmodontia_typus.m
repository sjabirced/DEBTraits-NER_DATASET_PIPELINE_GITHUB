function [data, auxData, metaData, txtData, weights] = mydata_Eligmodontia_typus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Eligmodontia_typus'; 
metaData.species_en = 'Eastern Patagonian gerbil mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 24];

%% set data
% zero-variate data

data.tg = 18;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Mare1988';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 17;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Mare1988';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'solid food between 17 and 30 d';
data.tp = 51.5;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.4;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Mare1988';
data.Wwi = 21.4;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mare1988';

data.Ri  = 14/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Mare1988';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'till 7 pups per litter; 2 litters per yr assumed';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
    1  2.8  1.5  1.5  1.7
    5  3.7  2.2  3.4  2.2
   10  6.2  3.1  6.1  4.4
   15  9.4  3.5  8.7  4.9
   20 11.6  4.1 10.3  6.2
   30 15.1  NaN 12.2  7.5
   40 NaN   NaN 15.1  NaN
   50 NaN   NaN 15.1  NaN];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Mare1988'; treat.tW = {1 {'1','2','3','4'}};
label.treat.tW = 'individual';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6F48K'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2848298'; % Ency of Life
metaData.links.id_Wiki = 'Eligmodontia_typus'; % Wikipedia
metaData.links.id_ADW = 'Eligmodontia_typus'; % ADW
metaData.links.id_Taxo = '62302'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000647'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eligmodontia_typus}}';
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
bibkey = 'Mare1988'; type = 'Article'; bib = [ ... 
'author = {Michaela Mare}, ' ... 
'year = {1988}, ' ...
'title = {REPRODUCTION, GROWTH, AND DEVELOPMENT IN {A}RGENTINE GERBIL MICE, \emph{Eligmodontia typus}}, ' ...
'journal = {J. Mamm.}, ' ...
'volume = {69(4)}, ' ...
'pages = {852-854}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

