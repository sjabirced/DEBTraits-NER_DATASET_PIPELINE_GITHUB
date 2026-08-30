function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_genivittatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_genivittatus'; 
metaData.species_en = 'Longspine emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 28];

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 12; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 22;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01318*Lp^2.98, see F1';
data.Wwi = 193;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.98, see F1';

data.Ri  = 5e5/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 0	 0.161 0.134
 5	 0.188 0.188
10	 0.335 0.275
15	 0.644 0.469
20	 1.086 0.811
25	 1.817 1.509
32.5 2.199 1.904
37.5 2.595 2.172];
data.tL(:,1) = data.tL(:,1) + 0;  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MellGalz2009'; treat.tL = {1 {'Laregnere','Canard'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PQP4'; % Cat of Life
metaData.links.id_ITIS = '550905'; % ITIS
metaData.links.id_EoL = '46580951'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_genivittatus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_genivittatus'; % ADW
metaData.links.id_Taxo = '178738'; % Taxonomicon
metaData.links.id_WoRMS = '212078'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-genivittatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_genivittatus}}';
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
bibkey = 'MellGalz2009'; type = 'Article'; bib = [ ... 
'doi = {10.3354/ab00163}, ' ...
'author = { C. Mellin and R. Galzin and D. Ponton and L. Vigliola}, ' ... 
'year = {2009}, ' ...
'title = {Detecting age-structured effects in growth performance of coral reef fish juveniles}, ' ...
'journal = {Aquat. Biol.}, ' ...
'volume = {6}, ' ...
'pages = {31–39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-genivittatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
