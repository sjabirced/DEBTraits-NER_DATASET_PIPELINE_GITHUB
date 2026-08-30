function [data, auxData, metaData, txtData, weights] = mydata_Dromiciops_gliroides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Microbiotheria'; 
metaData.family     = 'Microbiotheriidae';
metaData.species    = 'Dromiciops_gliroides'; 
metaData.species_en = 'Monito del monte';

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 17];

%% set data
% zero-variate data

data.tg = 31;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'MunoLang2005';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'MunoLang2005';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MunoLang2005';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: at least 3 yrs';

data.Wwb = .05;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 13;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 24;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MunoLang2005';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MunoLang2005';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter, 1 litter per yr'; 

% univariate data
% time-length
data.tL = [ ... % time since birth (d), crown-rump length (cm)
 42 2.25
 44 1.7
 51 0.81
120 3.35];
units.tL = {'d', 'cm'};     label.tL = {'time', 'head length'};  
temp.tL = C2K(36.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MunoLang2005';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 3 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '37PW6'; % Cat of Life
metaData.links.id_ITIS = '552590'; % ITIS
metaData.links.id_EoL = '129538'; % Ency of Life
metaData.links.id_Wiki = 'Dromiciops_gliroides'; % Wikipedia
metaData.links.id_ADW = 'Dromiciops_gliroides'; % ADW
metaData.links.id_Taxo = '105160'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10600004'; % MSW3
metaData.links.id_AnAge = 'Dromiciops_gliroides'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dromiciops_gliroides}}';
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
bibkey = 'MunoLang2005'; type = 'article'; bib = [ ... 
'doi = {10.1071/zo03033}, ' ...
'author = {Andr\''{e}s Mu\~{n}oz-Pedreros and Brian K. Lang and Marta Bretos and Peter L. Meserve}, ' ... 
'year = {2005}, ' ...
'title = {REPRODUCTION AND DEVELOPMENT OF \emph{Dromiciops gliroides} ({M}ARSUPIALIA: {M}ICROBIOTHERIIDAE) IN TEMPERATE RAINFORESTS OF {S}OUTHERN {C}HILE}, ' ...
'journal = {Gayana}, ' ...
'volume = {69(2)}, ' ...
'pages = {225-233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dromiciops_gliroides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

