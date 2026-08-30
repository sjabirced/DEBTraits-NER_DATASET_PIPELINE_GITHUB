  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_gonius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_gonius'; 
metaData.species_en = 'Kuria labeo'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data
data.ab = 2.5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 57;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'fishbase gives 150 cm, but this is inconsistent with max published weight of 1.4 kg, which corresponds with 57 cm';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 59;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00631*Lp^3.05, see F1';
data.Wwi = 1400;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase based on 0.00631*Li^3.05, see F1, gives 27 kg; max. published weight: 1.4 kg';

data.Ri  = 203233/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 14.2
    2 20.6
    3 23.9
    4 26.4
    5 28.5
    6 30.0];
data.tL(:,1) = 365 * (0.7 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth','total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chat1992'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
    13.79  21.79
    17.00  46.41
    23.12 161.42
    28.55 266.12
    31.60 357.78
    36.71 627.70];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'DarsNare2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00631*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Pakistan, India, Nepal, Myanmar and Bangladesh';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3RHVY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '205720'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_gonius'; % Wikipedia
metaData.links.id_ADW = 'Labeo_gonius'; % ADW
metaData.links.id_Taxo = '177906'; % Taxonomicon
metaData.links.id_WoRMS = '1026571'; % WoRMS
metaData.links.id_fishbase = 'Labeo-gonius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_gonius}}';  
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
bibkey = 'Chat1992'; type = 'article'; bib = [ ...  
'doi = {10.33997/j.afs.1992.5.2.011}, ' ...
'author = {Anil Chatterji}, ' ...
'year = {1992}, ' ...
'title = {Age and Growth of \emph{Labeo gonius} ({C}yprinidae) in {K}ali {R}iver, {U}ttar {P}radesh, {I}ndia}, ' ... 
'journal = {Asian Fisheries Science}, ' ...
'volume = {5}, ' ...
'pages = {257-260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DarsNare2010'; type = 'article'; bib = [ ...  
'author = {B. A. Dars and N. T. Narejo and A. Dayo}, ' ...
'year = {2010}, ' ...
'title = {RELATIVE CONDITION FACTOR AND LENGTH-WEIGHT RELATIONSHIP OF A CARP, \emph{Labeo gonius} ({H}AMILTON) FROM {K}EENJHAR {L}AKE, DISTRICT {T}HATTA, {S}INDH, {P}AKISTAN}, ' ... 
'journal = {Sindh Univ. Res. Jour. (Sci. Ser.)}, ' ...
'volume = {42(2)}, ' ...
'pages = {67-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-gonius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

