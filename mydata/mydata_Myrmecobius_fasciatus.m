function [data, auxData, metaData, txtData, weights] = mydata_Myrmecobius_fasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Myrmecobiidae';
metaData.species    = 'Myrmecobius_fasciatus'; 
metaData.species_en = 'Numbat'; 

metaData.ecoCode.climate = {'BWh','BWk','Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 18];

%% set data
% zero-variate data

data.tg = 14;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Coop2011';   
  temp.tg = C2K(34.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 243;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 350;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(34.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 23;   units.Li = 'g';   label.Li = 'ultimate head-rump length'; bibkey.Li = 'Wiki';
  comment.Li = 'TL 45 cm; from photo: 22 cm tail';

data.Wwb = 0.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '360-680 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';
 
data.JOi  = 32.5;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(34.1);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 400; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'Coop2011 gives 3.89 ml O2/h.g, but this is seems 10 times too high for BMR; is possibly PMR';
    
% univariate data
% time-length
data.tL = [ ... % guessed time since birth (d), crown-rump length (cm)
    65 2.5
    68 3.0
    85 4.0
   113 5.5
   116 6.0
   179 8.0];
data.tL(:,1) = data.tL(:,1)-65;
units.tL = {'d', 'cm'};     label.tL = {'time', 'crown-rump length'};  
temp.tL = C2K(34.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Cala1960';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
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

% %% Group plots
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'feeds exclusively on termites; once in South Autralia, now confined to extreme SW';
metaData.bibkey.F1 = 'Coop2011'; 
F2 = 'No pounch; diurnal';
metaData.bibkey.F2 = 'Coop2011'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '73TBD'; % Cat of Life
metaData.links.id_ITIS = '552592'; % ITIS
metaData.links.id_EoL = '311158'; % Ency of Life
metaData.links.id_Wiki = 'Myrmecobius_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Myrmecobius_fasciatus'; % ADW
metaData.links.id_Taxo = '60025'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800007'; % MSW3
metaData.links.id_AnAge = 'Myrmecobius_fasciatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myrmecobius_fasciatus}}';
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
bibkey = 'Coop2011'; type = 'article'; bib = [ ... 
'doi = {10.1644/881.1}, ' ...
'author = {Christine Elizabeth Cooper}, ' ...
'year = {2011}, ' ...
'title  = {\emph{Myrmecobius fasciatus} ({D}asyuromorphia: {M}yrmecobiidae)}, ' ...
'journal = {Mammalian Species}, ' ...
'volume = {43(881)}, ' ...
'pages = {129–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cala1960'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1960.tb05841.x}, ' ...
'author = {J. H. Calaby}, ' ...
'year = {1960}, ' ...
'title  = {OBSERVATIONS ON THE BANDED ANT-EATER \emph{Myrmecobius f. fasciatus} {W}ATERHOUSE ({M}ARSUPIALIA), WITH PARTICULAR REFERENCE TO ITS FOOD HABITS}, ' ...
'journal = {Proceedings of the Zoological Society of London}, ' ...
'volume = {43(881)}, ' ...
'pages = {129–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003'; type = 'article'; bib = [ ... 
'doi = {0.1073/pnas.0436428100}, '...
'author = {Craig R. White and Roger S. Seymour}, ' ... 
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, ' ...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Myrmecobius_fasciatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

