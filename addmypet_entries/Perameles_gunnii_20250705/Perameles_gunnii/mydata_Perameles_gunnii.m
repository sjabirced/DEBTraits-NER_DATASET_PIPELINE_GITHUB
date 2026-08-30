function [data, auxData, metaData, txtData, weights] = mydata_Perameles_gunnii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Peramelemorphia'; 
metaData.family     = 'Peramelidae';
metaData.species    = 'Perameles_gunnii'; 
metaData.species_en = 'Greater long-nosed bandicoot'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHr', 'xiHl', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 05];

%% set data
% zero-variate data

data.tg = 12;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 91;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.1*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 136.7;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 766;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.8 * 2/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.8 litters per yr, 2 pups per litter';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
  0	      0.25
 90.110	403.718
107.462	445.644
131.876	535.767
149.147	592.297
169.569	608.960
189.870	647.529
252.758	668.459
305.276	710.264];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Duft1995';

% time-length
data.tL = [ ... % time since birth (yr), headlength (mm)
0.553	0.851
5.606	1.109
11.342	1.579
14.178	1.963
19.175	2.476
26.408	2.777
32.865	3.291
34.962	3.717
37.105	3.931
40.614	4.570
44.993	4.572
52.283	4.618
57.084	6.024
69.417	6.370
73.020	6.584
77.989	7.225
83.136	7.057
90.416	7.145
96.189	7.445
99.783	7.702
105.575	7.917
109.271	7.706
112.846	8.048
133.946	8.355];
data.tL(:,1) = data.tL(:,1) + 0; 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL   = C2K(36.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Duft1995';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.tW = 5 * weights.tW;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6V3LK'; % Cat of Life
metaData.links.id_ITIS = '552662'; % ITIS
metaData.links.id_EoL = '323869'; % Ency of Life
metaData.links.id_Wiki = 'Perameles_gunnii'; % Wikipedia
metaData.links.id_ADW = 'Perameles_gunnii'; % ADW
metaData.links.id_Taxo = '60061'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10900025'; % MSW3
metaData.links.id_AnAge = 'Perameles_gunnii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perameles_gunnii}}';
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
bibkey = 'Duft1995'; type = 'Article'; bib = [ ... 
'author = {A. C. Dufty}, ' ... 
'year = {1995}, ' ...
'title = {The growth and development of the eastern barred bandicoot \emph{Perameles gunnii} in {V}ictoria}, ' ...
'journal = {Victorian Naturalist}, ' ...
'volume = {112}, ' ...
'pages = {79-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Perameles_gunnii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

