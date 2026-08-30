function [data, auxData, metaData, txtData, weights] = mydata_Sorex_palustris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Sorex_palustris'; 
metaData.species_en = 'American water shrew'; 

metaData.ecoCode.climate = {'B','Cfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 28];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 90;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'ADW';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 0.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 12; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 16; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '8–18 g';

data.Ri  = 5*2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter, 2 litters per yr';
           
data.JOi  = 70.65;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(38);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 14.4; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 5 * weights.JOi;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'central and eastern regions of Canada and the northern United States, as well as a small isolated section of the Appalachian mountain range';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7WW74'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '133159'; % Ency of Life
metaData.links.id_Wiki = 'Sorex_palustris'; % Wikipedia
metaData.links.id_ADW = 'Sorex_palustris'; % ADW
metaData.links.id_Taxo = '169874'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700566'; % MSW3
metaData.links.id_AnAge = 'Sorex_palustris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sorex_palustris}}';
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
bibkey = 'GenoIsle2018';type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, '...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sorex_palustris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sorex_palustris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
