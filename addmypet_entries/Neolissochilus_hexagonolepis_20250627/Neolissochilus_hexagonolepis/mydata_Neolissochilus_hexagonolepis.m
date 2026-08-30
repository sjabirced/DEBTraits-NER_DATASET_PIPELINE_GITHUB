  function [data, auxData, metaData, txtData, weights] = mydata_Neolissochilus_hexagonolepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Neolissochilus_hexagonolepis'; 
metaData.species_en = 'Copper mahseer'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 27];

%% set data
% zero-variate data
data.ab = 19;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 120;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JohaNeg2003';
  comment.Wwb = 'Based on egg diameter of 2-2.5 mm: pi/6*0.225^3';
data.Wwp = 126.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.02, see F1';
data.Wwi = 18.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.02, see F1; max. published weight: 11.0 kg';

data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'SarmSanw2015';
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length-weight
data.tLW = [ ... % time (mnth), total length (cm), wet weight (g)
    1  2.917  0.17
    2  3.747  0.50
    3  7.390  3.72
    4  8.563  6.00
    5  9.367  7.50
    6 12.103 16.17
    7 12.540 17.19
    8 16.733 43.27
    9 21.043 71.01];
data.tLW(:,1) = 30.5 * (0 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time', 'total length', 'weight'};  
temp.tLW = C2K(23);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SarmSanw2015'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.00977*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Asia: India, Bangladesh, Nepal, Myanmar, Thailand, Malaysia, Indonesia and China. Also in Bhutan, Pakistan and Viet Nam';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '46L3Q'; % Cat of Life
metaData.links.id_ITIS = '689496'; % ITIS
metaData.links.id_EoL = '344832'; % Ency of Life
metaData.links.id_Wiki = 'Neolissochilus_hexagonolepis'; % Wikipedia
metaData.links.id_ADW = 'Neolissochilus_hexagonolepis'; % ADW
metaData.links.id_Taxo = '483524'; % Taxonomicon
metaData.links.id_WoRMS = '1022528'; % WoRMS
metaData.links.id_fishbase = 'Neolissochilus_hexagonolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neolissochilus_hexagonolepis}}';  
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
bibkey = 'SarmSanw2015'; type = 'article'; bib = [ ... 
'doi = {10.15512/joeoh/2015/v15i1&2/91185}, ' ...
'author = {Debajit Sarma and Suman Sanwa and, Partha Das and M. S. Akhtar}, ' ...
'year = {2015}, ' ...
'title = {Ontogeny in Feeding Behaviour of Chocolate Mahseer, \emph{Neolissocheilus hexagonolepis} in Captive Environment}, ' ... 
'journal = {J. Ecophysiol. Occup. Hlth.}, ' ...
'volume = {15(1,2)}, ' ...
'pages = {23–30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Neolissochilus_hexagonolepis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

