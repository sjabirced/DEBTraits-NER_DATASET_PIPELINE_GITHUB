function [data, auxData, metaData, txtData, weights] = mydata_Glaucidium_brasilianumGlaucidium_nana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Glaucidium_nana'; 
metaData.species_en = 'Austral pygmy owl'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 05];

%% set data
% zero-variate data

data.ab = 28;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23-28 d';
data.tx = 28.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-35 d';
data.tp = 94.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '28-35 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'guess';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9.3*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 8.8;     units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 7.0;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'avibase';
data.Wwx = 58.7;     units.Wwx = 'g';   label.Wwx = 'wet weight at fledge';         bibkey.Wwx = 'avibase';
data.Wwi = 76.15;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 66.15;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 3.9/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 eggs per clutch, 1 clutch per yr'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;
weights.Wwx = 3 * weights.Wwx;
weights.tx = 3 * weights.tx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3G644'; % Cat of Life
metaData.links.id_ITIS = '686695'; % ITIS
metaData.links.id_EoL = '1036396'; % Ency of Life
metaData.links.id_Wiki = 'Glaucidium_nana'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2682234'; % Taxonomicon server down
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2A67FFCBF7AEE253'; % avibase
metaData.links.id_birdlife = 'austral-pygmy-owl-glaucidium-nana'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glaucidium_nana}}';
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
bibkey = 'Nora2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.aupowl1.01}, ' ...
'author = {Norambuena, H. V.}, ' ... 
'year = {2020}, ' ...
'title = {Austral Pygmy-Owl (\emph{Glaucidium nana}), version 1.0. In Birds of the World (T. S. Schulenberg, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA. https://doi.org/}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=2A67FFCBF7AEE253&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

