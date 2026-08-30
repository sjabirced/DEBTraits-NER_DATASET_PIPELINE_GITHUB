function [data, auxData, metaData, txtData, weights] = mydata_Dumetella_carolinensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Mimidae';
metaData.species    = 'Dumetella_carolinensis'; 
metaData.species_en = 'Gray catbird'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf','Tncf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {''}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 08];

%% set data
% zero-variate data

data.ab = 12.5;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-13 d';
data.tx = 10.5;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '10-11 d';
data.tp = 30;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwx = 28.5;  units.Wwx = 'g';   label.Wwx = 'wet weight at fledge';     bibkey.Wwx = 'avibase';
data.Wwi = 39.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 35.7;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'avibase';

data.Ri  = 2*3.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 eggs/clutch, 2 clutches per yr';

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

% %% Group plots
% set1 = {'tW','tWp'}; subtitle1 = {'Unparasitized, parasitized'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '382DF'; % Cat of Life
metaData.links.id_ITIS = '178625'; % ITIS
metaData.links.id_EoL = '45510145'; % Ency of Life
metaData.links.id_Wiki = 'Dumetella_carolinensis'; % Wikipedia
metaData.links.id_ADW = 'Dumetella_carolinensis'; % ADW
metaData.links.id_Taxo = '56779'; % Taxonomicon
metaData.links.id_WoRMS = '422628'; % WoRMS
metaData.links.id_avibase = '95B77F083F49835F'; % avibase
metaData.links.id_birdlife = 'grey-catbird-dumetella-carolinensis'; % birdlife
metaData.links.id_AnAge = 'Dumetella_carolinensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dumetella_carolinensis}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Dumetella_carolinensis}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=95B77F083F49835F&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

