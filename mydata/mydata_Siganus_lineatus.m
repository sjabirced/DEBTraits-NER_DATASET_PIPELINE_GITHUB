function [data, auxData, metaData, txtData, weights] = mydata_Siganus_lineatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_lineatus'; 
metaData.species_en = 'Golden-lined spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 01];

%% set data
% zero-variate data
data.ab = 2.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 43;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.55 mm: pi/6*0.055^3'; 
data.Wwp = 373; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01698*Lp^3.00, see F1';
data.Wwi = 1350; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*Li^3.00, see F1';

data.Ri = 618603/365;  units.Ri = '#/d';    label.Ri = 'max reprodion rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Siganus_fuscescens';

% uni-variate data
% time-length
data.tL= [ ... % time since birth (d), std length (cm)
4.020	0.294
10.044	0.381
15.026	0.520
18.008	0.782
26.052	1.268
29.979	1.779
34.999	2.012];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BryaMadr1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.am;

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
F1 = 'weight-length relationship: W in g = 0.01698*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YN79'; % Cat of Life
metaData.links.id_ITIS = '1146384'; % ITIS
metaData.links.id_EoL = '46577156'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_lineatus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_lineatus'; % ADW
metaData.links.id_Taxo = '187600'; % Taxonomicon
metaData.links.id_WoRMS = '273916'; % WoRMS
metaData.links.id_fishbase = 'Siganus-lineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_lineatus}}';
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
bibkey = 'BryaMadr1977'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0044-8486(77)90005-9}, ' ...
'author = {Bryan, P. G. and Madraisau, B. B.}, ' ... 
'year = {1977}, ' ...
'title = {Larval rearing and development of \emph{Siganus lineatus} ({P}isces: {S}iganidae) from hatching through metamorphosis}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {10(3)}, ' ...
'pages = {243–252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Siganus-lineatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

