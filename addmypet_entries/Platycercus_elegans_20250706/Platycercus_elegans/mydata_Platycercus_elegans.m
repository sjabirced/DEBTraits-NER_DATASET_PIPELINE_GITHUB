function [data, auxData, metaData, txtData, weights] = mydata_Platycercus_elegans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Platycercus_elegans'; 
metaData.species_en = 'Crimson rosella'; 

metaData.ecoCode.climate = {'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 06];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'bow';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '19-21';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'bow';   
  temp.tx = C2K(41);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 454;units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 26.8*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'bow';
data.Wwi = 163;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'bow';

data.Ri  = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'bow';   
  temp.Ri = C2K(41);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-7 egg/clutch, 1 clutches/yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   7
    7  40
   14  80
   21 110
   28 130];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'wombaroo';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 50;
weights.Wwi = weights.Wwi * 8;
weights.Wwb = weights.Wwb * 3;

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
F1 = '10 d: eyes open; 28 d: feathers ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JP8F'; % Cat of Life
metaData.links.id_ITIS = '554870'; % ITIS
metaData.links.id_EoL = '45517981'; % Ency of Life
metaData.links.id_Wiki = 'Platycercus_elegans'; % Wikipedia
metaData.links.id_ADW = 'Platycercus_elegans'; % ADW
metaData.links.id_Taxo = '54319'; % Taxonomicon
metaData.links.id_WoRMS = '1485183'; % WoRMS
metaData.links.id_avibase = 'AC26C1C10593F82D'; % avibase
metaData.links.id_birdlife = 'crimson-rosella-platycercus-elegans'; % birdlife
metaData.links.id_AnAge = 'Platycercus_elegans'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycercus_elegans}}';
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
bibkey = 'wombaroo'; type = 'Misc'; bib =  ... 
'howpublished = {\url{https://wombaroo.com.au/wp-content/uploads/2020/05/Crimson-Rosella.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib =  ... 
'howpublished = {\url{https://birdsoftheworld.org/bow/species/criros2}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Platycercus_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

