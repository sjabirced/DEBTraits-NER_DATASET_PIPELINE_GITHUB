function [data, auxData, metaData, txtData, weights] = mydata_Pleurogrammus_azonus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Hexagrammidae';
metaData.species    = 'Pleurogrammus_azonus'; 
metaData.species_en = 'Okhotsk atka mackerel';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 12];

%% set data
% zero-variate data

data.ab = 40;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(12.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(12.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 62.0;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.4e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.3 mm of Pleurogrammus_monopterygius: pi/6*0.23^3';
data.Wwp = 228;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.09, see F1';
data.Wwi = 2875;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.09, see F1';
 
data.Ri = 4.6*16e3/365; units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'guess';
  temp.Ri = C2K(12.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pleurogrammus_monopterygius';

% uni-variate data
% time-length
data.tL_fm = [ ... %  time since birth (yr), fork length(cm)
1.103	23.722 23.840
2.099	29.019 29.018
3.085	30.352 30.351
4.091	32.587 32.104];
data.tL_fm(:,1) = (0.4 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(12.8); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MoriMori2015'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Wwi = 0 * weights.Wwi;
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
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00832*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KBMT'; % Cat of Life
metaData.links.id_ITIS = '644357'; % ITIS
metaData.links.id_EoL = '46568833'; % Ency of Life
metaData.links.id_Wiki = 'Pleurogrammus_azonus'; % Wikipedia
metaData.links.id_ADW = 'Pleurogrammus_azonus'; % ADW
metaData.links.id_Taxo = '44951'; % Taxonomicon
metaData.links.id_WoRMS = '282288'; % WoRMS
metaData.links.id_fishbase = 'Pleurogrammus-azonus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurogrammus_azonus}}';
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
bibkey = 'MoriMori2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-014-0316-x}, ' ...
'author = {Shoko H. Morita and Kentaro Morita and Tomonori Hamatsu and Masayuki Chimura and Yuuho Yamashita and Kei Sasaki and Tomoki Sato}, ' ... 
'year = {2015}, ' ...
'title = {Differential effects of the environment on the growth of arabesque greenling (\emph{Pleurogrammus azonus}): does rising temperature benefit young but not old fish?}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {98}, ' ...
'pages = {801–809}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pleurogrammus-azonus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

