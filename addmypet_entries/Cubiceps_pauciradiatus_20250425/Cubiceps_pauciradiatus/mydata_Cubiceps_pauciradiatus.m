function [data, auxData, metaData, txtData, weights] = mydata_Cubiceps_pauciradiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Nomeidae';
metaData.species    = 'Cubiceps_pauciradiatus'; 
metaData.species_en = 'Bigeye cigarfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 25];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tL data giving an egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 10.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00871*Lp^3.08, see F1';
data.Wwi = 88.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00871*Li^3.08, see F1';

data.Ri  = 2e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(12.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
1.959	0.166
3.975	0.153
3.999	0.200
4.047	0.276
4.097	0.303
5.044	0.220
5.045	0.183
5.093	0.263
5.117	0.323
5.958	0.366
5.959	0.346
5.962	0.226
6.036	0.319
6.037	0.286
6.038	0.246
6.949	0.486
6.976	0.436
7.003	0.386
7.004	0.363
7.006	0.299
7.028	0.402
7.055	0.336
8.026	0.299
8.047	0.432
8.101	0.336
8.126	0.376
8.150	0.402
9.019	0.359
9.039	0.516
9.040	0.499
9.041	0.486
9.067	0.446
9.089	0.549
10.006	0.612
10.033	0.549
10.034	0.522
10.086	0.489
10.964	0.971
10.965	0.925
10.977	0.569
10.998	0.702
10.999	0.675
11.036	0.319
11.966	0.748
11.987	0.895
11.989	0.815
12.018	0.715
12.022	0.585
12.036	0.938
12.077	0.466
12.093	0.768
13.009	0.835
13.039	0.675
13.058	0.881
13.063	0.738
13.955	0.768
13.973	0.988
13.978	0.858
13.998	1.028
14.022	1.071
14.971	0.891
15.003	1.490
15.027	0.738
15.038	1.194
15.965	0.945
15.998	0.689
17.027	1.234
18.077	1.111];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LespSteq2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Atlantic, Indian and Pacific: circumtropical.';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6BNPR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577456'; % Ency of Life
metaData.links.id_Wiki = 'Cubiceps_pauciradiatus'; % Wikipedia
metaData.links.id_ADW = 'Cubiceps_pauciradiatus'; % ADW
metaData.links.id_Taxo = '172441'; % Taxonomicon
metaData.links.id_WoRMS = '159424'; % WoRMS
metaData.links.id_fishbase = 'Cubiceps-pauciradiatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cubiceps_pauciradiatus}}';
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
bibkey = 'LespSteq2003'; type = 'Article'; bib = [ ... 
'author = {Magali Lespilette and Bernard St\''{e}quert and Louis Marec}, ' ... 
'year = {2003}, ' ...
'title = {Age and growth of \emph{Cubiceps pauciradiatus} larvae ({N}omeidae) from the eastern tropical {A}tlantic {O}cean}, ' ...
'journal = {Cybium}, ' ...
'volume = {27(4)}, ' ...
'pages = {269-274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cubiceps-pauciradiatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
