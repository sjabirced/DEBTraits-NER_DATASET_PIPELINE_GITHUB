function [data, auxData, metaData, txtData, weights] = mydata_Chirostoma_promelas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Chirostoma_promelas'; 
metaData.species_en = 'Blacknose silverside'; 

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

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temerature is guessed';
data.am = 8*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 31.7;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'guess';
  comment.Li = 'based on Li for Chirostoma_estor and length-ratio at 300 d:  42*71/94';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.6 mm of  Leuresthes_tenuis : pi/6*0.16^3';
data.Wwp = 19; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'DelgMart2012','fishbase'};
  comment.Wwp = 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 366; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';
  
data.GSI = 0.139; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Chirostoma_attenuatum';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
  0.000	1.101
 29.612	1.510
 59.709	2.045
 89.806	2.706
119.903	3.462
151.942	4.280
181.553	5.098
209.223	5.822
240.291	6.357
300.485	7.112];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DelgMart2012';

% time-weight
data.tW = [ ... time since birth (d), weight (g)
120.011	0.340
148.945	0.509
179.346	0.849
210.040	1.223
240.455	2.004
270.004	3.125
300.153	4.721];
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
F1 = 'length-weight: WW in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Central America: endemic to the Lerma River basin, Mexico';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5Y5SR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1157372'; % Ency of Life
metaData.links.id_Wiki = 'Chirostoma'; % Wikipedia
metaData.links.id_ADW = 'Chirostoma_promelas'; % ADW
metaData.links.id_Taxo = '170876'; % Taxonomicon
metaData.links.id_WoRMS = '1018996'; % WoRMS
metaData.links.id_fishbase = 'Chirostoma-promelas'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chirostoma_promelas}}'];
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
'howpublished = {\url{https://www.fishbase.de/summary/Chirostoma-promelas.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

