function [data, auxData, metaData, txtData, weights] = mydata_Calidris_virgata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_virgata'; 
metaData.species_en = 'Surfbird'; 

metaData.ecoCode.climate = {'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 06];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibase';   
  temp.ab = C2K(33); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-23 d';
data.tx = 18;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'bow';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-20 d';
data.tp = 150;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.3*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 21;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwi = 216.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 186.9;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% univariate data
data.tW = [ ... % time since hatch (d), weight (g)
0.896	18.914
1.024	12.336
1.905	16.447
2.850	18.092
2.989	22.615
4.740	21.382
4.820	33.306
5.702	38.240
5.841	42.763
6.641	34.951
7.808	54.276
8.626	62.911
9.838	62.089
10.533	81.414
10.596	78.125
10.628	44.819
10.738	84.293
10.853	66.201
13.658	104.852
16.571	119.243
18.538	69.079
19.345	130.345];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'LameTomk2022';
comment.tW = 'Data for Turquoise Lake';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi; 
weights.Ri = 3 * weights.Ri; 
weights.Ww0 = 3 * weights.Ww0; 
weights.tp = 5 * weights.tp; 
weights.tW = 5 * weights.tW; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW_isl','tW_can','tW_rog','tW_ros'}; subtitle1 = {'Data for islandica, canutus, rogersi, roselaari'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1}; txtData.label.sets = {'Subspec of Calidris canutus'};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'PK4L'; % Cat of Life
metaData.links.id_ITIS = '176645'; % ITIS
metaData.links.id_EoL = '45509222'; % Ency of Life
metaData.links.id_Wiki = 'Calidris_tenuirostris'; % Wikipedia
metaData.links.id_ADW = 'Calidris_tenuirostris'; % ADW
metaData.links.id_Taxo = '70310'; % Taxonomicon
metaData.links.id_WoRMS = '366592'; % WoRMS
metaData.links.id_avibase = '09C51FA9A4E5C3E8'; % avibase
metaData.links.id_birdlife = 'great-knot-calidris-tenuirostris'; % birdlife
metaData.links.id_AnAge = 'Calidris_tenuirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calidris_tenuirostris}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calidris_tenuirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=09C51FA9A4E5C3E8}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/grekno/cur/introduction#repro}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LameTomk2022'; type = 'Article'; bib = [ ... 
'doi = {10.1111/gcb.16025}, ' ...
'author = {Thomas K. Lameris and  Pavel S. Tomkovich and James A. Johnson and R. I. Guy Morrison and Ingrid Tulp and Simeon Lisovski and Lucas DeCicco and Maksim Dementyev and Robert E. Gill and Job ten Horn and Theunis Piersma and Zachary Pohlen and Hans Schekkerman and Mikhail Soloviev and Evgeny E. Syroechkovsky1 and Mikhail K. Zhemchuzhnikov and Jan A. van Gils}, ' ... 
'year = {2022}, ' ...
'title = {Mismatch-induced growth reductions in a clade of Arctic-breeding shorebirds are rarely mitigated by increasing temperatures}, ' ...
'journal = {Glob Change Biol.}, ' ...
'volume = {28}, ' ...
'pages = {829–847}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

