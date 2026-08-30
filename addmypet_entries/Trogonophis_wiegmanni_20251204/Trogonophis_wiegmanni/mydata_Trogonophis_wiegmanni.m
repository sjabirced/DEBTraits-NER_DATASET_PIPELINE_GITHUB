function [data, auxData, metaData, txtData, weights] = mydata_Trogonophis_wiegmanni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Trogonophidae';
metaData.species    = 'Trogonophis_wiegmanni'; 
metaData.species_en = 'Checkerboard worm lizard'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'jiTd'};
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
metaData.date_subm = [2025 12 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 04];

%% set data
% zero-variate data

data.ab = 90;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'animalia';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Amphisbaena_alba';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Amphisbaena_alba';

data.Wwb = 0.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
data.Wwi = 19.6 ;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'snakesandlizards';
  comment.Wwi = 'based on TL 25 cm, width 1 cm: 25*1^2*pi/4';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'snakesandlizards';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 eggs per clutch; 1 clutch per yr';

data.JOi  = 0.0032; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'KameGatt1983';   
  temp.JOi = C2K(25);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 4.97; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

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
metaData.links.id_CoL = '7CW3X'; % Cat of Life
metaData.links.id_ITIS = '1125556'; % ITIS
metaData.links.id_EoL = '461507'; % Ency of Life
metaData.links.id_Wiki = 'Trogonophis_wiegmanni'; % Wikipedia
metaData.links.id_ADW = 'Trogonophis_wiegmanni'; % ADW
metaData.links.id_Taxo = '50463'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Trogonophis/wiegmanni'; % ReptileWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trogonophis_wiegmanni}}';
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
bibkey = 'KameGatt1983'; type = 'Article'; bib = [ ... 
'title = {Aerobic and Anaerobic Activity Metabolism of Limbless and Fossorial Reptiles}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {56}, ' ...
'year = {1983}, ' ...
'pages = {416-429}, ' ...
'author = {S. Kamel and R. E. Gatten}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'snakesandlizards'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.snakesandlizards.com/identification/checkerboard-worm-lizard-trogonophis-wiegmanni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

