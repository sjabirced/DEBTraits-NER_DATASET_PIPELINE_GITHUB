  function [data, auxData, metaData, txtData, weights] = mydata_Pelasgus_minutus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pelasgus_minutus'; 
metaData.species_en = 'Ohrid minnow'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.am = 6*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.5;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 5;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 0.13;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 1.13;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1';

% univariate data

% time-length-weight-fecundity
tLWN = [ ... % time since birth (yr), fork length (cm)
    1 3.89 0.66  225
    2 4.29 1.22 2122
    3 5.49 3.40 2301];
data.tLW = tLWN(:,1:3);
data.tLW(:,1) = 365 * (0 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'fork length', 'weight'};  
temp.tLW = C2K(22);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'KostMane2024'; treat.tLW = {1 {'length','weight'}};

% length-fecundity
data.LN = tLWN(:,[2 4]); 
units.LN = {'cm', '#'}; label.LN = {'fork length','fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KostMane2024'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Lake Ohrid and Skadar basins (Albania and Macedonia, Montenegro). Also in Morinjska drainage in Montenegro';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6TZFC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '7245796'; % Ency of Life
metaData.links.id_Wiki = 'Pelasgus_minutus'; % Wikipedia
metaData.links.id_ADW = 'Pelasgus_minutus'; % ADW
metaData.links.id_Taxo = '1682800'; % Taxonomicon
metaData.links.id_WoRMS = '1525658'; % WoRMS
metaData.links.id_fishbase = 'Pelasgus-minutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pelasgus_minutus}}';  
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
bibkey = 'KostMane2024'; type = 'Article'; bib = [ ...
'author = {Vasil Kostov and Irina Manevska and Julijana Arsovska and Dijana Blazhekovikj-Dimovska and Stojmir Stojanovski and Lidija Velkova-Jordanoska}, ' ...
'year = {2024}, ' ...
'title = {Biological, Ecological and Taxonomic Characteristics of the Species \emph{Pelasgus minutus} ({K}araman, 1924) ({C}ypriniformes: {L}euciscidae) from {B}elchishko {B}lato, {R}epublic of {N}orth {M}acedonia}, ' ... 
'journal = {Acta Zool. Bulg.}, ' ...
'volume = {Supplement 20}, '...
'pages = {111-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pelasgus-minutus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

