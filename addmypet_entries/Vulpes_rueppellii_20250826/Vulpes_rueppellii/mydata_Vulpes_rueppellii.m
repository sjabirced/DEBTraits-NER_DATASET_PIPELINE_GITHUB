function [data, auxData, metaData, txtData, weights] = mydata_Vulpes_rueppellii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Vulpes_rueppellii'; 
metaData.species_en = 'Rueppell''s fox'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp','TPa'};
metaData.ecoCode.habitat = {'0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 26];

%% set data
% zero-variate data

data.tg = 53;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 8*7;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW'; 
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 40;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Vulpes_macrotis';
data.Wwi = 1600;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'ADW';
  comment.Wwi = '1.2 to 3.6 kg; males being slightly large';
data.Wwim = 1900;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ADW';
  comment.Wwim = '1.2 to 3.6 kg; males being slightly large';

data.Ri  = 2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1 litter per yr';

data.JOi  = 798.9;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(38);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1546; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = weights.JOi * 3;

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
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males, high feed efficiency'};
% set2 = {'tW_0f','tW_0m'}; subtitle2 = {'Data for females, males, low feed efficiency'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5BSFZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '328000'; % Ency of Life
metaData.links.id_Wiki = 'Vulpes_rueppellii'; % Wikipedia
metaData.links.id_ADW = 'Vulpes_rueppellii'; % ADW
metaData.links.id_Taxo = '66454'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000885'; % MSW3
metaData.links.id_AnAge = 'Vulpes_rueppellii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vulpes_rueppellii}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vulpes_rueppellii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Vulpes_rueppellii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018';type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
