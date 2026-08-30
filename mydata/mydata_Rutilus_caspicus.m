  function [data, auxData, metaData, txtData, weights] = mydata_Rutilus_caspicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rutilus_caspicus'; 
metaData.species_en = 'Caspian roach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 08];

%% set data
% zero-variate data
data.ab = 5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Rutilus rutilus';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Rutilus rutilus';
data.Li = 45;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.2 mm of Rutilus rutilus: 4/3*pi*0.06^3';
data.Wwp = 18.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00724*Lp^3.14, see F1';
data.Wwi = 1124; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00724*Li^3.14, see F1; max. published weight: 2.0 kg';

data.R22 = 30e3/365;   units.R22 = 'g';  label.R22 = 'Reprod rate at TL 22 cm';    bibkey.R22 = 'Laak2010';
  temp.R22 = C2K(9); units.temp.R22 = 'K'; label.temp.R22 = 'temperature';
  comment.R22 = 'based on Rutilus rutilus';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	 8.551 10.164
2	13.877 15.006
3	16.031 17.966
4	17.646 20.603
5   20.123 23.402
6	22.545 29.211
7	25.827 NaN
8	32.497 NaN];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NaddAbdo2005';
treat.tL = {1 {'Gomishan wetland','Anzali wetland'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Sierakowo, Blotno, Wickie Lake'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00724*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northern and northwestern Caspian Sea; enters Volga, Ural, Emba, Terek and Kura drainages for spawning';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4TTGZ'; % Cat of Life
metaData.links.id_ITIS = '1200397'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Rutilus_caspicus'; % Wikipedia
metaData.links.id_ADW = 'Rutilus_caspicus'; % ADW
metaData.links.id_Taxo = '1682851'; % Taxonomicon
metaData.links.id_WoRMS = '307935'; % WoRMS
metaData.links.id_fishbase = 'Rutilus-caspicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rutilus_caspicus}}';  
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
bibkey = 'NaddAbdo2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2005.00669.xopen_in_newISSN0175-8659}, ' ...
'author = {R. Naddafi and A. Abdoli and B. Hassanzadeh Kiabi and B. Mojazi Amiri and M. Karami}, ' ...
'year = {2005}, ' ...
'title = {Age, growth and reproduction of the {C}aspian roach (\emph{Rutilus rutilus caspicus}) in the {A}nzali and {G}omishan wetlands, {N}orth {I}ran}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {21}, '...
'pages = {492–497}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rutilus-caspicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

