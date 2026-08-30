function [data, auxData, metaData, txtData, weights] = mydata_Pterapogon_kauderni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Kurtiformes'; 
metaData.family     = 'Apogonidae';
metaData.species    = 'Pterapogon_kauderni'; 
metaData.species_en = 'Banggai cardinal fish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data

data.am = 6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.1;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 8.6;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 0.014; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VageVolp2004';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 10.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^2.93, see F1';
  
data.Ri  = 70/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), std length (cm), 
0.0	0.543  0.062
0.5	2.552  1.328
1.0	4.039  3.537
1.5	4.863  5.666
2.0	5.567  7.353
2.5	6.090  8.719
3.0	6.413  9.744
3.5	6.615 10.408
4.0	6.878 10.972
4.5	6.940 11.355
5.0	6.982 11.617
5.5	7.003 11.779
6.0	7.065 11.941];
data.tLW(:,1) = data.tLW(:,1) * 365; % convert yr to d
units.tLW   = {'d', 'cm','g'};  label.tLW = {'time since birth','std length','weight'};  
temp.tLW    = C2K(27);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'NdobSoem2013'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PTGR'; % Cat of Life
metaData.links.id_ITIS = '642226'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pterapogon_kauderni'; % Wikipedia
metaData.links.id_ADW = 'Pterapogon_kauderni'; % ADW
metaData.links.id_Taxo = '185423'; % Taxonomicon
metaData.links.id_WoRMS = '282494'; % WoRMS
metaData.links.id_fishbase = 'Pterapogon-kauderni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterapogon_kauderni}}';
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
bibkey = 'NdobSoem2013'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIP2013.43.3.08}, ' ...
'author = {Ndobe, S. and Soemarno, E.Y. Herawati and D. Setyohadi and A. Moore and M.L.D. Palomares and D. Pauly}, ' ... 
'year = {2013}, ' ...
'title = {Life history of {B}anggai cardinalfish, \emph{Pterapogon kauderni} ({A}ctinopterygii: {P}erciformes: {A}pogonidae), from {B}anggai {I}slands and {P}alu {B}ay, {S}ulawesi, {I}ndonesia}, ' ...
'journal = {Acta Ichthyol. Piscat.}, ' ...
'volume = {43(3)}, ' ...
'pages = {237-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VageVolp2004'; type = 'Article'; bib = [ ... 
'doi = {10.1023/B:EBFI.0000033338.11355.f}, ' ...
'author = {Alejandro A. Vagelli and Alejandra V. Volpedo}, ' ... 
'year = {2004}, ' ...
'title = {Reproductive Ecology of \emph{Pterapogon kauderni}, an Endemic {A}pogonid from Indonesia with Direct Development}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {70}, ' ...
'pages = {235-245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Pterapogon-kauderni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
