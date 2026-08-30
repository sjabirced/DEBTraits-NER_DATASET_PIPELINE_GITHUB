function [data, auxData, metaData, txtData, weights] = mydata_Dicrostonyx_unalascensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Dicrostonyx_unalascensis'; 
metaData.species_en = 'Unalaska Island Collared Lemming'; 

metaData.ecoCode.climate = {'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 25];

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '19-21 d';
data.tx = 17.5;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '15-20 d';
data.tp = 40;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'guess';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on D. groenlandicus';
data.am = 3.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on D. groenlandicus';

data.Wwb = 5.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'MorrDiet1977';
data.Wwx = 60;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';         bibkey.Wwx = 'MorrDiet1977';
data.Wwi = 112; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'Wiki';

data.Ri  = 2.5*11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11 pups per litter; 2-3 litters per yr';
 
% uni-variate data
% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
    0  5.4  5.2
    1 10.1 10.2
    2 15.4 15.3
    3 23.1 22.8
    4 31.8 31.9
    8 43.2 46.2
   12 49.2 53.4
   16 54.4 59.2
   20 59.4 62.7
   24 64.2 64.8
   28 70.1 65.7
   32 73.0 67.0
   36 76.9 68.8
   40 76.8 69.8
   44 79.7 70.5
   48 84.0 71.8
   52 87.2 72.0
   56 86.3 72.9
   60 80.0 74.3
   64 NaN  75.4
   68 NaN  74.8];
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm    = C2K(36.6);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature'; 
bibkey.tW_fm = 'MorrDiet1977'; treat.tW_fm = {1 {'female','males'}};
comment.tW_fm = 'presented as its synonym Dicrostonyx stevensoni';
  
%% set weights for all real data
weights = setweights(data, []);

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
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Endemic to the islends Umnak and Unalaska';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6D636'; % Cat of Life
metaData.links.id_ITIS = '180334'; % ITIS
metaData.links.id_EoL = '328430'; % Ency of Life
metaData.links.id_Wiki = 'Dicrostonyx_unalascensis'; % Wikipedia
metaData.links.id_ADW = 'Dicrostonyx_unalascensis'; % ADW
metaData.links.id_Taxo = '112357'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000196'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicrostonyx_unalascensis}}';
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
bibkey = 'MorrDiet1977'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.50.4.30155733}, ' ...
'author = {Morrison, P. and Dieterich, R. and Preston, D.}, ' ... 
'year = {1977}, ' ...
'title = {Body Growth in Sixteen Rodent Species and Subspecies Maintained in Laboratory Colonies}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {50(4)}, ' ...
'pages = {294–310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

