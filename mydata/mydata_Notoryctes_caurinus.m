function [data, auxData, metaData, txtData, weights] = mydata_Notoryctes_caurinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Notoryctemorphia'; 
metaData.family     = 'Notoryctidae';
metaData.species    = 'Notoryctes_caurinus'; 
metaData.species_en = 'Northern marsupial mole'; 

metaData.ecoCode.climate = {'BSh','BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 20];

%% set data
% zero-variate data

data.tg = 13;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'guess';   
  temp.tg = C2K(30.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 110;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(30.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1.2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(30.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(30.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
data.Wwx = 20; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'guess';
data.Wwi = 50;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = '40–70 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(30.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 2 teats; 1 litter per yr; 1 pup per litter';

data.JOi  = 21.48;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WithThom2000';   
  temp.JOi = C2K(30.8);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 34; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = ' BMR 0.63 ml O_2/h.g';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 0 * weights.tg;
weights.JOi = 3 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Body temperature variable like golden mole; respiration at minimum at 30 C';
metaData.bibkey.F1 = 'WithThom2000';
F2 = 'rarely seen';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Little Sandy and Great Sandy Deserts, and at northern areas of the Gibson Desert (Western Australia), and possibly the Tanami Desert (Western Australia/western Northern Territory';
metaData.bibkey.F3 = 'Wiki';
F4 = 'eye remnants covered with skin; ears covered with hears';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '47YCH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '323861'; % Ency of Life
metaData.links.id_Wiki = 'Notoryctes_caurinus'; % Wikipedia
metaData.links.id_ADW = 'Notoryctes_caurinus'; % ADW
metaData.links.id_Taxo = '60034'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10700004'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notoryctes_caurinus}}';
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
bibkey = 'WhitSeym2003'; type = 'article'; bib = [ ... 
'doi = {0.1073/pnas.0436428100}, '...
'author = {Craig R. White and Roger S. Seymour}, ' ...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, ' ...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438},  ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WithThom2000'; type = 'article'; bib = [ ...
'doi = {10.1071/ZO99073}, ' ...
'title = {Metabolic physiology of the north-western marsupial mole, \emph{Notoryctes caurinus} ({M}arsupialia: {N}otoryctidae)}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {48}, ' ...
'year = {2000}, ' ...
'pages = {241–258},  ' ...
'author = {P. C. Withers and G. G. Thompson and R. S. Seymour}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

