  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_boggut

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_boggut'; 
metaData.species_en = 'Boggut labeo'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L_f'}; 

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
data.ab = 6;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 29;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm for Cirrhinus cirrhosus: pi/6*0.1^3';
data.Wwp = 16;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00832*Lp^3.04, see F1';
data.Wwi = 232;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.04, see F1';
    
data.GSI = 0.36; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'SarkKuma2012';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 10.05  9.93
2 14.85 14.40
3 20.40 23.30]; 
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SarkKuma2012'; treat.tL = {1 {'Betwa River','Ken River'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;
weights.ab = weights.ab * 0;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.00832*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Pakistan, India and Bangladesh';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3RHTJ'; % Cat of Life
metaData.links.id_ITIS = '689270'; % ITIS
metaData.links.id_EoL = '1012933'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_boggut'; % Wikipedia
metaData.links.id_ADW = 'Labeo_boggut'; % ADW
metaData.links.id_Taxo = '177878'; % Taxonomicon
metaData.links.id_WoRMS = '1022521'; % WoRMS
metaData.links.id_fishbase = 'Labeo-boggut'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_boggut}}';  
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
bibkey = 'SarkKuma2012'; type = 'techreport'; bib = [ ... 
'author = {U. K. Sarkar and R. S. Kumar and V. K. Dubey and A. Pandey and W. S. Lakra}, ' ... 
'year = {2012}, ' ...
'title = {Population structure and reproductive biology of a freshwater ﬁsh, \emph{Labeo boggut} ({S}ykes, 1839), from two perennial rivers of {Y}amuna basin}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {28}, ' ...
'pages = {107–115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-boggut.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

