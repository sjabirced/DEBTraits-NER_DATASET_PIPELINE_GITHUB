function [data, auxData, metaData, txtData, weights] = mydata_Rhynchocypris_percnurus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rhynchocypris_percnurus'; 
metaData.species_en = 'Lake minnow'; 

metaData.ecoCode.climate = {'BWk','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
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

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 18;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'LianSui2014';
  comment.Wwb = 'based on egg diameter of 1.52 mm: pi/6*0.152^3';
data.Wwp = 8.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'LianSui2014','fishbase'};
  comment.Wwp = 'based on 0.01047*Lp^3.06, see F1';
data.Wwi = 73;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.06, see F1; max. published weight: 100 g';

data.Ri = 3000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'LianSui2014';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length-weight
data.tL = [ ... % time (yr), std length (cm), weight (g)
1	5.357
2	7.475];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL= C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LianSui2014'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
F1 = 'length-weight: W in g = 0.01047*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Lena and Amur in the north to the Yangtze in the south';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4SRPH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Rhynchocypris_percnurus'; % Wikipedia
metaData.links.id_ADW = 'Rhynchocypris_percnurus'; % ADW
metaData.links.id_Taxo = '1682843'; % Taxonomicon
metaData.links.id_WoRMS = '1026590'; % WoRMS
metaData.links.id_fishbase = 'Rhynchocypris-lagowskii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhynchocypris_percnurus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Rhynchocypris-percnura.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'LianSui2014'; type = 'article'; bib = [ ...
'author = {Yangyang Liang and Xiaoyun Sui and Yifeng Chen and Yintao Jia and Dekui He}, ' ...
'year = {2014}, ' ...
'title  = {Life history traits of the {C}hinese minnow \emph{Rhynchocypris oxycephalus} in the upper branch of {Y}angtze {R}iver, {C}hina}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {53(36)}, ' ...
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

