function [data, auxData, metaData, txtData, weights] = mydata_Leuciscus_baicalensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leuciscus_baicalensis'; 
metaData.species_en = 'Siberian dace'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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

data.am = 12*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'SverKniz2012';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 26;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'SverKniz2012'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 16;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00891*Lp^3.13, see F1';
data.Wwi = 239;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'SverKniz2012','fishbase'};
  comment.Wwi = 'based on 0.00891*Li^3.13, see F1';

data.Ri = 5.7e3/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Leuciscus_aspius: 1e6*89.6/15800';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (d), total length (cm), weight (g)
    1   7.3   3
    2  15.5  12
    3  13.2  22
    4  16.1  38
    5  19.2  62
    6  21.3  51
    7  22.9 128
    8  23.5 141
    9  24.4 156
   10  26.0 188
   11  25.9 187];
data.tLW(:,1) = 365 * (0.9+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(12);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SverKniz2012'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

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
F1 = 'length-weight: W in g = 0.00891*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Ulungur Lake and Ulungur River in China , Mongolia and rivers draining to the Arctic Ocean, from the Ob to the Kolyma';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '72424'; % Cat of Life
metaData.links.id_ITIS = '1199691'; % ITIS
metaData.links.id_EoL = '209155'; % Ency of Life
metaData.links.id_Wiki = 'Leuciscus_baicalensis'; % Wikipedia
metaData.links.id_ADW = 'Leuciscus_baicalensis'; % ADW
metaData.links.id_Taxo = '178760'; % Taxonomicon
metaData.links.id_WoRMS = '1020385'; % WoRMS
metaData.links.id_fishbase = 'Leuciscus-baicalensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuciscus_baicalensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leuciscus-baicalensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SverKniz2012'; type = 'article'; bib = [ ...
'author = {T.V.Sverdlova and Igor B. Knizhin}, ' ...
'year = {2012}, ' ...
'title  = {The biology of siberian dace \emph{Leuciscus leuciscus baicalensis} ({D}yb.) of the upper reach of the {L}ena river}, ' ...
'journal = {Baikal Zoological Journal}, ' ...
'pages = {19-23}, ' ...
'volume = {9}'];
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

