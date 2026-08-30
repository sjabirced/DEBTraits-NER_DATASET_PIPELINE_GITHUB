function [data, auxData, metaData, txtData, weights] = mydata_Chionomys_nivalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Chionomys_nivalis'; 
metaData.species_en = 'European snow vole'; 

metaData.ecoCode.climate = {'Dfb','ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 31];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 18;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 250 ;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.4 *365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 19;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 50;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '28-57 g';

data.Ri  = 2*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 pups per litter; 2 litter per yr';

data.JOi  = 81.0;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(37.4);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 32.8; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y5J4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1179601'; % Ency of Life
metaData.links.id_Wiki = 'Chionomys_nivalis'; % Wikipedia
metaData.links.id_ADW = 'Chionomys_nivalis'; % ADW
metaData.links.id_Taxo = '62731'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000187'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chionomys_nivalis}}';
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
% %
% bibkey = 'AnAge'; type = 'Misc'; bib = ...
% 'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=}}';
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% % %
% bibkey = 'ADW'; type = 'Misc'; bib = ...
% 'howpublished = {\url{https://animaldiversity.org/accounts//}}';
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% %
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
