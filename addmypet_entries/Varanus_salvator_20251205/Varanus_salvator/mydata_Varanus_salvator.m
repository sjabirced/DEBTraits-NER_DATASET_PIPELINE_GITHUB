function [data, auxData, metaData, txtData, weights] = mydata_Varanus_salvator
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_salvator'; 
metaData.species_en = 'Asian water monitor'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biTg','biFm', 'biTh'};
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
metaData.date_subm = [2025 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 05];

%% set data
% zero-variate data

data.ab = 6.5*30.5;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6-7 mnth';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Wiki';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 65; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Varanus_komodoensis: 90*5e4/7e4';
data.Wwi = 50e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-40 eggs per clutch, 1 clutch er season';

data.JOi  = 1.212; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'Glee1979';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 505; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;

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
metaData.links.id_CoL = '7FG74'; % Cat of Life
metaData.links.id_ITIS = '174117'; % ITIS
metaData.links.id_EoL = '51900280'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_salvator'; % Wikipedia
metaData.links.id_ADW = 'Varanus_salvator'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Varanus/salvator'; % ReptileWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_salvator}}';
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
bibkey = 'Glee1979'; type = 'Article'; bib = [ ... 
'title = {Foraging and Transport Costs in the Galapagos Marine Iguana, Amblyrhynchus cristatus}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {52(4)}, ' ...
'year = {1979}, ' ...
'pages = {549-557}, ' ...
'author = {Todd T. Gleeson}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Varanus_salvator/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

