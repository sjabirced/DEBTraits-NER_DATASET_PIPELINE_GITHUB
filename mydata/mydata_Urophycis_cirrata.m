function [data, auxData, metaData, txtData, weights] = mydata_Urophycis_cirrata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Urophycis_cirrata'; 
metaData.species_en = 'Gulf hake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 30];

%% set data
% zero-variate data

data.ab = 13.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(11.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MartHaim2000';   
  temp.am = C2K(11.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 33; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 66;  units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CavoCard2018';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3'; 
data.Wwp = 271; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^3.15, see F1'; 
data.Wwi = 2409; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.15, see F1; max. published weight: 2.5 kg'; 

data.Ri  = 1.7e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Urophycis_tenuis: 15e6*2409/21e3';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 19.3 17.4
    2 23.0 19.5
    3 33.7 24.9
    4 40.4 32.7
    5 41.4 34.4
    6 48.1 36.1
    7 48.5 38.6
    8 52.8 NaN
    9 56.5 NaN
   10 59.5 NaN
   11 57.6 NaN
   12 65.6 NaN
   13 63.5 NaN
   14 64.5 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d  
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(11.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MartHaim2000'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Lp = 5 * weights.Lp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%eights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southwest Atlantic: southern Brazil, Uruguay, Argentina and Falkland Is';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DY4C'; % Cat of Life
metaData.links.id_ITIS = '164738'; % ITIS
metaData.links.id_EoL = '46565104'; % Ency of Life
metaData.links.id_Wiki = 'Urophycis'; % Wikipedia
metaData.links.id_ADW = 'Urophycis_brasiliensis'; % ADW
metaData.links.id_Taxo = '44361'; % Taxonomicon
metaData.links.id_WoRMS = '272519'; % WoRMS
metaData.links.id_fishbase = 'Urophycis_brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urophycis}}';
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
bibkey = 'MartHaim2000'; type = 'article'; bib = [ ... 
'author = {Rodrigo Martins and Manuel Haimovici}, ' ... 
'year = {2000}, ' ...      
'title = {Determina\c{c}\~{a}o de idades, an\''{a}lise do crescimento e longevidade da abr\''{o}tea de profundidade, \emph{Urophycis cirrata}, {G}oode \& {B}ean, 1896, ({T}eleostei; {P}hycidae) no extremo sul do {B}rasil}, ' ...
'journal = {Atlantica, Rio Grande}, ' ...
'volume = {22}, ' ...
'pages = {57-70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Urophycis_brasiliensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
