function [data, auxData, metaData, txtData, weights] = mydata_Pristipomoides_argyrogrammicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Pristipomoides_argyrogrammicus'; 
metaData.species_en = 'Ornate jobfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 21];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(20.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 121; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01514*Lp^3.00, see F1';
data.Wwi = 969; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.00, see F1';

data.Ri  = 8.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_carponotatus: 749e3*969/859';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
0.935	14.637
0.986	19.398
0.997	14.694
0.998	16.702
0.999	18.365
1.005	16.415
1.012	15.669
1.972	20.029
1.985	17.103
1.992	18.308
1.994	21.463
2.000	19.512
2.001	19.971
2.002	20.946
2.006	17.161
2.007	19.168
2.013	18.537
2.015	22.438
2.954	26.511
2.969	28.862
2.973	22.266
2.980	21.233
2.982	26.166
2.983	28.117
2.988	25.019
2.989	27.199
2.990	29.092
2.996	25.650
3.002	23.356
3.003	23.872
3.011	28.633
3.015	22.954
3.016	24.675
3.030	24.216
3.036	21.807
3.927	27.428
3.960	23.470
3.982	26.511
3.984	30.124
3.997	27.887
4.003	25.593
4.004	26.109
4.005	27.314
4.006	28.346
4.007	29.207
4.008	25.191
4.010	26.740
4.016	24.101
4.976	28.002
4.985	31.845
5.005	29.608
5.011	28.920
5.012	29.321
5.033	31.272];
data.tL(:,1) = 365 * (0.45+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaheAumo2017';
comment.tL = 'genders combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01514*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MJZ3'; % Cat of Life
metaData.links.id_ITIS = '168917'; % ITIS
metaData.links.id_EoL = '46580798'; % Ency of Life
metaData.links.id_Wiki = 'Pristipomoides_auricilla'; % Wikipedia
metaData.links.id_ADW = 'Pristipomoides_auricilla'; % ADW
metaData.links.id_Taxo = '184755'; % Taxonomicon
metaData.links.id_WoRMS = '218512'; % WoRMS
metaData.links.id_fishbase = 'Pristipomoides-auricilla'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristipomoides_auricilla}}';
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
bibkey = 'MaheAumo2017'; type = 'article'; bib = [ ...
'doi = {10.2989/1814232X.2017.1327886}, ' ...
'author = {K. Mah\''{e} and Y. Aumond and K. Rabhi and R. Elleboode and E. Bellamy and J. Huet and M. Gault and D. Roos}, ' ...
'year = {2017}, ' ...
'title = {Relationship between somatic growth and otolith growth: a case study of the ornate jobfish \emph{Pristipomoides argyrogrammicus} from the coast of {R}\''{e}union ({SW} {I}ndian {O}cean)}, ' ... 
'journal = {African Journal of Marine Science}, ' ...
'volume = {39(2)}, '...
'pages = {145–151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pristipomoides-auricilla.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
