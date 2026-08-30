function [data, auxData, metaData, txtData, weights] = mydata_Leuciscus_vorax
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leuciscus_vorax'; 
metaData.species_en = 'Tigris asp'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 05];

%% set data
% zero-variate data

data.am = 24*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 30;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 102;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 6.4e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ShafJasi1982';
  comment.Wwb = 'based on egg diameter of 1.07 mm: pi/6*0.107^3';
data.Wwp = 634;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00501*Li^3.14, see F1';
data.Wwi = 5640;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.14, see F1; max. published weight: 10.0 kg';

data.Ri = 74504/365;   units.Ri = '#/d';  label.Ri = 'reproduction rate at TL = 38.cm'; bibkey.Ri = 'ShafJasi1982';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (d), total length (cm), weight (g)
    1  8.7    6.09
    2 17.3   49.88
    3 25.8  169.47   
    4 33.3  370.02
    5 40.9  694.12
    6 46.8 1048.38
    7 51.0 1363.75];
data.tLW(:,1) = 365 * (0.2 + data.tLW(:,1)); % convert yr to d 
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(20);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ShafJasi1982'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 10 * weights.Li;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Data Wwp and Wwi are ignored due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00501*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '6Q3RS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Leuciscus_idus'; % Wikipedia
metaData.links.id_ADW = 'Leuciscus_idus'; % ADW
metaData.links.id_Taxo = '178769'; % Taxonomicon
metaData.links.id_WoRMS = '154324'; % WoRMS
metaData.links.id_fishbase = 'Leuciscus-idus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuciscus_idus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leuciscus-idus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ShafJasi1982'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1982.tb04708.x}, ' ...
'author = {Shafi, M. and Jasim, B. M.}, ' ...
'year = {1982}, ' ...
'title  = {Some aspects of the biology of a cyprinid, \emph{Aspius vorax} {H}eckel}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'pages = {271–278}, ' ...
'volume = {20(3)}'];
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

