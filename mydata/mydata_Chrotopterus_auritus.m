function [data, auxData, metaData, txtData, weights] = mydata_Chrotopterus_auritus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Chrotopterus_auritus'; 
metaData.species_en = 'Big-eared woolly bat'; 

metaData.ecoCode.climate = {'Aw','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiCi','xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 03];

%% set data
% zero-variate data

data.tg = 100;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Anoura geoffroyi';
data.tx = 30.5;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365 ;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'EsbeMotta2006';
  temp.tp = C2K(36.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 22.4; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EsbeMotta2006';
data.Wwx = 60;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 96.1;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'McNa1969';
  comment.Wwi = '75 to 96 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EsbeMotta2006';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ' 1 pup per litter; assumed: 1 litter per yr';

data.JOi  = 141.3;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'McNa1969';   
  temp.JOi = C2K(36.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 96.1; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'WhitSeym2003: 31.1 ml O2/h for Ww=96.1 g and say that they got it from McNa1969';
		
%% set weights for all real data
weights = setweights(data, []);
%weights.Wwx = 0 * weights.Wwx;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
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
metaData.links.id_CoL = '5YK72'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '327367'; % Ency of Life
metaData.links.id_Wiki = 'Chrotopterus_auritus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801207'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chrotopterus_auritus}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Anoura_caudifer/}}';
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
%
bibkey = 'CruzGarl2001';type = 'article'; bib = [ ...
'doi = {10.1078/0944-2006-00006}, ' ...
'author = {Ariovaldo P. Cruz-Neto and Theodore Garland and Augusto Shinya Abe}, '...
'title = {Diet, phylogeny, and basal metabolic rate in phyllostomid bats}, ' ...
'journal = {Zoology}, ' ...
'year = {2001}, ' ...
'volume = {104(1)}, '...
'pages = {49-58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McNa1969';type = 'article'; bib = [ ...
'author = {Brian K. McNab}, '...
'title = {THE ECONOMICS OF TEMPERATURE REGULATION IN NEOTROPICAL BATS}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'year = {1969}, ' ...
'volume = {31}, '...
'pages = {227-268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EsbeMotta2006';type = 'article'; bib = [ ...
'author = {Esb\''{e}rard, C. E. L. and Motta, A. G. and Almeida, J. C. and Ferreira, L. C. S. and Costa, L. M}, '...
'title = {EPRODUCTION OF \emph{Chrotopterus auritus} (PETERS) IN CAPTIVITY ({C}HIROPTERA, {P}HYLLOSTOMIDAE)}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'year = {2006}, ' ...
'volume = {66(3)}, '...
'pages = {955-956}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

