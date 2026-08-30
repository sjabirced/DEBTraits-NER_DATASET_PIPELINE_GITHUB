function [data, auxData, metaData, txtData, weights] = mydata_Hypsiprymnodon_moschatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Hypsiprymnodontidae';
metaData.species    = 'Hypsiprymnodon_moschatus'; 
metaData.species_en = 'Musky rat-kangaroo'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 18];

%% set data
% zero-variate data

data.tg = 14;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'guess';   
  temp.tg = C2K(34.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 270;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 250;     units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';
     
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'occurse only in NE Australia; west of Ingham, Queensland at Mt. Lee to Mt. Amos south of Cooktown';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MT3Q'; % Cat of Life
metaData.links.id_ITIS = '552703'; % ITIS
metaData.links.id_EoL = '311160'; % Ency of Life
metaData.links.id_Wiki = 'Hypsiprymnodon_moschatus'; % Wikipedia
metaData.links.id_ADW = 'Hypsiprymnodon_moschatus'; % ADW
metaData.links.id_Taxo = '60260'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000175'; % MSW3
metaData.links.id_AnAge = 'Hypsiprymnodon_moschatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hypsiprymnodon_moschatus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hypsiprymnodon_moschatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

