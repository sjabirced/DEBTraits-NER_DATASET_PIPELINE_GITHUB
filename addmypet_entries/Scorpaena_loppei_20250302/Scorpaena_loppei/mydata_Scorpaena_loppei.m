function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_loppei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_loppei'; 
metaData.species_en = 'Cadenat''s rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 02];

%% set data
% zero-variate data

data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(15.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 15;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwim = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 236;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.12, see F1';
 
data.Ri = 8.4e3/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(15.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Scorpaena_notata: 32850*60.16/236';

% uni-variate data
% time-length 
data.tL_fm = [ ... %  year class (yr), total length(cm)
    0  5.3  NaN
    1  7.6   8.4
    2  9.1   9.9
    3  9.4  10.7
    4 10.2  11.4
    5 11.0  12.3];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.95) * 365; % convert yr to d
units.tL_fm = {'d' 'cm'}; label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm = C2K(15.1); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OrdiVall2012'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01288*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79Z9T'; % Cat of Life
metaData.links.id_ITIS = '166836'; % ITIS
metaData.links.id_EoL = '46567869'; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_loppei'; % ADW
metaData.links.id_Taxo = '187151'; % Taxonomicon
metaData.links.id_WoRMS = '127244'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-loppei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_notata}}';
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
bibkey = 'OrdiVall2012'; type = 'Article'; bib = [ ... 
'author = {Ordines, F. and M. Valls and A. Gouraguine}, ' ... 
'year = {2012}, ' ...
'title = {Biology, feeding, and habitat preferences of {C}adenat''s rockfish, \emph{Scorpaena loppei} ({A}ctinopterygii: {S}corpaeniformes: {S}corpaenidae), in the {B}alearic {I}slands (western {M}editerranean)}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {42(1)}, ' ...
'pages = {21-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-notata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

