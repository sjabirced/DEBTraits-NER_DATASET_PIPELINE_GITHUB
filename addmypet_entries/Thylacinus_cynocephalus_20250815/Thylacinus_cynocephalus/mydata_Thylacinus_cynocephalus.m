function [data, auxData, metaData, txtData, weights] = mydata_Thylacinus_cynocephalus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Thylacinidae';
metaData.species    = 'Thylacinus_cynocephalus'; 
metaData.species_en = 'Thylacine'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAt'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwt'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 15];

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'NewtSpou2018';   
  temp.tg = C2K(35.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 16*7;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'NewtSpou2018';   
  temp.tx = C2K(35.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(35.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(35.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lim = 129.5;  units.Lim = 'g';   label.Lim = 'ultimate length from nose to tail base for males'; bibkey.Lim = 'ADW';

data.Wwb = 0.2;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 25e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
data.Wwim = 35e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'NewtSpou2018';

data.Ri  = 2*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter, 2 litters per yr';
 
% univariate data
data.tL = [ ... % time since birth, crown-rump length (cm), head length (cm)
10	 2.513 1.494
32	 7.911 3.464
37	 8.937 3.562
67	16.846 6.375
84	21.498 7.598];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(35.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'NewtSpou2018'; treat.tL = {1 {'crown-rump','head'}};
label.treat.tL = 'length';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Extinct since 1933; restricted to Tasmania after the introduction of dingos on mainland Australia';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Both female and male had a pouch, but the male-pouch was only for protection';
metaData.bibkey.F2 = 'vintage'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '56PRR'; % Cat of Life
metaData.links.id_ITIS = '552591'; % ITIS
metaData.links.id_EoL = '126716'; % Ency of Life
metaData.links.id_Wiki = 'Thylacinus_cynocephalus'; % Wikipedia
metaData.links.id_ADW = 'Thylacinus_cynocephalus'; % ADW
metaData.links.id_Taxo = '60030'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800004'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thylacinus_cynocephalus}}';
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
bibkey = 'NewtSpou2018'; type = 'article'; bib = [ ... 
'doi = {10.1098/rsos.171914}, ' ...
'author = {Axel H. Newton and Frantisek Spoutil and Jan Prochazka and Jay R. Black and Kathryn Medlock and Robert N. Paddle and Marketa Knitlova and Christy A. Hipsley and Andrew J. Pask}, ' ...
'year = {2018}, ' ...
'title  = {Letting the "cat" out of the bag: pouch youngdevelopment of the extinct Tasmanian tiger revealed by X-ray computed tomography}, ' ...
'journal = {R. Soc. open sci.}, ' ...
'volume = {5}, ' ...
'pages = {171914}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Thylacinus_cynocephalus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'vintage'; type = 'Misc'; bib = ...
'howpublished = {\url{https://vintagenewsdaily.com/the-last-known-photographs-of-the-now-extinct-thylacine-known-as-the-tasmanian-tiger-1933/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

