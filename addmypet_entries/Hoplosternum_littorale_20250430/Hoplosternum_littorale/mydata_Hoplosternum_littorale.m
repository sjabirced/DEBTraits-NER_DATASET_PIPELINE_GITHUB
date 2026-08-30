function [data, auxData, metaData, txtData, weights] = mydata_Hoplosternum_littorale

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Callichthyidae';
metaData.species    = 'Hoplosternum_littorale'; 
metaData.species_en = 'Atipa'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data
data.ab = 5.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16.7;      units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 26.3;      units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.1e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 92;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 356;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';
  
data.Ri = 2e4/ 365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % 1time since birth (d), standard length (cm)
11.812	1.192
14.955	1.469
18.340	2.125
18.360	1.332
18.837	2.418
19.599	2.177
23.499	2.384
24.240	2.988
24.854	3.626
25.012	2.333
25.119	3.092
26.119	3.385];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'ricefield 1'};  
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'PontMol2001'};
%
data.tL1 = [ ... % 1time since birth (d), standard length (cm)
33.446	2.593
40.753	2.630
43.035	2.044
44.152	2.716
45.741	4.648
46.613	5.062
47.155	3.527
49.073	2.424
50.168	3.959
50.788	4.339
50.807	3.614
52.566	3.770
54.308	4.632
54.452	3.926
54.945	4.357
55.692	4.736
62.338	5.945
62.852	5.548
69.751	6.774
74.600	9.309
77.746	9.465
78.898	8.741];
units.tL1 = {'d', 'cm'};  label.tL1 = {'time since birth', 'standard length', 'ricefield 2'};  
  temp.tL1 = C2K(25); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = {'PontMol2001'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  10 * weights.tL;
weights.tL1 =  10 * weights.tL1;
weights.Li =  3 * weights.Li;
weights.Li =  3 * weights.Li;
weights.Lp =  3 * weights.Lp;
weights.Wwp =  0 * weights.Wwp;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'data at different locations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1    = 'fishbase';
F2 = 'South America: Most Cis-Andean South American river drainages north of Buenos Aires, Argentina. Introduced in the USA';
metaData.bibkey.F2    = 'fishbase';
F3 = 'The genus can extract oxygen from air using a highly vascularised portion of the gastrointestinal tract after 32 d; before that time via skin';
metaData.bibkey.F3    = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

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
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northeast Atlantic: southern Scandinavia to Mediterranean, Morocco, Mauritania to Senegal'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3MN5Z'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '224637'; % Ency of Life
metaData.links.id_Wiki = 'Hoplosternum_littorale'; % Wikipedia
metaData.links.id_ADW = 'Hoplosternum_littorale'; % ADW
metaData.links.id_Taxo = '44160'; % Taxonomicon
metaData.links.id_WoRMS = '1014873'; % WoRMS
metaData.links.id_fishbase = 'Hoplosternum_littorale'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hoplosternum_littorale}}';  
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
bibkey = 'PontMol2001'; type = 'Article'; bib = [ ...    
'author = {D. Ponton and J. H. Mol and J. Panfili}, ' ...
'year  = {2001}, ' ...
'title = {Use of otolith microincrements for estimating the age and growth of young armoured catfish \emph{Hoplosternum littorale}}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'doi = {10.1006/jfbi.2000.1533}, ' ...
'volume = {58}, ' ...
'pages = {1274-1285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hoplosternum_littorale.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

