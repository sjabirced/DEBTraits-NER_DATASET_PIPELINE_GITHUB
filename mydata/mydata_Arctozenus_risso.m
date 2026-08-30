function [data, auxData, metaData, txtData, weights] = mydata_Arctozenus_risso
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Paralepididae';
metaData.species    = 'Arctozenus_risso'; 
metaData.species_en = 'Spotted barracudina'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
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
data.ab = 83; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(4.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6*365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014';   
  temp.tp = C2K(4.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AunePrim2014';  
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.7;   units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'AunePrim2014';
data.Li = 29;     units.Li = 'cm';   label.Li = 'ultimate total length'; bibkey.Li = 'AunePrim2014';

data.Wwb = 0.0038; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 1.94 mm: pi/6*0.194^3';
data.Wwp = 10.4;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00224*Li^3.14, see F1';
data.Wwi = 87.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = {'fishbase','AunePrim2014'};
  comment.Wwi = 'based on 0.00224*Li^3.14, see F2';

data.Ri  = 1.3e3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(4.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.6; AunePrim2014 give a fecundity of 1e5 eggs, but given Wwb, they would weigh 382 g; unlikely in view of Wwi';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 0 * weights.Ri;
weights.Li = 3 * weights.Li;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length: Ww in g =  0.00224*(TL in mm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Worldwide distribution from the Arctic to Antarctic. Eastern Pacific: British Columbia (55 N) to at least north central Baja California (28 N). Northwest Pacific: Bering Sea, Kamchatka, Kuril Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'GBY3'; % Cat of Life
metaData.links.id_ITIS = '644687'; % ITIS
metaData.links.id_EoL = '46563818'; % Ency of Life
metaData.links.id_Wiki = 'Arctozenus_risso'; % Wikipedia
metaData.links.id_ADW = 'Arctozenus_risso'; % ADW
metaData.links.id_Taxo = '161593'; % Taxonomicon
metaData.links.id_WoRMS = '126352'; % WoRMS
metaData.links.id_fishbase = 'Arctozenus_risso'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctozenus_risso}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Arctozenus_risso.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

