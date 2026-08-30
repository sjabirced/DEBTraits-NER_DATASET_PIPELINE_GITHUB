  function [data, auxData, metaData, txtData, weights] = mydata_Hypophthalmus_marginatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Hypophthalmus_marginatus'; 
metaData.species_en = 'Mapara'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 56;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 110;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00490*Lp^3.09, see F1';
data.Wwi = 1236;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.09, see F1; max published weight  506 g';

data.Ri = 41616/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 22.3
    2 35.1
    3 42.5
    4 46.8
    5 49.3
    6 50.7];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CutrBati2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
F2= 'South America: Amazon and Orinoco River basins and major rivers of French Guiana and Suriname';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N35L'; % Cat of Life
metaData.links.id_ITIS = '681485'; % ITIS
metaData.links.id_EoL = '356804'; % Ency of Life
metaData.links.id_Wiki = 'Hypophthalmus_marginatus'; % Wikipedia
metaData.links.id_ADW = 'Hypophthalmus_marginatus'; % ADW
metaData.links.id_Taxo = '177143'; % Taxonomicon
metaData.links.id_WoRMS = '1022291'; % WoRMS
metaData.links.id_fishbase = 'Hypophthalmus_marginatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hypophthalmus_marginatus}}';  
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
bibkey = 'CutrBati2005'; type = 'Article'; bib = [ ...
'doi = {10.1590/S0044-59672005000100013}, ' ...
'author = {Leocy Cutrimi and Vandick da Silva Batista}, ' ...
'year = {2005}, ' ...
'title = {Age and growth of mapar\''{a} (\emph{Hypophthalmus marginatus}) in the {C}entral {A}mazon}, ' ... 
'journal = {Acta Amazonica}, ' ...
'volume = {35(1)}, '...
'pages = {85-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypophthalmus_marginatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

