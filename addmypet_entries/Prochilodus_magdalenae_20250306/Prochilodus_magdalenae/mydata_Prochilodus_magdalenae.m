  function [data, auxData, metaData, txtData, weights] = mydata_Prochilodus_magdalenae
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Prochilodontidae';
metaData.species    = 'Prochilodus_magdalenae'; 
metaData.species_en = 'Magdalena River prochilodus'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 06];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'MendPert2021';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 51;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JaraJime2008';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 241;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01862*Lp^2.96, see F1';
data.Wwi = 2110;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^2.96, see F1, max published weight 905 g';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since hatch (yr), total length (cm), weight (g)
 1	11.753  20.453
 2	15.297  41.772
 3	16.588  58.184
 4	18.186  74.602
 5	19.630 102.452
 6	21.541 131.103
 7	21.272 127.931
 8	21.627 126.393
 9	21.670 134.647
10	22.259 149.431];
data.tLW(:,1) = (.8 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(24.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
  treat.tLW = {1, {'length','weight'}};
bibkey.tLW = 'MendPert2021';

% length-weight-fecundity
data.LN = [ ... % total length (cm), weight (g), fecundity (#)
34.5 111989
34.6 120004
31.4 105456
34.3 116873
38.7 125720
33.3 115321
31.0 121357
30.5 115352
36.6 154965
27.0  62528
30.3 116714
32.0  87450
30.0  85277
31.0 100601];
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.WN = 'temperature';
bibkey.LN = 'DoriEspi2021'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MN8J'; % Cat of Life
metaData.links.id_ITIS = '641605'; % ITIS
metaData.links.id_EoL = '994607'; % Ency of Life
metaData.links.id_Wiki = 'Prochilodus_magdalenae'; % Wikipedia
metaData.links.id_ADW = 'Prochilodus_magdalenae'; % ADW
metaData.links.id_Taxo = '184789'; % Taxonomicon
metaData.links.id_WoRMS = '1015065'; % WoRMS
metaData.links.id_fishbase = 'Prochilodus-magdalenae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Prochilodus_magdalenae}}';  
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
bibkey = 'MendPert2021'; type = 'Article'; bib = [ ...
'doi = {10.22579/20112629.706}, ' ...
'author = {Lu\''{i}s C. Mendoza1 and Vicente Pertuz-Buelvas and Jos\''{e} Espinosa-Araujo and V\''{i}ctor J. Atencio-Garc\''{i}a  and Martha J. Prieto-Guevara}, ' ...
'year = {2021}, ' ...
'title = {Potential of the bocachico Prochilodus magdalenae culture with biofloc technology}, ' ... 
'journal = {Orinoquia}, ' ...
'volume = {25(2)}, '...
'pages = {25-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JaraJime2008'; type = 'Article'; bib = [ ...
'doi = {10.22579/20112629.706}, ' ...
'author = {Ursula Jaramillo-Villa and Luz F. Jim\''{e}nez-Segura}, ' ...
'year = {2008}, ' ...
'title = {SOME BIOLOGICAL ASPECTS OF \emph{Prochilodus magdalenae} POPULATION IN {T}UMARAD\''{o} FLOODPLAIN LAGOONS ({A}TRATO {R}IVER), {C}OLOMBIA}, ' ... 
'journal = {Actual Biol.}, ' ...
'volume = {30(88)}, '...
'pages = {55-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DoriEspi2021'; type = 'Article'; bib = [ ...
'doi = {10.15446/abc.v26n1.82907}, ' ...
'author = {Mar\''{i}a Alejandra Doria-Gonz\''{a}lez and Andrea Marcela Espitia-Galvis and Fredys F. Segura-Guevara and Charles W. Olaya-Nieto}, ' ...
'year = {2021}, ' ...
'title = {Reproductive biology of Bocachico \emph{Prochilodus magdalenae} ({P}rochilodontidae) in the {S}an {J}orge {R}iver, {C}olombia}, ' ... 
'journal = {Acta Biol. Colomb.}, ' ...
'volume = {26(1)}, '...
'pages = {54-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Prochilodus-magdalenae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

