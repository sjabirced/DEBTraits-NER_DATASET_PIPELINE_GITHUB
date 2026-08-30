function [data, auxData, metaData, txtData, weights] = mydata_Peropteryx_macrotis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Emballonuridae';
metaData.species    = 'Peropteryx_macrotis'; 
metaData.species_en = 'Lesser dog-like bat'; 

metaData.ecoCode.climate = {'A','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 28];

%% set data
% zero-variate data

data.tg = 130;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Wiki';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW gives 8-10 mnth, but also that Wwb = 2.1 g';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 650;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.38; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on 3 to 9 g';
data.Wwi = 5.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'WhitSeym2003';
  comment.Wwi = 'ADW: 3 to 9 g';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

data.JOi  = 11.6;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 5.1; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOI = 'corrected table of WhitSeym2003 is used';    
  
%% set weights for all real data
weights = setweights(data, []);
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
D2 = 'Body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'X22B'; % Cat of Life
metaData.links.id_ITIS = '631699'; % ITIS
metaData.links.id_EoL = '328782'; % Ency of Life
metaData.links.id_Wiki = 'Coleura_seychellensis'; % Wikipedia
metaData.links.id_ADW = 'Coleura_seychellensis'; % ADW
metaData.links.id_Taxo = '63978'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800977'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coleura_seychellensis}}';
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
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

