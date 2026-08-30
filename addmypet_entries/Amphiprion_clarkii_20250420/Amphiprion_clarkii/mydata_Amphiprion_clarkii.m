function [data, auxData, metaData, txtData, weights] = mydata_Amphiprion_clarkii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Amphiprion_clarkii'; 
metaData.species_en = 'Yellowtail clownfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 20];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KhooDasa2018';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 7-8 d, yolksac resorbed at 7 h';
data.am = 11*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.7e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KhooDasa2018';
  comment.Wwb = 'based on egg length of 3.0-3.3 mm and width 1.1-1.9 mm: pi/6*0.315*0.15^2'; 
data.Wwp = 4.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.02344*Lp^2.98, see F1';
data.Wwi = 74.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02344*Li^2.98, see F1';

data.Ri  = 2500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (mm)
    0 2.00 3.20 4.50 
    1 3.96 5.19 6.35
    2 5.89 6.88 7.66
    3 7.37 7.97 8.50 
    4 8.23 8.50 8.60];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
L0.tL = [2; 3.2; 4.5]; units.L0.tL = {'cm';'cm';'cm'}; label.L0.tL = {'initial length';'initial length';'initial length'};
bibkey.tL = 'Ochi1986'; treat.tL = {1 {'2.0 cm','3.2 cm','4.5 cm'}}; title.treat.tL = 'initial length';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.L0 = L0;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02344*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: Persian Gulf to Western Australia, throughout the Indo-Australian Archipelago and in the western Pacific at the islands of Melanesia and Micronesia, north to Taiwan, southern Japan and the Ryukyu Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'D559'; % Cat of Life
metaData.links.id_ITIS = '613230'; % ITIS
metaData.links.id_EoL = '46572510'; % Ency of Life
metaData.links.id_Wiki = 'Amphiprion_clarkii'; % Wikipedia
metaData.links.id_ADW = 'Amphiprion_clarkii'; % ADW
metaData.links.id_Taxo = '160741'; % Taxonomicon
metaData.links.id_WoRMS = '212783'; % WoRMS
metaData.links.id_fishbase = 'Amphiprion-clarkii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphiprion_clarkii}}';
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
bibkey = 'Ochi1986'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00392839}, ' ...
'author = {Ochi, H.}, ' ... 
'year = {1986}, ' ...
'title = {Growth of the anemonefish \emph{Amphiprion clarkii} in temperate waters, with special reference to the influence of settling time on the growth of 0-year olds}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {92(2)}, ' ...
'pages = {223–229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Amphiprion-clarkii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
