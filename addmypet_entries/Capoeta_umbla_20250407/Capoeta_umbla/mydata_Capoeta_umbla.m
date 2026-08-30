function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_umbla
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_umbla'; 
metaData.species_en = 'Tigris scraper'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 07];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'ZulfGund2013';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 20.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 45;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 88;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'ZulfGund2013','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 880;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ZulfGund2013';
  comment.Wwi = 'based on tW data';

data.Ri = 2.3e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(40.0/46.7)^3';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
    1 14.31 13.71
    2 23.55 22.47
    3 26.61 25.44
    4 28.68 28.06
    5 31.14 30.80
    6 32.43 33.17
    7 33.65 35.41
    8 34.82 38.07
    9 37.36 NaN
   10 44.65 44.80];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ZulfGund2013'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (yr), weight (g)
    1  43.98  42.07
    2 127.41 106.22
    3 183.23 160.46
    4 227.26 210.20
    5 270.28 253.77
    6 309.13 289.10
    7 346.31 340.71
    8 383.40 411.75
    9 478.33 NaN
   10 736.25 874.00];
data.tW_fm(:,1) = 365 * (0.8+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ZulfGund2013'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01000*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Tigris and Euphrates';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'QRG4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4628226'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_umbla'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_umbla'; % ADW
metaData.links.id_Taxo = '1803046'; % Taxonomicon
metaData.links.id_WoRMS = '1418554'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-umbla'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_umbla}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-umbla.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ZulfGund2013'; type = 'article'; bib = [ ...
'doi = {10.4194/1303-2712-v13_2_04}, ' ...
'author = {Mehmet Z\"{u}lf\"{u} \c{C}oban and Fatih G\"{u}nd\"{u}z and Ferhat Demirol and Gürel Nedim Örnek\c{c}i and G\"{o}khan Karakaya and Ibrahim T\"{u}rkg\"{u}l\"{u} Ahmet Alp}, ' ...
'year = {2013}, ' ...
'title  = {Population Dynamics and Stock Assessment of \emph{Capoeta umbla} ({H}eckel, 1843) in {L}ake {H}azar, {E}lazıv{g}, {T}urkey}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {13}, ' ...
'pages = {221-231}'];
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

