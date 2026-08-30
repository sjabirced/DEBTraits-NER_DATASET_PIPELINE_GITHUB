function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_apodus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_apodus'; 
metaData.species_en = 'Schoolmaster snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 15];

%% set data
% zero-variate data

data.ab = 6.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(26.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 42*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 79.1;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.78 mm: pi/6*0.078^3'; 
data.Wwp = 210;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwi = 6420; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1; max. published weight: 10.8 kg';

data.Ri  = 3.56e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_argentiventris';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
1.565	29.256
1.662	17.033
2.094	28.607
2.184	27.310
2.538	24.532
2.933	26.568
3.019	29.253
3.020	28.790
3.065	27.216
3.066	25.827
3.150	31.289
3.151	30.086
3.234	37.493
3.331	25.548
3.373	28.048
3.550	26.381
3.816	24.344
3.940	35.640
3.988	30.639
3.990	28.232
4.030	33.417
4.031	32.121
4.034	27.399
4.164	31.380
4.517	30.546
4.557	35.453
4.607	27.397
4.821	36.101
4.828	26.378
4.956	33.323
5.045	31.100
5.046	30.359
5.091	29.156
5.180	27.952
5.529	32.673
5.531	29.710
6.104	30.264
6.458	28.041
6.718	34.245
7.381	30.725
7.643	33.965
7.865	32.761
8.696	40.444
10.158	31.089
11.825	40.807
13.897	40.618
18.957	50.792
21.957	47.452
41.923	44.167];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.9)*365;  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(26.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PottBurt2016'; 
%
data.tL_m = [ ... % time since birth (d), total length (cm)
2.184	26.384
3.106	31.382
3.237	32.863
3.500	35.641
3.683	25.733
4.076	30.361
5.045	32.211
5.268	27.766
5.883	31.191
5.924	34.246
6.015	31.654
6.054	37.857
6.589	29.893
7.116	32.021
8.129	33.130
8.343	41.000
9.270	40.072
10.288	33.589
11.029	44.605];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.9)*365;  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(26.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PottBurt2016'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;
weights.ab =  0 * weights.ab;
% weights.GSI =  3 * weights.GSI;
% weights.Wwb =  3 * weights.Wwb;
% weights.Wwi =  3 * weights.Wwi;
% weights.Li =  3 * weights.Li;

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '168850'; % ITIS
metaData.links.id_EoL = '46580721'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_apodus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_apodus'; % ADW
metaData.links.id_Taxo = '106198'; % Taxonomicon
metaData.links.id_WoRMS = '159793'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-apodus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_apodus}}';
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
bibkey = 'PottBurt2016'; type = 'Article'; bib = [ ... 
'doi = {10.7717/peerj.2543}, ' ...
'author = {Jennifer C. Potts and Michael L. Burton and Amanda R. Myers}, ' ... 
'year = {2016}, ' ...
'title = {Age, growth, and natural mortality of schoolmaster (\emph{Lutjanus apodus}) from the southeastern {U}nited {S}tates}, ' ...
'journal = {PeerJ}, ' ...
'volume = {4}, ' ...
'pages = {e2543}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-apodus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
