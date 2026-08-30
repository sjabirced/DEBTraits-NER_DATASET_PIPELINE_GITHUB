function [data, auxData, metaData, txtData, weights] = mydata_Kobus_ellipsiprymnus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Kobus_ellipsiprymnus'; 
metaData.species_en = 'Waterbuck'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 15];

%% set data
% zero-variate data

data.tg = 264;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 213;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 771;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 13600;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'AnAge: 9 kg';
data.Wwi = 185e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '161–214 kg';
data.Wwim = 230e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwim = '198–262 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1 litters per yr';

  % univariate data
  data.tL_fm = [ ... % time since birth (yr), shoulder height (cm)
  0.08	68.353  NaN
  0.33  NaN     87.428
  0.66	93.786  92.197
  1.25  NaN     96.171
  1.50	99.350  NaN
  2.50  NaN    118.425
  4.00 119.220  NaN
  5.00  NaN    127.962
  7.00  NaN    142.269];
  data.tL_fm(:,1) = data.tL_fm(:,1) * 365; % convert yr to d
  units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'shoulder height'};  
  temp.tL_fm    = C2K(38.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  bibkey.tL_fm = 'Furs2019'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'slow/fast foetal development is taken as free parameter with t_0 = 0, but fast development results';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3RB5R'; % Cat of Life
metaData.links.id_ITIS = '183856'; % ITIS
metaData.links.id_EoL = '328724'; % Ency of Life
metaData.links.id_Wiki = 'Kobus_ellipsiprymnus'; % Wikipedia
metaData.links.id_ADW = 'Kobus_ellipsiprymnus'; % ADW
metaData.links.id_Taxo = '68316'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200961'; % MSW3
metaData.links.id_AnAge = 'Kobus_kob'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kobus_ellipsiprymnus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Kobus_ellipsiprymnus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Furs2019'; type = 'Misc'; bib = [ ...
'author = {Deon Furstenburg}, ' ...
'year = {2019}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/316167489_Waterbuck_Kobus_ellipsiprymnus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

