  function [data, auxData, metaData, txtData, weights] = mydata_Mesopotamichthys_sharpeyi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Mesopotamichthys_sharpeyi'; 
metaData.species_en = 'Binni'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 11];

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 42.7;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AbduAlZa2022';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 82;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.03, see F1';
data.Wwi = 813; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.03, see F1; max. published weight: 800 g';
    
data.GSI = 0.1755; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'AbduAlZa2022';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 1 11.8
 2 21.4
 3 26.2
 4 30.5
 5 34.5
 6 37.8
 7 41.1
 8 44.0];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MohaAlJu2019';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.214	39.116
13.020	52.617
13.384	25.880
14.043	52.754
14.189	39.381
14.848	55.541
15.139	36.830
16.018	50.340
16.164	45.002
16.175	237.861
16.311	63.772
16.320	216.452
16.751	87.938
17.054	262.086
17.115	55.844
17.481	58.572
17.993	69.355
18.067	82.757
18.069	109.543
18.870	56.079
18.946	96.268
18.948	131.090
19.236	69.521
19.461	149.908
19.605	115.106
19.750	93.697
20.044	120.522
22.753	171.778
22.967	86.092
22.972	177.164
23.481	115.625
23.483	150.447
23.631	185.288
23.924	190.685
23.926	220.149
24.508	182.727
24.593	372.917
24.726	161.328
25.022	204.224
25.244	260.504
25.311	161.406
25.753	209.680
25.901	236.485
25.902	257.914
25.977	284.710
26.190	185.631
26.561	271.395
26.633	247.297
26.636	298.191
26.704	217.843
26.921	177.693
26.934	389.302
27.361	199.181
27.367	284.896
27.439	271.512
27.509	223.308
27.876	242.107
27.878	274.250
28.092	193.921
28.099	306.422
28.245	298.406
28.390	279.676
28.533	223.445
28.681	250.250
28.900	255.637
28.904	311.887
29.041	164.584
29.190	204.783
29.268	279.793
29.412	247.670
29.557	228.939
29.786	384.327
29.854	309.336
29.997	255.784
30.150	357.590
30.212	175.455
30.214	218.313
30.217	261.170
30.364	271.904
30.440	325.486
30.663	384.444
31.023	293.421
31.756	317.626
31.983	443.550
32.128	414.105
32.204	465.008
32.791	502.586
33.225	416.930
33.295	368.725
33.369	392.842
33.880	366.125
34.243	328.674
34.466	392.989
34.684	358.197
35.055	460.033
35.126	422.542
35.791	529.774
36.082	508.384
36.225	452.153
36.892	591.528
37.040	631.727
37.179	505.853
37.180	521.924
37.182	554.067
38.142	717.589
38.210	626.526
38.428	607.806
38.572	562.289
39.034	948.065
39.098	798.074
39.169	768.619
39.177	894.513
39.476	999.017
45.175	914.066
45.245	876.576];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MohaAlJu2019'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00933*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the Tigris-Euphrates basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '425D3'; % Cat of Life
metaData.links.id_ITIS = '690304'; % ITIS
metaData.links.id_EoL = '217587'; % Ency of Life
metaData.links.id_Wiki = 'Mesopotamichthys_sharpeyi'; % Wikipedia
metaData.links.id_ADW = 'Mesopotamichthys_sharpeyi'; % ADW
metaData.links.id_Taxo = '1803312'; % Taxonomicon
metaData.links.id_WoRMS = '1026351'; % WoRMS
metaData.links.id_fishbase = 'Mesopotamichthys-sharpeyi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mesopotamichthys_sharpeyi}}';  
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
bibkey = 'MohaAlJu2019'; type = 'Article'; bib = [ ...  
'author = {Abdul-Razak M. Mohamed and Mohanad O.A. Al-Jubouri}, ' ...
'year = {2019}, ' ...
'title = {Growth and Exploitation Rates of Four Cyprinids Fish  in {A}l-{D}iwaniya {R}iver, {I}raq}, ' ... 
'journal = {IOSR Journal of Agriculture and Veterinary Science (IOSR-JAVS)}, ' ...
'volume = {12(8)}, '...
'pages = {58-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AbduAlZa2022'; type = 'Article'; bib = [ ...  
'author = {Abdul Hussein J. Abdullah and Faleh Musa Al-Zaidy}, ' ...
'year = {2022}, ' ...
'title = {Reproductive Biology of the Bunni \emph{Mesopotamichthys sharpeyi} ({G}\"{u}nther, 1874) from Southern {M}issan {P}rovince Marshes, {S}outhern {I}raq}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {26(3)}, '...
'pages = {347-358}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mesopotamichthys-sharpeyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

