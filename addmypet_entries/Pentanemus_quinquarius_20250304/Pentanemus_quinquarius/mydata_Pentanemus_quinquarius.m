function [data, auxData, metaData, txtData, weights] = mydata_Pentanemus_quinquarius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Pentanemus_quinquarius'; 
metaData.species_en = 'Royal threadfin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 04];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Polydactylus_macrochir';  
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm as typical for Polydactylus: pi/6*0.0775^3'; 
data.Wwi  = 271;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on  0.00398*Li^3.13, see F1';

data.GSI = 0.055; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'FontBaro1976';
  temp.GSI = C2K(25.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
236.831	7.163
236.832	6.703
241.952	6.494
243.232	7.498
272.676	8.126
289.318	7.290
289.319	6.914
302.120	8.211
305.960	9.090
318.762	9.007
318.763	8.002
330.283	9.384
331.563	8.631
332.844	8.254
334.124	8.003
344.365	9.510
364.848	9.720
364.849	10.054
378.930	9.176
410.934	11.981
414.774	11.018
422.455	10.726
425.016	11.102
427.576	10.182
428.856	9.973
457.020	11.103
473.662	10.937
486.464	12.067
486.465	11.732
489.024	12.946
489.025	11.356
517.188	13.407
519.748	12.445
522.309	11.943
523.589	12.235
532.550	12.654
547.912	13.031
549.191	13.868
549.192	12.697
549.193	12.487
563.274	14.036
563.275	12.990
581.196	13.409
593.998	14.455
608.080	14.707
609.360	14.414
614.481	13.996
642.644	14.917
672.088	16.425
672.089	15.002
673.368	15.546
673.369	13.998
690.010	15.379
705.373	15.087
706.653	14.794
707.933	14.041
722.015	16.845
727.135	16.552
733.536	15.799
738.657	16.134
770.661	17.056
771.941	15.968
780.902	16.596
783.463	16.261
787.303	15.132
788.583	15.466
793.704	17.015
793.705	16.722
794.984	16.010
848.751	17.937
856.432	16.933
858.993	17.770
883.316	17.645
884.596	17.352
887.156	18.399
889.717	17.562
917.880	17.437
930.682	17.982
962.686	18.987
966.527	18.443
1026.695	18.864
1029.255	19.910
1104.785	18.908
1120.147	20.289];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FontBaro1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_Eig','tL_Roe','tL_Der','tL_Cha','tL_Rop'}; subtitle1 = {'Data for loc Eig, Roe, Der, Cha, Rop'};
% set2 = {'tL_Fli','tL_Spr','tL_Fit','tL_Mar','tL_Bri'}; subtitle2 = {'Data for loc Fli, Spr, Fit, Mar, Bri'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00398*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76NJK'; % Cat of Life
metaData.links.id_ITIS = '170475'; % ITIS
metaData.links.id_EoL = '46578879'; % Ency of Life
metaData.links.id_Wiki = 'Pentanemus_quinquarius'; % Wikipedia
metaData.links.id_ADW = 'Pentanemus_quinquarius'; % ADW
metaData.links.id_Taxo = '183432'; % Taxonomicon
metaData.links.id_WoRMS = '282202'; % WoRMS
metaData.links.id_fishbase = 'Pentanemus-quinquarius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pentanemus_quinquarius}}';
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
bibkey = 'FontBaro1976'; type = 'Article'; bib = [ ... 
'author = {Fontana, A. and J. Baron}, ' ... 
'year = {1976}, ' ...
'title = {Croissance de \emph{Pentanemus quiquarius} ({B}arbillon) et \emph{Pteroscion peli} ({M}adongo) au {C}ongo}, ' ...
'journal = {Oc\''{e}anographes biologistes Centre ORSTOM Pointe-Noire (Congo)}, ' ...
'volume = {31}, ' ...
'pages = {1-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pentanemus-quinquarius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

