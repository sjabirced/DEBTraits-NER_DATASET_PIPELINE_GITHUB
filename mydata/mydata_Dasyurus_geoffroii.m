function [data, auxData, metaData, txtData, weights] = mydata_Dasyurus_geoffroii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Dasyurus_geoffroii'; 
metaData.species_en = 'Western quoll'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

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

data.tg = 16;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 158;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.011;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 890;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'AnAge';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litters per yr, 6 pups per litter';
 
  % univariate data
  % time-weight
  data.tW_fm = [ ... % time since birth (d), weight (g)
      58 NaN  10.9
      60 12.5 NaN
      61 13.8 14.4
      62 14.6 15.5
      63 16.4 17.1
      65 19.0 20.0
      68 23.7 25.1
      70 28.8 30.5
      72 35.2 37.0];
  data.tW_fm(:,1) = data.tW_fm(:,1)-35;
  units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
  temp.tW_fm  = C2K(36.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
  bibkey.tW_fm = 'SereSode1988'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 10 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I had to subtract 35 d from age to capture tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6CF7H'; % Cat of Life
metaData.links.id_ITIS = '552607'; % ITIS
metaData.links.id_EoL = '323724'; % Ency of Life
metaData.links.id_Wiki = 'Dasyurus_geoffroii'; % Wikipedia
metaData.links.id_ADW = 'Dasyurus_geoffroii'; % ADW
metaData.links.id_Taxo = '60004'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800021'; % MSW3
metaData.links.id_AnAge = 'Dasyurus_geoffroii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyurus_viverrinus}}';
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
bibkey = 'SereSode1988'; type = 'Article'; bib = [ ... 
'author = {M. Serena and T. R. Soderquist}, ' ... 
'year = {1988}, ' ...
'title = {Growth and Development of Pouch Young of Wild and Captive \emph{Dasyurus geoffroii} ({M}arsupialia: {D}asyuridae)}, ' ...
'journal = {Aust. J. Zool.}, ' ...
'volume = {36}, ' ...
'pages = {533-543}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dasyurus_viverrinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

