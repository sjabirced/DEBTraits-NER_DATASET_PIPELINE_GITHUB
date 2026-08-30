function [data, auxData, metaData, txtData, weights] = mydata_Madoqua_saltiana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Madoqua_saltiana'; 
metaData.species_en = 'Salt''s dik-dik'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
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

data.tg = 178;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 84;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 139;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(37.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 681.67;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 2826;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 3.8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '2.5–4.0 kg';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 2 litters per yr';

data.JOi  = 851.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.8);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 2000; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = weights.Wwx*0;

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
D1 = 'Males are assumed not to differ from females by {p_Am}';
D2 = 'Slow foetal development is assumed';     
D3 = 'Wwx is ignored due to inconsistency';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6R5DD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '311494'; % Ency of Life
metaData.links.id_Wiki = 'Madoqua_saltiana'; % Wikipedia
metaData.links.id_ADW = 'Madoqua_saltiana'; % ADW
metaData.links.id_Taxo = '68406'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200602'; % MSW3
metaData.links.id_AnAge = 'Madoqua_saltiana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Madoqua_saltiana}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Madoqua_saltiana}}';
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