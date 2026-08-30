function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_russellii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_russellii'; 
metaData.species_en = 'Russell''s snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 12];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LeuLiou2013';
  comment.Wwb = 'based egg diameter of 0.8 mm of L. stellatus: pi/6*0.08^3'; 
data.Wwi = 1524; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.98, see F1';

data.GSI  = 0.25;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0 10.5
    1 18.6
    2 23.1
    3 28.4
    4 39.5];
data.tL(:,1) = 365 * (0.5+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Blab1993'; 
%
data.tL1 = [ ... % time since hatch (d), total length (cm)
0.085	0.196
0.657	0.261
1.714	0.229
2.768	0.262
5.069	0.303
6.793	0.361
10.150	0.403
12.740	0.420
14.937	0.592
20.113	0.700
24.899	0.914
29.958	1.405
37.966	2.321
49.936	4.454];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length'};  
temp.tL1    = C2K(24.7);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'LeuLiou2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WGCM'; % Cat of Life
metaData.links.id_ITIS = '168893'; % ITIS
metaData.links.id_EoL = '51605256'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_russelli'; % ADW
metaData.links.id_Taxo = '179236'; % Taxonomicon
metaData.links.id_WoRMS = '276534'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-russellii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus}}';
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
bibkey = 'Blab1993'; type = 'techreport'; bib = [ ... 
'author = {S. J. M. Blaber}, ' ... 
'year = {1993}, ' ...
'title = {Determination of Biological Parameters required for the Rational Management and Exploitation of the Fishes of the Gulf of Carpentaria}, ' ...
'institution = {CSIRO Division of Fisheries}, ' ...
'volume = {FRDC Project 91/29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeuLiou2013'; type = 'Article'; bib = [ ... 
'doi = {10.1017/s0025315413000131}, ' ...
'author = {Leu, M.-Y., & Liou, C.-H.}, ' ... 
'year = {2013}, ' ...
'title = {The larval development of the {R}ussell''s snapper, \emph{Lutjanus russellii} ({T}eleostei: {L]utjanidae) reared under laboratory conditions}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {93(06)}, ' ...
'pages = {1695–1701}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-russellii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
