function [data, auxData, metaData, txtData, weights] = mydata_Scotinomys_xerampelinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Scotinomys_xerampelinus'; 
metaData.species_en = 'Chiriqui brown mouse'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi','biCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 18];

%% set data
% zero-variate data

data.tg = 33;    units.tg = 'd';    label.tg = 'gestation time';       bibkey.tg = 'gbif';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 7;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'gbif';
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 78;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'gbif';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Sigmodon_hispidus';

data.Wwb = 2.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Scotinomys_teguina';
data.Wwi = 14; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'HoopCarl1976';

  data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, 1 litter per yr';

data.JOi  = 31.9; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'GenoIsle2018';   
  temp.JOi = C2K(37.5);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 15.2; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

  % time-length-weight
  data.tLW = [ ... % time since birth (wk), total length (cm), weight (g)
 0	 5.133  2.243
 1 	 7.461  3.244
 2	 9.693  4.690
 3	11.456  5.937
 4	12.531  7.336
 5	13.404  7.840
 6	13.846  8.956
 7	14.266 10.168
 8	14.590 11.827
10	15.033 13.346
12	15.222 14.008];
    data.tLW(:,1) = data.tLW(:,1)*7; % convert wk to d
    units.tLW = {'d','cm','g'}; label.tLW = {'time since birth','total length','weight'};  
    temp.tLW = C2K(37.6);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
    bibkey.tLW = 'HoopCarl1976'; treat.tLW = {1 {'length','weight'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'endemic to Costa Rica and Panama';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YPDJ'; % Cat of Life
metaData.links.id_ITIS = '970736'; % ITIS
metaData.links.id_EoL = '4461356'; % Ency of Life
metaData.links.id_Wiki = 'Sigmodon_planifrons'; % Wikipedia
metaData.links.id_ADW = 'Sigmodon_planifrons'; % ADW
metaData.links.id_Taxo = '88818'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000923'; % avibase
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sigmodon_planifrons}}';
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
bibkey = 'knowyourmammals'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.knowyourmammals.com/mammal-identification/miahuatlan-cotton-mouse-sigmodon-planifrons/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/4265124}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GenoIsle2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/brv.12350}, ' ...
'title = {Comparative analyses of basal rate of metabolism in mammals: data selection does matter}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {93(1)}, ' ...
'year = {2018}, ' ...
'pages = {404-438}, ' ...
'author = {Michel Genoud and Karin Isler and Robert D. Martin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoopCarl1976'; type = 'techreport'; bib = [ ... 
'title = {Reproduction, Growth and Development in Two Contiguously Allopatric Rodent Species, Genus \emph{Scotinomys}}, ' ...
'publisher = {Museum of Zoology, University of Michigan}, ' ...
'address = {Ann Arbor}, ' ...
'year = {1976}, ' ...
'pages = {404-438}, ' ...
'author = {Emmet T. Hooper and Michael D. Carleton}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
