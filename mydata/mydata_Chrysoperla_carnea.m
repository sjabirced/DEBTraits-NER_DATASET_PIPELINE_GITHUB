function [data, auxData, metaData, txtData, weights] = mydata_Chrysoperla_carnea

%% set metaData
metaData.phylum     = 'Arthropoda';
metaData.class      = 'Insecta'; 
metaData.order      = 'Neuroptera'; 
metaData.family     = 'Chrysopidae';
metaData.species    = 'Chrysoperla_carnea'; 
metaData.species_en = 'Common green lacewing'; 

metaData.ecoCode.climate = {'C','D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTi','0iTs','0iTg'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beCii'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp

metaData.data_0     = {'ab'; 'aj'; 'ae'; 'am'; 'Lb'; 'Lj'; 'Le'; 'Wwb'; 'Wwj'; 'Wwe'; 'Wde'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'X-Wwj'; 'T-ab'; 'T-aj'; 'T-ae'; 't-N'; 't-pX'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Natalie Albrecht','Josef Koch','Kim Rakel','Heike Fremdt','Daniela Jans','Andre Gergs','Thomas Preuss'};         
metaData.date_subm = [2025 05 26];
metaData.email    = {'albrecht@gaiac-eco.de'};        
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'}; 

metaData.author_mod_1   = {'Bas Kooijman'};         
metaData.date_mod_1     = [2025 06 13];
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'}; 
metaData.email_cur   = {'lika@uoc.gr'};  
metaData.date_acc    = [2025 06 14];

%% set data

% zero-variate data

data.ab = 5.1; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'AmarShea2013a';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj_23 = 11; units.tj_23 = 'd'; label.tj_23 = 'time since birth at pupation at 23 C'; bibkey.tj_23 = 'AmarShea2013a';   
  temp.tj_23 = C2K(23);  units.temp.tj_23 = 'K'; label.temp.tj_23 = 'temperature';  
data.tj_25 = 8; units.tj_25 = 'd'; label.tj_25 = 'time since birth at pupation at 25 C'; bibkey.tj_25 = 'Baye2024';   
  temp.tj_25 = C2K(25);  units.temp.tj_25 = 'K'; label.temp.tj_25 = 'temperature'; 
data.tj_25a = 7; units.tj_25a = 'd'; label.tj_25a = 'time since birth at pupation'; bibkey.tj_25a = 'Baye2024';   
  temp.tj_25a = C2K(25);  units.temp.tj_25a = 'K'; label.temp.tj_25a = 'temperature'; 
data.tje_23 = 11.5; units.tje_23 = 'd'; label.tje_23 = 'time since pupation at emergence at 23 C'; bibkey.tje_23 = 'AmarShea2013a';   
  temp.tje_23 = C2K(23);  units.temp.tje_23 = 'K'; label.temp.tje_23 = 'temperature'; 
data.tje_25 = 9; units.tje_25 = 'd'; label.tje_25 = 'time since pupation at emergence at 25 C'; bibkey.tje_25 = 'Baye2024';   
  temp.tje_25 = C2K(25);  units.temp.tje_25 = 'K'; label.temp.tje_25 = 'temperature';
data.te_23 = 17.9; units.te_23 = 'd'; label.te_23 = 'time since birth at emergence'; bibkey.te_23 = 'AmarShea2013b';   
  temp.te_23 = C2K(23);  units.temp.te_23 = 'K'; label.temp.te_23 = 'temperature'; 
data.tep_23 = 4.2; units.tep_23 = 'd'; label.tep_23 = 'time since emergence at first egg release'; bibkey.tep_23 = 'AmarShea2013a';   
  temp.tep_23 = C2K(23);  units.temp.tep_23 = 'K'; label.temp.tep_23 = 'temperature';  
data.tei = 51.7; units.tei = 'd'; label.tei = 'life span since emergence'; bibkey.tei = 'AmarShea2013a';   
  temp.tei = C2K(23); units.temp.tei = 'K'; label.temp.tei = 'temperature'; 
data.teia = 48.3; units.teia = 'd'; label.teia = 'life span since emergence'; bibkey.teia = 'AmarShea2013b';   
  temp.teia = C2K(23); units.temp.teia = 'K'; label.temp.teia = 'temperature';    

data.Lb = 0.24; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = 'ChakKora2010';
data.Lj = 0.71; units.Lj = 'cm'; label.Lj = 'length at pupation'; bibkey.Lj = 'ChakKora2010';
data.Le = 0.724; units.Le = 'cm'; label.Le = 'length at emergence'; bibkey.Le = 'ChakKora2010';

data.Wwb = 0.0001; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'BaumGuti1981';
data.Wwj_1 = 0.0083; units.Wwj_1 = 'g'; label.Wwj_1 = 'wet weight of pupa'; bibkey.Wwj_1 = 'SyedAshf2008'; % no full access, data from abstract
data.Wwj_aphid = 7.08E-3; units.Wwj_aphid = 'g'; label.Wwj_aphid = 'wet weight of pupa'; bibkey.Wwj_aphid = 'JokaZara2012';
data.Wwj_whitefly = 8.4E-3; units.Wwj_whitefly = 'g'; label.Wwj_whitefly = 'wet weight of pupa'; bibkey.Wwj_whitefly = 'JokaZara2012';
data.Wwj_artificial = 9.46E-3; units.Wwj_artificial = 'g'; label.Wwj_artificial = 'wet weight of pupa'; bibkey.Wwj_artificial = 'JokaZara2012';
data.Wwe_1 = 8.96e-3; units.Wwe_1 = 'g'; label.Wwe_1 = 'wet weight at emergence'; bibkey.Wwe_1 = 'Baye2024';
data.Wwe_2 = 1.16e-2; units.Wwe_2 = 'g'; label.Wwe_2 = 'wet weight at emergence'; bibkey.Wwe_2 = 'Baye2024';
data.Wwi_1 = 2.97e-2; units.Wwi_1 = 'g'; label.Wwi_1 = 'ultimate wet weight'; bibkey.Wwi_1 = 'Baye2024';
data.Wwi_2 = 2.96e-2; units.Wwi_2 = 'g'; label.Wwi_2 = 'ultimate wet weight'; bibkey.Wwi_2 = 'Baye2024';
data.Wde = 0.003107; units.Wde = 'g'; label.Wde = 'Imago dry weight'; bibkey.Wde = 'LawoRome2008';
data.Ww_asym = 8e-2; units.Ww_asym = 'g'; label.Ww_asym = 'asymptotic wet  weight'; bibkey.Ww_asym = 'guess';
  comment.Ww_asym = 'hypothetical ultimate weight if growth would not cease at emergence';
  
data.Ri_1 = 1264/45.6; units.Ri_1 = '#/d'; label.Ri_1 = 'reproduction rate'; bibkey.Ri_1 = 'AmarShea2013a'; % fecundity/oviposition period 
  temp.Ri_1 = C2K(23); units.temp.Ri_1 = 'K'; label.temp.Ri_1 = 'temperature';
data.Ri_2 = 694.4/48.3; units.Ri_2 = '#/d'; label.Ri_2 = 'reproduction rate'; bibkey.Ri_2 = 'AmarShea2013b'; % fecundity/lifetime
  temp.Ri_2 = C2K(23); units.temp.Ri_2 = 'K'; label.temp.Ri_2 = 'temperature';
data.Ri_3 = 15.67; units.Ri_3 = '#/d'; label.Ri_3 = 'reproduction rate'; bibkey.Ri_3 = 'JokaZara2012'; 
  temp.Ri_3 = C2K(25); units.temp.Ri_3 = 'K'; label.temp.Ri_3 = 'temperature';
data.Ri_4 = 8.67; units.Ri_4 = '#/d'; label.Ri_4 = 'reproduction rate'; bibkey.Ri_4 = 'SharAli2023'; 
  temp.Ri_4 = C2K(25); units.temp.Ri_4 = 'K'; label.temp.Ri_4 = 'temperature';  
data.Ri_5 = 247.44/9.04; units.Ri_5 = '#/d'; label.Ri_5 = 'reproduction rate'; bibkey.Ri_5 = 'ChakKora2010'; % fecundity/oviposition period
  temp.Ri_5 = C2K(32); units.temp.Ri_5 = 'K'; label.temp.Ri_5 = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), length (cm)
    0.5	0.25
    1.5	0.31
    2.5	0.34
    3.5	0.47
    5.5	0.68
    6.5	0.8
    7.5	0.85];
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'larval body length', 'replica 1'}; 
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Baye2024';
% 
data.tL2 = [ ... % time (d), length (cm)
    0.5	0.33
    1.5	0.33
    2.5	0.50
    3.5	0.58
    4.5	0.67
    5.5	0.93
    6.5	0.94];
units.tL2  = {'d', 'cm'}; label.tL2 = {'time since birth', 'larval body length', 'replica 2'}; 
temp.tL2 = C2K(25); units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Baye2024';
    
% time-weight
data.tWw = [ ... % time (d), wet weight (g)
    0	0.00028
    2.9	0.001786667
    5	0.01163];
units.tWw  = {'d', 'g'}; label.tWw = {'time since birth', 'larval wet weight', '27 C'}; 
temp.tWw = C2K(27); units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'ZhenHage1993';
%
data.tWw1 = [ ... % time (d), wet weight (g)
    0.5	1.88E-04
    1.5	5.78E-04
    2.5	5.84E-04
    3.5	1.61E-03
    4.5	2.74E-03
    5.5	3.96E-03
    6.5	7.61E-03
    7.5	1.36E-02
 %   8.5 1.39E-02 % late larval non growth phase shortly before pupation
    ];
units.tWw1  = {'d', 'g'}; label.tWw1 = {'time since birth', 'larval wet weight', '25 C, replica 1'}; 
temp.tWw1 = C2K(25); units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = 'Baye2024';
%
data.tWw2 = [ ... % Time (d), wet weight (g)
    0.5	0.000584
    1.5	0.000643
    2.5	0.002054
    3.5	0.003088
    4.5	0.003464
    5.5	0.009695
    6.5	0.014036
 %   7.5	0.014924 % late larval non growth phase shortly before pupation
    ];
units.tWw2  = {'d', 'g'}; label.tWw2 = {'time since birth', 'larval wet weight', '25 C, replica 2'}; 
temp.tWw2 = C2K(25); units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature'; 
bibkey.tWw2 = 'Baye2024';

% time-dry weight
data.tWd = [ ... % time (d), dry weight (g)
    0	5.66667E-05
    2.9	0.000373333
    5	0.00389];
units.tWd  = {'d', 'g'}; label.tWd = {'time since birth', 'larval dry weight'}; 
temp.tWd = C2K(27); units.temp.tWd = 'K'; label.temp.tWd = 'temperature'; 
bibkey.tWd = 'ZhenHage1993';

% scaled function response-pupal wet weight
data.fWw_j = [ ... % sum of consumed eggs till pupation (#), wet weight pupa(g)
    432     0.0048
    529     0.0062
    1166    0.0117];
% cumulative sum of food ingested before pupation, relative to the observed maximum, is used as a proxi for f
data.fWw_j(:,1) = data.fWw_j(:,1)/data.fWw_j(3,1); % translate consumed eggs to f assuming f = 1 at highest level
units.fWw_j  = {'-', 'g'}; label.fWw_j = {'scaled functional response', 'body weight of pupa'}; 
temp.fWw_j = C2K(27); units.temp.fWw_j = 'K'; label.temp.fWw_j = 'temperature';
bibkey.fWw_j = 'ZhenDaan1993';

% temperature-age at hatch
data.Tab = [ ... % temperature (C), age at birth (d)
    15	12.494	
    20	6.208	
    25	4.05	
    27	3.448	
    30	3      
    32	3.224	];
units.Tab  = {'C', 'd'}; label.Tab = {'temperature', 'age at birth'}; 
bibkey.Tab = 'AghdNema2020';

% temperature-larval development time
data.Ttj_AN20 = [ ... % temperature (C), time since hatch at pupation (d)
    15	31.129
    20	13.556
    25	8.629
    27	7.303
    30	6.297
    32	6.835 ];
units.Ttj_AN20  = {'C', 'd'}; label.Ttj_AN20 = {'temperature','time since birth at pupation', 'AghdNema2020'}; 
bibkey.Ttj_AN20 = 'AghdNema2020';
% 
data.Ttj_S23 = [ ... % temperature (C), time since hatch at pupation (d)
    19	18
    21	17
    23	14.33
    25	10.66
    27	10.33
    29	9.33
    31	8.6];
units.Ttj_S23  = {'C', 'd'}; label.Ttj_S23 = {'temperature','time since birth at pupation', 'SharAli2023'};  
bibkey.Ttj_S23 = 'SharAli2023';

% temperature - pupal development time
data.Tte_AN20 = [ ... % temperature (C), time since pupation at emergence (d)
    15	36.129
    20	14.691
    25	9.8
    27	8.079
    30	6.432
    32	6.821];
units.Tte_AN20  = {'C', 'd'}; label.Tte_AN20 = {'temperature', 'time since pupation at emergence', 'AghdNema2020'}; 
bibkey.Tte_AN20 = 'AghdNema2020';
% 
data.Tte_S23 = [ ... % temperature (C), time since pupation at emergence (d)
    19	11.1
    21	11
    23	8.6
    25	7.6
    27	6.66
    29	5.66
    31	5];
units.Tte_S23  = {'C', 'd'}; label.Tte_S23 = {'temperature', 'time since pupation at emergence', 'SharAli2023'};  
bibkey.Tte_S23 = 'SharAli2023';

% time-cumulative offspring
data.tN = [ ... % Time since start of oviposition (d), cumulative offspring (#)
    0	0.0
    2	19.5
    4	57.4
    6	107.8
    8	160.9
    10	204.9
    12	253.7
    14	295.1
    16	331.1
    18	366.6
    20	392.9
%     22	413.7 % cut off after linear phase
%     24	433.9
%     26	454.6
%     28	467.3
%     30	471.0
    ];
units.tN  = {'d', '#'}; label.tN = {'time since start of oviposition', 'cumulative offspring'}; 
temp.tN = C2K(27); units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'ZhenDaan1993';

% time-cumulative food consumption
data.tX = [ ... % time since birth (d), cumulative food consumption (g)
    0.08	6.7848E-06
    0.17	4.52232E-05
    0.26	0.000104016
    0.34	0.000167323
    1.01	0.000314424
    1.35	0.000492888
    2.01	0.000811800
    2.35	0.000938520
    3.01	0.000979176
    3.09	0.001012968
    3.17	0.001024320
    3.27	0.001026696
    4.00	0.001026696
    4.09	0.001130184
    4.16	0.001167144
    4.26	0.001403688
    4.34	0.001536744
    5.00	0.003207336
    5.33	0.003909576
    5.99	0.004041576
    6.08	0.004086456
    6.16	0.004131336
    6.24	0.004123416
    6.34	0.004168296
    6.98	0.004152456
    7.99	0.004152456
    8.07	0.004356845
    8.15	0.004697616
    8.21	0.005310624
    8.31	0.005923896
    8.97	0.011306856
    9.30	0.014371896
    9.97	0.022547976
    10.06	0.022888536
    10.14	0.023841576
    10.23	0.025816296
    10.30	0.026634696
    10.98	0.032004456
    11.31	0.035014056
    11.98	0.034882056];
 units.tX  = {'d', 'g'}; label.tX = {'time since birth', 'wet weight consumed food'}; 
 temp.tX = C2K(23); units.temp.tX = 'K'; label.temp.tX = 'temperature'; 
 bibkey.tX = 'LawoRome2008';
    
%% set weights for all real data
 weights = setweights(data, []); 
 weights.Ww_asym = weights.Ww_asym * 0;
 weights.Wwb = weights.Wwb * 5;
%  weights.fWw_j = weights.fWw_j * 3;
%  weights.Wwe_2 = weights.Wwe_2 * 5;
%  weights.Wwi_2 = weights.Wwi_2 * 5;
weights.Wwj_artificial = weights.Wwj_artificial * 5;
weights.tN = weights.tN * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.w = 1; units.psd.w = '-'; label.psd.w = 'wet weight contribution of reserve'; weights.psd.w = 0.1;

%% pack auxData and tXtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL', 'tL2'};           subtitle1 = {'Data for two replicated test runs'};
set2 = {'tWw', 'tWw1', 'tWw2'}; subtitle2 = {'Data for 25 C (two replicated test runs) and 27 C'};
set3 = {'Ttj_AN20', 'Ttj_S23'}; subtitle3 = {'Data for two different studies'};
set4 = {'Tte_AN20', 'Tte_S23'}; subtitle4 = {'Data for two different studies'};
metaData.grp.sets = {set1, set2, set3, set4};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4};

%% Discussion points
D1 = 'For now, this entry focuses only on females';
D2 = 'Investment in the reproduction buffer takes place during the imago stage (synovigeny) because (a) imagos still feed on protein sources, and (b) the wet weight of total reproductive output exceeds the female wet weight at emergence by a lot (making reproductive investment only during the larval phase implausible)';
D3 = 'Since ovary development takes place after emergence in the female imago, we assume a maturity reset at the start of pupation an further maturation during pupa and imago stages till puberty';
D4 = 'The imago feeds, does not grow';
D5 = 'mod_1: Emergence and puberty are triggered by maturity thresholds, pupation is triggered by reserve density at pupation equals that at emergence';
D6 = 'mod_1: allocation to maturation/reproduction subjected to the kappa-rule';
D7 = 'mod_1: the value of the zoom factor is substatially reduced, using guessed asymptotic weight as data';
D8 = 'mod_1: predict-file is simplified';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7, 'D8',D8);

%% Facts
F1 = 'Development of ovaries takes place after emergence in the female imago';
metaData.bibkey.F1 = 'ZhenDaan1993';
F2 = 'Imagos continue feeding on protein sources to sustain egg production';
metaData.bibkey.F2 = 'SattSali2011';
F3 = 'Has yeast endosymbionts';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of the original entry was financially supported by Bayer AG';

%% Links
metaData.links.id_CoL = '5YQX4'; % Cat of Life
metaData.links.id_ITIS = '935697'; % ITIS
metaData.links.id_EoL = '65490457'; % Ency of Life
metaData.links.id_Wiki = 'Chrysoperla_carnea'; % Wikipedia
metaData.links.id_ADW = 'Chrysoperla_carnea'; % ADW
metaData.links.id_Taxo = '27285'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AghdNema2020'; type = 'Article'; bib = [ ... 
'author = {Aghdam, H. and Nemati, Z.}, ' ...
'year = {2020}, ' ...
'title = {Modeling of the effect of temperature on developmental rate of common green lacewing, \emph{Chrysoperla carnea} ({S}teph.) ({N}europtera: {C}hrysopidae)}, ' ...
'journal = {Egyptian Journal of Biological Pest Control}, ' ...
'volume = {30}, ' ...
'pages = {145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmarShea2013a'; type = 'Article'; bib = [ ... 
'author = {Amarasekare, K. and Shearer, P.W.}, ' ...
'year = {2013}, ' ...
'title = {Life History Comparison of Two Green Lacewing Species \emph{Chrysoperla johnsoni} and \emph{Chrysoperla carnea} ({N}europtera: {C}hrysopidae)}, ' ...
'journal = {Environmental Entomology}, ' ...
'volume = {42}, ' ...
'pages = {1079-1084}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmarShea2013b'; type = 'Article'; bib = [ ... 
'author = {Amarasekare, K. and Shearer, P.W.}, ' ...
'year = {2013}, ' ...
'title = {Comparing Effects of Insecticides on Two Green Lacewings Species, \emph{Chrysoperla johnsoni} and \emph{Chrysoperla carnea} ({N}europtera: {C}hrysopidae)}, ' ...
'journal = {Journal of Economic Entomology}, ' ...
'volume = {106}, ' ...
'pages = {1126-1133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaumGuti1981'; type = 'Article'; bib = [ ... 
'author = {Baumgartner, J.U. and Gutierrez, A.P. and Summers, C.G.}, ' ...
'year = {1981}, ' ...
'title = {The Influence of Aphid Prey Consumption on Searching Behavior, Weight Increase, Developmental Time, and Mortality of \emph{Chrysopa carnea} ({N}europtera: {C}hrysopidae) and \emph{Hippodamia convergens} ({C}oleoptera: {C}occinellidae) Larvae}, ' ...
'journal = {The Canadian Entomologist}, ' ...
'volume = {113}, ' ...
'pages = {1007-1014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChakKora2010'; type = 'Article'; bib = [ ... 
'author = {Chakraborty, D. and Korat, D.}, ' ...
'year = {2010}, ' ...
'title = {Biology of green lacewing, \emph{Chrysoperla carnea} ({S}tephens) in middle {G}ujarat conditions}, ' ...
'journal = {Karnataka Journal of Agricultural Sciences}, ' ...
'volume = {23}, ' ...
'pages = {500-502}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JokaZara2012'; type = 'Article'; bib = [ ... 
'author = {Jokar, M. and Zarabi, M.}, ' ...
'year = {2012}, ' ...
'title = {Surveying Effect Kind of Food on Biological Parameters on \emph{Chrysoperla carnea} ({N}europtera: {C}hrysopidae) Under Laboratory Conditions}, ' ...
'journal = {Egyptian Academic Journal of Biological Sciences. A, Entomology}, ' ...
'volume = {5}, ' ...
'pages = {99-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LawoRome2008'; type = 'Article'; bib = [ ... 
'author = {Lawo, N. and Romeis, J.}, ' ...
'year = {2008}, ' ...
'title = {Assessing the Utilization of a Carbohydrate Food Source and the Impact of Insecticidal Proteins on Larvae of the Green Lacewing, \emph{Chrysoperla carnea}}, ' ...
'journal = {Biological Control}, ' ...
'volume = {44}, ' ...
'pages = {389-398}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharAli2023'; type = 'Article'; bib = [ ... 
'author = {Sharif, M. and Ali, J. and Solangi, B.K. and Tariq, M.A. and Ahmed, F. and Shah, R. and Bazai, M.J.K. and Khan, A.W. and Shahzad, F. and Amin, M. and Khan, M.}, ' ...
'year = {2023}, ' ...
'title = {Effects of Different Thermal Stress on Life Cycle of \emph{Chrysoperla carnea} ({N}europtera: {C}hrysopidae) Under Laboratory Condition {Q}uetta {B}alochistan}, ' ...
'journal = {Pure and Applied Biology}, ' ...
'volume = {12}, ' ...
'pages = {424-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SyedAshf2008'; type = 'Article'; bib = [ ...
'author = {Syed, A.N. and Ashfaq, M. and Ahmad, S.}, ' ...
'year = {2008}, ' ...
'title = {Comparative Effect of Various Diets on Development of \emph{Chrysoperla carnea} (Neuroptera: Chrysopidae)}, ' ...
'journal = {International Journal of Agriculture and Biology}, ' ...
'volume = {10}, ' ...
'pages = {728-730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhenDaan1993'; type = 'Article'; bib = [ ... 
'author = {Zheng, Y. and Daane, K.M. and Hagen, K.S. and Mittler, T.E.}, ' ...
'year = {1993}, ' ...
'title = {Influence of Larval Food Consumption on the Fecundity of the Lacewing \emph{Chrysoperla carnea}}, ' ...
'journal = {Entomologia Experimentalis et Applicata}, ' ...
'volume = {67}, ' ...
'pages = {9-14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhenHage1993'; type = 'Article'; bib = [ ... 
'author = {Zheng, Y. and Hagen, K.S. and Daane, K.M. and Mittler, T.E.}, ' ...
'year = {1993}, ' ...
'title = {Influence of Larval Dietary Supply on the Food Consumption, Food Utilization Efficiency, Growth and Development of the Lacewing \emph{Chrysoperla carnea}}, ' ...
'journal = {Entomologia Experimentalis et Applicata}, ' ...
'volume = {67}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2024'; type = 'Misc'; bib = [ ... 
'year = {2024}, ' ...
'howpublished = {unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SattSali2011'; type = 'Article'; bib = [ ... 
'author = {Sattar, A. and Salihah, Z. and Farid, A. and Usman, A. and Khattak, S.U.K.}, ' ...
'year = {2011}, ' ...
'title = {Impact of Proteins in Adult Artificial Diet of \emph{Chrysoperla carnea} ({S}tephens) ({N}europtera: {C}hrysopidae) on Biological Parameters}, ' ...
'journal = {Songklanakarin Journal of Science & Technology}, ' ...
'volume = {28}, ' ...
'number = {1}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [ ... 
'year = {2025}, ' ...
'howpublished = {url{https://en.wikipedia.org/wiki/Chrysoperla_carnea}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
