function [data, auxData, metaData, txtData, weights] = mydata_Phascogale_tapoatafa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Phascogale_tapoatafa'; 
metaData.species_en = 'Brush-tailed phascogale'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 290;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0123;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 70;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'AnAge';
data.Wwi = 210;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 310;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';

data.Ri  = 2*6.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.4 pups per litter; 2 litters per yr';

data.JOi  = 127.3;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.4);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  comment.JOi = 'based on Ww = 157.2 g';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4FVN8'; % Cat of Life
metaData.links.id_ITIS = '552622'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Phascogale_tapoatafa'; % Wikipedia
metaData.links.id_ADW = 'Phascogale_tapoatafa'; % ADW
metaData.links.id_Taxo = '59940'; % Taxonomicon
metaData.links.id_WoRMS = '10800076'; % WoRMS
metaData.links.id_MSW3 = ''; % MSW3
metaData.links.id_AnAge = 'Phascogale_tapoatafa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phascogale_tapoatafa}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phascogale_tapoatafa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/brv.12350}, '... 
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

