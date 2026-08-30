function [data, auxData, metaData, txtData, weights] = mydata_Couesius_plumbeus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Couesius_plumbeus'; 
metaData.species_en = 'Lake chub'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 04];

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 8.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 23;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BrowHamm1970';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 6.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.01, see F1';
data.Wwi = 128.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.01, see F1; max. published weight: 4.0 kg';

data.Ri = 6630/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm)
    1  3.6  0.5
    2  6.1  2.4
    3  8.6  6.4
    4 10.1 10.2];
data.tLW(:,1) = 365*(0 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(16);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'BrucPars1976'; treat.tLW = {1 {'length','weight'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
9.018	667.841
9.702	861.097
9.703	815.900
9.786	680.356
9.845	788.867
9.904	864.232
10.216	963.855
10.596	1265.402
10.610	985.184
11.092	1211.464
11.503	1500.977
11.575	1383.506
11.866	1534.341
11.988	1468.124
12.000	1272.275
12.078	1534.468
12.096	1685.138
12.414	2101.149
12.895	2432.889
13.237	1703.905];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BrowHamm1970'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;

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
F1 = 'length-weight: W in g = 0.01023*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'YZHV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Couesius_plumbeus'; % Wikipedia
metaData.links.id_ADW = 'Couesius_plumbeus'; % ADW
metaData.links.id_Taxo = '172091'; % Taxonomicon
metaData.links.id_WoRMS = '567529'; % WoRMS
metaData.links.id_fishbase = 'Couesius-plumbeus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Couesius_plumbeus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Couesius-plumbeus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BrucPars1976'; type = 'article'; bib = [ ... 
'author = {Bruce, W.J. and R.F. Parsons}, ' ...
'year = {1976}, ' ...
'title  = {Age, growth and maturity of Lake Chub \emph{Couesius plumbeus} in 66 Brook, ten {M}ile {L}ake, western {L}abrador}, ' ...
'journal = {Fish. Mar. Serv. Tech. Serv. (683):9p. }, ' ...
'pages = {44(5)}, ' ...
'volume = {683}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BrowHamm1970'; type = 'article'; bib = [ ... 
'doi = {10.1139/f70-117}, ' ...
'author = {Brown, J. H. and Hammer, U. T. and Koshinsky, G. D.}, ' ...
'year = {1970}, ' ...
'title  = {Breeding Biology of the Lake Chub, \emph{Couesius plumbeus}, at {L}ac la {R}onge, {S}askatchewan}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'pages = {1005–1015}, ' ...
'volume = {27(6)}'];
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

