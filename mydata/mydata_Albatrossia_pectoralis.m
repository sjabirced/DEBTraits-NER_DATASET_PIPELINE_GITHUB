function [data, auxData, metaData, txtData, weights] = mydata_Albatrossia_pectoralis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Albatrossia_pectoralis'; 
metaData.species_en = 'Giant grenadier'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
% zero-variate data

data.am = 56*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(2.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 83.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'fishbase given 4.5 cm, but is probably PAL, not TL';
data.Li  = 210;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm of Nezumia_aequalis: pi/6*0.13^3';
data.Wwp = 1582;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00087*Li^3.26, see F1';  
data.Wwi = 23476;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00087*Li^3.26, see F1; max. published weight: 86.0 kg';

data.Ri = 329000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(2.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), pre-anal fin length (mm), weight (g)
     16     240       1905 
     19     250       2320 
     20     240       1970 
     20     350       6995 
     20     220       1645 
     20     310       4295 
     20     350       6185 
     21     210       1215 
     21     290       3485 
     21     230       1780 
     21     320       5680 
     22     280       3270 
     22     300       3805 
     22     250       2445 
     22     310       3590 
     22     410       8185 
     23     300       3430 
     23     270       3180 
     23     320       4400 
     23     260       2690 
     23     340       6390 
     23     370       6840 
     23     320       4890 
     23     270       3330 
     23     250       2392 
     23     450      12575 
     24     290       3125 
     24     290       3385 
     24     300       3765 
     24     270       3040 
     24     300       4075 
     24     310       4330 
     24     270       2674 
     24     250       2450 
     24     340       5110 
     24     350       6060 
     25     300       3680 
     25     350       6220 
     25     330       5490 
     25     400       8940 
     25     330       5165 
     25     450      14165 
     26     230       1850 
     26     280       3050 
     26     390       8110 
     26     410       8610 
     26     350       7280 
     26     370       7330 
     26     310       4010 
     26     270       2725 
     26     340       5685 
     26     340       4435 
     26     480      13775 
     26     320       4345 
     26     330       5845 
     27     290       3090 
     27     280       2995 
     27     310       4545 
     27     260       3662 
     27     330       4665 
     27     270       2885 
     27     560      15470 
     27     350       6400 
     27     340       6630 
     27     380       8010 
     27     260       2460 
     27     380       7820 
     27     330       5470 
     27     330       5615 
     28     350       6445 
     28     310       4175 
     28     460      10375 
     28     310       3910 
     28     260       2125 
     28     300       4348 
     28     280       3368 
     28     290       3132 
     28     300       3780 
     28     350       6125 
     28     310       4105 
     28     290       3810 
     28     300       3800 
     28     260       2345 
     28     290       2910 
     28     380       7435 
     29     270       2575 
     29     310       4500 
     29     440      10300 
     29     330       5485 
     29     310       4925 
     29     250       2165 
     29     320       4980 
     29     360       6445 
     29     390       7270 
     29     270       2548 
     29     300       3475 
     29     400       8610 
     29     340       5200 
     29     350       4760 
     30     270       2232 
     30     250       2815 
     30     280       2995 
     30     400       7060 
     30     320       4200 
     30     280       2980 
     30     280       3370 
     30     300       3625 
     30     250       2060 
     30     290       3030 
     30     310       3995 
     30     330       4730 
     30     330       6140 
     30     370       8050 
     30     460      15295 
     30     380       6425 
     30     210       1600 
     30     390       8615 
     30     340       5495 
     30     360       6010 
     31     300       3740 
     31     330       4020 
     31     310       4545 
     31     320       5170 
     31     260       3280 
     31     280       3195 
     31     420       9640 
     31     280       3105 
     31     230       2065 
     31     440      10885 
     32     400       7890 
     32     260       2435 
     32     290       3360 
     32     360       6125 
     32     260       2410 
     32     240       2205 
     32     320       4040 
     33     280       3060 
     33     330       5325 
     33     350       6390 
     33     300       3810 
     33     370       6480 
     33     300       3565 
     33     280       2970 
     33     260       2160 
     33     600      23615 
     33     410       6120 
     33     280       2880 
     33     450      11940 
     33     300       4390 
     34     330       4570 
     34     390       8265 
     34     330       5310 
     34     260       2892 
     34     310       3955 
     35     300       3260 
     35     270       3500 
     35     370       6335 
     35     410       8885 
     35     330       6310 
     35     300       4215 
     35     300       3865 
     36     360       5630 
     36     300       4140 
     36     340       5975 
     37     490      14620 
     37     350       6835 
     37     350       6860 
     38     360       6005 
     38     360       5745 
     38     280       3360 
     39     390       7415 
     39     330       4195 
     39     300       4096 
     39     330       4815 
     39     260       2505 
     42     350       5135 
     42     340       5370 
     42     330       4635 
     42     370       7360 
     42     280       3865 
     42     300       3310 
     43     330       4745 
     44     410       8670 
     44     330       4885 
     45     260       2725 
     45     410      10760 
     49     450       9275 
     52     320       4265 
     56     320       3885];
data.tLW(:,1) = 365*(0.5+data.tLW(:,1)); % convert yr to d
for i=2:size(data.tLW,1);if data.tLW(i,1)<=data.tLW(i-1,1);data.tLW(i,1)=data.tLW(i-1,1)+1e-3;end;end
data.tLW(:,2) = data.tLW(:,2)*4.2/10; % convert PAFL in mm to TL in cm, see F2
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW   = C2K(2.6);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'RodgHutc2017'; treat.tLW = {1 {'length','weight'}};
comment.tLW = 'the given length unit is cm in fig 6, but mm is assumed';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Wwp = 0 * weights.Wwp;
weights.Wwb = 2 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.Lp = 5 * weights.Lp;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00087*(TL in mm)^3.26';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 4.2*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,  'F2',F2);

%% Links
metaData.links.id_CoL = 'BFMN'; % Cat of Life
metaData.links.id_ITIS = '165427'; % ITIS
metaData.links.id_EoL = '46564757'; % Ency of Life
metaData.links.id_Wiki = 'Albatrossia_pectoralis'; % Wikipedia
metaData.links.id_ADW = 'Albatrossia_pectoralis'; % ADW
metaData.links.id_Taxo = '160294'; % Taxonomicon
metaData.links.id_WoRMS = '236135'; % WoRMS
metaData.links.id_fishbase = 'Albatrossia-pectoralis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Albatrossia_pectoralis}}';
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
bibkey = 'RodgHutc2017'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0180020}, ' ...
'author = {Cara J. Rodgveller and Charles E. Hutchinson and Scott C. Vulstek and Charles M. Guthrie}, ' ... 
'year = {2017}, ' ...
'title = {Otolith shape variability and associated body growth differences in giant grenadier, \emph{Albatrossia pectoralis}}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {12(6)}, ' ...
'pages = {e0180020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Albatrossia_pectoralis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

