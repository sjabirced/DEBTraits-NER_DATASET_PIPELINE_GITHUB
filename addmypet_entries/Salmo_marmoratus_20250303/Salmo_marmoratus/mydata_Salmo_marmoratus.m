  function [data, auxData, metaData, txtData, weights] = mydata_Salmo_marmoratus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_marmoratus'; 
metaData.species_en = 'Marbled trout'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Lw_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 03];

%% set data
% zero-variate data
data.ab = 61; units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'fishbase'; 
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Alevins commence feeding 59-63 days after spawning at 10 C ';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;         units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'guess'; 
data.Li = 120;        units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0335;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 20.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.03, see F1; ';

data.Ri = 2e4/365;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 11.511 12.801 10.756
2 17.693 19.299 16.328 
3 21.125 23.887 21.463
4 24.225 27.579 27.093
5 28.029 32.328 NaN
6 32.900 36.000 NaN];
data.tL(:,1) =  365 * (0.9+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VincCriv2007'; treat.tL = {1 {'Zakojska','Gorska','Gatsnik'}}; 

% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
1  16.39  22.87  13.07
2  57.91  75.89  45.08
3  95.07 136.16 102.52
4 142.17 209.27 195.58
5 215.91 341.04 NaN
6 366.35 460.80 NaN];
data.tW(:,1) = 365 * (0.9+data.tW(:,1)); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'VincCriv2007'; treat.tW = {1 {'Zakojska','Gorska','Gatsnik'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.ab = 3 * weights.ab;

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

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '79CYT'; % Cat of Life
metaData.links.id_ITIS = '623502'; % ITIS
metaData.links.id_EoL = '1157691'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Salmo_marmoratus'; % ADW
metaData.links.id_Taxo = '186420'; % Taxonomicon
metaData.links.id_WoRMS = '1019650'; % WoRMS
metaData.links.id_fishbase = 'Salmo-marmoratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salmo_marmoratus}}';  
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
bibkey = 'VincCriv2007'; type = 'article'; bib = [ ...
'doi = {10.1007/s10750-006-0470-z}, ' ...
'author = {Vincenzi, S. and A.J. Crivelli and D. Jesensek and J.-F. Rubin and G.A. De Leo}, ' ... 
'year = {2007}, ' ...
'title = {Density-dependent individual growth of marble trout (\emph{Salmo marmoratus}) in the {S}oca and {I}drijca river basins, {S}lovenia}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {58}, ' ...
'pages = {999-1001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Salmo-marmoratus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
