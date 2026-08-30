function [data, auxData, metaData, txtData, weights] = mydata_Thallomys_paedulcus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Thallomys_paedulcus'; 
metaData.species_en = 'Acacia rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 01];

%% set data
% zero-variate data

data.tg = 26;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 109;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'at least 3.5 yr';

data.Wwb = 2.65; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 17.5;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 132.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WhitSeym2003';
  comment.Wwi = 'ADW: 63 and 100 g';

data.Ri  = 6/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter; 2 litters per yr';

data.JOi  = 87.3;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(36.7);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 132.4; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;
weights.Wwi = 8 * weights.Wwi;
weights.JOi = 3 * weights.JOi;

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
D1 = 'Males are assumed  not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZVG8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1179443'; % Ency of Life
metaData.links.id_Wiki = 'Thallomys_paedulcus'; % Wikipedia
metaData.links.id_ADW = 'Thallomys_paedulcus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001842'; % MSW3
metaData.links.id_AnAge = 'Thallomys_paedulcus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thallomys_paedulcus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thallomys_paedulcus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Thallomys_paedulcus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
