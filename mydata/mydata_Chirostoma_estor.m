function [data, auxData, metaData, txtData, weights] = mydata_Chirostoma_estor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Chirostoma_estor'; 
metaData.species_en = 'Pike silverside'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 24];

%% set data
% zero-variate data

data.ab = 13;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temerature is guessed';
data.am = 8*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'DelgMart2012'; 
data.Li  = 42;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.6 mm of  Leuresthes_tenuis : pi/6*0.16^3';
data.Wwp = 11.9; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'DelgMart2012','fishbase'};
  comment.Wwp = 'based on 0.00550*Lp^3.09, see F1';
data.Wwi = 570; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.09, see F1; max. published weight: 540 g';
  
data.GSI = 0.139; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';  bibkey.GSI = 'guess';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Chirostoma_attenuatum';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
  0.423	1.268
 29.963	1.764
 59.499	2.331
 90.479	3.109
119.509	4.134
149.023	5.158
180.476	6.183
209.507	7.172
239.028	8.056
299.544	9.401];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DelgMart2012';

% time-weight
data.tW = [ ... time since birth (d), weight (g)
119.433	0.543
150.126	0.883
179.363	1.392
209.778	2.174
239.913	3.328
270.069	5.128
300.549	7.913];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'}; 
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DelgMart2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.tW = weights.tW * 10;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00550*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Central America: endemic to the Lerma River basin, Mexico';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5Y5SW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Chirostoma'; % Wikipedia
metaData.links.id_ADW = 'Chirostoma_estor'; % ADW
metaData.links.id_Taxo = '192528'; % Taxonomicon
metaData.links.id_WoRMS = '1014846'; % WoRMS
metaData.links.id_fishbase = 'Chirostoma-estor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chirostoma_estor}}'];
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
bibkey = 'DelgMart2012'; type = 'article'; bib = [ ...
'author = {Ana Carmen Delgadillo-Calvillo and Carlos Antonio Mart\''{i}nez-Palacios and Jos\''{e} Manuel Berruecos-Villalobos and Ra\''{u}l Ulloa-Arvizu and Reyes L\''{o}pez-Ordaz and Carlos Gustavo V\''{a}squez-Pel\''{a}ez}, ' ... 
'year = {2012}, ' ...
'title = {Characterization of the growth curve in two species of silverside \emph{Chirostoma estor}, \emph{C. promelas} and their hybrids}, ' ...
'journal = {Vet. M\''{e}x.}, ' ...
'volume = {43(2)}, ' ...
'pages = {113-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Chirostoma-estor.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

