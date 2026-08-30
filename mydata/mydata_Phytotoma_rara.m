function [data, auxData, metaData, txtData, weights] = mydata_Phytotoma_rara
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Cotingidae';
metaData.species    = 'Phytotoma_rara'; 
metaData.species_en = 'Rufous-tailed plantcutter'; 

metaData.ecoCode.climate = {'Cfb','Csb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 07];

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-15 d';
data.tx = 10;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '13-15 d';
data.tp = 99;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.5*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.34;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'bow';
  comment.Wwb = 'based on egg width 20 mm anf length 25.5 mm: pi/6*2.55*2^2';
data.Wwi = 47;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per year';
 
data.JOi  = 1.491*60;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'RezeSwan2002';   
  temp.JOi = C2K(41.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 42.0; units.weight.JOi = 'g'; label.weight.JOi = 'weight';                                                                                                                                                                                                                                                                                                                                                                                                                																				
   
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
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '77JGX'; % Cat of Life
metaData.links.id_ITIS = '562163'; % ITIS
metaData.links.id_EoL = '916962'; % Ency of Life
metaData.links.id_Wiki = 'Phytotoma_rara'; % Wikipedia
metaData.links.id_ADW = 'Phytotoma_rara'; % ADW
metaData.links.id_Taxo = '55961'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'D0CCD452A56A144D'; % avibase
metaData.links.id_birdlife = 'rufous-tailed-plantcutter-phytotoma-rara'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phytotoma_rara}}';
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
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/rutpla1/cur/breeding}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=D0CCD452A56A144D&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RezeSwan2002'; type = 'Article'; bib = [ ... 
'doi = {10.1093/czoolo/56.6.741}, ' ...
'author = {Enrico L. Rezende and David L. Swanson and F. Fernando Novoa and Francisco Bozinovic}, ' ...
'title = {Passerines versus nonpasserines: so far, no statistical differences in the scaling of avian energetics}, ' ...
'journal = {The Journal of Experimental Biology}, ' ...
'year = {2002}, ' ...
'volume = {205}, ' ...
'pages = {101–107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

