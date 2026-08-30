function [data, auxData, metaData, txtData, weights] = mydata_Larimichthys_crocea
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Larimichthys_crocea'; 
metaData.species_en = 'Large yellow croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};
metaData.data_1     = {'t-L_f', 't-Ww_f'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 28];

%% set data
% zero-variate data;

data.ab = 51/24+4;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(22.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
  comment.ab = 'based on Larimichthys_polyactis';
data.am = 365*6;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(22.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 17;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';   

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 to 1.4 mm of Larimichthys_polyactis: pi/6*0.132^3';
data.Wwp = 53.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00891*Lp^3.07, see F1';
data.Wwi = 6.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00891*Li^3.07, see F1';

data.GSI  = 0.12; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'YanJian2022';   
  temp.GSI = C2K(22.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time (d), length (cm)
 90	 3.116  2.962
120	 4.749  4.593
151	 8.086  7.543
180	10.104  9.795
209	10.884 12.124
242	13.989 14.144
272	14.923 15.620
300	17.872 15.469
333	18.031 15.861
395	18.737 16.333
424	18.896 17.112
453	19.985 17.116
485	21.306 19.058
516	25.341 20.690
547	24.105 22.787
577	25.581 22.558
608	24.810 23.648
635	26.287 25.356
665	27.764 25.128
700	28.000 25.442]; 
data.tL(:,1) = data.tL(:,1) -20 ; % set origin at birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length'}; 
temp.tL = C2K(22.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChenHuan2020'; treat.tL = {1 {'Xiapu','Shacheng'}};

% time-weight
data.tW = [ ... % time (year), wet weight (g)
 90	  0.500   0.500
120	  2.410   3.614
151	  7.229   8.434
180	 16.867  14.458
209	 25.301  36.145
242	 49.398  54.217
272	 59.036  66.265
300	110.843  73.494
333	114.458  85.542
395	124.096  73.494
424	128.916  89.157
453	153.012  90.361
485	180.723 119.277
516	277.108 156.627
547	236.145 201.205
577	268.675 201.205
608	267.470 269.880
635	325.301 281.928
665	389.157 291.566
700	437.349 300.000];  
data.tW(:,1) = data.tW(:,1) - 20 ; % set origin at birth
units.tW   = {'d', 'g'}; label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(22.8); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ChenHuan2020'; treat.tW = {1 {'Xiapu','Shacheng'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.ab = 0 * weights.ab;

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00891*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NXNY'; % Cat of Life
metaData.links.id_ITIS = '646547'; % ITIS
metaData.links.id_EoL = '46579143'; % Ency of Life
metaData.links.id_Wiki = 'Larimichthys_crocea'; % Wikipedia
metaData.links.id_ADW = 'Larimichthys_crocea'; % ADW
metaData.links.id_Taxo = '178197'; % Taxonomicon
metaData.links.id_WoRMS = '281271'; % WoRMS
metaData.links.id_fishbase = 'Larimichthys-crocea'; % fishbase

%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Larimichthys-crocea}}';
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
bibkey = 'ChenHuan2020'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.aqrep.2019.100242}, ' ...
'author = {Yunlong Chena and Weiqing Huang and Xiujuan Shan and Jia Chen and Huasong Weng and Tao Yang and Huibin Wang}, ' ... 
'year = {2020}, ' ...
'title = {Growth characteristics of cage-cultured large yellow croaker \emph{Larimichthys crocea}}, ' ...
'journal = {Aquaculture Reports}, ' ...
'volume = {16}, ' ...
'pages = {100242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YanJian2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fmars.2022.868580}, ' ...
'author = {Yan, L.-t. and Jiang, Y. and Xu, Q. and Ding, G.-m. and Chen, X.-y. and Liu, M.}, ' ... 
'year = {2022}, ' ...
'title = {Reproductive Dynamics of the Large Yellow Croaker \emph{Larimichthys crocea} ({S}ciaenidae), A Commercially Important Fishery Species in {C}hina}, ' ...
'journal = {Front. Mar. Sci.}, ' ...
'volume = {9}, ' ...
'pages = {868580}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
