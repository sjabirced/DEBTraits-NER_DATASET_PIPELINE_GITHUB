function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_alexandrei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_alexandrei'; 
metaData.species_en = 'Brazilian snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 15];

%% set data
% zero-variate data

data.ab = 6.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AschFerr2015';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 33.1;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'FernOliv2012';
  comment.Wwb = 'based egg diameter of 0.85 mm: pi/6*0.085^3'; 
data.Wwp = 68.3;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 494; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1; max published weight 199.9 g';

data.Ri  = 324e3/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'FernOliv2012';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    0  8.3
    1 13.1
    2 17.0
    3 20.0
    4 22.4
    5 24.2
    6 25.7
    7 26.8
    8 27.7
    9 28.5
   10 29.0];
data.tL(:,1) = (data.tL(:,1) + 0.9)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AschFerr2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;
weights.ab =  0 * weights.ab;
weights.Ri =  3 * weights.Ri;
weights.Wwb =  3 * weights.Wwb;
% weights.Wwi =  3 * weights.Wwi;
% weights.Li =  3 * weights.Li;

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
F1 = 'weight-length relationship: Ww in g = 0.01514*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WG7H'; % Cat of Life
metaData.links.id_ITIS = '1214490'; % ITIS
metaData.links.id_EoL = '46580756'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_alexandrei'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_alexandrei'; % ADW
metaData.links.id_Taxo = '3417126'; % Taxonomicon
metaData.links.id_WoRMS = '276521'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus_alexandrei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_alexandrei}}';
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
bibkey = 'AschFerr2015'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12633}, ' ...
'author = {A. Aschenbrenner and B. P. Ferreira}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth and mortality of \emph{Lutjanus alexandrei} in estuarine and coastal watersof the tropical south-western {A}tlantic}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {31}, ' ...
'pages = {57–64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FernOliv2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12633}, ' ...
'author = {Fernandes, C. A. F. and Oliveira, P. G. V. and Travassos, P. E. P. and Hazin,F. V. H.}, ' ... 
'year = {2012}, ' ...
'title = {Reproduction of the {B}razilian snapper, \emph{Lutjanus alexandrei} {M}oura \& {L}indeman, 2007 ({P}erciformes: {L}utjanidae),oﬀ the northern coast of {P}ernambuco, {B}razil}, ' ...
'journal = {Neotrop. Ich-thyol.}, ' ...
'volume = {10}, ' ...
'pages = {587–592}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus_alexandrei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
