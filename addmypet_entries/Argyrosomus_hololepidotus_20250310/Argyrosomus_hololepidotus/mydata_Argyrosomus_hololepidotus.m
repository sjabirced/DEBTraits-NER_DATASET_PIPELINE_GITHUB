function [data, auxData, metaData, txtData, weights] = mydata_Argyrosomus_hololepidotus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Argyrosomus_hololepidotus'; 
metaData.species_en = 'Southern meagre'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 10];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(25.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25.9);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 75.4;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Smal1985'; 
data.Li  = 200;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwp = 3.1e3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'Smal1985','fishbase'};
  comment.Wwp = 'based on 0.00562*Lp^3.06, see F1';
data.Wwi = 61.8e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.06, see F1; max published weight 71 kg';

data.GSI  = 0.06; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'Smal1985';   
  temp.GSI = C2K(25.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1  23   120
    2  44   780
    3  62  2280
    4  77  4360
    5  90  6970
    6 102  9800
    7 112 12700
    8 120 15840
    9 128 18770
   10 134 21800
   11 139 24340
   12 144 26900];
data.tLW(:,1) = 365 * (data.tLW(:,1) + 0.7);  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(25.9);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'WallSchl1979'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.weights = weights;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
% set2 = {'tWw_15_1', 'tWw_15_2', 'tWw_15_3', 'tWw_15_4'}; subtitle2 = {'HCMR cages 1,2,3 and 4 at varying temperatures (year 2015)'};
% set3 = {'tWw_13_1', 'tWw_13_2'}; subtitle3 = {'HCMR cages 1 and 2 at varying temperatures (year 2013)'};
% metaData.grp.sets = {set1,set2,set3};
% metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.00562*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'GKHX'; % Cat of Life
metaData.links.id_ITIS = '646511'; % ITIS
metaData.links.id_EoL = '46578923'; % Ency of Life
metaData.links.id_Wiki = 'Argyrosomus_hololepidotus'; % Wikipedia
metaData.links.id_ADW = 'Argyrosomus_hololepidotus'; % ADW
metaData.links.id_Taxo = '161636'; % Taxonomicon
metaData.links.id_WoRMS = '218632'; % WoRMS
metaData.links.id_fishbase = 'Argyrosomus-hololepidotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrosomus_hololepidotus}}';
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
bibkey = 'WallSchl1979'; type = 'Article'; bib = [ ...
'doi = {10.1080/00359197909520076}, ' ...
'author = {Wallace, J. H. and Schleyer, M. H.}, ' ... 
'year = {1979}, ' ...
'title = {AGE DETERMINATION IN TWO IMPORTANT SPECIES OF {S}OUTH {A}FRICAN ANGLING FISHES THE KOB (ARGYROSOMUS HOLOLEPIDOTUS LACEP.) AND THE SPOTTED GRUNTER (\emph{Pomadasys commersonnii} {L}ACEP.)}, ' ...
'journal = {Transactions of the Royal Society of South Africa}, ' ...
'volume = {44(1)}, ' ...
'pages = {15–26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smal1985'; type = 'Article'; bib = [ ...
'doi = {10.2989/025776185784461199}, ' ...
'author = {Smale, M. J.}, ' ... 
'year = {1985}, ' ...
'title = {Aspects of the biology of \emph{Argyrosomus hololepidotus} and \emph{Atractoscion aequidens} ({O}steichthyes: {S}ciaenidae) in waters of the south-eastern {C}ape, {S}outh {A}frica}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {3(1)}, ' ...
'pages = {63–75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Argyrosomus-hololepidotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
