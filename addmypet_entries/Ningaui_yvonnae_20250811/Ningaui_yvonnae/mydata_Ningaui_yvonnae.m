function [data, auxData, metaData, txtData, weights] = mydata_Ningaui_yvonnae 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Ningaui_yvonnae';
metaData.species_en = 'Southern Ningaui'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 11];

%% set data
% zero-variate data

data.tg = 17;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'BosCart2001';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 78;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tp = 'based on Ningaui timealeyi';
data.tp = 290;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Ningaui ridei';
data.am = 20*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'BosCart2001';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.005;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 2.5;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
  comment.Wwx = 'based on Ningaui timealeyi';
data.Wwi = 8.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'BosCart2001';
data.Wwim = 10.4;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'BosCart2001';

data.Ri  = 5.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BosCart2001';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW_fm = [ ... % time (mnth), weight g
 2	4.572  5.060
 3	6.460  6.765
 4	5.969  6.488
 5	6.576  7.217
 6	6.054  6.969
 7	6.417  7.699
 8	7.116  8.763
 9	9.278 11.261
10	8.940 11.746
11	8.754 10.828
12	9.269  9.971];
data.tW_fm(:,1) = (3.5+data.tW_fm(:,1))*30.5; % convert mnth to d
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm  = C2K(35);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'BosCart2001'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 5 * weights.tW_fm;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '47FFX'; % Cat of Life
metaData.links.id_ITIS = '552618'; % ITIS
metaData.links.id_EoL = '323734'; % Ency of Life
metaData.links.id_Wiki = 'Ningaui_yvonnae'; % Wikipedia
metaData.links.id_ADW = 'Ningaui_yvonnae'; % ADW
metaData.links.id_Taxo = '110246'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800084'; % MSW3
metaData.links.id_AnAge = 'Antechinus_flavipes'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ningaui_yvonnae}}';
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
bibkey = 'BosCart2001'; type = 'Article'; bib = [ ... 
'doi = {10.1071/wr00021}, ' ...
'author = {Bos, D. G. and Carthew, S. M.}, ' ... 
'year = {2001}, ' ...
'title = {Population ecology of \emph{Ningaui yvonneae} ({D}asyuridae: {M}arsupialia) in the {M}iddleback {R}anges, {E}yre {P}eninsula, {S}outh {A}ustralia}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {28(5)}, ' ...
'pages = {507-515}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ningaui_timealeyi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

