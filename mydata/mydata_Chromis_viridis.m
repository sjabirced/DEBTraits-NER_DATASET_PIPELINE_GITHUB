function [data, auxData, metaData, txtData, weights] = mydata_Chromis_viridis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Chromis_viridis'; 
metaData.species_en = 'Blue green damselfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
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

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Chromis_ternatensis';

data.Lp  = 5.8;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 3.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.02089*Lp^2.90, see F1';
data.Wwi = 16.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.90, see F1';

data.Ri  = 87; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis: 200*10/22.92';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 0	 0.296 0.301
 5	 0.338 0.338
10	 0.475 0.425
15	 0.651 0.565
20	 0.785 0.810
25	 0.880 NaN
26.5 NaN   0.987
30   0.981 NaN
32   NaN   1.154];
data.tL(:,1) = data.tL(:,1) + 0;  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MellGalz2009'; treat.tL = {1 {'Laregnere','Canard'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.90';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5YHVH'; % Cat of Life
metaData.links.id_ITIS = '615234'; % ITIS
metaData.links.id_EoL = '46572227'; % Ency of Life
metaData.links.id_Wiki = 'Chromis_viridis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '46266'; % Taxonomicon
metaData.links.id_WoRMS = '212811'; % WoRMS
metaData.links.id_fishbase = 'Chromis-viridis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chromis_viridis}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Chromis-viridis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
