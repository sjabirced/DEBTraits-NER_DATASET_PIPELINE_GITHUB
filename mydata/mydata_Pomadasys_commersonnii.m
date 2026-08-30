function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_commersonnii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_commersonnii'; 
metaData.species_en = 'Smallspotted grunter'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW','MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

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

data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(26.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'WallSchl1979';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 38; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on Pomadasys maculatus';
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 872; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01905*Lp^2.95, see F1';
data.Wwi = 7835; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^2.95, see F1';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    3 39  799
    4 49 1300
    5 56 2000
    6 62 2700
    7 67 3400
    8 71 4000
    9 74 4600
   10 77 5200];
data.tLW(:,1) = 365 * (data.tLW(:,1) + 0.7);  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(26.8);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'WallSchl1979'; treat.tLW = {1 {'length','weight'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    53.7 214510
    54.0 268054
    54.1 511903
    54.2 301983
    54.6 477831
    54.7 481266
    55.6 504679
    55.6 445305
    57.7 487543 
    62.1 694840 
    66.5 402950 
    67.0 398738 
    69.0 458495 
    70.3 767546 
    71.2 557105 
    71.7 894505 
    72.0 495564 
    72.5 630420 
    78.4 1281300 
    78.5 1421520];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(26.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AlNaAlMa1979'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
weights.ab = 0 * weights.ab;
%weights.Wwi = 0 * weights.Wwi;
%weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01905*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQKY'; % Cat of Life
metaData.links.id_ITIS = '630243'; % ITIS
metaData.links.id_EoL = '46578436'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys_commersonnii'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_commersonnii'; % ADW
metaData.links.id_Taxo = '184485'; % Taxonomicon
metaData.links.id_WoRMS = '218563'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-commersonnii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys_commersonnii}}';
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
bibkey = 'AlNaAlMa1979'; type = 'Article'; bib = [ ...
'doi = {10.1080/00359197909520076}, ' ...
'author = {A. Al-Nahdi and A. Al-Marzouqi and N. Jayabalan and S. Al-Habsi}, ' ... 
'year = {1979}, ' ...
'title = {MATURATION AND SPAWNING OF THE SMALLSPOTTED GRUNT \emph{Pomadasys commersonnii} ({L}ACEP\`{e}DE, 1801) IN THE {A}RABIAN {S}EA OFF {O}MAN}, ' ...
'journal = {Thalassas}, ' ...
'volume = {27(1)}, ' ...
'pages = {67-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-commersonnii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
