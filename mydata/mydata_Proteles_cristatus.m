function [data, auxData, metaData, txtData, weights] = mydata_Proteles_cristatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Herpestidae';
metaData.species    = 'Proteles_cristatus'; 
metaData.species_en = 'Aardwolf'; 

metaData.ecoCode.climate = {'B',};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
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

data.tg = 84;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki'; 
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '89-92 d';
data.tp = 1.75*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'Wiki';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 275;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = '200-350 g';
data.Wwi = 9000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 7–10 kg';

data.Ri  = 2.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter; 1 litter per yr';

data.JOi  = 2194 ;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(39);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 8100; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'specialised on termites of the family Hodotermitidae';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4N38B'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49952483'; % Ency of Life
metaData.links.id_Wiki = 'Proteles_cristatus'; % Wikipedia
metaData.links.id_ADW = 'Proteles_cristata'; % ADW
metaData.links.id_Taxo = '67059'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000689'; % MSW3
metaData.links.id_AnAge = 'Proteles_cristata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Proteles_cristatus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Proteles_cristata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Proteles_cristata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
