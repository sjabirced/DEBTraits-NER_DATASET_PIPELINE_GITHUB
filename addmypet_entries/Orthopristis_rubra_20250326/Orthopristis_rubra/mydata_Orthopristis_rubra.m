function [data, auxData, metaData, txtData, weights] = mydata_Orthopristis_rubra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Orthopristis_rubra'; 
metaData.species_en = 'Corocoro grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 03 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 26];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 41.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 50;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01259*Lp^2.97, see F1';
data.Wwi = 805; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^2.97, see F1; max. published weight: 850 g';

data.Ri  = 3e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Haemulon_album: 2.2e6*805/5926';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
    0  5.153   5.081
    1 17.204 105.015
    2 25.593 258.383
    3 30.864 378.640
    4 33.559 483.634
    5 35.576 560.640
    6 36.644 604.554
    7 37.304 633.187];
data.tLW(:,1) = (data.tLW(:,1) + 0.4)*365;  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(25.7);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'VianVera2002'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;
weights.Wwi = 2 * weights.Wwi;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01259*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74WRP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Orthopristis'; % Wikipedia
metaData.links.id_ADW = 'Orthopristis_rubra'; % ADW
metaData.links.id_Taxo = '3418266'; % Taxonomicon
metaData.links.id_WoRMS = '401818'; % WoRMS
metaData.links.id_fishbase = 'Orthopristis-rubra'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orthopristis}}';
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
bibkey = 'VianVera2002'; type = 'article'; bib = [ ... 
'author = {Vianna, M. and J.R. Verani}, ' ... 
'year = {2002}, ' ...
'title = {Biologia populacional de \emph{Orthopristis ruber} ({T}eleostei, {H}aemulidae) esp\''{e}cie acompanhante da pesca de arrasto do camar\~{a}o-rosa, no sudeste brasiliero}, ' ...
'journal = {Atl\^{a}ntica}, ' ...
'volume = {23(1)}, ' ...
'pages = {27-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Orthopristis-rubra.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
