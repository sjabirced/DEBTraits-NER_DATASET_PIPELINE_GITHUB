  function [data, auxData, metaData, txtData, weights] = mydata_Silurus_meridionalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Silurus_meridionalis'; 
metaData.species_en = 'Chinese large-mouth catfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'jX-r_T'; 'jX-r_W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 01];

%% set data
% zero-variate data
data.ab = 6;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 50;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 114;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 1.3 mm: pi/6*0.13^3';
data.Wwp = 873;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00646*Lp^3.02, see F1';
data.Wwi = 10522;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.02, see F1;max. published weight: 10.8 kg';
  
data.Ri = 315660/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';  
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Silurus_glanis: 114*3e4*10522/114e3'; 

% univariate data
% feeding rate-spec growth rate
data.jXr = [ ... % feeding rate as percentage of weight (g/d.g), 100 * specific growth rate (1/d)
7  3.34  3.03  3.32  3.53  2.36
4  1.73  1.25  1.62  1.53  1.79
2  0.48  0.12  0.65  0.68  0.72
1 -0.29 -0.23 -0.07 -0.10  0.06];
data.jXr = data.jXr/100;
units.jXr = {'g/d.g', '1/d'};  label.jXr = {'daily feeding rate as fraction of weight','specific growth rate'};  
  temp.jXr = C2K(25); units.temp.jXr = 'K'; label.temp.jXr = 'temperature';
bibkey.jXr = 'XiaoRuyu1992'; treat.jXr = {1, {'8.7','25.5','45','80','129'}}; title.jXR = 'different initial weights';
label.treat.jXr = 'initial weight, g'; comment.jXr = 'duration of experiment: 20 d; but 30 d in the 129 g group';
%
data.jXr_T = [ ... % feeding rate as percentage of weight (g/d.g), 100 * specific growth rate (1/d)
7   0.67  1.94  3.32  3.55
4   0.54  1.45  1.62  1.22
2   0.13  0.52  0.65  0.28
1  -0.19 -0.01 -0.07 -0.09];
data.jXr_T = data.jXr_T/100;
units.jXr_T = {'g/d.g', '1/d'};  label.jXr_T = {'daily feeding rate as fraction of weight','specific growth rate'};  
bibkey.jXr_T = 'XiaoRuyu1992'; treat.jXr_T = {0, {'15','20','25','30'}}; 
label.treat.jXr_T = 'temperature, C'; title.jXR = 'different temperatures';
comment.jXr_T = 'initial weight 44 g, duration of experiment: 20 d'; 
units.feedingRate.jXr_T = 'g/g.d'; label.temp.jXr_T = 'daily feeding rate as fraction of weight';
feedingRate.jXr_T = [ ...
    2.20 5.10 6.15 8.24
    1.99 3.84 3.72 3.97
    1.02 2.00 2.03 2.01
    0.50 1.00 1.01 0.96]; 
feedingRate.jXr_T = feedingRate.jXr_T/100;

%% set weights for all real data
weights = setweights(data, []);
weight.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.feedingRate = feedingRate;
auxData.treat = treat;
auxData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'middle Yangtze River basin, China';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Z25V'; % Cat of Life
metaData.links.id_ITIS = '681965'; % ITIS
metaData.links.id_EoL = '1002961'; % Ency of Life
metaData.links.id_Wiki = 'Silurus_meridionalis'; % Wikipedia
metaData.links.id_ADW = 'Silurus_meridionalis'; % ADW
metaData.links.id_Taxo = '187682'; % Taxonomicon
metaData.links.id_WoRMS = '1374505'; % WoRMS
metaData.links.id_fishbase = 'Silurus_meridionalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Silurus_meridionalis}}';  
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
bibkey = 'XiaoRuyu1992'; type = 'Article'; bib = [ ...    
'doi = {10.1111/j.1095-8649.1992.tb02619.x}, ' ...
'author = {Xiao-Jun, X. and Ruyung, S.}, ' ...
'year  = {1992}, ' ...
'title = {The bioenergetics of the southern catfish (\emph{Silurus meridionalis} {C}hen): growth rate as a function of ration level, body weight, and temperature}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {40(5)}, ' ...
'pages = {719–730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Silurus_meridionalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

