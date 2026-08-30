function [data, auxData, metaData, txtData, weights] = mydata_Cyclura_nubila

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Cyclura_nubila'; 
metaData.species_en = 'Cuban rock iguana'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 15];

%% set data
% zero-variate data

data.ab = 84;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RehaVele1997';   
  temp.ab = C2K(30.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 20*30.5;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'RehaVele1997';
  temp.ap = C2K(30.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'in zoo, Wiki: 2-3 yr';
data.am = 47.6*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(30.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 28.8; units.Lb = 'cm';   label.Lb = 'total length at birth';        bibkey.Lb = 'RehaVele1997';
data.Li = 106;  units.Li = 'cm';   label.Li = 'ultimate wet weight for females';    bibkey.Li = 'Wiki';
data.Lim = 160;  units.Lim = 'cm';   label.Lim = 'ultimate wet weight for males';    bibkey.Lim = 'Wiki';

data.Wwb = 52; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'RehaVele1997';

data.Ri  = 30/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-30 eggs per clutch, assumed: 1 clutch per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), length (cm)
  0	31.911 31.444 31.124 30.180 28.612
 40 38.545 38.232 36.269 37.445 34.461
 60	41.946 43.831 38.252 41.394 37.938
 90	46.094 44.988 46.012 45.856 42.714
120 48.836 52.056 51.659 49.705 47.107
150	51.726 53.608 54.316 51.958 49.446
180	52.508 55.727 57.455 53.216 51.882
220	55.926 58.441 60.794 55.611 55.219
240	58.445 60.565 62.372 58.444 57.738
275	59.062 60.944 64.085 61.337 59.063
335	62.653 62.494 67.363 62.416 62.575
365	64.841 64.758 68.062 63.741 64.448];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(30.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RehaVele1997'; treat.tL = {1 {'1','2','3','4','5'}}; label.treat.tL = 'individual';

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
  0	 52.309  53.330  52.309  52.313  50.258
 40 101.951  82.465  80.410  95.797  77.337
 60	138.035 157.533 110.356 149.325 167.777
 90	179.407 254.262 208.111 185.544 161.959
120 223.781 267.877 279.155 236.093 207.380
150	268.218 295.917 329.765 262.064 261.051
180	275.671 319.784 397.724 286.953 277.727
220	327.360 366.337 458.643 329.412 316.075
240	367.620 414.797 499.937 392.243 373.778
275	413.062 426.407 516.638 398.708 398.708
335	476.241 470.096 596.251 438.303 445.470
365	444.756 465.263 598.597 471.433 473.472];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(30.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RehaVele1997'; treat.tW = {1 {'1','2','3','4','5'}}; label.treat.tW = 'individual';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tL = 5 * weights.tL;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic in Cuba';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BTN8'; % Cat of Life
metaData.links.id_ITIS = '173919'; % ITIS
metaData.links.id_EoL = '795184'; % Ency of Life
metaData.links.id_Wiki = 'Cyclura_nubila'; % Wikipedia
metaData.links.id_ADW = 'Cyclura_nubila'; % ADW
metaData.links.id_Taxo = '341611'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Cyclura&species=nubila'; % ReptileDB
metaData.links.id_AnAge = 'Cyclura_nubila'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclura_nubila}}';
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
bibkey = 'RehaVele1997'; type = 'article'; bib = [ ... 
'author = {Ivan Rehak and Petr Velensky}, ' ... 
'year = {1997}, ' ...
'title = {Second generation of {C}uban iguanas, \emph{Cyclura nubila}, born in {P}rague Zoo}, ' ...
'journal = {Gazella}, ' ...
'volume = {24}, ' ...
'pages = {93-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

