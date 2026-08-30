function [data, auxData, metaData, txtData, weights] = mydata_Branchiostegus_argentatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Latilidae';
metaData.species    = 'Branchiostegus_argentatus'; 
metaData.species_en = 'Silver tilefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Branchiostegus_japonicus';

data.Lp = 17;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 31;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'YasuKosa1951';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Branchiostegus_japonicus: pi/6*0.08^3';
data.Wwp = 42.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00708*Lp^3.07, see F1';
data.Wwi = 268;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.07, see F1';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(26.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Branchiostegus_japonicus';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
    1 14
    2 20
    3 24
    4 27
    5 30
    6 31];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(26.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YasuKosa1951';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Pacific: East and South China seas';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'N6QR'; % Cat of Life
metaData.links.id_ITIS = '645595'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Branchiostegus_argentatus'; % Wikipedia
metaData.links.id_ADW = 'Branchiostegus_argentatus'; % ADW
metaData.links.id_Taxo = '164593'; % Taxonomicon
metaData.links.id_WoRMS = '367208'; % WoRMS
metaData.links.id_fishbase = 'Branchiostegus-argentatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Branchiostegus_argentatus}}';  
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
bibkey = 'YasuKosa1951'; type = 'Article'; bib = [ ...
'author = {Yasuda, H. and M. Kosaka}, ' ...
'year = {1951}, ' ...
'title = {On the growth of the {J}apanese principal fish. {IV}. \emph{Branchiostegus japonicus} ({H}outtuyn) and its allied forms}, ' ... 
'journal = {Bull. Jap. Soc. Sci. Fish.}, ' ...
'volume = {15(12)}, '...
'pages = {855-858}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Branchiostegus-argentatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

