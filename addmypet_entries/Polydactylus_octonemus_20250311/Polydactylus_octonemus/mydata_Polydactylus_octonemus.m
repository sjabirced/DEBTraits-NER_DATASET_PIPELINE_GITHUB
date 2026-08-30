function [data, auxData, metaData, txtData, weights] = mydata_Polydactylus_octonemus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Polydactylus_octonemus'; 
metaData.species_en = 'Atlantic threadfin'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 11];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on Li, relative to family memeber';
data.Li  = 33;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm: pi/6*0.0775^3'; 
data.Wwi  = 187;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00407*Li^3.07, see F1';

data.GSI  = 0.06; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'DentChit1990';   
  temp.GSI = C2K(26.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
52.657	6.415
94.089	8.735
118.238	13.077
132.224	14.012
147.846	14.057
159.661	15.762
190.895	16.296
222.653	17.560
232.890	17.482
249.028	18.580
266.255	19.152];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(26.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DentChit1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_Eig','tL_Roe','tL_Der','tL_Cha','tL_Rop'}; subtitle1 = {'Data for loc Eig, Roe, Der, Cha, Rop'};
% set2 = {'tL_Fli','tL_Spr','tL_Fit','tL_Mar','tL_Bri'}; subtitle2 = {'Data for loc Fli, Spr, Fit, Mar, Bri'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are supposed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VSDQ'; % Cat of Life
metaData.links.id_ITIS = '170447'; % ITIS
metaData.links.id_EoL = '46578837'; % Ency of Life
metaData.links.id_Wiki = 'Polydactylus_octonemus'; % Wikipedia
metaData.links.id_ADW = 'Polydactylus_octonemus'; % ADW
metaData.links.id_Taxo = '46324'; % Taxonomicon
metaData.links.id_WoRMS = '159852'; % WoRMS
metaData.links.id_fishbase = 'Polydactylus-octonemus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polydactylus_octonemus}}';
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
bibkey = 'DentChit1990'; type = 'Article'; bib = [ ... 
'author = {Dentzau, M.W. and M.E. Chittenden}, ' ... 
'year = {1990}, ' ...
'title = {Reproduction, movements, and apparent population dynamics of the {A}tlantic threadfin \emph{Polydactylus octonemus} in the {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {88}, ' ...
'pages = {439-462}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Polydactylus-octonemus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

