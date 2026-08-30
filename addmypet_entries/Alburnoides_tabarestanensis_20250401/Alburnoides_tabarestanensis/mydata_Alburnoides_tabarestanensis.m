  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_tabarestanensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_tabarestanensis'; 
metaData.species_en = 'Tabarestan riffle minnow'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 01];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;  units.Lp = 'cm'; label.Lp = 'total length at puberty';        bibkey.Lp = 'guess'; 
data.Li = 8.3; units.Li = 'cm'; label.Li = 'ultimate total length';        bibkey.Li = 'TahaEsma2018';

data.Wwb = 1.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TahaEsma2018';
  comment.Wwb = 'Based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 0.24;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00776*Lp^3.14,  see F1';
data.Wwi = 6.0; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'TahaEsma2018';
  comment.Wwi = 'based on 0.00776*Li^3.14, see F1';

data.Ri = 2368/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size'; bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Alburnoides_qanati';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  3.57 4.15
    2  5.91 5.89
    3  7.75 7.47
    4  9.12 8.55
    5 10.23 9.43];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(23);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GhojPati2017'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1  0.63  1.01
    2  3.28  3.01
    3  7.29  6.19
    4 12.61  8.35
    5 16.30 12.90];
data.tW_fm(:,1) = 365 * (0.5 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(23);  units.temp.tW_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tW_fm = 'GhojPati2017'; treat.tW_fm = {1 {'females','males'}}; 

% length-weight
data.LW_f = [ % ...
2.749	0.463
3.416	0.215
3.577	1.063
3.737	0.212
3.870	1.546
3.950	0.453
4.297	1.422
4.297	0.693
4.457	2.027
4.617	0.934
4.724	2.389
4.858	1.296
4.964	2.023
5.205	1.293
5.285	2.263
5.338	4.204
5.578	2.382
5.658	3.474
5.979	1.893
6.032	3.349
6.165	3.712
6.352	2.861
6.459	4.195
6.646	3.466
6.753	5.164
6.833	3.707
6.993	4.312
7.073	6.011
7.633	7.463
7.874	6.126
8.114	10.735
8.114	7.701
8.167	8.915
8.194	9.764
8.274	6.122
8.568	8.669
9.208	11.819
9.288	14.245
9.582	15.699
9.795	14.727
9.822	11.328
10.009	16.788
10.222	13.995
10.516	18.726
11.103	22.968];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'GhojPati2017'; 
% 
data.LW_m = [ %% total length (cm), weight (g)
3.966	1.310
4.167	0.403
4.290	1.613
4.539	1.714
4.689	1.512
4.741	0.806
4.888	2.117
5.064	1.411
5.086	2.621
5.188	1.915
5.261	2.823
5.362	2.319
5.438	1.714
5.560	2.923
5.561	2.218
5.736	2.520
5.762	2.016
5.909	3.024
5.959	3.226
6.036	2.016
6.185	2.621
6.233	3.528
6.458	3.427
6.632	3.327
6.656	4.133
6.807	3.629
6.829	4.738
6.977	5.645
6.982	3.226
7.054	4.738
7.155	3.931
7.276	6.250
7.278	4.839
7.427	5.343
7.503	4.637
7.575	6.351
7.603	4.738
7.701	5.444
7.773	7.258
7.850	6.048
7.976	5.444
7.996	7.762
8.020	8.569
8.147	7.460
8.174	6.351
8.250	5.847
8.448	6.754
8.823	6.149
8.993	8.569
9.463	10.484
10.401	16.028];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'GhojPati2017'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Data Wwp and Wwi are ignorned due to inconsistency with other data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Tajan River, Caspian Sea basin in Iran';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGVR'; % Cat of Life
metaData.links.id_ITIS = '1200147'; % ITIS
metaData.links.id_EoL = '47064648'; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_tabarestanensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5237138'; % Taxonomicon
metaData.links.id_WoRMS = '1006921'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-tabarestanensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnoides_tabarestanensis}}';  
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
bibkey = 'GhojPati2017'; type = 'Article'; bib = [ ...  
'author = {Ghojoghi, A. and R. Patimar and H. Jafaryan and K. Golzarianpour}, ' ...
'year = {2017}, ' ...
'title = {Age and growth of emph{Alburnoides cf. tabarestanensis} ({T}eleostei: {C}yprinidae) in the {Z}av {S}tream, southeastern {C}aspian {S}ea basin}, ' ... 
'journal = {Iran J. Ichthyol.}, ' ...
'volume = {4(4)}, '...
'pages = {331-339}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnoides-tabarestanensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

