function [data, auxData, metaData, txtData, weights] = mydata_Bothus_constellatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Bothidae';
metaData.species    = 'Bothus_constellatus'; 
metaData.species_en = 'Pacific eyed flounder'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'Data for B. mancus';
data.am = 6*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10.1;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 15.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on GSI*Wwi/2.5e6, where 2.5e6 is fecundity of B. mancus, see F3';
data.Wwp = 11.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^3.04, see F1';
data.Wwi = 45.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.04, see F1';
  
data.GSI  = 0.029; units.GSI  = 'g/g'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'TapiGarc2000';   
  temp.GSI = C2K(24);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (mnth), total length (cm)
 0	5.831
 3	6.896
 5	7.337
 8	7.882
11	8.807
15	8.453
17	9.067
20	9.924
23 10.642
27 12.364
37 13.241
41 14.406];
data.tL(:,1) = 30.5 * (30 + data.tL(:,1)); 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(24); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TapiGarc2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Western Pacific: New Zealand and the Mangareva and Gambier Islands. Eastern Pacific: Bahia Magdalena (Baja California Sur, Mexico) and the Gulf of California to Peru, including the Galapagos Islands';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '68QJB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46569789'; % Ency of Life
metaData.links.id_Wiki = 'Bothus_constellatus'; % Wikipedia
metaData.links.id_ADW = 'Bothus_constellatus'; % ADW
metaData.links.id_Taxo = '164435'; % Taxonomicon
metaData.links.id_WoRMS = '274183'; % WoRMS
metaData.links.id_fishbase = 'Bothus-constellatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bothus_constellatus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bothus-constellatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TapiGarc2000'; type = 'Article'; bib = [ ... 
'author = {M. Tapia-Garc\''{i}a and M. C. Garc\''{i}a-Abad and G. Cerdenares Ladr\''{o}n de Guevara}, ' ... 
'year = {2000}, ' ...
'title = {Reproduction, distribution and abundance of Bothus constellatus ({P}isces: {B}othidae), in the {G}ulf of {T}ehuantepec, {M}exico}, ' ...
'journal = {Rev. biol. trop.}, ' ...
'volume = {48(1)}, ' ...
'pages = {403--411}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
