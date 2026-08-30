function [data, auxData, metaData, txtData, weights] = mydata_Zaglossus_bruijni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Monotremata'; 
metaData.family     = 'Tachyglossidae';
metaData.species    = 'Zaglossus_bruijni'; 
metaData.species_en = 'western long-beaked echidna'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTa', '0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'incubation time';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(30.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 152;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(30.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(30.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365*41.2;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(30.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 1.36;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'Flan1990';
  comment.Ww0 = 'based on egg length of 18 mm, and guessed width of 12 mm: pi/6*1.8*1.2^2';
data.Wwb = 0.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnInfo';
data.Wwx = 400;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 16500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(30.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one egg per litter, 1 litter per yr';

data.JOi  = 1215.4;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(30.8);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 10300; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = weights.Ww0 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'WJO','WJO_hib'}; subtitle1 = {'Data during active period, hibernation'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Data Ww0 is ignored because of inconsistency with Wwb';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Feeds on earthworms';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7GBTL'; % Cat of Life
metaData.links.id_ITIS = '552523'; % ITIS
metaData.links.id_EoL = '323860'; % Ency of Life
metaData.links.id_Wiki = 'Zaglossus_bruijni'; % Wikipedia
metaData.links.id_ADW = 'Zaglossus_bruijni'; % ADW
metaData.links.id_Taxo = '77683'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10300017'; % MSW3
metaData.links.id_AnAge = 'Zaglossus_bruijni'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zaglossus_bruijni}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Zaglossus_bruijni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Zaglossus_bruijni/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnInfo'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animalinformation.com/animal/western-long-beaked-echidna/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Flan1990'; type = 'Book'; bib = [ ...  
'title = {Mammals of New Guinea.}, '...
'publisher = {The Australian Museum, Robert Brown \& Assoc.}, '...
'year = {1990}, '...
'author = {Flannery, T.}, '...
'address = {Carina, Qld}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/brv.12350}, '... 
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


