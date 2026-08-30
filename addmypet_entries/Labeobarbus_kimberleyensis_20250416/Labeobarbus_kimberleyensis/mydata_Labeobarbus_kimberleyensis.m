  function [data, auxData, metaData, txtData, weights] = mydata_Labeobarbus_kimberleyensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeobarbus_kimberleyensis'; 
metaData.species_en = 'Largemouth yellowfish'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 16];

%% set data
% zero-variate data
data.ab = 6;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'ElleWeyl2012';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 51.8;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 82.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 1606;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00912*Lp^3.06, see F1';
data.Wwi = 6673;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.06, see F1; max. published weight: 22.2 kg';

data.Ri  = 8e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Labeo_gonius: 203233*5573/1400';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
4.438	30.356
4.922	40.965
4.923	37.596
4.983	39.219
5.957	41.722
5.958	38.603
5.959	36.981
5.976	47.712
5.977	44.592
5.978	39.975
6.952	42.978
6.970	49.841
6.992	43.851
6.994	39.484
7.013	41.481
7.035	37.863
7.946	45.606
7.965	51.221
8.919	52.102
9.956	48.117
9.992	63.215
9.993	58.599
10.011	65.961
10.014	57.601
10.015	54.855
10.947	60.103
10.987	61.601
11.070	56.735
11.982	60.611
11.985	52.126
12.955	67.356
14.033	60.377];
data.tL_f(:,1) = 365 * (0.2 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','females'};  
temp.tL_f = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ElleWeyl2012'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.944	17.858
2.978	21.859
3.017	27.100
3.018	25.603
3.019	24.106
3.931	28.730
4.033	26.235
4.939	51.946
4.966	28.363
4.985	34.353
5.938	36.856
5.958	39.102
5.959	36.357
5.980	33.362
6.000	34.985
6.018	42.471
6.933	37.113
6.953	38.735
6.993	40.732
7.012	45.723
7.947	44.108
8.898	52.850
9.001	48.983
9.954	52.484
9.976	47.119
10.968	55.362
10.969	54.239
10.988	57.608
10.990	52.118
10.993	41.761
11.010	52.867
11.315	51.497
11.984	55.370
12.003	59.113
16.975	69.384];
data.tL_m(:,1) = 365 * (0.4 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length','males'};  
temp.tL_m = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ElleWeyl2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwb = weights.Wwb * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00912*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'originally endemic to the Orange-Vaal River system, South Africa. Has been introduced into the Gouritz River, South Cape and the Olifants River, Limpopo River system where it is now established';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NPX2'; % Cat of Life
metaData.links.id_ITIS = '689357'; % ITIS
metaData.links.id_EoL = '220132'; % Ency of Life
metaData.links.id_Wiki = 'Labeobarbus_kimberleyensis'; % Wikipedia
metaData.links.id_ADW = 'Labeobarbus_kimberleyensis'; % ADW
metaData.links.id_Taxo = '691155'; % Taxonomicon
metaData.links.id_WoRMS = '1017491'; % WoRMS
metaData.links.id_fishbase = 'Labeobarbus-kimberleyensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeobarbus_kimberleyensis}}';  
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
bibkey = 'ElleWeyl2012'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2012.03395.x}, ' ...
'author = {Ellender, B. R. and Weyl, O. L. F. and Winker, H.}, ' ...
'year = {2012}, ' ...
'title = {Age and growth and maturity of southern {A}frica''s largest cyprinid fish, the largemouth yellowfish \emph{Labeobarbus kimberleyensis}}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {81(4)}, ' ...
'pages = {1271–1284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeobarbus-kimberleyensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

