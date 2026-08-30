  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_zysron
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_zysron'; 
metaData.species_en = 'Slender threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data

% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'MehaAlMa2013';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 34;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.5 mm: pi/6*0.05^3';
data.Wwp = 59;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwim = 'based on 0.01349*Li^2.96, see F1';
data.Wwi = 460;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.96, see F1; max. published weight: 395 g';
  
data.Ri  = 139200/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nemipterus japonicus';

% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g0
1	20.086  79.508
2	26.579 182.901
3	30.729 281.996
4	33.266 349.026];
data.tLW(:,1) = 365 * (0 + data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(27.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'MehaAlMa2013'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 10 * weights.Ri;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01349*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4682S'; % Cat of Life
metaData.links.id_ITIS = '550989'; % ITIS
metaData.links.id_EoL = '46581016'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_zysron'; % ADW
metaData.links.id_Taxo = '180987'; % Taxonomicon
metaData.links.id_WoRMS = '218519'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-zysron'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus}}';  
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
bibkey = 'MehaAlMa2013'; type = 'inproceedings'; bib = [ ...  
'author = {Sahar F. Mehanna and Juma Al-Mamry and Iman Al-Kharusi and Dawood Al-Mamry}, ' ...
'year = {2013}, ' ...
'title = {Stock assessment of threadfin bream \emph{Nemipterus zysron} ({B}leeker, 1857) in the {S}ea of {O}man, {S}ultanate of {O}man}, ' ... 
'booktitle = {INOC-IIUM-International Conference on Oceanography \& Sustainable Marine Production: A Challenge of Managing Marine Resources under Climate Change, ICOSMaP, Kuantan- Malaysia, 28-30 October 2013}, ' ...
'pages = {510-518}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-zysron.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
