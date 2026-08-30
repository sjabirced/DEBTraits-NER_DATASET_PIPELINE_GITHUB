function [data, auxData, metaData, txtData, weights] = mydata_Kajikia_albida
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Kajikia_albida'; 
metaData.species_en = 'Atlantic white marlin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data

data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'WinkMour2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 164;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 300;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ArocBarr2009';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 40264;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^3.14, see F1';
data.Wwi = 268210; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.14, see F1; max. published weight: 82.5 kg';

data.Ri  = 877000/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 179 cm'; bibkey.Ri  = 'ArocBarr2009';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ...  % time since birth (yr), LJFL length (cm)
    1  47.4  67.0
    2  81.8 106.1
    3 106.8 128.8
    4 124.9 142.1
    5 138.1 149.8
    6 147.6 154.3
    7 154.6 156.9
    8 159.6 158.5
    9 163.3 159.4];
data.tL_fm(:,1) = data.tL_fm(:,1)*365; % convert yr to f
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'LJFL length'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'WinkMour2020'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'model predictions by WinkMour2020, not data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm; 
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 3 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Atlantic Ocean: roughly from 45N to 45S in the southwestern Atlantic and 35S in the southeastern Atlantic. Records from the Mediterranean Sea, and from Bretagne, France seem to correspond to a few straying individuals';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NJ89'; % Cat of Life
metaData.links.id_ITIS = '768127'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Kajikia_albida'; % Wikipedia
metaData.links.id_ADW = 'Kajikia_albida'; % ADW
metaData.links.id_Taxo = '1683089'; % Taxonomicon
metaData.links.id_WoRMS = '712907'; % WoRMS
metaData.links.id_fishbase = 'Kajikia_albida'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kajikia_albida}}';
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
bibkey = 'WinkMour2020'; type = 'Article'; bib = [ ... 
'author = {H. Winker and B. Mourato and Y. Chang}, ' ... 
'year = {2020}, ' ...
'title = {UNIFYING PARAMETERIZATIONS BETWEEN AGE-STRUCTURED AND SURPLUS PRODUCTION MODELS: AN APPLICATION TO {A}TLANTIC WHITE MARLIN (\emph{Kajikia albida}) WITH SIMULATION TESTING }, ' ...
'journal = {Collect. Vol. Sci. Pap. ICCAT}, ' ...
'volume = {76(4)}, ' ...
'pages = {219-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArocBarr2009'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2008.08.010}, ' ...
'author = {Freddy Arocha and Alexander B\''{a}rrios}, ' ... 
'year = {2009}, ' ...
'title = {Sex ratios, spawning seasonality, sexual maturity, and fecundity of white marlin (\emph{Tetrapturus albidus}) from the western central {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {95(1)}, ' ...
'pages = {98-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Kajikia_albida}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

