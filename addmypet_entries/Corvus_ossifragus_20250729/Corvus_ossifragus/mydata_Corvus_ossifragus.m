function [data, auxData, metaData, txtData, weights] = mydata_Corvus_ossifragus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Corvidae';
metaData.species    = 'Corvus_ossifragus'; 
metaData.species_en = 'Fish crow'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 29];

%% set data
% zero-variate data

data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 36;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'bow';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '32-40 d';
data.tp = 84;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14.5*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 14.1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwx = 275;   units.Wwx = 'g';   label.Wwx = 'wet weight ar fledging';     bibkey.Wwx = 'bow';
data.Wwi = 275;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '247–293 g';
data.Wwim = 300;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '280–320 g';

data.Ri  = 4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 5 eggs per clutch, 1 clutch per yr';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'YNJD'; % Cat of Life
metaData.links.id_ITIS = '179737'; % ITIS
metaData.links.id_EoL = '45510007'; % Ency of Life
metaData.links.id_Wiki = 'Corvus_ossifragus'; % Wikipedia
metaData.links.id_ADW = 'Corvus_ossifragus'; % ADW
metaData.links.id_Taxo = '59552'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '43E56D2CAA66A6CA'; % avibase
metaData.links.id_birdlife = 'fish-crow-corvus-ossifragus'; % birdlife
metaData.links.id_AnAge = 'Corvus_ossifragus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corvus_ossifragus}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Corvus_ossifragus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=43E56D2CAA66A6CA&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/fiscro/cur/breeding}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
