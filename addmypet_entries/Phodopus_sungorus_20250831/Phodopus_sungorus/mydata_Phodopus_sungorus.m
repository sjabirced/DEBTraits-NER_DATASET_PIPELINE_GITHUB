function [data, auxData, metaData, txtData, weights] = mydata_Phodopus_sungorus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Phodopus_sungorus'; 
metaData.species_en = 'Winter white dwarf hamster'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 31];

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'AnAge: 29 d';
data.tx = 21;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 wk';
data.tp = 120;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(36.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 14.8;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 23.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
 comment.Wwi = 'Wiki:19-36 g';
data.Wwim = 30;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
 comment.Wwim = 'Wiki:19-45 g g';

data.Ri  = 5.5*3.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.5 pups per litter; 3.5 litters per yr';

data.JOi  = 40.9;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(36.1);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 25.7; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'corrected table of WhitSeym2003 is used';
	
%% set weights for all real data
weights = setweights(data, []);
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
D1 = 'Males are assumed  to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GK93'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1179519'; % Ency of Life
metaData.links.id_Wiki = 'Phodopus_sungorus'; % Wikipedia
metaData.links.id_ADW = 'Phodopus_sungorus'; % ADW
metaData.links.id_Taxo = '62499'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000371'; % MSW3
metaData.links.id_AnAge = 'Phodopus_sungorus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phodopus_sungorus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phodopus_sungorus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% %
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Phodopus_sungorus/}}';
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
