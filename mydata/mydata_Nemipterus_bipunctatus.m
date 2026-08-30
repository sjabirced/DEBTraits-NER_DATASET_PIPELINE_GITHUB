  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_bipunctatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_bipunctatus'; 
metaData.species_en = 'Delagoa threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data

% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'MehaAlMa2013';   
  temp.am = C2K(26.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.5 mm: pi/6*0.05^3';
data.Wwp = 38;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01259*Lp^2.96, see F1';
data.Wwi = 297;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^2.96, see F1';
  
data.Ri  = 139200/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nemipterus japonicus';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm), weight (g)
1	12.81
2	17.00
3	19.45
4	21.75
5   23.85];
data.tL(:,1) = 365 * (0.7 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.1);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'ElGaKhal2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01259*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467Z3'; % Cat of Life
metaData.links.id_ITIS = '550980'; % ITIS
metaData.links.id_EoL = '46581014'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_bipunctatus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_bipunctatus'; % ADW
metaData.links.id_Taxo = '180968'; % Taxonomicon
metaData.links.id_WoRMS = '218517'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus_bipunctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_bipunctatus}}';  
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
bibkey = 'ElGaKhal2013'; type = 'article'; bib = [ ...  
'author = {A.A. El-Ganainy and M.T. Khalil and E.E.E. El-Bokhty and M.A. Saber and F.A.A. Abd El-Rahman}, ' ...
'year = {2013}, ' ...
'title = { Assessment of three nemipterid stocks based on trawl surveys in the {G}ulf of {S}uez, {R}ed {S}ea}, ' ... 
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {44}, ' ...
'pages = {45-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-bipunctatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
