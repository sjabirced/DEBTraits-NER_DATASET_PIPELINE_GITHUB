function [data, auxData, metaData, txtData, weights] = mydata_Gaidropsarus_argentatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Gaidropsarus_argentatus'; 
metaData.species_en = 'Arctic rockling'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0jMp', '0iMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

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
data.ab = 41; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(4.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(4.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AunePrim2014';  
  temp.am = C2K(4.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'AunePrim2014';
data.Li = 42;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'AunePrim2014';
  comment.Li = 'fishbase gives 35 cm';

data.Wwb = 0.0011;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 1.27  mm: pi/6*0.127^3';
data.Wwp = 94.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00468*Li^3.08, see F3';
data.Wwi = 467.6; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00468*Li^3.08, see F3';

data.Ri = 1.2e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.95; AunePrim2014 give a fecundity of 1e5 eggs, but giveb Wwb, the total egg weight would be 550 g, which is unlikely given Wwi';

  %% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
  
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00468*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Arctic to North Atlantic: off Newfoundland and Labrador and west of British Isles';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6JVM7'; % Cat of Life
metaData.links.id_ITIS = '164768'; % ITIS
metaData.links.id_EoL = '46564452'; % Ency of Life
metaData.links.id_Wiki = 'Gaidropsarus_argentatus'; % Wikipedia
metaData.links.id_ADW = 'Gaidropsarus_argentatus'; % ADW
metaData.links.id_Taxo = '174627'; % Taxonomicon
metaData.links.id_WoRMS = '126451'; % WoRMS
metaData.links.id_fishbase = 'Gaidropsarus_argentatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gaidropsarus_argentatus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Gaidropsarus_argentatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

