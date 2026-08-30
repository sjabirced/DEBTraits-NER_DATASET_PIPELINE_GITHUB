function [data, auxData, metaData, txtData, weights] = mydata_Salmostoma_untrahi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Danionidae';
metaData.species    = 'Salmostoma_untrahi'; 
metaData.species_en = 'Mahanadi razorbelly minnow'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 10];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'KiraPutt2005';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;    units.Lp = 'cm'; label.Lp = 'std length at puberty';    bibkey.Lp = 'guess';
data.Li = 20;    units.Li = 'cm'; label.Li = 'ultimate std length';        bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 8.0;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 90.2;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';
 
data.GSI = 0.15;  units.GSI = 'g/g';   label.GSI = 'Gonado Somatic Index';  bibkey.GSI = 'guess'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Danio rerio';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (mnth), total length (cm)
    1  1.90  2.10
    2  4.30  4.40
    3  6.10  6.10
    4  7.50  7.50
    5  8.80  8.80
    6  9.90  9.80
    7 10.80 10.60
    8 11.80 11.20
    9 12.60 11.80
   10 13.10 12.30
   11 13.70 12.70
   12 14.00 12.90];
data.tL_fm(:,1) = (0+data.tL_fm(:,1))*30.5; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KiraPutt2005'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
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
% set1 = {'tL_S','tL_W'}; subtitle1 = {'Data for summer, winter born group'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'India';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6XF6Q'; % Cat of Life
metaData.links.id_ITIS = '639667'; % ITIS
metaData.links.id_EoL = '51894484'; % Ency of Life
metaData.links.id_Wiki = 'Salmostoma_untrahi'; % Wikipedia
metaData.links.id_ADW = 'Salmostoma_untrahi'; % ADW
metaData.links.id_Taxo = '186448'; % Taxonomicon
metaData.links.id_WoRMS = '1020676'; % WoRMS
metaData.links.id_fishbase = 'Salmostoma_untrahi'; % fishbase

%% References
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
bibkey = 'KiraPutt2005'; type = 'Article'; bib = [ ... 
'doi = {10.11609/JOTT.ZPJ.1200.1770-3}, ' ...
'author = {B.R. Kiran and E.T. Puttaiah}, ' ...
'year = {2005}, ' ...
'title = {Age and growth of \emph{Salmostoma untrahi} ({P}isces: {C}yprinidae) from {B}hadra {R}eservoir, {K}arnataka}, ' ... 
'journal = {Zoos'' Print Journal}, ' ...
'volume = {20(2)}, '...
'pages = {1770-1773}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salmostoma_untrahi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
