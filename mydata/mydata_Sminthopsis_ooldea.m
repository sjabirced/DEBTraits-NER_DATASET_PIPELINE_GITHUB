function [data, auxData, metaData, txtData, weights] = mydata_Sminthopsis_ooldea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Sminthopsis_ooldea'; 
metaData.species_en = 'Ooldea dunnart'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 19];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'FrigWool1997';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 70;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'FrigWool1997';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '65-70 d';
data.tp = 300;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Wiki';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(35.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.01;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 4.8;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 11;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = '11-18 g';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 8 pups per litter';
   
data.JOi  = 18.9;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(35.9);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 10.6; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4XWZK'; % Cat of Life
metaData.links.id_ITIS = '552650'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sminthopsis_ooldea'; % Wikipedia
metaData.links.id_ADW = 'Sminthopsis_ooldea'; % ADW
metaData.links.id_Taxo = '59979'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800103'; % MSW3
metaData.links.id_AnAge = 'Sminthopsis_ooldea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sminthopsis_ooldea}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sminthopsis_ooldea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

