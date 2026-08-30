function [data, auxData, metaData, txtData, weights] = mydata_Pinna_nobilis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pinnidae';
metaData.species    = 'Pinna_nobilis'; 
metaData.species_en = 'Noble pen shell'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lb', 'Lj', 'Lp', 'Li', 'GSI', 'E0'}; 
metaData.data_1     = {'t-L_fT', 'T-dL', 'L-dL', 'L-N', 't-Ww', 'T-JO', 'T-CR'};

metaData.COMPLETE = 3; % using criteria of LikaKear2011

metaData.author   = {'Ines Haberle'};    
metaData.date_subm = [2019 08 26];              
metaData.email    = {'ihaberle@irb.hr'};            
metaData.address  = {'Bijenicka cesta 54, Zagreb, Croatia'};  

metaData.author_mod_1   = {'Dina Lika', 'Antonis Michail'};    
metaData.date__mod_1 = [2026 03 01];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'Univ of Crete, Heraklion, Greece'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2026 03 02]; 

%% set data
% zero-variate data

data.ab = 2 ;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TrigVice2017';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'the feeding starts with the development of the ciliary structure, i.e. vellum';
data.aj = 10;    units.aj = 'd';    label.aj = 'age at metamorphosis';     bibkey.aj = 'ButlVice1993';  
  temp.aj = C2K(20);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.tp = (1.5*365)-2;    units.tp = 'd';    label.tp = 'age at puberty since birth';   bibkey.tp = 'RichKenn1999'; 
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'GaliVlah2006';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 8.5e-03; %conversion um to cm
  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'TrigVice2017';
data.Lj  = 0.1;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis';  bibkey.Lj  = 'ButlVice1993';
data.Lp  = 16.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';        bibkey.Lp  = 'DeudGrau2017';
data.Li  = 86;   units.Li  = 'cm';  label.Li  = 'ultimate length in the wild';    bibkey.Li  = 'RichKenn1999';
  comment.Li = 'Common ultimate size in the wild. Largest specimen ever reported was 120 cm.';

% data.GSI  = 0.52; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'DeudGrau2017';   
%   temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
%   comment.GSI = 'calculated as weight of visceral mass (including gonad)/weight of total soft tissue';

data.GSI  = 0.15; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'AcarLok2018';   
  temp.GSI = C2K(20); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'max GSI value (Table 1)';

data.E0 = 0.001; units.E0 = 'J'; label.E0 = 'initial energy content'; bibkey.E0 = 'VeerCard2006'; 
  comment.E0 = 'data for Crassostrea gigas';

%% uni-variate data
%t-L data, time - length  ADULTS
data.tL1 = [ ... 
    1 16.5
    2 23.75
    3 29.08
    4 32.76
    5 35.89
    6 38.37
    7 40.4
    8 42.43
    9 45.56
    10 44.02
    11 44.95
    12 46.24
    13 47.36];
data.tL1(:,1)= data.tL1(:,1)*365; % conversion age year to day, set birth is at age 0
temp.tL1 = C2K(21);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
L0.tL1 = data.tL1(1,2);
units.L0.tL1 = 'cm'; label.L0.tL1 = 'initial length'; % average initial length
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'};  
bibkey.tL1 = 'RichKenn1999';
comment.tL1 = 'Aguamarga - unimpacted, healthy habitat (large Posidonia meadow) (L_i=49 from van Bertallanfy equation in the article)';

data.tL2 = [ ... 
    1 15.4
    2 30.9
    3 37.87
    4 46.32
    5 51.28
    6 54.04
    7 56.16
    8 59.38];
data.tL2(:,1)= data.tL2(:,1)*365; 
temp.tL2 = C2K(21);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
L0.tL2 = data.tL2(1,2); 
units.L0.tL2 = 'cm'; label.L0.tL2 = 'initial length'; 
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'total length'};  
bibkey.tL2 = 'RichKenn1999';
comment.tL2 = 'Carboneras, unimpacted (L_i = 69 from van Bertallanfy equation in the article)';

%----------------------------

% time-length data at varying temperature, time - length at different T
tL1_T = [ ... % time (d), size (cm), temperature (C), 14cm
    272	1.51	22.8
    288	2.73	18.0
    303	3.35	17.2
    346	4.26	16.5
    363	4.70	15.1
    393	5.24	12.8
    408	5.77	12.9
    421	6.05	13.1
    436	7.11	13.4
    451	7.38	13.8
    466	7.83	14.2
    481	8.41	14.8
    497	9.19	15.7
    513	9.63	16.7
    528	10.45	18.2
    558	11.98	21.3
    575	13.62	22.9
    590	15.38	24.5
    607	16.76	24.6
    611	17.06	24.6
    ];
tL1_T(:,1) = tL1_T(:,1)-tL1_T(1,1);
data.tL1_T = [tL1_T(:,1), tL1_T(:,2)];
units.tL1_T = {'d', 'cm'}; label.tL1_T = {'time','length'};
temp.tL1_T = [tL1_T(:,1), tL1_T(:,3)]; units.temp.tL1_T = {'d', 'C'}; label.temp.tL1_T = {'time','temperature'};
L0.tL1_T = data.tL1_T(1,2);  units.L0.tL1_T = 'cm'; label.L0.tL1_T = 'initial length';
bibkey.tL1_T = 'RichKenn1999';
comment.tL1_T = 'Time and size of smaller Pinna (1y) at various temperatures from site Villaricos (L_i=45).';
%
tL2_T = [ ... % time (d), size (cm), temperature (C), 14 cm
    28	2.22	12.2
    44	2.62	11.9
    73	3.12	12.4
    104	5.24	14.5
    135	6.32	16.1
    180	9.66	20.3
    195	10.41	21.6
    211	12.13	24.2
    242	15.79	25.3
    256	17.29	25.6
    272	18.56	22.8
    286	19.60	18.0
    317	19.68	17.3
    363	20.28	15.1
    393	20.69	12.8
    481	23.86	14.8
    512	24.72	16.7
    527	24.98	18.2
    557	27.05	21.3
    589	29.82	24.5
    605	31.43	24.6
    610	31.67	24.6];
tL2_T(:,1) = tL2_T(:,1)-tL2_T(1,1);
data.tL2_T = [tL2_T(:,1), tL2_T(:,2)];
units.tL2_T = {'d', 'cm'}; label.tL2_T = {'time','length'};
temp.tL2_T = [tL2_T(:,1), tL2_T(:,3)]; units.temp.tL2_T = {'d', 'C'}; label.temp.tL2_T = {'time','temperature'};
L0.tL2_T = data.tL2_T(1,2);  units.L0.tL2_T = 'cm'; label.L0.tL2_T = 'initial length';
bibkey.tL2_T = 'RichKenn1999';
comment.tL2_T = 'Time and size of larger Pinna (2y) at various temperatures from site Villaricos (L_i=45).';

%----------------------------

% T-dL data, temperature - growth rate 
data.TdL1 = [ ... % temperature (C), growth rate (mm/day), for Pinna 14cm
    12.9	0.34
    13.0	0.23
    13.2	0.70
    13.4	0.18
    13.9	0.31
    14.3	0.33
    14.8	0.53
    15.2	0.18
    16.5	0.25
    16.7	0.54
    17.3	0.21
    18.1	0.41
    18.3	0.50
    21.5	1.08
    22.9	0.72
    23.0	1.15
    24.6	0.86
    24.8	0.63];
data.TdL1(:,2) = data.TdL1(:,2) / 10; %conversion length mm to cm
units.TdL1 = {'C', 'cm/day'};
label.TdL1 = {'temperature', 'growth rate'};
L0.TdL1 = mean(data.tL1_T(:,2));  units.L0.TdL1 = 'cm'; label.L0.TdL1 = 'initial length';
bibkey.TdL1 = 'RichKenn1999';
comment.TdL1 = 'Growth rate of smaller Pinna (1y) at site Villaricos, inferred from temperature profiles';
%
data.TdL2 = [ ... % temperature (C), growth rate (mm/day), for Pinna 25cm
    12.3	0.24
    12.3	0.17
    12.9	0.14
    13.8	0.71
    14.3	0.37
    15.8	0.29
    16.5	0.13
    16.7	0.15
    17.2	0.36
    17.3	0.03 %outlier
    19.1	0.73
    19.5	0.71
    20.4	0.46
    21.7	1.06
    22.9	0.71
    23.0	0.90
    24.6	1.20
    24.6	1.01
    24.8	0.39
    25.5	0.94
    25.7	0.82];
data.TdL2(:,2) = data.TdL2(:,2) / 10; %conversion length mm to cm
units.TdL2 = {'C', 'cm/day'};
label.TdL2 = {'temperature', 'growth rate'};
L0.TdL2 = mean(data.tL2_T(:,2));  units.L0.TdL2 = 'cm'; label.L0.TdL2 = 'initial length';
bibkey.TdL2 = 'RichKenn1999';
comment.TdL2 = 'Growth rate of larger Pinna (2y) at site Villaricos, inferred from temperature profiles';

%----------------------------

% L-dL data, Length - growth rate
data.LdL = [ ... % length (cm), growth rate (cm/year)
    24.61	8.73
    29.70	7.95
    30.50	7.89
    35.51	8.43
    36.40	8.33
    36.99	8.76
    40.78	8.51
    41.94	7.74
    37.70	7.97
    36.71	7.71
    40.06	7.10
    43.77	6.60
    44.26	6.20
    43.00	6.00
    42.46	5.71
    37.82	6.65
    33.85	7.27
    36.12	6.57
    36.84	6.06
    33.22	6.95
    32.37	7.12
    31.26	6.93
    29.87	7.04
    27.99	6.53
    30.76	6.33
    31.83	5.83
    33.66	6.02
    36.39	5.81
    36.74	5.52
    33.35	5.38
    38.35	5.22
    38.80	5.19
    39.56	4.87
    36.96	4.73
    37.72	4.54
    42.19	4.60
    42.36	3.71
    41.03	4.11
    38.88	3.92
    37.99	3.83
    36.87	3.72
    37.40	3.21
    35.48	3.35
    33.96	3.78
    52.15	2.81
    37.61	1.41
    46.46	1.04];
data.LdL(:,2) = data.LdL(:,2)/365; %conversion cm/year to cm/day
units.LdL = {'cm', 'cm/day'};
label.LdL = {'length', 'growth rate'}; 
temp.LdL = C2K(20);  units.temp.LdL='K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'SilePeha2003';

%----------------------------

% Length - No. of oocytes
data.LN = [ ... length (cm), no. of oocytes (#/year) - fecundity
    37.67	18564780
    38.99	18943620
    44.53	35051760
    45.01	51219540
    49.42	44855760
    49.66	52347900
    52.06	44430000
    57.89	47911320
    55.2	72400800
    55.2	96858360
    52.55	93733860
    50.59	93362520
    45.11	106050720
    51.08	155289720
    54.66	186805560
    55.1	165498600
    61.07	218287860
    62      234844920
    63.22	198933000
    67.73	213475380
    64.89	157493220
    61.07	164244480
    60.24	162676440
    57.74	109057080
    59.75	109822260
    59.5	101146680];
% data.LN(:,2)=data.LN(:,2)/365; %conversion #/year to #/day
units.LN = {'cm', '#/yr'};
label.LN = {'length', 'fecundity'}; 
temp.LN= C2K(20);  units.temp.LN='K'; label.temp.LN = 'temperature';
bibkey.LN = 'TrigVice2017';

%% additional data for mod_1
%Acarli et al. 2011 Data
%temperatures
tT_izmir = [% (time (months since Dec 04'), Temperature (°C)
    0	12.01716
    1	13.85141
    2	12.05981
    3	14.62989
    4	15.42971
    5	22.75604
    6	23.84379
    7	27.75756
    8	24.86755
    9	21.96688
    10	18.86359
    11	13.81941
    12	12.75299
    14	11.98517
    15	11.9745
    16	18.87426
    ];
tT_izmir(:,1) = tT_izmir(:,1)*30; %convert months to days

%Total animal weight vs time.
tW_w = [ %time (months since dec 04'), Total weights Large group (g) , Total weights small group (g)
    0	 3.52588  0.1  
    1	 4.23356  0.29073
    2	 6.49142  1.03212
    3	 9.18738  2.0094
    4	12.48992  3.22258
    5	17.00564  5.61524
    6	22.39754  9.42327
    7	32.91176 17.61223
    8	36.82089 25.29569
    9	45.14464 29.81141
    10	56.70354 35.80991
    11	58.42221 36.88829
    12	61.75845 38.67436
    14	65.63388 46.25672
    15	73.35105 51.27794
    16	86.83081 57.84932
];

tW_w(:,1) = tW_w(:,1)*30; %convert months to days

%total weights vs time large group
data.tWw_A_large = tW_w(:,[1,2]); 
units.tWw_A_large = {'d','g'}; label.tWw_A_large = {'time', 'total weight'}; bibkey.tWw_A_large = 'AcarLok2011';
temp.tWw_A_large = [ tT_izmir(:,1), C2K( tT_izmir(:,2) )]; units.temp.tWw_A_large = {'d','K'}; label.temp.tWw_A_large ={'month','mean Temperature'};

data.tWw_A_small = tW_w(:,[1,3]); %weights vs time large group
units.tWw_A_small =  {'d','g'}; label.tWw_A_small = {'time', 'total weight'}; bibkey.tWw_A_small = 'AcarLok2011';
temp.tWw_A_small = [ tT_izmir(:,1), C2K( tT_izmir(:,2) )]; units.temp.tWw_A_small = {'d','K'}; label.temp.tWw_A_small ={'month','mean Temperature'};

tL_acar = [ % time (months since Dec 04'), Shell length (mm) (large group), Shell length (small group)
0	72.59297	31.97195
1	78.67812	42.59426
2	85.45718	53.69699
3	93.30382	64.05241
4	99.81599	70.88486
5	104.40654	84.54975
6	121.06063	93.8376
7	127.25253	104.24641
8	133.12416	113.64102
9	136.64714	117.21738
10	140.06336	122.55522
11	145.02756	123.08901
12	146.09513	127.19915
14	151.96676	140.00999
15	153.51474	140.9708
16	160.24043	142.35864
];

tL_acar(:,1)    = tL_acar(:,1)*30; %convert months to days
tL_acar(:,2:end)   = tL_acar(:,2:end)/10.0; %convert mm to cm
data.tL_A_large   = tL_acar(:,[1,2]); 
units.tL_A_large  = {'d','cm'}; label.tL_A_large = {'time', 'shell length'}; bibkey.tL_A_large = 'AcarLok2011';
temp.tL_A_large = [tT_izmir(:,1), C2K(tT_izmir(:,2))]; units.temp.tL_A_large = {'d','K'}; label.temp.tL_A_large ={'month','mean Temperature'};

data.tL_A_small   = tL_acar(:,[1,3]);
units.tL_A_small = {'d','cm'}; label.tL_A_small = {'time', 'shell length'}; bibkey.tL_A_small = 'AcarLok2011'; 
temp.tL_A_small = [tT_izmir(:,1), C2K(tT_izmir(:,2))]; units.temp.tL_A_small = {'d','K'}; label.temp.tL_A_small ={'month','mean Temperature'};

%Average Physiological rates (clearance rates (CR) and oxygen consumption VO2)) for an average animal with length 29.4 cm
CR_VO2 = [ %Temperature (°C)    CR (L/g dry mass/h)    VO2 (mg O2 / g dry mass/h) 
            8.5	                0.45128	                      0.25369             	
            14	                4.25119	                      0.6974	                
            18	                5.66715             		  0.84905	              
            23	                7.8431	                      1.09758	               
            28	                14.52294	           	      1.24712	             
            ];
CR_VO2(:,2:end) = CR_VO2(:,2:3) * 24; %convert all physiological rates to per day instead of per hour. 
DW_hernan = 5.7137; % g, mean dry weight of individuals 
CR_VO2(:,2:end) = CR_VO2(:,2:3) * DW_hernan;  %L/h, convert mass specific rates to simple rates

%extract CR data for all temperatures
data.TCR_H = [CR_VO2(:,[1 2]); [30 0]]; units.TCR_H = {'C','L/d'}; label.TCR_H = {'Temperature', 'Clearance Rate'}; bibkey.TCR_H = 'HernIbar2023';
% added a zero rate at 30 C, that is constructed but realistic since Pinnas are not known to live in areas above 30 C
L0.TCR_H = 29.4; units.L0.TCR_H = {'cm'}; label.L0.TCR_H ={'mean length'}; 
comment.TCR_H = 'mean clearance rates from 8 individuals with average shell length of 29.4 cm at various temperatures';

%O2 consumptions rates
data.TJO_H = [CR_VO2(:,[1,3]); [30 0]]; units.TJO_H = {'C','mg O2/d'}; label.TJO_H = {'Temperature', 'Oxygen consumption'}; bibkey.TJO_H = 'HernIbar2023';
% added a zero rate at 30 C, that is constructed but realistic since Pinnas are not known to live in areas above 30 C
comment.TJO_H = 'mean oxygen consumptions from 8 individual with average length of 29.4 cm at various temperatures';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 3 * weights.ab;
weights.TJO_H(end) = 0.1*weights.TJO_H(end); 
weights.TCR_H(end) = 0.1*weights.TCR_H(end);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.L0 = L0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
  set1 = {'tL1_T','tL2_T'}; subtitle1 = {'time vs. length'};
  set2 = {'TdL1','TdL2'}; subtitle2 = {'temperature vs. growth rate'};
  set3 = {'tL1','tL2'}; subtitle3 = {'time vs. Length'};
  set4 = {'tL_A_large','tL_A_small'}; subtitle4 = {'time vs. length'};
  set5 = {'tWw_A_large','tWw_A_small'}; subtitle5 = {'time vs. total weight'};

  metaData.grp.sets = {set1,set2,set3,set4,set5};
  metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Discussion points
D1 = ['Some data and inital parameter values of species Crassostrea gigas were taken, because more data was available (C. gygas is a well studied commertial species).'...
     'P. nobilis and C. gygas belong to the same bivalve order, Ostreida, with the most similar growth/size pattern throughout the life cycle.'...
     'Ref: MolluscaBase.'];
D2 = ['The individuals at different locations reach different size - to reproduce that, we use site specific f for which the initial value was set as a ratio of ' ...
      'maximum shell length reported for that site (provided in the relevant publication) and the maximum recorded shell size of 86 cm.'...
      'It is possible (for all sites) that the largest reported shells might not be the maximum obtainable size in that area, as the collection of specimens by ' ...
      'amateur divers may be partially responsible of the absence of larger individuals.'];
D3 = ['In the datasets from RichKenn1999 the temperatures were inferred from shell carbonate (using palaeotemperature equation), ' ...
     'and the bivalve growth rates were then inferred from temperature profiles.'];
D4 = ['mod_1:The value of 0.52 was replaced by 0.15, as the former was calculated as weight of visceral mass (including gonad)/weight of total soft tissue'];
D5 = ['mod_1: We assumed zero values for the mean oxygen consumption rate and the clearance rate at 30C to approximate the upper thermal tolerance of P. nobilis.'...
      'This assumption is based on the absence of reported populations in the Aegean and Ionia seas at  temperatures higher than 30C (S.M. Manolaki, personal communication, May 2023).'];
  
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'This is an endemic and the largest bivalve mollusc of the Mediterranean with life span up to 27 years';
metaData.bibkey.F1 = {'ZavoHrsb1991', 'Gome1988'};
F2 = 'Feeding starts when the appearance of a ciliary structure or velum occurs';
metaData.bibkey.F2 = 'TrigVice2017'; 
F3 = 'Usual habitat of the bivalve are seagrass meadows, thus deagradation of this habitats impacts the recruitment of the juveniles';
metaData.bibkey.F3 = 'GarcVice2006';
F4 = ['For the juveniles the growth pattern shows rapid growth during first year, and slightly slower growth in the second year. '...
      'Also growth rate decreases during a period of increasing water temperatures and at the time of gametogenesis, ' ...
      'probably due to reallocation of energy from shell growth to reproduction'];
metaData.bibkey.F4 = 'DeudGrau2017';
F5 = ['The species is asynchronic hermaphrodite showing a single three-month spawning season.', ...
      'The smallest individuals have only male gonads, while only larger individuals can develop exclusivly female gonads.'];
metaData.bibkey.F5 = 'DeudGrau2017';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '4HYTZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467273'; % Ency of Life
metaData.links.id_Wiki = 'Pinna_nobilis'; % Wikipedia
metaData.links.id_ADW = 'Pinna_nobilis'; % ADW
metaData.links.id_Taxo = '39322'; % Taxonomicon
metaData.links.id_WoRMS = '140780'; % WoRMS
metaData.links.id_molluscabase = '140780'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pinna_nobilis}}, '...
'note = {Last accessed 2019-08-26}'];
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
bibkey = 'AcarLok2011'; type = 'Article'; bib = [ ... 
'author = {Acarli, S. and Lok, S.Y. and Palaz, M.}, ' ... 
'year = {2011}, ' ...
'title = {Culture of Fan Mussel (\emph{Pinna nobilis}, Linnaeus 1758) in Relation to Size on Suspended Culture System in Izmir Bay,Aegean Sea, Turkey}, ' ...
'journal = {Kafkas Univ Vet Fak Derg}, ' ...
'volume = {17}, ' ...
'number = {6}, '...
'pages = {995-1002}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AcarLok2018'; type = 'Article'; bib = [ ... 
'author = {Acarli, S. and Lok, S.Y. and Acarli, D. and Kirtik, A.}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive cycle and biochemical composition in the adductor muscle of the endangered species fan mussel (\emph{Pinna nobilis}, Linnaeus 1758 from the Aegean Sea, Turkey}, ' ...
'journal = {Fresenius environmental bulletin}, ' ...
'volume = {27}, ' ...
'number = {10}, '...
'pages = {6506-6518}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ButlVice1993'; type = 'Article'; bib = [ ... 
'author = {Butler, A. and Vicente, N. and de Gaulejac, B.}, ' ... 
'year = {1993}, ' ...
'title = {Ecology of the pterioid bivalves \emph{Pinna bicolor} Gmelin and \emph{Pinna nobilis} {L}.}, ' ...
'journal = {Marine Life}, ' ...
'volume = {3}, ' ...
'number = {1-2}, '...
'pages = {37-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeudGrau2017'; type = 'Article'; bib = [ ... 
'author = {Deudero, S. and Grau, A. and V\''{a}zquez-Luis, M. and \''{A}lvarez, E. and Alomar, C. and Hendriks, I.E.}, ' ... 
'year = {2017}, ' ...
'title = {Reproductive investment of the pen shell \textit{Pinna nobilis} ({B}ivalvia, {P}innidae) {L}innaeus, 1758 in {C}abrera {N}ational {P}ark, {S}pain}, ' ...
'journal = {Mediterranean Marine Science}, ' ...
'volume = {18}, ' ...
'number = {2}, '...
'pages = {102-110}, '...
'doi = {10.12681/mms.1645}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaliVlah2006'; type = 'Article'; bib = [ ... 
'author = {Galinou-Mitsoudi, S. and Vlahavas, G. and Papoutsi, O.}, ' ... 
'year = {2006}, ' ...
'title = {Population study of the protected bivalve \textit{Pinna nobilis} ({L}innaeus, 1758) in {T}hermaikos {G}ulf ({N}orth {A}egean {S}ea)}, ' ...
'journal = {Journal of Biological Research}, ' ...
'volume = {5}, ' ...
'pages = {47-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarcVice2006'; type = 'Manual'; bib = [ ... 
'author = {Garc\''{i}a-March, J.R. and Vicente N.}, ' ... 
'year = {2006}, ' ...
'title = {Protocol to study and monitor \textit{Pinna nobilis} populations within marine protected areas. {MedPAN}-{I}nterreg {IIIC}-project}, ' ...
'organization = {Malta Environment and Planning Authority (MEPA)}, ' ...
'pages = {62},' ...
'howpublished = {\url{https://www.researchgate.net/publication/235963792_Protocol_to_study_and_monitor_Pinna_nobilis_populations_within_marine_protected_areas}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gome1988'; type = 'Book'; bib = [ ... 
'author = {G\''{o}mez-Alba, J.A.S.}, ' ... 
'year = {1988}, ' ...
'title  = {Gu\''{i}a de campo de los f\''{o}siles de {E}spa\~{n}a y de {E}uropa}, ' ...
'publisher = {Ediciones Omega SA, Barcelona}, ' ...
'pages = {925}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HernIbar2023'; type = 'Article'; bib = [ ... 
'author = {Hernandis, S. and Ibarrola, I. and Tena-Medialdea, J. and Albentosa, M. and Prado, P. and V\''{a}zquez-Luis, M. and Garc\''{i}a-March, J. R.}, ' ... 
'year = {2023}, ' ...
'title = {Physiological responses of the fan mussel Pinna nobilis to temperature: ecological and captivity implications, ' ...
'journal = {Mediterranean Marine Science, ' ...
'volume = {24}, ' ...
'number = {2}, '...
'pages = {259-271}, '...
'doi = {10.1007/s002270050459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RichKenn1999'; type = 'Article'; bib = [ ... 
'author = {Richardson, C.A. and Kennedy, H. and Duarte, C.M. and Kennedy, D.P. and Proud, S.V.}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth of the fan mussel \textit{Pinna nobilis} from south-east {S}panish {M}editerranean seagrass (\textit{Posidonia oceanica}) meadows}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {133}, ' ...
'number = {2}, '...
'pages = {205-212}, '...
'doi = {10.1007/s002270050459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilePeha2003'; type = 'Article'; bib = [ ... 
'author = {Siletic, T. and Peharda, M.}, ' ... 
'year = {2003}, ' ...
'title = {Population study of the fan shell \textit{Pinna nobilis} in {M}alo and {V}eliko {J}ezero of the {M}ljet {N}ational {P}ark ({A}driatic {S}ea)}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {67}, ' ...
'number = {1}, '...
'pages = {91-98}, '...
'doi = {10.3989/scimar.2003.67n1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TrigVice2017'; type = 'Article'; bib = [ ... 
'author = {Trigos, S. and Vicente, N. and Prado, P. and Espin\''{o}s, F.J.}, ' ... 
'year = {2017}, ' ...
'title = {Adult spawning and early larval development of the endangered bivalve \textit{Pinna nobilis}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {483}, ' ...
'pages = {271-284}, '...
'doi = {10.1016/j.aquaculture.2017.10.015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VeerCard2006'; type = 'Article'; bib = [ ... 
'author = {van der Veer, H.W. and Cardoso, J.F.M.F. and van der Meer, J.}, ' ... 
'year = {2006}, ' ...
'title = {The estimation of {DEB} parameters for various {N}ortheast {A}tlantic bivalve species}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {56}, ' ...
'number = {2}, '...
'pages = {107-124}, '...
'doi = {10.1016/j.seares.2006.03.005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZavoHrsb1991'; type = 'Incollection'; bib = [ ...
'author = {Zavodnik, D. and Hrs-Brenko, M. and Legac, M.}, ' ... 
'year = {1991}, ' ...
'title = {Synopsis on the fan shell \textit{Pinna nobilis} {L}. in the eastern {A}driatic {S}ea}, ' ...
'editor = {Boudourescque, C.F and Avon, M. and Gravez, V.},' ...
'booktitle  = {Les Esp\`{e}ces Marines \`{a} Prot\''{e}ger en M\''{e}diterran\''{e}e}, ' ...
'publisher = {GIS Posidonie Publications, Marseilles}, ' ...
'pages = {169-178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];