function [data, auxData, metaData, txtData, weights] = mydata_Eulemur_mongoz

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lemuridae';
metaData.species    = 'Eulemur_mongoz'; 
metaData.species_en = 'Mongoose lemur'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 29];

%% set data
% zero-variate data

data.tg = 120;   units.tg = 'd';    label.tg = 'age at birth';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 135;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 mnth';
data.tp = 650;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 36.2*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(36.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 62; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1950; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 2500; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '2-3 kg';

data.Ri  = 1/225; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pups per litter, 1 litter per yr';
            
data.JOi  = 1143;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(36.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1382; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6H9MK'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '326525'; % Ency of Life
metaData.links.id_Wiki = 'Eulemur_fulvus'; % Wikipedia
metaData.links.id_ADW = 'Eulemur_fulvus'; % ADW
metaData.links.id_Taxo = '65490'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100040'; % MSW3
metaData.links.id_AnAge = 'Eulemur_fulvus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eulemur_fulvus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eulemur_fulvus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eulemur_fulvus/}}';
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

