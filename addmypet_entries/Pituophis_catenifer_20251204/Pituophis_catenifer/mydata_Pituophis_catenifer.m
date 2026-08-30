function [data, auxData, metaData, txtData, weights] = mydata_Pituophis_catenifer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Pituophis_catenifer'; 
metaData.species_en = 'Bullsnake'; 

metaData.ecoCode.climate = {'B','Cs'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'jiTg'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 04];

%% set data
% zero-variate data

data.ab = 70;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '65-75 d';
data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33.8*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 12; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on TL 32.5 cm at hatch, at ultimate 275 cm; 7276*(32.5/275)^3';
data.Wwi = 7276;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';

data.Ri  = 24/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-24 eggs per clutch; 1 clutch per yr';

data.JOi  = 0.411; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(30);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 548; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = 'endemic to California and Baja California';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JCGM'; % Cat of Life
metaData.links.id_ITIS = '209400'; % ITIS
metaData.links.id_EoL = '47046707'; % Ency of Life
metaData.links.id_Wiki = 'Pituophis_catenifer'; % Wikipedia
metaData.links.id_ADW = 'Pituophis_catenifer'; % ADW
metaData.links.id_Taxo = '531574'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Pituophis/catenifer'; % ReptileWeb
metaData.links.id_AnAge = 'Pituophis_catenifer'; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pituophis_catenifer}}';
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
bibkey = 'NespSola2017'; type = 'Article'; bib = [ ... 
'author = {R. F. Nespolo and J. J. Solano-Iguaran and F. Bozinovic}, '...
'title = {Phylogenetic Analysis Supports the Aerobic-Capacity Model for the Evolution of Endothermy}, '...
'journal = {Am. Nat.}, '....
'year = {2017}, '...
'volume = {189}, '...
'pages = {13-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/Pituophis/catenifer}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pituophis_catenifer}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pituophis_catenifer/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

