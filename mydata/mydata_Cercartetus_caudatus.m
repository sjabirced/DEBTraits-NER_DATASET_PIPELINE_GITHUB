function [data, auxData, metaData, txtData, weights] = mydata_Cercartetus_caudatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Burramyidae';
metaData.species    = 'Cercartetus_caudatus'; 
metaData.species_en = 'Long-tailed pygmy possum'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
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

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 77;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 460;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.Wwb= 'based on Cercartetus_nanus';

data.Wwb = 0.0198;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb= 'based on Cercartetus_nanus';
data.Wwx = 12;     units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 43;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '15-43 g';

data.Ri  = 2*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 2 litters per yr';

data.JOi  = 23.76;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'guess';   
  temp.JOi = C2K(37.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 36; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'based on  Cercartetus_nanus';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.JOi = 5 * weights.JOi;

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
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'endemic in northern Australia and New Guinea';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SQZK'; % Cat of Life
metaData.links.id_ITIS = '609816'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cercartetus_caudatus'; % Wikipedia
metaData.links.id_ADW = 'Cercartetus_caudatus'; % ADW
metaData.links.id_Taxo = '60190'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000021'; % MSW3
metaData.links.id_AnAge = 'Cercartetus_caudatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cercartetus_caudatus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cercartetus_caudatus}}';
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

