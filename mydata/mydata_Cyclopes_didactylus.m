function [data, auxData, metaData, txtData, weights] = mydata_Cyclopes_didactylus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pilosa'; 
metaData.family     = 'Cyclopedidae';
metaData.species    = 'Cyclopes_didactylus'; 
metaData.species_en = 'Silky anteater'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 21];

%% set data
% zero-variate data

data.tg = 135;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(33);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW: 120-150 d';
data.tx = 152;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(33);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(33);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(33);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'one animal lived for 2,3 yrs in captivety';

data.Wwb = 10; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 160; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'HaysMira2012';
data.Wwi = 266; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 175 to 400 g';

data.Ri  = 2/616;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';  
  comment.Ri = '1 pup per litter, 2 litters per yr';
 
data.JOi  = 114.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WithThom2000';   
  temp.JOi = C2K(33);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 240; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data from Washington, Prague, Bristol'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '32VDS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '328520'; % Ency of Life
metaData.links.id_Wiki = 'Cyclopes_didactylus'; % Wikipedia
metaData.links.id_ADW = 'Cyclopes_didactylus'; % ADW
metaData.links.id_Taxo = '60507'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11800028'; % MSW3
metaData.links.id_AnAge = 'Cyclopes_didactylus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclopes_didactylus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cyclopes_didactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cyclopes_didactylus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaysMira2012'; type = 'article'; bib = [ ...
'doi = {10.HaysMira2012/brv.12350}, ' ...
'title = {\emph{Cyclopes didactylus} ({P}ilosa: {C}yclopedidae)}, ' ...
'journal = {Mammalian Species}, ' ...
'volume = {44(895)}, ' ...
'year = {2012}, ' ...
'pages = {51-58},  ' ...
'author = {Virginia Hayssen and Flavia Miranda and Bret Pasch}'];
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

