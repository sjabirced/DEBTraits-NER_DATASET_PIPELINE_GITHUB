function [data, auxData, metaData, txtData, weights] = mydata_Poecile_gambeli

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Paridae';
metaData.species    = 'Poecile_gambeli'; 
metaData.species_en = 'Mountain chickadee'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 08];

%% set data
% zero-variate data

data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from Wiki';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from Wiki';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.1*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'avibase';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.23; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwx = 7; units.Wwx = 'g';   label.Wwx = 'wet weight at fledge';     bibkey.Wwx = 'guess';
data.Wwi = 11.0; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 11.6; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1.5*7/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-12 eggs/clutch, 1-2 clutch/yr';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4KSC2'; % Cat of Life
metaData.links.id_ITIS = '554385'; % ITIS
metaData.links.id_EoL = '45511439'; % Ency of Life
metaData.links.id_Wiki = 'Poecile_gambeli'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '537395'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'DE0971C1BF7640CA'; % avibase
metaData.links.id_birdlife = 'mountain-chickadee-poecile-gambeli'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Poecile_gambeli}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=DE0971C1BF7640CA&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

