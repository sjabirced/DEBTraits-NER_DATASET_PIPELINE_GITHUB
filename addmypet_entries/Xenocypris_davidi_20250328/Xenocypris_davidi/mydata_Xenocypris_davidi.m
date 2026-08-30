function [data, auxData, metaData, txtData, weights] = mydata_Xenocypris_davidi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Xenocypris_davidi'; 
metaData.species_en = 'Chub'; 

metaData.ecoCode.climate = {'Am','Dfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 23;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'WangLin2021'; 
data.Li = 46.9;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 145;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00871*Lp^3.10, see F1';
data.Wwi = 1320;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.10, see F1;max; published weight: 1.6 kg';

data.Ri = 5.3e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Xenocypris macrolepis: 6377*1320/160';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
    1  7.8   8.8
    2 13.6  49.3
    3 17.5 108.0
    4 21.0 190.3
    5 23.5 276.6];
data.tLW(:,1) = 365*(0.5+ data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(28.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Yie1988'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '7G96J'; % Cat of Life
metaData.links.id_ITIS = '639698'; % ITIS
metaData.links.id_EoL = '46581798'; % Ency of Life
metaData.links.id_Wiki = 'Xenocypris_davidi'; % Wikipedia
metaData.links.id_ADW = 'Xenocypris_davidi'; % ADW
metaData.links.id_Taxo = '190068'; % Taxonomicon
metaData.links.id_WoRMS = '283183'; % WoRMS
metaData.links.id_fishbase = 'Xenocypris-davidi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Xenocypris_davidi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Xenocypris-davidi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Yie1988'; type = 'article'; bib = [ ... 
'author = {Yie, F.}, ' ...
'year = {1988}, ' ...
'title  = {Study on life-history pattern of seven freshwater fishes in the {D}ongjiang {R}iver, {G}uangdong}, ' ...
'journal = {Acta. Hydrobiol. Sin. Shuisheng Shengwu Xuebao}, ' ...
'pages = {12(2)}, ' ...
'volume = {107-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'WangLin2021'; type = 'article'; bib = [ ... 
'doi = {10.3389/fenvs.2021.707130}, ' ...
'author = {Teng Wang and Lin Lin and Yong Liu and Ivan Jakovli\''{c} and Chun-hou Li Ya-yuan Xiao and Peng Wu}, ' ...
'year = {2021}, ' ...
'title  = {Life History Traits, Elasticity Analyses, and Phenotypic Plasticity of \emph{Squaliobarbus curriculus} in the {P}earl {R}iver {E}stuary, {C}hina}, ' ...
'journal = { Front. Environ. Sci.}, ' ...
'pages = {9}, ' ...
'volume = {707130}'];
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

