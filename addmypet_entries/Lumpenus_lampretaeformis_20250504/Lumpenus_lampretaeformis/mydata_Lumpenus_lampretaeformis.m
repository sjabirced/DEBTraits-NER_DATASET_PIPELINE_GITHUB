function [data, auxData, metaData, txtData, weights] = mydata_Lumpenus_lampretaeformis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lumpenidae';
metaData.species    = 'Lumpenus_lampretaeformis'; 
metaData.species_en = 'Snakeblenny'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 04];

%% set data
% zero-variate data

data.ab = 38;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(3.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(3.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(3.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 50; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0016; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GordDunc1979';
  comment.Wwb = 'based on egg diameter of 1.44 mm: pi/6*0.144^3';
  comment.Wwb = 'AunePrim2014 give egg diameter of 0.8 mm';
data.Wwp = 3.8;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00129*Lp^2.99, see F1';
data.Wwi = 155;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'AunePrim2014','fishbase'};
  comment.Wwi = 'based on 0.00129*Li^2.99, see F1';

data.Ri = 1000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(3.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AunePrim2014 give a fecundity of 334 eggs';
 
% uni-variate data
% time-length-weight
data.tLW_LL = [ ... % time since birth (yr), total length (cm)
0  7.9 0.6    
1 12.7 2.8
2 13.3 2.9
3 14.2 2.9
4 15.4 3.5
5 16.2 3.9
6 16.6 4.3
7 17.6 4.7
8 18.5 5.5
9 20.25 5.9];	
data.tLW_LL(:,1) = (data.tLW_LL(:,1)+0.95)*365; % convert yr to d
units.tLW_LL = {'d', 'cm', 'g'};  label.tLW_LL = {'time since birth', 'total length', 'weight'};  
  temp.tLW_LL = C2K(3.1);  units.temp.tLW_LL = 'K'; label.temp.tLW_LL = 'temperature';
bibkey.tLW_LL = 'GordDunc1979'; treat.tLW_LL = {1 {'length','weight'}}; title.tLW_LL = 'Loch Linnhe';
%
% time-length-weight
data.tLW_FL = [ ... % time since birth (yr), total length (cm)
0  NaN NaN   
1 11.5 1.3
2 12.0 NaN
3 16.1 2.6
4 15.9 3.4
5 17.36 3.8
6 18.2 5.1
7 20.0 5.3
8 19.5 5.9
9 21.4 6.9];	
data.tLW_FL(:,1) = (data.tLW_FL(:,1)+0.95)*365; % convert yr to d
units.tLW_FL = {'d', 'cm', 'g'};  label.tLW_FL = {'time since birth', 'total length', 'weight'};  
  temp.tLW_FL = C2K(3.1);  units.temp.tLW_FL = 'K'; label.temp.tLW_FL = 'temperature';
bibkey.tLW_FL = 'GordDunc1979'; treat.tLW_FL = {1 {'length','weight'}}; title.tLW_FL = 'Firth of Lorne';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tLW_LL = weights.tLW_LL * 50;
weights.tLW_FL = weights.tLW_FL * 50;
weights.Li = weights.Li * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 0;
weights.Wwp = weights.Wwp * 0;
weights.tp = weights.tp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data Wwp, Wwi and tp ignorned due to inconsistency with tLW data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00129*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Atlantic: Spitsbergen southward to Scandinavian coasts, North Sea, southern part of the Baltic, the Faroes, Iceland and south-eastern coasts of Greenland. Elsewhere, western coasts of Greenland; also, Labrador and Newfoundland to Massachusetts Bay';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6R28Q'; % Cat of Life
metaData.links.id_ITIS = '631023'; % ITIS
metaData.links.id_EoL = '46574696'; % Ency of Life
metaData.links.id_Wiki = 'Lumpenus_lampretaeformis'; % Wikipedia
metaData.links.id_ADW = 'Lumpenus_lampretaeformis'; % ADW
metaData.links.id_Taxo = '46506'; % Taxonomicon
metaData.links.id_WoRMS = '154675'; % WoRMS
metaData.links.id_fishbase = 'Lumpenus_lampretaeformis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumpenus_lampretaeformis}}';
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
bibkey = 'GordDunc1979'; type = 'article'; bib = [ ...
'doi = {10.1017/s0025315400042727}, ' ...
'author = {Gordon, J. D. M. and Duncan, J. A. R.}, ' ...
'year = {1979}, ' ...
'title  = {Some notes on the biology of the snake blenny, \emph{Lumpenus lampretaeformis} on the west coast of {S}cotland}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {59(02)}, ' ...
'pages = {413-419}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lumpenus_lampretaeformis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
