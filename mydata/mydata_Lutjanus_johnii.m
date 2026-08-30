function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_johnii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_johnii'; 
metaData.species_en = 'John''s snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 14];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 51.9; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 97;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PhilJaya2017';
  comment.Wwb = 'based egg diameter of 0.85 mm: pi/6*0.085^3'; 
data.Wwp = 1766;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.96, see F1';
data.Wwi = 11241; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.96, see F1; max. published weight: 10.5 kg';

data.Ri  = 0.92e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'PhilJaya2017';   
  temp.Ri = C2K(28.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), fork length (cm)
1.474	17.081
2.209	29.814
2.391	34.472
3.018	21.118
3.377	41.304
3.382	31.988
3.494	51.553
3.562	41.925
3.754	31.988
4.058	39.441
4.114	49.068
4.173	54.037
4.239	47.826
4.242	42.857
4.289	66.149
4.357	56.832
4.484	51.242
4.488	44.721
4.552	40.994
5.098	57.764
5.171	40.683
5.290	48.447
5.348	54.658
5.353	45.963
5.354	44.721
5.412	51.242
6.142	70.186
6.332	63.975
6.335	59.006
6.386	76.398
6.516	66.460
7.133	69.255
7.323	61.801
7.505	66.460
7.872	74.534
8.306	72.360
8.372	66.149
8.487	78.882
9.355	77.019
9.419	72.671
9.731	68.944
10.775	80.435
12.384	78.882
16.217	82.298
22.035	77.329
25.249	81.366];
data.tL_f(:,1) = (data.tL_f(:,1) + 0)*365;  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(28.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CappMarr2013';
%
data.tL_m = [ ... % time since birth (d), fork length (cm)
2.135	36.490
2.192	29.368
2.250	22.555
2.318	30.913
2.388	44.224
2.439	27.196
2.444	34.935
2.626	28.120
2.947	45.142
2.949	47.309
3.006	38.639
3.251	33.371
3.316	39.252
3.381	42.656
3.817	45.433
3.999	37.380
4.001	40.786
4.127	44.498
4.133	54.096
4.247	37.994
4.253	46.972
4.255	50.068
4.373	39.849
4.446	57.495
4.498	41.704
4.504	51.611
4.867	36.124
5.304	39.211
5.307	43.855
5.313	54.381
5.372	47.878
5.622	50.350
5.812	57.776
5.999	58.391
6.184	55.292
6.373	60.860
6.617	52.806
7.119	62.083
7.373	70.128
7.375	73.224
7.619	67.027
8.675	67.005
9.239	74.424
9.358	65.752
10.914	71.912
11.165	75.622
12.523	61.662
15.454	81.106
24.211	79.068
25.516	79.970
27.315	77.146
27.871	72.491
28.624	84.859];
data.tL_m(:,1) = (data.tL_m(:,1) + 0)*365;  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(28.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CappMarr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.ab =  0 * weights.ab;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72PR5'; % Cat of Life
metaData.links.id_ITIS = '168885'; % ITIS
metaData.links.id_EoL = '46580750'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_johnii'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_johnii'; % ADW
metaData.links.id_Taxo = '106197'; % Taxonomicon
metaData.links.id_WoRMS = '218496'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-johnii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_johnii}}';
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
bibkey = 'CappMarr2013'; type = 'Article'; bib = [ ... 
'doi = {10.7755/FB.111.4.2}, ' ...
'author = {Mike Cappo and Ross J. Marriott and Stephen J. Newman}, ' ... 
'year = {2013}, ' ...
'title = {James''s rule and causes and consequences of a latitudinal cline in the demography of {J}ohn''s Snapper (\emph{Lutjanus johnii}) in coastal waters of {A}ustralia}, ' ...
'journal = {Fish Bull.}, ' ...
'volume = {111}, ' ...
'pages = {309–324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PhilJaya2017'; type = 'Misc'; bib = [ ...
'year = {2017}' ... 
'author = {K. K. Philipose and Jayasree Loka and T. Senthil Murugan and Ritesh Ranjan}, ' ...
'howpublished = {\url{https://eprints.cmfri.org.in/14966/1/Lutjanus%20johnii.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-johnii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
