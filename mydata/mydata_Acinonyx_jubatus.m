function [data, auxData, metaData, txtData, weights] = mydata_Acinonyx_jubatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Acinonyx_jubatus'; 
metaData.species_en = 'Cheetah'; 

metaData.ecoCode.climate = {'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2025 07 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 18];

%% set data
% zero-variate data

data.tg = 88;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 107;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2.5*365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(39.0); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2-3 yrs';
data.am = 20.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.0); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 460; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'WackKram1991';
data.Wwx = 1940; units.Wwx = 'g'; label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 53500; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 21 and 65 kg';

data.Ri  = 0.7*3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 0.7 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.026	469.856
1.945	508.695
3.133	547.557
4.052	590.272
5.078	632.996
5.996	675.710
7.131	710.692
8.049	753.407
9.022	792.250
9.940	819.461
10.966	885.441
11.993	928.165
12.965	974.760
14.046	1017.489
15.018	1052.456
15.990	1025.408
17.071	1099.145
17.935	1099.219
18.962	1188.455
20.096	1316.460
20.960	1285.526
22.041	1347.635
22.959	1324.458
23.986	1378.810
25.066	1440.919
25.876	1468.120
27.011	1429.458
28.037	1631.097
29.010	1623.429
30.090	1538.251
31.062	1565.466
31.981	1569.421
32.953	1767.179
33.980	1670.369
35.114	1709.226
35.924	1751.932
36.951	1814.035
37.923	1961.406
38.896	1876.218
39.976	1899.567
40.894	1930.654
41.975	2078.034
43.001	1973.471
43.866	1981.298
44.946	2016.274];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WackKram1991';

% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
120.916  8302.564
150.474	10248.092
181.146	14694.135
181.896	16171.756
211.532	15844.591
213.051	18231.662
242.702	17449.959
243.479	18132.137
272.935	23032.163
272.963	22236.722
302.209	21568.469
303.073	19750.688
334.060	26696.877
364.775	29892.942];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(39.0);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MarkDick2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tW1 = 5 * weights.tW1;
weights.Wwx = 0 * weights.Wwx;
weights.Wwb = 5 * weights.Wwb;
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: tW1 data added';     
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '9BTZ'; % Cat of Life
metaData.links.id_ITIS = '183813'; % ITIS
metaData.links.id_EoL = '328680'; % Ency of Life
metaData.links.id_Wiki = 'Acinonyx_jubatus'; % Wikipedia
metaData.links.id_ADW = 'Acinonyx_jubatus'; % ADW
metaData.links.id_Taxo = '67330'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000006'; % MSW3
metaData.links.id_AnAge = 'Acinonyx_jubatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lynx_lynx}}';
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
bibkey = 'WackKram1991'; type = 'Article'; bib = [ ... 
'author = {Wack, R. F. and Kramer, L. W. and Cupps, W. and Currie, P.}, ' ... 
'year = {1991}, ' ...
'title = {Growth rate of 21 captive-born, mother-raised cheetah cubs}, ' ...
'howpublished = {\url{http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.600.7752&rep=rep1&type=pdf}}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {10}, ' ...
'pages = {273--276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarkDick2003'; type = 'Article'; bib = [ ... 
'author = {Laurie L. Marker and Amy J. Dickman}, ' ... 
'year = {2003}, ' ...
'title = {MORPHOLOGY, PHYSICAL CONDITION, AND GROWTH OF THE CHEETAH (\emph{Acinonyx jubatus jubatus})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {84(3)}, ' ...
'pages = {840–850}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lynx_lynx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

