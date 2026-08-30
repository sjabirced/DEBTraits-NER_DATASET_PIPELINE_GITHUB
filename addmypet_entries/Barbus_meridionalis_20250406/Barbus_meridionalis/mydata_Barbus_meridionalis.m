  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_meridionalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_meridionalis'; 
metaData.species_en = 'Mediterranean barbel'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 06];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 27;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 14.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^2.97, see F1';
data.Wwi = 209.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fisbase';
  comment.Wwi = 'based on 0.01175*Li^2.97, see F1; max. published weight: 200.00 g ';
    
data.Ri = 1.7e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'Neop1987';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.026	6.789
0.531	7.317
1.013	10.788
1.551	11.155
2.050	14.206
2.555	14.701
3.008	17.363
3.529	17.891
4.031	19.972
4.501	21.696
5.016	24.812
5.523	24.790];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'g'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Neop1987'; 
comment.tL = 'data from Rentina stream';
    
% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1  23.68 19.16
    2  47.09 39.01
    3  73.17 63.66
    4 114.05 NaN
    5 147.75 NaN];
data.tW_fm(:,1) = 365 * (0.5 + data.tW_fm(:,1));
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Neop1987'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'data from Rentina stream';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = weights.tW_fm * 5;
weights.ab = weights.ab * 0;

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
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'KNKQ'; % Cat of Life
metaData.links.id_ITIS = '688651'; % ITIS
metaData.links.id_EoL = '211931'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_meridionalis'; % Wikipedia
metaData.links.id_ADW = 'Barbus_meridionalis'; % ADW
metaData.links.id_Taxo = '43788'; % Taxonomicon
metaData.links.id_WoRMS = '1022733'; % WoRMS
metaData.links.id_fishbase = 'Barbus-meridionalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_meridionalis}}';  
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
bibkey = 'Neop1987'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1439-0426.1987.tb00445.x}, ' ...
'author = {Neophitou, C.}, ' ...
'year = {1987}, ' ...
'title  = {A study of some autoecological parameters of southern barbel (\emph{Barbus meridionalis} {R}.) in the {R}entina stream, {G}reece}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'pages = {24–29}, ' ...
'volume = {3(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Barbus_meridionalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

