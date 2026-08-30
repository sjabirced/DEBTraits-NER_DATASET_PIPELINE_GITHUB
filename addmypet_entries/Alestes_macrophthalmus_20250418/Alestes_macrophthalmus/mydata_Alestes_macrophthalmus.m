  function [data, auxData, metaData, txtData, weights] = mydata_Alestes_macrophthalmus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Alestes_macrophthalmus'; 
metaData.species_en = 'Torpedo robber'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpHl', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
% zero-variate data
data.ab =  3.2; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Bowm1969';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Alestes_baremoze: pi/6*0.08^3';
data.Wwp = 28;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Bowm1969','fishbase'};
  comment.Wwp = 'based on 0.01122*Lp^3.05, see F1';
data.Wwi = 2974;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.05, see F1';
    
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
29.541	1.740
31.992	1.188
35.430	0.970
59.535	2.231
61.184	1.912
65.977	3.146
88.736	2.984
93.310	3.550
93.400	3.826
95.684	2.766
95.846	3.259
119.817	4.114
122.368	3.867
123.289	3.998
124.867	3.460
124.977	3.794
126.927	4.389
151.489	4.373
153.124	4.010
155.180	4.924
183.161	4.632
185.174	5.416
186.732	4.820
210.527	5.138
213.264	5.457];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bowm1969'; 

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
13.262	2306.844
13.433	2689.739
14.120	3244.672
14.378	9445.340
14.807	5243.341
15.064	5796.452
15.451	6562.423
15.665	6308.557
15.923	2530.458
15.966	4568.856
16.137	6777.653
16.223	7245.109
16.309	6566.068
16.352	9283.872
16.395	4782.993
16.524	6821.756
16.567	6312.384
16.824	6440.866
17.382	4829.647
17.425	6698.195
17.639	6189.552
18.369	14812.608
19.356	12905.971
20.215	13504.096
20.515	13123.206
20.730	14907.557
21.674	13000.738
22.489	17208.022
22.489	13428.829
22.575	18779.512
22.704	17548.636
23.133	17550.459
25.494	17263.242];
units.LN   = {'cm', '#'};  label.LN = {'fork length','fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Bowm1969'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight Ww in g = 0.01122*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Africa: Congo River basin: from Pool Malebo up to the upper Lualaba and Luapula in Cameroon, Democratic Republic of the Congo, Republic of Congo, Central African Republic, Angola and Zambia. Lower Guinea: found in coastal River basins in Cameroon, Gabon and the Republic of Congo (Ref. 80290). Also reported from Lake Tanganyika, the Malagarazi River  and the Rusizi River';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BP8N'; % Cat of Life
metaData.links.id_ITIS = '640392'; % ITIS
metaData.links.id_EoL = '211789'; % Ency of Life
metaData.links.id_Wiki = 'Alestes'; % Wikipedia
metaData.links.id_ADW = 'Alestes_macrophthalmus'; % ADW
metaData.links.id_Taxo = '43290'; % Taxonomicon
metaData.links.id_WoRMS = '1020783'; % WoRMS
metaData.links.id_fishbase = 'Alestes_macrophthalmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alestes}}';  
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
bibkey = 'Bowm1969'; type = 'article'; bib = [ ... 
'author = {A. P. Bowmaker}, ' ... 
'year = {1969}, ' ...
'title = {Contribution to Knowledge of the Biology of \emph{Alestes macrophthalmus} {G}unther ({P}isces: {C}haracidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {33}, ' ...
'pages = {302–341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Alestes-macrophthalmus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

