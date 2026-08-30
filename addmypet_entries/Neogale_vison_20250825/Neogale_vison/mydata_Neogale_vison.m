function [data, auxData, metaData, txtData, weights] = mydata_Neogale_vison
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Neogale_vison'; 
metaData.species_en = 'American mink'; 

metaData.ecoCode.climate = {'BS','BW','Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 25];

%% set data
% zero-variate data

data.tg = 42;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 49;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 334;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 371;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 11.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 5.8;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 110;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 700;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 400–780 g';
data.Wwim = 1300;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 500–1580 g';

data.Ri  = 4.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 pups per litter; 1 litter per yr';

data.JOi  = 488;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(39);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 660; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

% uni-variate data

% time-weight 
data.tW_f = [ ... % time (wk), body weight (g)
    1   13.31
    2   40.83
    3   77.46
    4  119.33
    5  149.87
    6  195.54
    7  276.34
    8  399.41
    9  525.48
   10  622.94
   11  664.47
   12  778.24
   13  854.57
   14  852.56
   15  945.27
   16  985.99
   17 1032.83
   18 1027.66
   19 1087.00
   20 1124.40
   21 1131.08
   22 1212.51
   23 1265.77
   24 1282.74
   25 1229.14
   26 1324.44
   27 1367.77
   28 1364.27];
data.tW_f(:,1) = 7 * data.tW_f(:,1); % convert wk to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SoreGros2003';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (wk), body weight (g)
    1   14.99
    2   47.11
    3   90.24
    4  137.38
    5  175.93
    6  216.90
    7  330.66
    8  481.71
    9  676.07
   10  820.51
   11  979.58
   12 1181.69
   13 1387.23
   14 1426.91
   15 1633.96
   16 1757.22
   17 1891.18
   18 1981.66
   19 2102.91
   20 2207.08
   21 2324.07
   22 2416.48
   23 2510.16
   24 2592.76
   25 2509.49
   26 2645.56
   27 2696.54
   28 2757.87];
data.tW_m(:,1) = 7 * data.tW_m(:,1); % convert wk to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SoreGros2003';
comment.tW_m = 'Data for males';
%
data.tW_0f = [ ... % time (wk), body weight (g)
    1   27.83
    2   65.60
    3  110.57
    4  160.96
    5  202.53
    6  283.56
    7  405.19
    8  500.77
    9  611.21
   10  702.31
   11  740.37
   12  836.66
   13  907.01
   14  887.73
   15  980.65
   16 1012.76
   17 1062.11
   18 1071.36
   19 1114.02
   20 1136.13
   21 1136.52
   22 1206.75
   23 1230.28
   24 1244.03
   25 1186.93
   26 1260.45
   27 1288.27
   28 1293.62];
data.tW_0f(:,1) = 7 * data.tW_0f(:,1); % convert wk to d
units.tW_0f   = {'d', 'g'};  label.tW_0f = {'time since birth', 'wet weight', 'female'};  
temp.tW_0f    = C2K(39);  units.temp.tW_0f = 'K'; label.temp.tW_0f = 'temperature';
bibkey.tW_0f = 'SoreGros2003';
comment.tW_0f = 'Data for females; low feed efficiency';
%
data.tW_0m = [ ... % time (wk), body weight (g)
    1   28.26
    2   70.91
    3  121.76
    4  179.34
    5  209.58
    6  304.10
    7  448.47
    8  579.32
    9  756.32
   10  924.49
   11 1055.49
   12 1232.23
   13 1429.10
   14 1448.24
   15 1624.39
   16 1743.16
   17 1887.04
   18 1979.85
   19 2050.39
   20 2185.35
   21 2237.07
   22 2325.30
   23 2381.75
   24 2467.84
   25 2391.45
   26 2495.91
   27 2539.27
   28 2598.15];
data.tW_0m(:,1) = 7 * data.tW_0m(:,1); % convert wk to d
units.tW_0m   = {'d', 'g'};  label.tW_0m = {'time since birth', 'wet weight', 'male'};  
temp.tW_0m    = C2K(39);  units.temp.tW_0m = 'K'; label.temp.tW_0m = 'temperature';
bibkey.tW_0m = 'SoreGros2003';
comment.tW_0m = 'Data for males; low feed efficiency';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = weights.JOi * 3;
weights.tW_f = weights.tW_f * 5;
weights.tW_m = weights.tW_m * 5;
weights.tW_0f = weights.tW_0f * 5;
weights.tW_0m = weights.tW_0m * 5;
weights.JOi = 5 * weights.JOi;
weights.tx = 5 * weights.tx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males, high feed efficiency'};
set2 = {'tW_0f','tW_0m'}; subtitle2 = {'Data for females, males, low feed efficiency'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5JSHV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66942485'; % Ency of Life
metaData.links.id_Wiki = 'Neogale_vison'; % Wikipedia
metaData.links.id_ADW = 'Neovison_vison'; % ADW
metaData.links.id_Taxo = '1684130'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001484'; % MSW3
metaData.links.id_AnAge = 'Neovison_vison'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neogale_vison}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neovison_vison}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Neovison_vison/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
