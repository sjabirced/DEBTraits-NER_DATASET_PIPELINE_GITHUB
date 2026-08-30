function [data, auxData, metaData, txtData, weights] = mydata_Eumicrotremus_spinosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cyclopteridae';
metaData.species    = 'Eumicrotremus_spinosus'; 
metaData.species_en = 'Atlantic spiny lumpsucker'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.2); % K, body temp
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

data.ab = 41; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(0.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1*365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014';   
  temp.tp = C2K(0.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(0.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 14;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0141; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 3.86;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.02089*Lp^3.03, see F1';
data.Wwi = 62;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = {'AunePrim2014','fishbase'};
  comment.Wwi = 'based on 0.02089*Li^3.03, see F1';

data.Ri = 636/ 365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(0.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'WdW_13','WdW_10','WdW_7','WdW_4'}; subtitle1 = {'Data at 13, 10, 7, 4 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Arctic, Northwest to Northeast Atlantic: Barents Sea to Franz Josef Land, Spitzbergen, Greenland, and south along North American coast to Massachusetts; including Iceland and Norway; Canadian Arctic to Hudson Bay in Canada';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6H95V'; % Cat of Life
metaData.links.id_ITIS = '167545'; % ITIS
metaData.links.id_EoL = '46569201'; % Ency of Life
metaData.links.id_Wiki = 'Eumicrotremus_spinosus'; % Wikipedia
metaData.links.id_ADW = 'Eumicrotremus_spinosus'; % ADW
metaData.links.id_Taxo = '174258'; % Taxonomicon
metaData.links.id_WoRMS = '127217'; % WoRMS
metaData.links.id_fishbase = 'Eumicrotremus_spinosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eumicrotremus_spinosus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Eumicrotremus_spinosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
