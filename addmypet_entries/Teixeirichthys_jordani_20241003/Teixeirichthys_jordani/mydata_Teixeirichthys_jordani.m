function [data, auxData, metaData, txtData, weights] = mydata_Teixeirichthys_jordani

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Teixeirichthys_jordani'; 
metaData.species_en = 'Jordan''s damsel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Dascyllus albisella';
data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.1e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.7 mm and width 0.5 mm: pi/6*0.07*0.05^2'; 
data.Wwp = 2.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.01318*Lp^3.00, see F1';
data.Wwi = 54;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.00, see F1';

data.Ri  = 52800/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Dascyllus albisella';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (cm)
0.000	6.705
0.000	6.814
0.000	6.913
0.000	7.100
0.000	7.218
0.000	7.436
0.000	7.505
0.006	7.278
0.006	7.584
0.006	7.682
0.012	7.001
0.012	7.366
0.988	8.519
0.994	7.720
0.994	7.907
0.994	8.272
0.994	8.568
0.994	8.638
0.994	8.707
0.994	8.805
1.000	8.164
1.000	8.341
1.000	8.401
1.006	8.075
1.006	8.450
1.012	7.996
1.018	7.809
1.982	9.840
1.988	9.889
1.994	9.543
1.994	9.701
1.994	9.741
2.000	9.119
2.000	9.198
2.000	9.316
2.000	9.405
2.000	9.484
2.000	9.622
2.006	9.257
2.012	8.853
2.018	8.922
2.018	9.020
2.982	10.114
2.982	10.213
2.988	10.272
2.988	10.390
2.988	10.449
2.994	9.897
2.994	10.064
2.994	10.499
2.994	10.558
2.994	10.686
3.000	10.341
3.000	10.617
3.012	9.986];
data.tL(:,1) = 365*(data.tL(:,1) + 1.3); % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JuCheu2019';
comment.tL = 'data from Johnston Atoll';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: Red Sea and Mozambique Channel; also known from Australia, China and Japan';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '55554'; % Cat of Life
metaData.links.id_ITIS = '615414'; % ITIS
metaData.links.id_EoL = '46572544'; % Ency of Life
metaData.links.id_Wiki = 'Teixeirichthys_jordani'; % Wikipedia
metaData.links.id_ADW = 'Teixeirichthys_jordani'; % ADW
metaData.links.id_Taxo = '212792'; % Taxonomicon
metaData.links.id_WoRMS = '273759'; % WoRMS
metaData.links.id_fishbase = 'Teixeirichthys_jordani'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Teixeirichthys_jordani}}';
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
bibkey = 'JuCheu2019'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-003-1108-6}, ' ...
'author = {Ju, P. and Cheung, W.W.L. and Lu, Z. and Yang, S. and Guo, Z. and Chen, M. and Xiao, J.}, ' ... 
'year = {2019}, ' ...
'title = {Age, growth, and abundance fluctuation of Jordan’s damsel, \emph{Teixeirichthys jordani} ({A}ctinopterygii: {P}erciformes: {P}omacentridae), in the southern {T}aiwan {S}trait}, ' ...
'journal = {Acta Ichthyol. Piscat.}, ' ...
'volume = {49(3)}, ' ...
'pages = {243–250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Teixeirichthys_jordani}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
