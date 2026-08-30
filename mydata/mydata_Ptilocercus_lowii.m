function [data, auxData, metaData, txtData, weights] = mydata_Ptilocercus_lowii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Scandentia'; 
metaData.family     = 'Ptilocercidae';
metaData.species    = 'Ptilocercus_lowii'; 
metaData.species_en = 'Pen-tailed treeshrew'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 24];

%% set data
% zero-variate data

data.tg = 50;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 36;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(35.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-25 d';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12.5*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(35.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: One captive specimen lived for 2.7 years, but maximum longevity is likely much longer';

data.Wwb = 10; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'Wiki: 10-12 g';
data.Wwx = 22;   units.Wwx = 'g';  label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 57.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WhitSeym2003';
  comment.Wwi = 'ADW: 42.5 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
            
data.JOi  = 43.1;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';           
  weight.JOi = 57.5; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'in Malaysia it spent several hours per night consuming naturally fermented nectar of the bertam palm (alcohol content up to 3.8 percent)';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Q7X6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '289799'; % Ency of Life
metaData.links.id_Wiki = 'Ptilocercus_lowii'; % Wikipedia
metaData.links.id_ADW = 'Ptilocercus_lowii'; % ADW
metaData.links.id_Taxo = '61403'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11900070'; % MSW3
metaData.links.id_AnAge = 'Ptilocercus_lowii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ptilocercus_lowii}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ptilocercus_lowii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ptilocercus_lowii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

