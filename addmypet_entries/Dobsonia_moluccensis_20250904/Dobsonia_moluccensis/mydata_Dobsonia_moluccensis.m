function [data, auxData, metaData, txtData, weights] = mydata_Dobsonia_moluccensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Dobsonia_moluccensis'; 
metaData.species_en = 'Bare-backed fruit bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 04];

%% set data
% zero-variate data

data.tg = 150;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 180;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 715 ;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 55; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 508;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 510;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '325–525 g';
data.Wwim = 480;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '380–500 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'gbif';   
  temp.Ri = C2K(36.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

data.JOi  = 367.9;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(36.8);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 404.3; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'corrected PNAS table is used';																					
		
%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;
weights.JOi = 3 * weights.JOi;
weights.Wwi = 5 * weights.Wwi;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '372KN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '327329'; % Ency of Life
metaData.links.id_Wiki = 'Dobsonia_moluccensis'; % Wikipedia
metaData.links.id_ADW = 'Dobsonia_moluccensis'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800083'; % MSW3
metaData.links.id_AnAge = 'Dobsonia_moluccensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dobsonia_moluccensis}}';
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
% bibkey = 'AnAge'; type = 'Misc'; bib = ...
% 'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=}}';
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/2433186}}';
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
