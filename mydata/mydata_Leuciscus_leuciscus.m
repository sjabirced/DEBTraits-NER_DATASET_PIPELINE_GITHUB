function [data, auxData, metaData, txtData, weights] = mydata_Leuciscus_leuciscus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leuciscus_leuciscus'; 
metaData.species_en = 'Common dace'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-N_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 05];

%% set data
% zero-variate data

data.am = 16*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 17.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 40;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 57.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00631*Lp^3.16, see F1';
data.Wwi = 729;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.16, see F1; max published weight 1.0 kg';

data.Ri = 27000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL_Sfm = [ ... % time (d), total length (cm)
    1  5.39  5.52
    2  9.08  9.22
    3 13.09 13.34
    4 15.98 16.29
    5 17.04 18.38
    6 18.64 19.35
    7 19.53 19.40
    8 21.13 20.85
    9 21.50 NaN
   10 21.40 NaN];
data.tL_Sfm(:,1) = data.tL_Sfm(:,1) * 365; % convert yr to d
units.tL_Sfm = {'d', 'cm'}; label.tL_Sfm = {'time since birth', 'total length'};  
temp.tL_Sfm = C2K(13);  units.temp.tL_Sfm = 'K'; label.temp.tL_Sfm = 'temperature';
bibkey.tL_Sfm = 'Mann1974'; treat.tL_Sfm = {1 {'females','males'}}; 
title.tL_Sfm = 'River Stour';
%
data.tL_Ffm = [ ... % time (d), total length (cm)
    1  5.46  5.47
    2 11.14 11.25
    3 14.79 15.42
    4 17.91 18.41
    5 19.20 20.38
    6 20.86 22.17
    7 22.44 23.36
    8 23.34 23.36
    9 23.36 24.30
   10 24.90 NaN];
data.tL_Ffm(:,1) = data.tL_Ffm(:,1) * 365; % convert yr to d
units.tL_Ffm = {'d', 'cm'}; label.tL_Ffm = {'time since birth', 'total length'};  
temp.tL_Ffm = C2K(13);  units.temp.tL_Ffm = 'K'; label.temp.tL_Ffm = 'temperature';
bibkey.tL_Ffm = 'Mann1974'; treat.tL_Ffm = {1 {'females','males'}}; 
title.tL_Ffm = 'River Frome';

% time-weight
data.tW_Sfm = [ ... % time (d), weight (g)
    0 0.003 0.003
    1  1.23  1.33
    2   8.9   9.2
    3  29.5  29.1
    4  53.0  52.8
    5  64.0  75.7
    6  83.4  88.2
    7  95.8  88.9
    8 121   110
    9 127   NaN
   10 125   NaN];
data.tW_Sfm(:,1) = data.tW_Sfm(:,1) * 365; % convert yr to d
units.tW_Sfm = {'d', 'cm'}; label.tW_Sfm = {'time since birth', 'total length'};  
temp.tW_Sfm = C2K(13);  units.temp.tW_Sfm = 'K'; label.temp.tW_Sfm = 'temperature';
bibkey.tW_Sfm = 'Mann1974'; treat.tW_Sfm = {1 {'females','males'}}; 
title.tW_Sfm = 'River Stour';
%
data.tW_Ffm = [ ... % time (d), weight (g)
    0 0.003  0.003
    1  1.63   1.64
    2  19.1   16.4
    3  46.4   46.0
    4  84.5   82.0
    5 105    114
    6 136    150
    7 171    179
    8 194    193
    9 194    203
   10 237    NaN];
data.tW_Ffm(:,1) = data.tW_Ffm(:,1) * 365; % convert yr to d
units.tW_Ffm = {'d', 'cm'}; label.tW_Ffm = {'time since birth', 'total length'};  
temp.tW_Ffm = C2K(13);  units.temp.tW_Ffm = 'K'; label.temp.tW_Ffm = 'temperature';
bibkey.tW_Ffm = 'Mann1974'; treat.tW_Ffm = {1 {'females','males'}}; 
title.tW_Ffm = 'River Frome';

% length-fecundity
data.LN_S = [ ... % total length (cm), fecundity (#)
12.270	1211.000
16.366	2995.805
16.488	3126.934
17.346	3015.931
17.637	4597.959
17.740	3405.116
18.049	6032.258
18.732	7057.745
18.847	5534.424
19.696	6071.404
20.263	5261.278
20.568	5691.105
21.264	3032.748
21.361	7682.135
21.546	10151.985
21.848	8925.084
24.031	10363.256];
units.LN_S = {'cm', '#'}; label.LN_S = {'total length','fecundity','River Stour'};  
temp.LN_S = C2K(13);  units.temp.LN_S = 'K'; label.temp.LN_S = 'temperature';
bibkey.LN_S = 'Mann1974'; 
%
data.LN_F = [ ... % total length (cm), fecundity (#)
14.635	3194.824
14.731	2788.869
15.373	2433.813
16.536	2887.765
16.649	2650.195
16.668	3355.380
16.728	7108.258
17.045	3898.277
17.050	4157.357
17.408	3476.321
18.596	4336.644
18.890	5608.977
19.312	6154.247
19.317	6516.504
19.447	5853.501
19.468	7358.251
19.601	6752.904
20.050	8307.326
20.190	7845.075
20.503	9582.686
20.507	10002.696
20.612	6466.803
20.940	8545.440
20.955	9929.760
22.684	9782.726
22.688	10138.757
22.836	8724.810
22.994	8180.631
23.352	10064.262
23.404	16017.871
23.753	17326.487
25.161	16830.425];
units.LN_F = {'cm', '#'}; label.LN_F = {'total length','fecundity','River Frome'};  
temp.LN_F = C2K(13);  units.temp.LN_F = 'K'; label.temp.LN_F = 'temperature';
bibkey.LN_F = 'Mann1974'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Sfm = 10 * weights.tL_Sfm;
weights.tL_Ffm = 10 * weights.tL_Ffm;
% weights.Li = 3 * weights.Li;
% weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_S','LN_F'}; subtitle1 = {'Data for rivers Stour, Frome'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3P2YK'; % Cat of Life
metaData.links.id_ITIS = '163580'; % ITIS
metaData.links.id_EoL = '46581646'; % Ency of Life
metaData.links.id_Wiki = 'Leuciscus_leuciscus'; % Wikipedia
metaData.links.id_ADW = 'Leuciscus_leuciscus'; % ADW
metaData.links.id_Taxo = '178776'; % Taxonomicon
metaData.links.id_WoRMS = '154599'; % WoRMS
metaData.links.id_fishbase = 'Leuciscus-leuciscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuciscus_leuciscus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leuciscus-leuciscus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Mann1974'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1974.tb04542.x}, ' ...
'author = {Mann, R. H. K.}, ' ...
'year = {1974}, ' ...
'title  = {Observations on the age, growth, reproduction and food of the dace, Leuciscus leuciscus (L.), in two rivers in southern England}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'pages = {237–253}, ' ...
'volume = {6(3)}'];
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

