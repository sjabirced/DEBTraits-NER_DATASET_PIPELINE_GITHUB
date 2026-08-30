function [data, auxData, metaData, txtData, weights] = mydata_Scotinomys_teguina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Scotinomys_teguina'; 
metaData.species_en = 'Alston''s brown mouse'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 01];

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'ADW: 20-25 d';
data.tp = 34;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.3; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HoopCarl1976';
data.Wwi = 12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WhitSeym2003';

data.Ri  = 3*2.8/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'WhitSeym2003';   
  temp.Ri = C2K(37.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.8 pups per litter; assumed 3 litters per yr';

data.JOi  = 31.2;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(37.6);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 12; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'corrected table of WhitSeym2003 is used';
	
  % univariate data
  % time-length-weight
  data.tLW = [ ... % time since birth (wk), total length (cm), weight (g)
 0	 4.907  2.271
 1 	 7.442  3.705
 2	 9.766  5.390
 3	11.146  6.823
 4	12.102  8.229
 5	12.594  9.514
 6	12.977 10.933
 7	13.172 11.898
 8	13.271 12.793
10	13.538 13.839
12	13.640 14.437];
    data.tLW(:,1) = data.tLW(:,1)*7; % convert wk to d
    units.tLW = {'d','cm','g'}; label.tLW = {'time since birth','total length','weight'};  
    temp.tLW = C2K(37.6);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
    bibkey.tLW = 'HoopCarl1976'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Wwi = 3 * weights.Wwi;
weights.JOi = 3 * weights.JOi;

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
D1 = 'Males are assumed  not to differ from females';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VXN6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scotinomys_teguina'; % Wikipedia
metaData.links.id_ADW = 'Scotinomys_teguina'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000519'; % MSW3
metaData.links.id_AnAge = 'Scotinomys_teguina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scotinomys_teguina}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Scotinomys_teguina}}';
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
%
bibkey = 'HoopCarl1976'; type = 'techreport'; bib = [ ... 
'title = {Reproduction, Growth and Development in Two Contiguously Allopatric Rodent Species, Genus \emph{Scotinomys}}, ' ...
'publisher = {Museum of Zoology, University of Michigan}, ' ...
'address = {Ann Arbor}, ' ...
'year = {1976}, ' ...
'pages = {404-438}, ' ...
'author = {Emmet T. Hooper and Michael D. Carleton}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
