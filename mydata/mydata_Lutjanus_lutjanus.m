function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_lutjanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_lutjanus'; 
metaData.species_en = 'Bigeye snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
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
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.2; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 26;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01622*Lp^2.95, see F1';
data.Wwi = 582; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01622*Li^2.95, see F1; max. published weight: 390 g';

data.Ri  = 102841/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
37.585	5.381
98.078	6.095
365+84.342	9.381
365+123.963	9.857
365+187.639	10.571
730+36.999	12.190
730+186.976	13.095
730+254.184	13.571
730+317.144	13.857
730+361.364	14.381
1095+125.113	14.905
1095+217.784	15.238
1095+252.800	15.333
1095+360.680	15.714
1460+5.233	15.905
1460+37.065	15.952
1460+124.784	16.286
1460+155.202	16.333
1460+253.891	17.000
1460+317.910	17.143
1825+4.195	17.238
1825+37.799	17.429
1825+124.459	17.905
1825+153.458	17.762
1825+252.491	17.857
1825+316.868	18.238];
data.tL(:,1) = data.tL(:,1) +  300;  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Prad2015';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
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

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01622*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QQ2R'; % Cat of Life
metaData.links.id_ITIS = '1214478'; % ITIS
metaData.links.id_EoL = '46580749'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_lutjanus'; % ADW
metaData.links.id_Taxo = '106209'; % Taxonomicon
metaData.links.id_WoRMS = '218495'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-lutjanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_lutjanus}}';
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
bibkey = 'Prad2015'; type = 'Article'; bib = [ ... 
'author = {Pradeep.H.D}, ' ... 
'year = {2015}, ' ...
'title = {Estimates of Length-Based Population Parameters of the Bigeye Snapper (\emph{Lutjanus lutjanus}  {B}loch, 1790) off  {M}adras coast along South-east coast of {I}ndia}, ' ...
'journal = {Journal of the Andaman Science Association}, ' ...
'volume = {20(2)}, ' ...
'pages = {213-219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-lutjanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
