function [data, auxData, metaData, txtData, weights] = mydata_Gymnobelideus_leadbeateri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Petauridae';
metaData.species    = 'Gymnobelideus_leadbeateri'; 
metaData.species_en = 'Leadbeater''s possum'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 20];

%% set data
% zero-variate data

data.tg = 16;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 115;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 475;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 464;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(35);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14.1*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.194; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 34; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 170;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'GenoIsle2018';

data.Ri  = 1.5*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr; 1.5 pups per litter';

data.JOi  = 103.10;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 166.30; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;
weights.Ri = 3 * weights.Ri;
weights.Wwb = 3 * weights.Wwb;

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3HQJZ'; % Cat of Life
metaData.links.id_ITIS = '609838'; % ITIS
metaData.links.id_EoL = '323822'; % Ency of Life
metaData.links.id_Wiki = 'Gymnobelideus_leadbeateri'; % Wikipedia
metaData.links.id_ADW = 'Gymnobelideus_leadbeateri'; % ADW
metaData.links.id_Taxo = '60209'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000150'; % MSW3
metaData.links.id_AnAge = 'Gymnobelideus_leadbeateri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnobelideus_leadbeateri}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gymnobelideus_leadbeateri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003'; type = 'article'; bib = [ ... 
'doi = {0.1073/pnas.0436428100}, '...
'author = {Craig R. White and Roger S. Seymour}, ' ...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, ' ...
'pages = {4046 – 4049}'];
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

