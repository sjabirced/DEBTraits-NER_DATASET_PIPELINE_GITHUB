function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_cyanopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_cyanopterus'; 
metaData.species_en = 'Cubera snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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

data.ab = 7.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 55*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 80; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 160;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HeymKjer2005';
  comment.Wwb = 'based egg diameter of 0.78 mm: pi/6*0.078^3'; 
data.Wwp = 6041;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^2.98, see F1';
data.Wwi = 47664; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^2.98, see F1; max. published weight: 57.0 kg';

data.GSI  = 0.058;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(25.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    1  31.7
    2  38.0
    3  44.0
    4  49.7
    5  55.0
    6  60.1
    7  64.8
    8  69.4
    9  73.7
   10  77.7
   11  81.6
   12  85.2
   13  88.6
   14  91.9
   15  95.0
   16  97.9
   17 100.7
   18 103.3
   19 105.7
   20 108.1
   21 110.3
   22 112.4
   25 118.0
   28 122.8
   29 124.3
   31 126.9
   55 143.5];
data.tL(:,1) = (data.tL(:,1) + 0.9)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurtPott2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  15 * weights.tL;
weights.ab =  0 * weights.ab;
weights.GSI =  3 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01288*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WG8W'; % Cat of Life
metaData.links.id_ITIS = '168847'; % ITIS
metaData.links.id_EoL = '46580724'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_cyanopterus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_cyanopterus'; % ADW
metaData.links.id_Taxo = '179214'; % Taxonomicon
metaData.links.id_WoRMS = '159796'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-cyanopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_cyanopterus}}';
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
bibkey = 'BurtPott2017'; type = 'Article'; bib = [ ... 
'doi = {10.5343/bms.2016.1116}, ' ...
'author = {Burton, M.L. and J.C. Potts}, ' ... 
'year = {2017}, ' ...
'title = {Age, growth, and natural mortality of cubera snapper, \emph{Lutjanus cyanopterus}, from the southeastern {U}nited {S}tates}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {93(3)}, ' ...
'pages = {815-828}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeymKjer2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00714.x}, ' ...
'author = {W. D. Heyman and B. Kjerfve and R. T. Graham and K. L. Rhodes and L. Garbutt}, ' ... 
'year = {2005}, ' ...
'title = {Spawning aggregations of \emph{Lutjanus cyanopterus} ({C}uvier) on the {B}elize {B}arrier {R}eef over a 6 year period}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {67}, ' ...
'pages = {83—101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-cyanopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
