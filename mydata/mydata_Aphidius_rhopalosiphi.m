function [data, auxData, metaData, txtData, weights] = mydata_Aphidius_rhopalosiphi

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hymenoptera'; 
metaData.family     = 'Braconidae';
metaData.species    = 'Aphidius_rhopalosiphi';
metaData.species_en = 'Aphid parasitic wasp'; 

metaData.ecoCode.climate = {'C','D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTi','0iTs','0iTg'};
metaData.ecoCode.embryo  = {'Ta'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beTii','eiHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ae'; 'Wdj'; 'Wwj'; 'Le'; 'Wde'; 'Wwe'; 'Ww0'; 'JCe'; 'Ni'; 'am'};
metaData.data_1     = {'T-aj'; 'T-ae'; 't-Ww'; 'T-N'; 't-N'; 'X-N'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Josef Koch','Kim Rakel','Heike Fremdt','Daniela Jans','Andre Gergs','Thomas Preuss'};         
metaData.date_subm = [2025 05 23];
metaData.email    = {'koch@gaiac-eco.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};   

metaData.curator     = {'Bas Kooijman'}; 
metaData.email_cur   = {'bas.kooijman@vu.nl'};  
metaData.date_acc    = [2025 05 24]; 

%% set data
% zero-variate data

%------ MuraLann2004

% host: Sitobion avenae on winter wheat
data.ab = 3.5;  units.ab = 'd';  label.ab = 'age at birth';  bibkey.ab = 'MuraLann2004';
  temp.ab = C2K(19.5);  units.temp.ab = 'K';  label.temp.ab = 'temperature';
  comment.ab = 'teratocytes released in host after 3-4 days';
  
%------ FuenPowe1996 & FuenNiem1998

% host: Sitobion avenae on various wheat and oat cultivars (averaged)
data.aj = 7.18;  units.aj = 'd';  label.aj = 'age at mummification';  bibkey.aj = {'FuenPowe1996', 'FuenNiem1998'};
  temp.aj = C2K(23);  units.temp.aj = 'K';  label.temp.aj = 'temperature';

% host: Sitobion avenae on various wheat and oat cultivars (averaged)
data.te = 4.55;  units.te = 'd';  label.te = 'time from mummy to emergence';  bibkey.te = {'FuenPowe1996', 'FuenNiem1998'};
  temp.te = C2K(23);  units.temp.te = 'K';  label.temp.te = 'temperature';
  
%------ LegrVern2004
  
% host: Sitobion avenae on winter wheat
data.ae = 43.9;  units.ae = 'd';  label.ae = 'age at emergence';  bibkey.ae = 'LegrVern2004';
  temp.ae = C2K(10);  units.temp.ae = 'K';  label.temp.ae = 'temperature';

% host: Sitobion avenae on winter wheat
data.Wdj = 0.16/ 1000;  units.Wdj = 'g';  label.Wdj = 'dry mass of mummy';  bibkey.Wdj = 'LegrVern2004';
  comment.Wdj = 'cocoon weight included; males and females mixed';

% host: Sitobion avenae on winter wheat
data.Wwj = 0.42/ 1000;  units.Wwj = 'g';  label.Wwj = 'fresh mass of mummy';  bibkey.Wwj = 'LegrVern2004';
  comment.Wwj = 'cocoon weight included; males and females mixed';

%------ LannWard2011

% % host: Sitobion avenae on winter wheat
% data.Wwe10 = 0.29/ 1e3;  units.Wwe10 = 'g';  label.Wwe10 = 'female wet weight at emergence';  bibkey.Wwe10 = 'LannWard2011';
%   comment.Wwe10 = 'N = 40; 10 C; potentially adverse effect of temperature on food?';

% % host: Sitobion avenae on winter wheat
% data.Wwe15 = 0.24/ 1e3;  units.Wwe15 = 'g';  label.Wwe15 = 'female wet weight at emergence';  bibkey.Wwe15 = 'LannWard2011';
%   comment.Wwe15 = 'N = 40; 15 C; potentially adverse effect of temperature on food?';

% % host: Sitobion avenae on winter wheat
% data.Wwe20 = 0.19/ 1e3;  units.Wwe20 = 'g';  label.Wwe20 = 'female wet weight at emergence';  bibkey.Wwe20 = 'LannWard2011';
%   comment.Wwe20 = 'N = 40; 20 C; potentially adverse effect of temperature on food?';

% % host: Sitobion avenae on winter wheat
% data.Wwe25 = 0.14/ 1e3;  units.Wwe25 = 'g';  label.Wwe25 = 'female wet weight at emergence';  bibkey.Wwe25 = 'LannWard2011';
%   comment.Wwe25 = 'N = 40; 25 C; potentially effect of temperature on food?';

% host: Sitobion avenae on winter wheat
data.Wwe = 0.22/ 1e3;  units.Wwe = 'g';  label.Wwe = 'female wet weight at emergence';  bibkey.Wwe = 'LannWard2011';
  comment.Wwe = 'N = 160; mean of four temperature treatments at 10, 15, 20, 25 C';

%------ LannViss2012
 
% host: Sitobion avenae on winter wheat
data.Ww0 = 2.03E-05/ 1000;  units.Ww0 = 'g';  label.Ww0 = 'wet weight of an egg';  bibkey.Ww0 = 'LannViss2012';
  comment.Ww0 = 'N = 42; based on volumetric estimate and an assumed wet weight density of 1 g/mL';  

% host: Sitobion avenae on winter wheat
data.Wdj2 = 0.118/ 1000;  units.Wdj2 = 'g';  label.Wdj2 = 'dry mass of mummy';  bibkey.Wdj2 = 'LannViss2012';
  comment.Wdj2 = 'N = 17; cocoon weight included; males and females mixed';

% host: Sitobion avenae on winter wheat
data.Wde = 180.5/ 1e6;  units.Wde = 'g';  label.Wde = 'female dry weight at emergence';  bibkey.Wde = 'LannViss2012';
  comment.Wde = 'N = 14; same study reports 90.1 mug for males and females mixed (N = 51)';

% host: Sitobion avenae on winter wheat
data.JCe = 0.41;  units.JCe = 'muL CO2 /h';  label.JCe = 'mean basal metabolic rate';
  bibkey.JCe = 'LannViss2012';  temp.JCe = C2K(20);  units.temp.JCe = 'K'; label.temp.JCe = 'temperature';
  comment.JCe = 'N = 26';
  
%------ ShirCart1983
  
% host: Sitobion avenae on winter wheat
data.Ni = 392.21;  units.Ni = '#';  label.Ni = 'total number of deposited eggs';  bibkey.Ni = 'ShirCart1983';

% host: Sitobion avenae on winter wheat
data.Nih = 256.59;  units.Nih = '#';  label.Nih = 'total number of hatched eggs';  bibkey.Nih = 'ShirCart1983';

% host: Sitobion avenae on winter wheat
data.am = 13.1;  units.am = 'd';  label.am = 'life span as imago';  bibkey.am = 'ShirCart1983';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fed with honey solution';
  
%------ CoheJons2005

% host: Sitobion fragariae/avenae and Metopolophium albidum (pooled data)
data.Le = 0.211;  units.Le = 'cm';  label.Le = 'female length at emergence';  bibkey.Le = 'CoheJons2005';
  comment.Le = 'N = 40; measured from the front of the head to the end of abdomen';
  
%------ BAYER standard test data (N = 374)

% host: Rhopalosiphum padi
data.N24h = 26.92;  units.N24h = '#';  label.N24h = 'aphids parasitized in 24 h';  bibkey.N24h = 'Baye2024';
temp.N24h = C2K(20.4); units.temp.N24h = 'K'; label.temp.N24h = 'temperature';
 comment.N24h = 'N = 374; mean of control data from standard ecotoxicity tests';
  
% uni-variate data

% time - wet weight (based on volumetric estimates from microscopy figures)
% host: Sitobion avenae on winter wheat
tWw = [  ... % time since oviposision (d), larva width (mum), larva side view area (mum^2)
    4	120.760	63899.760 % first instar
    6	327.984	463816.644 % early second instar
%     6	578.300	1178493.924 % late second instar (seems unrealistic; scale in micrograph incorrect?)
    7	490.599	861281.595]; % third instar
t = tWw(:,1); % d, time since oviposision
width = tWw(:,2); % mum, larva width obtained from micrographs using ImageJ
area = tWw(:,3); % mum^2, larva side view area obtained from micrographs using ImageJ
height = area./width; % mum, height if area is reshaped into a rectangle
volume = height .* pi .* (width./ 2).^2 ./ 1000^3; % mm^3, volume assuming a cylinder with h = height and r = width/2
Ww = volume./ 1000; % g, wet weight assuming a wet weight density of 1g/mL
data.tWw = [t, Ww];
units.tWw = {'d', 'g'};  label.tWw = {'time since oviposition', 'wet weight'};
temp.tWw = C2K(19.5);  units.temp.tWw = 'K';  label.temp.tWw = 'temperature';  comment.tWw = 'based on microscopy figures 1A, 2A, 2D, 3A';
bibkey.tWw = 'MuraLann2004';

% temperature - mean age at mummification
% host: Sitobion avenae on winter wheat
data.Taj = [ ... % temperature (C), median age at mummification (d), mean age at mummification (d)
    8	23	23.5
    12	16	15.8
    16	11	10.5
    20	8	7.9
    25	6	6.7];
data.Taj = data.Taj(:,[1 3]); % use either mean [1 3] or median [1 2]
units.Taj = {'C', 'd'};  label.Taj = {'temperature', 'larval development time', 'Sigs2000'};
bibkey.Taj = 'Sigs2000';

% temperature - mean time from mummy to imago
% host: Sitobion avenae on winter wheat
data.Tte = [ ... % temperature (C), median time from mummy to imago (d), mean time from mummy to imago (d)
    8	21	24.4
%     12	14	42.8 % clear outlier
    16	9	16.9
    20	5	6.7
    25	4	4.6];
data.Tte = data.Tte(:,[1 3]); % use either mean [1 3] or median [1 2]
units.Tte = {'C', 'd'};  label.Tte = {'temperature', 'pupal development time', 'Sigs2000'};
bibkey.Tte = 'Sigs2000';

% temperature - parasitization rate
% host: Sitobion avenae on winter wheat
data.TN5h = [ ... % temperature (C), fraction of 100 aphids successfully parasitized in 5 h by 5 females (-)
    8	0.02
    12	0.23
    16	0.18
    20	0.31
    25	0.41];
data.TN5h(:,2) = (-(-data.TN5h(:,2)+1).^(1/5)+1) * 100 ; % calculate back to single female and scale to 100 aphids
units.TN5h = {'C', '#'};  label.TN5h = {'temperature', 'aphids parasitized in 5 h'};
bibkey.TN5h = 'Sigs2000';
comment.TN5h = '100 aphids offered';

% temperature - mean age at mummification (different study)
% host: Sitobion avenae on winter wheat
data.Taj2 = [ ... % temperature (C), mean age at mummification (d)
    10	22.1
    15	14.6
    20	9.6
    25	7.4];
units.Taj2 = {'C', 'd'};  label.Taj2 = {'temperature', 'larval development time', 'LannWard2011'};
bibkey.Taj2 = 'LannWard2011';

% temperature - mean time from mummy to imago (different study)
% host: Sitobion avenae on winter wheat
data.Tte2 = [ ... % temperature (C), mean time from mummy to imago (d)
    10	20.0
    15	7.1
    20	4.9
    25	4.7];
units.Tte2 = {'C', 'd'};  label.Tte2 = {'temperature', 'pupal development time', 'LannWard2011'};
bibkey.Tte2 = 'LannWard2011';

% host density - parasitization rate
% host: Sitobion avenae on winter wheat
data.XN24h =  [... % number of aphids offered (#), number of aphids successfully parasitized in 24 h (#)
    5	1.7
    10	2.2
    20	4.2
    40	25.0
    100	46.7];
units.XN24h   = {'#', '#'};  label.XN24h = {'aphids offered', 'aphids parasitized in 24 h'};
temp.XN24h    = C2K(18);  units.temp.XN24h = 'K'; label.temp.XN24h = 'temperature';
bibkey.XN24h = 'ShirCart1983';
comment.XN24h = 'parasitization rate of 1 female (2-5 d old) offered different numbers of aphids for 24 h';

% time - cumulative parasitization
% host: Sitobion avenae on winter wheat
data.tN =  [... % time since emergence (d), repro rate (successfully parasitized aphids/d),
    1	19.00
    2	16.22
    3	22.31
    4	20.44
    5	24.56
    6	23.33
    7	24.14
    8	15.86
    9	19.54
    10	12.33
    11	12.36
    12	17.44
    13	12.11
    14	5.75
    15	3.50
    16	1.57
    17	0.74
    18	1.10
    19	0.86
    20	0.86
    21	0.86
    22	0.86
    23	0.86
    24	0.00];
data.tN(:,2) = cumsum(data.tN(:,2)); % cumulative reproduction
units.tN   = {'d', '#'};  label.tN = {'time since emergence', 'aphids parasitized'};
temp.tN    = C2K(18);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'ShirCart1983';
comment.tN = 'average repro rate of 17 females (sample size declining over time due to mortality) offered 40 aphids per day';

%% set weights for all real data
weights = setweights(data, []);
weights.TN5h = 0 * weights.TN5h; % These data are slightly inconsistent with the XN24h data and lead to a distortion in the doese response curve 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was financially supported by Bayer AG';

%% Group plots
set1 = {'Taj', 'Taj2'}; subtitle1 = {'Data for two different studies'};
set2 = {'Tte', 'Tte2'}; subtitle2 = {'Data for two different studies'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'E_Hb is assumed when cellular trophamnion disappears and teratocytes are released into host';
D2 = 'Different f values may be needed to account for different food qualities of different host aphids';
D3 = 'Mummy is treated like pupa in other insects';
D4 = 'Weight of the mummy is entirely attributed to the wasp (weight of the cocoon shell is neglected)';
D5 = 'No investment in reproduction buffer after emergence';
D6 = 'Assimilation by imago is assumed to cover maintenance costs';
D7 = 'As a consequence, the scaled reserve density remains constant at e_e';
D8 = 'Parasitization over time was modeled using a linear phase followed by a decline phase';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D6, 'D6',D5, 'D7',D7, 'D8',D8);

%% Facts
F1 = 'A. rhopalosiphi is a koinobiont; host aphids continue to move and grow for multiple days after parasitization';
metaData.bibkey.F1 = 'LannViss2012';
F2 = 'A. rhopalosiphi develops through three larval stages inside the host aphid';
metaData.bibkey.F2 = 'MuraLann2004'; 
F3 = 'Later, the aphid turns into an immobile mummy containing the nymphal parasitoid';
metaData.bibkey.F3 = 'LannViss2012';
F4 = 'After emergence, Aphidius parasitoids feed on sugar sources like nectar and honeydew';
metaData.bibkey.F4 = 'LuquPena2021';
F5 = 'The wasp imagos are not able to synthesize lipids';
metaData.bibkey.F5 = 'LannViss2012';                                               
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);

%% Links
metaData.links.id_CoL = 'FDDR'; % Cat of Life
metaData.links.id_ITIS = '1185046'; % ITIS
metaData.links.id_EoL = '3772845'; % Ency of Life
metaData.links.id_Wiki = 'Aphidius'; % Wikipedia
metaData.links.id_ADW = 'Aphidius_rhopalosiphi'; % ADW
metaData.links.id_Taxo = '2907693'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Aphidius}}';
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
bibkey = 'ShirCart1983'; type = 'Article'; bib = [ ... 
'author = {Shirota, Y. and Carter, N. and Rabbinge, R. and Ankersmit, G.W.}, ' ... 
'year = {1983}, ' ...
'title = {Biology of \emph{Aphidius rhopalosiphi}, A parasitoid of cereal aphids}, ' ...
'journal = {Entomologia Experimentalis et Applicata}, ' ...
'volume = {34}, ' ...
'pages = {27-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sigs2000'; type = 'Article'; bib = [ ... 
'author = {Sigsgaard, L.}, ' ... 
'year = {2000}, ' ...
'title = {The temperature-dependent duration of development and parasitism of three cereal aphid parasitoids, \emph{Aphidius ervi}, \emph{A. rhopalosiphi}, and \emph{Praon volucre}}, ' ...
'journal = {Entomologia Experimentalis et Applicata}, ' ...
'volume = {95}, ' ...
'pages = {173-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuraLann2004'; type = 'Article'; bib = [ ... 
'author = {Muratori, F. and Le Lannic, J. and Nenon, J.-P. and Hance, T.}, ' ... 
'year = {2004}, ' ...
'title = {Larval morphology and development of \emph{Aphidius rhopalosiphi} ({H}ymenoptera: {B}raconidae: {A}phidiinae)}, ' ...
'journal = {The Canadian Entomologist}, ' ...
'volume = {136}, ' ...
'pages = {169-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LegrVern2004'; type = 'Article'; bib = [ ... 
'author = {Legrand, M.-A. and Vernon, P. and Krespi, L. and Hance, T.}, ' ... 
'year = {2004}, ' ...
'title = {Morphological and physiological differences between mummy colour morphs of \emph{Aphidius rhopalosiphi} ({H}ymenoptera: {B}raconidae): {A}n adaptation to overwintering}, ' ...
'journal = {Belgian Journal of Zoology}, ' ...
'volume = {134}, ' ...
'pages = {9-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CoheJons2005'; type = 'Article'; bib = [ ... 
'author = {Cohen, J.E. and Jonsson, T. and  Muller, C.B. and Godfray, H.C.J. and Savage, V.M.}, ' ... 
'year = {2005}, ' ...
'title = {Body sizes of hosts and parasitoids in individual feeding relationships}, ' ...
'journal = {Proceedings of the National Academy of Sciences}, ' ...
'volume = {102}, ' ...
'number = {3}, ' ...
'pages = {684-689}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LannWard2011'; type = 'Article'; bib = [ ... 
'author = {Le Lann, C. and Wardziak, T. and van Baaren, J and van Alphen, J.J.M.}, ' ... 
'year = {2011}, ' ...
'title = {Thermal plasticity of metabolic rates linked to life-history traits and foraging behavior in a parasitic wasp}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {25}, ' ...
'pages = {641-651}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LannViss2012'; type = 'Article'; bib = [ ... 
'author = {Le Lann, C. and Visser, B. and van Baaren, J. and van Alphen, J.J.M. and Ellers, J.}, ' ... 
'year = {2012}, ' ...
'title = {Comparing resource exploitation and allocation of two closely related aphid parasitoids sharing the same host}, ' ...
'journal = {Evolutionary Ecology}, ' ...
'volume = {26}, ' ...
'pages = {79-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FuenPowe1996'; type = 'Article'; bib = [ ... 
'author = {Fuentes-Contreras, E. and Powell, W. and Wadhams, L.J. and Pickett, J.A. and Niemeyer, H. M.}, ' ... 
'year = {1996}, ' ...
'title = {Influence of wheat and oat cultivars on the development of the cereal aphid parasitoid \emph{Aphidius rhopalosiphi} and the generalist aphid parasitoid \emph{Ephedrus plagiutor}}, ' ...
'journal = {Annals of Applied Biology}, ' ...
'volume = {128}, ' ...
'pages = {181-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FuenNiem1998'; type = 'Article'; bib = [ ... 
'author = {Fuentes-Contreras, E. and Niemeyer, H.M.}, ' ... 
'year = {1998}, ' ...
'title = {DIMBOA Glucoside, a wheat chemical defense, affects host acceptance and suitability of \emph{Sitobion avenae} to the cereal aphid parasitoid \emph{Aphidius rhopalosiphi}}, ' ...
'journal = {Journal of Chemical Ecology}, ' ...
'volume = {24}, ' ...
'number = {2}, ' ...
'pages = {371-381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuquPena2021'; type = 'Article'; bib = [ ... 
'author = {Luquet, M. and Penalver-Cruz, A. and Satour, P. and Anton, S. and Cortesero, A.-M. and Lavandero, B. and Jaloux, B.}, ' ... 
'year = {2021}, ' ...
'title = {Aphid honeydew may be the predominant sugar source for \emph{Aphidius} parasitoids even in nectar-providing intercrops}, ' ...
'journal = {Biological Control}, ' ...
'volume = {158}, ' ...
'pages = {104596}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2024'; type = 'Article'; bib = [ ... 
'year = {2024}, ' ...
'volume = {DART: M-860722-01-1; M-857341-01-1; M-847401-01-3; M-848594-01-1; M-827134-01-1; M-822979-01-1; M-824052-01-1; M-809274-01-1; M-804041-01-1; M-779174-01-1; M-777926-01-1; M-762534-01-1; M-762532-02-1; M-758862-01-1; M-761030-02-1; M-686265-01-1; M-691182-01-1; M-677206-01-1; M-669971-01-1; M-665967-01-1}, ' ...
'howpublished = {BAYER study reports registered in DART}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

