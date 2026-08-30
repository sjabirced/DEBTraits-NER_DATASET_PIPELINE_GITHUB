function [data, auxData, metaData, txtData, weights] = mydata_Oryx_gazella
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Oryx_gazella'; 
metaData.species_en = 'Gemsbok'; 

metaData.ecoCode.climate = {'BW','BS'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 26];

%% set data
% zero-variate data

data.tg = 270 ;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ADW: 150-160 d';
data.tx = 11*7;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '10-12 wks';
data.tp = 550 ;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(38.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-8 mnth';
data.am = 23.8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 12000;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 35000;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
data.Wwi = 190e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '100–210 kg';
data.Wwim = 220e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = '180 and 240 kg';
  
data.Ri  = 1.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JOi  = 43560;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(38.9);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  comment.JOi = 'based on Ww = 1.8e+05 g';                                                                                          

%% set weights for all real data
weights = setweights(data, []); 
weights.Wwx = 0; 
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
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6SZD5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '331079'; % Ency of Life
metaData.links.id_Wiki = 'Oryx_gazella'; % Wikipedia
metaData.links.id_ADW = 'Oryx_gazella'; % ADW
metaData.links.id_Taxo = '68353'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200957'; % MSW3
metaData.links.id_AnAge = 'Oryx_gazella'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oryx_gazella}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oryx_gazella}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Oryx_gazella/}}';
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
