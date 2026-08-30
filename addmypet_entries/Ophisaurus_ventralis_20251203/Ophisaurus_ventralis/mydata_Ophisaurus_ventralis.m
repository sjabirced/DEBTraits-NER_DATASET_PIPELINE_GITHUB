function [data, auxData, metaData, txtData, weights] = mydata_Ophisaurus_ventralis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Anguidae';
metaData.species    = 'Ophisaurus_ventralis'; 
metaData.species_en = 'Eastern glass lizard'; 

metaData.ecoCode.climate = {'Cfa'};
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

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 03];

%% set data
% zero-variate data

data.ab = 95;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.8*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
  comment.Wwb = 'based on TL 15 cm at hatch, at ultimate 108 cm; 600*(15/108)^3';
data.Wwi = 600;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'ADW';
  comment.Wwi = '300-600 g';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-15 eggs per clutch; 1 clutch per yr';

data.JOi  = 0.0205; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'KameGatt1983';   
  temp.JOi = C2K(25);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 32.17; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74Q3X'; % Cat of Life
metaData.links.id_ITIS = '174110'; % ITIS
metaData.links.id_EoL = '1055734'; % Ency of Life
metaData.links.id_Wiki = 'Ophisaurus_ventralis'; % Wikipedia
metaData.links.id_ADW = 'Ophisaurus_ventralis'; % ADW
metaData.links.id_Taxo = '49694'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Ophisaurus/ventralis'; % ReptileWeb
metaData.links.id_AnAge = 'Ophisaurus_ventralis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ophisaurus_ventralis}}';
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
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/Ophisaurus/ventralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ophisaurus_ventralis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ophisaurus_ventralis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KameGatt1983'; type = 'Article'; bib = [ ... 
'title = {Aerobic and Anaerobic Activity Metabolism of Limbless and Fossorial Reptiles}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {56}, ' ...
'year = {1983}, ' ...
'pages = {416-429}, ' ...
'author = {S. Kamel and R. E. Gatten}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

