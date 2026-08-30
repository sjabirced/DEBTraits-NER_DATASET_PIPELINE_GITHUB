  function [data, auxData, metaData, txtData, weights] = mydata_Paracanthobrama_guichenoti

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Gobionidae';
metaData.species    = 'Paracanthobrama_guichenoti'; 
metaData.species_en = 'Taihu gudgeon'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
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
data.ab = 15;        units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'guess'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 41.5;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 131;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00955*Lp^3.18, see F1';
data.Wwi = 1335; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00955*Li^3.18, see F1';

data.Ri = 30669/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1  11.48
2  14.57
3  15.58
4  18.37
5  19.83];
data.tL(:,1) = 365 * (1.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Ming1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I has to add 1 yr to age estimates in tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00955*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CNHV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '209297'; % Ency of Life
metaData.links.id_Wiki = 'Paracanthobrama_guichenoti'; % Wikipedia
metaData.links.id_ADW = 'Paracanthobrama_guichenoti'; % ADW
metaData.links.id_Taxo = '182647'; % Taxonomicon
metaData.links.id_WoRMS = '1015892'; % WoRMS
metaData.links.id_fishbase = 'Paracanthobrama-guichenoti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Paracanthobrama_guichenoti}}';  
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
bibkey = 'Ming1993'; type = 'article'; bib = [ ...  
'doi = {10.0000/j.1000-0933.199313013844}, ' ...
'author = {Yin Ming-Cheng}, ' ...
'year = {1993}, ' ...
'title = {Age and growth of \emph{Paracanthobrama guichenoti} {B}leeker from {L}a {T}aihu}, ' ... 
'journal = {Acta Ecologica Sinica}, ' ...
'volume = {13(1)}, ' ... 
'pages = {38-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Paracanthobrama-guichenoti}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
