  function [data, auxData, metaData, txtData, weights] = mydata_Salmo_lourosensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_lourosensis'; 
metaData.species_en = 'Louros trout'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
data.ab = 52; units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'guess'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;         units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'guess'; 
data.Li = 37.2;        units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'NtakLias2014';

data.Wwb = 0.014;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 677;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'NtakLias2014';

data.Ri = 2e3/365;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), fork length (cm), weight (g)
0  7.6   5.2
1 14.2  42.0
2 21.8 132.6
3 28.1 242.0
4 35.6 468.8
5 37.2 677.5];
data.tLW(:,1) =  365 * (0.9+data.tLW(:,1)); % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'fork length', 'weight'};  
temp.tLW    = C2K(14.9);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'NtakLias2014'; treat.tLW = {1 {'length','weight'}}; 
 
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.ab = 0 * weights.ab;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;

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
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '79CYP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '27386500'; % Ency of Life
metaData.links.id_Wiki = 'Salmo'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3420081'; % Taxonomicon
metaData.links.id_WoRMS = '1007910'; % WoRMS
metaData.links.id_fishbase = 'Salmo-lourosensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salmo}}';  
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
bibkey = 'NtakLias2014'; type = 'article'; bib = [ ... 
'doi = {10.1111/jai.12493}, ' ...
'author = {A. Ntakis and R. Liasko and A. Oikonomou and I. D. Leonardos}, ' ... 
'year = {2014}, ' ...
'title = {Growth pattern of an endemic and endangered West {B}alkan {P}eninsula trout species (\emph{Salmo lourosensis}, {D}elling, 2010)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {1-4}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Salmo-lourosensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
