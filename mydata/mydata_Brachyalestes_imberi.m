  function [data, auxData, metaData, txtData, weights] = mydata_Brachyalestes_imberi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Brachyalestes_imberi'; 
metaData.species_en = 'Spot-tail'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data
data.ab =  4.5; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.3;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 19.8;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Alestes_baremoze: pi/6*0.08^3';
data.Wwp = 8.8;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^2.98, see F1';
data.Wwi = 83.9;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^2.98, see F1';
  
data.Ri = 14000/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase'; 
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
16.695	1.109
17.854	1.291
17.855	1.223
17.983	1.132
20.043	1.257
20.815	1.336
21.588	1.415
21.845	1.574
21.846	1.472
22.876	1.608
23.777	1.642
24.549	1.743
25.064	1.608
27.897	1.517
28.670	1.936
28.927	2.208
31.116	2.060
31.888	2.502
32.146	1.970
33.433	2.434
35.107	2.423
36.009	2.785
37.039	2.423
38.197	2.819
41.030	2.932
41.159	2.683
42.060	3.136
43.090	2.853
43.605	4.053
46.824	3.453
49.142	3.657
50.043	3.475
51.845	4.053
55.064	4.370
55.065	4.064
57.768	4.755
57.897	4.042
59.957	4.913
60.858	3.906
62.661	4.042
64.592	4.834
65.880	4.879];
data.tL(:,1) = data.tL(:,1) - 5; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoriMats2008'; 

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

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight Ww in g = 0.01148*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Africa: Mono River in Togo to Nipoue River in Liberia. Widely distributed in the Congo River basin. Also in the middle Zambezi, lower Zambezi, Wami River in Tanzania to Pongolo River in South Africa; Lakes Malawi, Rukwa, Rufiji and Ruvuma; on the western coast in the Quanza and the Nyanga, Tanganyika tributaries, Lake Kariba, Cunene River';
metaData.bibkey.F2 = 'fishbase';

%% Links
metaData.links.id_CoL = 'NH5Q'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '204812'; % Ency of Life
metaData.links.id_Wiki = 'Brycinus'; % Wikipedia
metaData.links.id_ADW = 'Brachyalestes_imberi'; % ADW
metaData.links.id_Taxo = '283060'; % Taxonomicon
metaData.links.id_WoRMS = '1026282'; % WoRMS
metaData.links.id_fishbase = 'Brachyalestes-imberi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brycinus}}';  
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
bibkey = 'MoriMats2008'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1365-2028.2007.00908.x}, ' ...
'author = {Shinsuke Morioka and Seiji Matsumoto}, ' ... 
'year = {2008}, ' ...
'title = {A note on the hatching period and growth in juvenile \emph{Brycinus imberi} ({P}isces: {A}lestiidae) in the shallow habitats of {L}ake {M}alawi}, ' ...
'institution = {African Journal of Ecology}, ' ...
'volume = {46(4)}, ' ...
'pages = {690–692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Brachyalestes-imberi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

