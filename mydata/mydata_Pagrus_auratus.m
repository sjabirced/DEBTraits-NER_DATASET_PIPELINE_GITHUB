function [data, auxData, metaData, txtData, weights] = mydata_Pagrus_auratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagrus_auratus'; 
metaData.species_en = 'Silver seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MP'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCim', 'biCic'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 30];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(17.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 54*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(17.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
  comment.Lp = '53.3 cm for males';
data.Li  = 130;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 42508;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02239*Li^2.97, see F1; max. published weight: 20.0 kg';

data.Ri  = 1.8e6/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(17.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (mm)
33.302	1.015
33.632	0.887
33.793	0.683
33.959	0.644
33.961	0.759
36.469	1.259
36.793	0.888
36.800	1.156
36.963	1.016
37.790	0.824
56.805	2.771
56.813	3.117
57.467	2.656
82.146	4.899
82.278	3.453
82.298	4.259
82.311	4.809
82.483	5.078
82.775	3.325
99.468	5.631
99.482	6.207
99.653	6.386];
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(17.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fran1994';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temeratures are guessed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.02239*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: widely occurring off New Zealand, Australia, Philippines, Indonesia, China, Taiwan, and Japan';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '75KB4'; % Cat of Life
metaData.links.id_ITIS = '647881'; % ITIS
metaData.links.id_EoL = '47060456'; % Ency of Life
metaData.links.id_Wiki = 'Pagrus_auratus'; % Wikipedia
metaData.links.id_ADW = 'Pagrus_auratus'; % ADW
metaData.links.id_Taxo = '182493'; % Taxonomicon
metaData.links.id_WoRMS = '398546'; % WoRMS
metaData.links.id_fishbase = 'Pagrus_auratus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagrus_auratus}}';
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
bibkey = 'Fran1994'; type = 'Article'; bib = [ ... 
'author = {Malcolm P. Francis}, ' ... 
'year = {1994}, ' ...
'title = {Growth of juvenile snapper, \emph{Pagrus auratus}}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {28}, ' ...
'pages = {201-218}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pagrus_auratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
