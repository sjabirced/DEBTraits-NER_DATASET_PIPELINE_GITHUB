  function [data, auxData, metaData, txtData, weights] = mydata_Chanodichthys_mongolicus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Xenocyprididae';
metaData.species    = 'Chanodichthys_mongolicus'; 
metaData.species_en = 'Mongolian redfin'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 30];

%% set data
% zero-variate data
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 100;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 437;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.07, see F1';
data.Wwi = 10960;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.07, see F1; max. published weight: 4.0 kg';

data.Ri  = 192000/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase_Cb';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chanodichthys dabryi';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
1	 7.56 10.27   
2	19.29 20.00
3	26.43 28.61
4	32.21 35.74
5	39.60 43.06
6	48.51 50.63
7	53.63 56.11];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'LiZhou1990';
treat.tL = {1 {'1984','1987-1988'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Lake Buir, Onon and Kherlen drainages in Mongolia; Amur and Yangtze drainages';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TM5Q'; % Cat of Life
metaData.links.id_ITIS = '688858'; % ITIS
metaData.links.id_EoL = '208749'; % Ency of Life
metaData.links.id_Wiki = 'Chanodichthys_mongolicus'; % Wikipedia
metaData.links.id_ADW = 'Chanodichthys_mongolicus'; % ADW
metaData.links.id_Taxo = '170540'; % Taxonomicon
metaData.links.id_WoRMS = '1020530'; % WoRMS
metaData.links.id_fishbase = 'Chanodichthys-mongolicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Chanodichthys_mongolicus}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chanodichthys-mongolicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase_Cb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/FieldGuide/FieldGuideSummary.php?GenusName=Chanodichthys&SpeciesName=dabryi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiZhou1990'; type = 'article'; bib = [ ... 
'doi = {10.33997/j.afs.1990.3.2.003}, ' ...
'author = {Li, Sifa and Zhou, Biyu and Lin, Qufei}, ' ... 
'year = {1990}, ' ...
'title = {The Yield and Growth of Major Fish  Species in a Large {C}hinese Reservoir }, ' ...
'journal = {Asian Fisheries Science}, ' ...
'volume = {3}, ' ...
'pages = {185-196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

