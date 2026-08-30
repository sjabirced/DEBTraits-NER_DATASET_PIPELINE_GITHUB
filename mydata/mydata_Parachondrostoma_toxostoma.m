  function [data, auxData, metaData, txtData, weights] = mydata_Parachondrostoma_toxostoma

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Parachondrostoma_toxostoma'; 
metaData.species_en = 'Soffie'; 

metaData.ecoCode.climate = {'BSk','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 17];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'SostSost1982';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 18.5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00813*Lp^3.11, see F1';
data.Wwi = 319; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.11, see F1; max. published weight: 350 g';
    
data.Ri = 15e3/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 10.04  8.49
    2 12.10 10.70
    3 13.50 12.34
    4 14.81 13.66
    5 16.38 15.32
    6 17.93 NaN
    7 19.55 NaN];
data.tL_fm(:,1) = 365 * (0.9 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SostSost1982'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
0	  5.341  7.455
1	 24.521 21.101
2	 36.048 28.659
3	 47.845 38.864
4	 82.389 47.213
5	100.537 81.483
6	143.809 NaN
7	165.394 NaN];
data.tW_fm(:,1) = 365 * (0.9 + data.tW_fm(:,1));
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(22);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'SostSost1982'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'data Wwp and Wwi were ignored due to inconsistentcy with tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00813*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northeastern part of Spain and France';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4CPT9'; % Cat of Life
metaData.links.id_ITIS = '1199782'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parachondrostoma_toxostoma'; % Wikipedia
metaData.links.id_ADW = 'Parachondrostoma_toxostoma'; % ADW
metaData.links.id_Taxo = '1008268'; % Taxonomicon
metaData.links.id_WoRMS = '1020868'; % WoRMS
metaData.links.id_fishbase = 'Parachondrostoma_toxostoma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parachondrostoma_toxostoma}}';  
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
bibkey = 'SostSost1982'; type = 'Article'; bib = [ ...
'doi = {10.23818/actas.01.29}, ' ...
'author = {Adolfo de Sostoa and Francisco J. de Sostoa}, ' ...
'year = {1982}, ' ...
'title = {Edad y crecimiento de \emph{Chondrostoma toxostoma} {V}allot, 1837 en el curso inferior del r\''{i}o Ebro ({T}arragona - {E}spa\~{n}a)}, ' ...
'journal = {Actas del Primer Congreso Espa\~{n}ol de Limnologia}, ' ...
'volume = {}, '...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Parachondrostoma-toxostoma}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

