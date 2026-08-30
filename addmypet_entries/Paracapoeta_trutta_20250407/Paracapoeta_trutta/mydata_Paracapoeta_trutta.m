function [data, auxData, metaData, txtData, weights] = mydata_Paracapoeta_trutta
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Paracapoeta_trutta'; 
metaData.species_en = 'Trout barb'; 

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
  
data.Lp = 23;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Kalk2008'; 
data.Li = 48.5;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Kalk2008';
  comment.Wwb = 'based on egg diameter of 1.04 mm: pi/6*0.104^3';
data.Wwp = 132;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'Kalk2008','fishbase'};
  comment.Wwp = 'based on 0.00794*Lp^3.10, see F1';
data.Wwi = 1335;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ZulfGund2013';
  comment.Wwi = 'based on 0.00794*Li^3.10, see F1';

data.Ri = 4e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(48.5/46.7)^3';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
    0 NaN   13.13
    1 15.26 14.77
    2 19.91 19.74
    3 23.74 21.51
    4 27.32 26.47
    5 29.34 29.89
    6 35.96 32.49
    7 36.83 34.95];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kalk2008'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (yr), weight (g)
    0 NaN     19.78
    1  43.41  42.06
    2 102.70  97.42
    3 172.00 164.16
    4 272.80 258.72
    5 362.70 345.04
    6 492.20 472.58
    7 613.00 549.69];
data.tW_fm(:,1) = 365 * (0.8+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Kalk2008'; treat.tW_fm = {1 {'females','males'}};

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
F1 = 'length-weight: W in g = 0.00794*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Tigris and Euphrates';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'QRG2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66674378'; % Ency of Life
metaData.links.id_Wiki = 'Paracapoeta_trutta'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_trutta'; % ADW
metaData.links.id_Taxo = '165386'; % Taxonomicon
metaData.links.id_WoRMS = '1670055'; % WoRMS
metaData.links.id_fishbase = 'Paracapoeta-trutta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Paracapoeta_trutta}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Paracapoeta-trutta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Kalk2008'; type = 'article'; bib = [ ...
'author = {Ercan Kalkan}, ' ...
'year = {2008}, ' ...
'title  = {Growth and Reproduction Properties of \emph{Capoeta trutta} ({H}eckel,1843) in {K}arakaya {D}am {L}ake}, ' ...
'journal = {Turk. J. Zool.}, ' ...
'volume = {32}, ' ...
'pages = {1-10}'];
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

