function [data, auxData, metaData, txtData, weights] = mydata_Entelurus_aequoreus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Entelurus_aequoreus'; 
metaData.species_en = 'Snake pipefish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.1); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 03];

%% set data
% zero-variate data

data.ab = 40; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(10.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014';   
  temp.tp = C2K(10.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.51*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AunePrim2014';   
  temp.am = C2K(10.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28.45;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'AunePrim2014';  
data.Li  = 61;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'AunePrim2014';
  comment.Li = 'fishbase gives 40 cm';

data.Wwb = 9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.79;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00068*Lp^3.00, see F1';
data.Wwi = 21;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00068*Li^3.00, see F1';

data.Ri  = 600/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(10.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase gives fecundity of 1000 eggs';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00068*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic: Iceland and Norway to Azores and also enters Baltic Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FDM6'; % Cat of Life
metaData.links.id_ITIS = '644927'; % ITIS
metaData.links.id_EoL = '46567495'; % Ency of Life
metaData.links.id_Wiki = 'Entelurus_aequoreus'; % Wikipedia
metaData.links.id_ADW = 'Entelurus_aequoreus'; % ADW
metaData.links.id_Taxo = '92973'; % Taxonomicon
metaData.links.id_WoRMS = '127379'; % WoRMS
metaData.links.id_fishbase = 'Entelurus_aequoreus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Entelurus_aequoreus}}';
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
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Entelurus_aequoreus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

