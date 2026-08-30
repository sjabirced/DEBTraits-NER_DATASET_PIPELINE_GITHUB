function [data, auxData, metaData, txtData, weights] = mydata_Calomys_callosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Calomys_musculinus'; 
metaData.species_en = 'Drylands Vesper Mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 24];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 51.5;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 22.5;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ProvPolo1993';
data.Wwim = 22; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'ProvPolo1993';

data.Ri  = 3*3/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter; 3 litters per yr assumed';
   
% univariate data
% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
    30 13.71 11.91
    60 16.50 13.13
    90 18.64 13.60
   120 21.35 16.82
   150 22.42 19.11
   180 22.49 21.76];
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm   = C2K(36.6);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature'; 
bibkey.tW_fm = 'ProvPolo1993'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = 10 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'PYL8'; % Cat of Life
metaData.links.id_ITIS = '633098'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Calomys_musculinus'; % Wikipedia
metaData.links.id_ADW = 'Calomys_musculinus'; % ADW
metaData.links.id_Taxo = '62296'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000621'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calomys_musculinus}}';
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
bibkey = 'ProvPolo1993'; type = 'Article'; bib = [ ... 
'author = {M.C. Provensal and J. Polop}, ' ... 
'year = {1993}, ' ...
'title = {Growth and determination of age in \emph{Calomys musculinus} ({R}odentia, {C}ricetidae)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {57(2)}, ' ...
'pages = {245–254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

