function [data, auxData, metaData, txtData, weights] = mydata_Sarda_australis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Sarda_australis'; 
metaData.species_en = 'Australian bonito'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 02];

%% set data
% zero-variate data

data.ab = 5;        units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(14.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(14.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 70;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 180;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm of Scomber japonicus: pi/6*0.105^3';
data.Wwp = 4.2e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^3.06, see F1';
data.Wwi = 76e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.06, see F1; max. published weight: 9.4 kg';

data.GSI  = 0.02; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'StewRobb2013';   
  temp.GSI = C2K(14.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.129	31.512
0.139	29.884
0.139	29.070
0.139	27.791
0.144	30.581
0.158	32.558
0.163	26.512
0.225	31.395
0.230	32.326
0.235	29.535
0.235	30.233
0.235	34.302
0.240	27.326
0.245	32.907
0.317	39.186
0.317	34.070
0.321	31.977
0.321	30.814
0.331	34.767
0.393	37.442
0.398	32.093
0.408	34.767
0.412	35.930
0.412	36.628
0.427	33.721
0.484	38.372
0.489	37.442
0.739	40.581
0.739	41.744
0.739	43.023
0.825	39.419
0.892	37.558
0.911	36.512
0.921	39.186
0.983	38.488
0.983	39.651
0.988	35.116
0.988	36.512
0.988	37.791
0.993	48.953
0.998	41.744
1.002	46.047
1.055	38.837
1.065	36.047
1.070	38.140
1.074	48.372
1.079	43.488
1.079	36.744
1.084	35.233
1.089	37.674
1.151	48.256
1.161	45.930
1.161	40.930
1.165	43.023
1.165	42.209
1.165	39.767
1.228	39.767
1.228	44.651
1.237	37.442
1.237	41.163
1.237	46.512
1.237	47.791
1.237	48.837
1.237	49.651
1.242	38.721
1.319	50.581
1.324	47.093
1.329	41.628
1.333	48.140
1.333	42.907
1.391	43.605
1.410	47.093
1.487	49.186
1.487	40.698
1.487	39.651
1.487	38.488
1.492	48.023
1.492	37.791
1.496	45.814
1.496	45.116
1.568	48.605
1.578	39.884
1.578	43.488
1.583	46.860
1.588	38.488
1.650	42.907
1.650	42.209
1.655	51.628
1.655	41.860
1.664	44.070
1.669	47.326
1.669	40.698
1.727	49.651
1.731	44.767
1.736	42.442
1.736	43.372
1.736	50.465
1.741	39.070
1.741	44.070
1.741	49.070
1.746	41.163
1.746	47.442
1.751	45.698
1.755	40.465
1.813	40.349
1.823	38.605
1.823	39.535
1.827	41.395
1.904	46.163
1.904	41.512
1.909	38.605
1.914	38.023
1.918	37.558
1.923	48.023
1.928	39.419
2.082	55.465
2.149	54.070
2.149	51.163
2.153	50.465
2.153	47.558
2.158	52.209
2.158	48.605
2.158	41.163
2.163	49.767
2.163	46.860
2.163	46.047
2.245	45.465
2.249	49.651
2.254	48.953
2.254	53.605
2.259	52.442
2.331	49.419
2.331	48.953
2.336	54.419
2.336	52.209
2.336	50.000
2.341	41.047
2.345	45.581
2.417	48.023
2.494	37.907
2.494	38.372
2.494	46.279
2.494	46.977
2.494	58.605
2.494	60.233
2.499	45.465
2.499	54.070
2.499	55.698
2.499	56.395
2.504	41.279
2.504	44.535
2.504	63.837
2.580	49.767
2.585	48.953
2.590	46.395
2.590	47.907
2.662	51.395
2.671	58.372
2.743	52.674
2.748	49.535
2.753	44.884
2.839	43.488
3.329	62.558
3.333	50.000
3.333	60.000
3.420	60.814
3.429	63.721
3.516	47.674];
data.tL(:,1) = 365*(2+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(14.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StewRobb2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.GSI = 5 * weights.GSI;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00955*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMJZ'; % Cat of Life
metaData.links.id_ITIS = '202018'; % ITIS
metaData.links.id_EoL = '46577304'; % Ency of Life
metaData.links.id_Wiki = 'Sarda_australis'; % Wikipedia
metaData.links.id_ADW = 'Sarda_australis'; % ADW
metaData.links.id_Taxo = '186534'; % Taxonomicon
metaData.links.id_WoRMS = '273809'; % WoRMS
metaData.links.id_fishbase = 'Sarda-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarda_australis}}';
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
bibkey = 'StewRobb2013'; type = 'article'; bib = [ ... 
'doi = {10.1071/MF12249}, ' ...
'author = {J. Stewart and W. D. Robbins and K. Rowling and A. Hegarty and A. Gould}, ' ... 
'year = {2013}, ' ...
'title = {A multifaceted approach to modelling growth of the {A}ustralian bonito, \emph{Sarda australis} (Family {S}combridae), with some observations on its reproductive biology}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {64}, ' ...
'pages = {671–678}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Sarda-australis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
