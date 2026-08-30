function [data, auxData, metaData, txtData, weights] = mydata_Henicorhynchus_siamensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Henicorhynchus_siamensis'; 
metaData.species_en = 'Siamese mud carp'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'SuvaLek2010';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'SuvaLek2010'; 
data.Li = 26.4;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'SuvaLek2010'; 
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 76.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'SuvaLek2010','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^3.00, see F1';
data.Wwi = 176;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.00, see F1; max. published weight: 25.90 g';

data.GSI = 0.186; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'SuvaLek2010';
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length-weight
data.tL = [ ... % time (d), total length (cm)
537.499	13.636
730+186.420	20.937
730+213.494	21.289
730+246.415	21.856
730+280.818	22.064
730+307.906	22.130
730+342.320	22.123
730+378.916	22.403
730+418.452	22.466
730+472.614	22.885
730+483.586	23.098
730+537.016	23.517];
data.tL(:,1) = data.tL(:,1)-220; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SuvaLek2010'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
D2 = 'GSI data ignored du to inconsistency with LN and Wwb data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00955*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Thailand (Bang Pakong, Chao Phraya, Mae Klong, and Phetchaburi basins) and Mekong basin in Cambodia, Lao PDR, Thailand, and Vietnam';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6M297'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Henicorhynchus_siamensis'; % Wikipedia
metaData.links.id_ADW = 'Henicorhynchus_siamensis'; % ADW
metaData.links.id_Taxo = '176477'; % Taxonomicon
metaData.links.id_WoRMS = '1014537'; % WoRMS
metaData.links.id_fishbase = 'Henicorhynchus-siamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Henicorhynchus_siamensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Henicorhynchus-siamensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SuvaLek2010'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1439-0426.2010.01619.x}, ' ...
'author = {Suvarnaraksha, A. and Lek, S. and Lek-Ang, S. and Jutagate, T.}, ' ...
'year = {2010}, ' ...
'title  = {Life history of the riverine cyprinid \emph{Henicorhynchus siamensis} ({S}auvage, 1881) in a small reservoir}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {27(4)}, ' ...
'pages = {995–1000}'];
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

