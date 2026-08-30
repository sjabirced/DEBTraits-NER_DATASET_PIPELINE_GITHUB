function [data, auxData, metaData, txtData, weights] = mydata_Hygophum_taaningi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Hygophum_taaningi'; 
metaData.species_en = 'Taaning''s lanternfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.1); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 26];

%% set data
% zero-variate data
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(7.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 6.6;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.6; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.04, see F1';
data.Wwi = 2.64; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.04, see F1; max. published weight: 3.50 g';
  
data.Ri = 1e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(7.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
9.540	0.492
11.047	0.509
13.778	0.693
16.479	0.606
16.623	0.543
17.844	0.693
20.415	0.789
20.561	0.743
20.705	0.685
20.842	0.556
21.307	0.685
22.220	0.773
22.224	0.810
23.120	0.739
23.565	0.677
24.181	0.802
24.776	0.727
26.893	0.806
28.398	0.802];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(7.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ConlGart2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50*weights.tL;
weights.Li = 3*weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight Ww in g = 0.00851*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Atlantic Ocean: south of about 40N to 30S in the western Atlantic and to about 22°S in eastern Atlantic';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6MMDN'; % Cat of Life
metaData.links.id_ITIS = '162701'; % ITIS
metaData.links.id_EoL = '46564148'; % Ency of Life
metaData.links.id_Wiki = 'Hygophum'; % Wikipedia
metaData.links.id_ADW = 'Hygophum_taaningi'; % ADW
metaData.links.id_Taxo = '176980'; % Taxonomicon
metaData.links.id_WoRMS = '126605'; % WoRMS
metaData.links.id_fishbase = 'Hygophum_taaningi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hygophum}}';
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
bibkey = 'ConlGart2009'; type = 'article'; bib = [ ...
'author = {Walter J. Conley and John V. Gartner}, ' ... 
'year   = {2009}, ' ...
'title  = {GROWTH AMONG LARVAE OF LANTERNFISHES ({T}ELEOSTEI: {M}YCTOPHIDAE) FROM THE EASTERN {G}ULF OF {M}EXICO}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'page = {123–135}, ' ...
'volume = {84(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hygophum_taaningi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

