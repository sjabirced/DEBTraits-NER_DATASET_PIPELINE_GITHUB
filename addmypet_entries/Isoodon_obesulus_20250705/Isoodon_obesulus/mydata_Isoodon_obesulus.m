function [data, auxData, metaData, txtData, weights] = mydata_Isoodon_obesulus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Peramelemorphia'; 
metaData.family     = 'Peramelidae';
metaData.species    = 'Isoodon_obesulus'; 
metaData.species_en = 'Southern brown bandicoot';

metaData.ecoCode.climate = {'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHr', 'xiHl', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 05];

%% set data
% zero-variate data

data.tg = 15;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 62;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.35; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 125;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 700; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.2* 2.7/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.73 pups per litter, 2.2 litters per yr';
 
% uni-variate data
% time - weight
data.tW = [ ... % time since birth (d),weight (g)
35.060	40.179
41.985	58.386
48.910	75.336
55.714	81.614
62.518	122.422];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(35.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Read2016';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6MYGN'; % Cat of Life
metaData.links.id_ITIS = '552656'; % ITIS
metaData.links.id_EoL = '323865'; % Ency of Life
metaData.links.id_Wiki = 'Isoodon_obesulus'; % Wikipedia
metaData.links.id_ADW = 'Isoodon_obesulus'; % ADW
metaData.links.id_Taxo = '112619'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10900019'; % MSW3
metaData.links.id_AnAge = 'Isoodon_obesulus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isoodon_macrourus}}';
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
bibkey = 'Read2016'; type = 'techreport'; bib = [ ... 
'author = {Bronny Elise Read}, ' ... 
'year = {2016}, ' ...
'title = {Husbandry Guidelines for the Southern Brown Bandicoot \emph{Isoodon obesulus}}, ' ...
'institution = {Taronga Training Institute}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Isoodon_macrourus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

