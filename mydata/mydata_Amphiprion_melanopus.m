function [data, auxData, metaData, txtData, weights] = mydata_Amphiprion_melanopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Amphiprion_melanopus'; 
metaData.species_en = 'Fire clownfish'; 

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

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.7e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KhooDasa2018';
  comment.Wwb = 'based on egg length of 3.0-3.3 mm and width 1.1-1.9 mm: pi/6*0.315*0.15^2'; 
data.Wwp = 2.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.0223*Lp^3.03, see F1';
data.Wwi = 41.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0223*Li^3.03, see F1';

data.Ri  = 7200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (mm)
 0	0.504
 5	0.793
10	1.009
15	1.029
20	1.160
25	1.413];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArveMcCo2000';  comment.tL = 'data for light:dark 16:8';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.0223*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: Persian Gulf to Western Australia, throughout the Indo-Australian Archipelago and in the western Pacific at the islands of Melanesia and Micronesia, north to Taiwan, southern Japan and the Ryukyu Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'D55T'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572517'; % Ency of Life
metaData.links.id_Wiki = 'Amphiprion_melanopus'; % Wikipedia
metaData.links.id_ADW = 'Amphiprion_melanopus'; % ADW
metaData.links.id_Taxo = '46255'; % Taxonomicon
metaData.links.id_WoRMS = '278398'; % WoRMS
metaData.links.id_fishbase = 'Amphiprion-melanopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphiprion_melanopus}}';
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
bibkey = 'ArveMcCo2000'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00392839}, ' ...
'author = {M. Arvedlund and M.I. McCormick and T. Ainsworth}, ' ... 
'year = {2000}, ' ...
'title = {Effects of Photoperiod on Growth of Larvae and Juveniles of the Anemonefish \emph{Amphiprion melanopus}}, ' ...
'journal = {Naga, The ICLARM Quarterly}, ' ...
'volume = {23(2)}, ' ...
'pages = {18-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Amphiprion_melanopus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
