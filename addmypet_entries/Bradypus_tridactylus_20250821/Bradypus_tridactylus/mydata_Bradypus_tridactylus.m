function [data, auxData, metaData, txtData, weights] = mydata_Bradypus_tridactylus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pilosa'; 
metaData.family     = 'Bradypodidae';
metaData.species    = 'Bradypus_tridactylus'; 
metaData.species_en = 'Pale-throated sloth'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 21];

%% set data
% zero-variate data

data.tg = 141;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(33);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 4*30.5;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(33);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1642;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(33);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1095;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(33);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 31*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(33);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 179; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 300; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'Wiki';
data.Wwi = 4850; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '3.8 to 6.5 kg';
data.Wwim = 4600; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '3.2 to 6 kg';

data.Ri  = 1/616;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';        
 
data.JOi  = 580.6;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WithThom2000';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 3746; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;
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

% %% Group plots
% set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data from Washington, Prague, Bristol'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Data Wwx is ignorned due to inconsistency';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'N5F3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '129534'; % Ency of Life
metaData.links.id_Wiki = 'Bradypus_tridactylus'; % Wikipedia
metaData.links.id_ADW = 'Bradypus_tridactylus'; % ADW
metaData.links.id_Taxo = '60524'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11800007'; % MSW3
metaData.links.id_AnAge = 'Bradypus_tridactylus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bradypus_tridactylus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bradypus_tridactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bradypus_tridactylus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438},  ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WithThom2000'; type = 'article'; bib = [ ...
'doi = {10.1071/ZO99073}, ' ...
'title = {Metabolic physiology of the north-western marsupial mole, \emph{Notoryctes caurinus} ({M}arsupialia: {N}otoryctidae)}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {48}, ' ...
'year = {2000}, ' ...
'pages = {241–258},  ' ...
'author = {P. C. Withers and G. G. Thompson and R. S. Seymour}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

