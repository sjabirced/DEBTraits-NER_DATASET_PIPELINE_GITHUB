function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_yaquinae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_yaquinae'; 
metaData.species_en = 'Kurile grenadier'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.am = 16*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'GerrAndr2018';   
  temp.am = C2K(1.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 63;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: pi/6*0.26^3';
data.Wwp = 204;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.08, see F1';
data.Wwi = 2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.08, see F1';

data.Ri  = 8395/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(1.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
6.318	38.242
6.903	39.905
7.191	37.767
7.420	44.656
8.286	39.192
8.291	42.755
8.300	49.169
8.799	41.805
8.934	34.679
9.110	55.344
9.161	40.143
9.240	44.656
9.253	53.444
9.316	47.031
9.320	49.644
10.131	56.532
10.187	44.656
10.199	52.969
11.210	47.031
11.362	51.781
12.011	47.031
12.089	51.069
12.311	53.207
12.450	48.694
13.186	54.157
13.396	48.219
13.620	52.257
14.060	54.157
14.273	50.831
16.332	64.608];
data.tL(:,1) = 365*(data.tL(:,1)+0); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(1.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GerrAndr2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';  
D2 = 'I had to subtract 7 yrs from age estimates to arrive at an acceptable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight Ww in g = 0.00575*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 2.86*PAL';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Pacific Ocean: Kurile Islands and Japan';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'YS64'; % Cat of Life
metaData.links.id_ITIS = '690423'; % ITIS
metaData.links.id_EoL = '46564574'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_yaquinae'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_yaquinae'; % ADW
metaData.links.id_Taxo = '171982'; % Taxonomicon
metaData.links.id_WoRMS = '272358'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-yaquinae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_yaquinae}}';
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
bibkey = 'GerrAndr2018'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr.2017.12.002}, ' ...
'author = {M.E. Gerringer and A.H. Andrews and G.R. Huss and K. Nagashima and B.N. Popp and T.D. Linley and N.D. Gallo and M.R. Clark and A.J. Jamieson and J.C. Drazen}, ' ... 
'year = {2018}, ' ...
'title = {Life history of abyssal and hadal fishes from otolith growth zones and oxygen isotopic compositions}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'volume = {132}, ' ...
'pages = {37-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaenoides-yaquinae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

