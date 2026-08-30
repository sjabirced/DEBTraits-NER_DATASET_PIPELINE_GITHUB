function [data, auxData, metaData, txtData, weights] = mydata_Calidris_tenuirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Calidris_tenuirostris'; 
metaData.species_en = 'Great knot'; 

metaData.ecoCode.climate = {'ET', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
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
data.am = 27.3*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 22;   units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwi = 174;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 156;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% univariate data
data.tW = [ ... % time since hatch (d), weight (g)
1.000	16.497
1.138	14.036
1.206	11.984
1.982	14.900
2.054	16.549
3.039	18.653
3.042	20.709
3.960	25.689
3.964	28.979
4.094	19.528
4.096	21.584
5.086	27.389
5.087	28.623
5.091	32.324
5.996	24.967
6.142	30.320
7.045	20.907
7.203	36.951
7.209	41.885
8.025	18.899
9.035	41.975
9.085	24.708
9.179	45.683
9.195	60.075
9.254	49.799
10.103	55.597
10.182	63.414
10.185	65.881
11.094	62.225
11.247	73.746
11.322	77.450
11.797	62.671
11.955	78.304
12.079	63.918
12.193	40.075
12.211	56.935
13.157	85.764
14.135	81.290
14.357	91.169
14.403	69.790
14.859	100.651
15.274	94.915
16.178	87.147
16.257	94.963
16.307	77.285
17.030	95.002
17.087	83.902
18.116	61.749
18.913	83.581
18.999	97.566
19.293	109.093
20.285	116.955
21.161	84.103
21.261	110.835
22.217	86.623
23.209	94.895
24.407	98.244];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'LameTomk2022';
comment.tW = 'Data for upper Anadyr River';

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

