function [data, auxData, metaData, txtData, weights] = mydata_Canthidermis_sufflamen

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Canthidermis_sufflamen'; 
metaData.species_en = 'Ocean triggerfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

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

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'KavaOlne2006';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.25e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BranVian2013';
  comment.Wwb = 'based on egg diameter of 0.35 mm of B.capriscus: pi/6*0.035^3';
data.Wwp = 477;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02570*Lp^2.89, see F1';
data.Wwi = 4459;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.89, see F1; max. published weight: 6.1 kg';

data.Ri  = 2e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based fecundity of on Balistes_capriscus';
  
% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm)
0	13.541   52.632
1	28.459  296.756
2	38.328  619.758
3	45.213  909.893
4	50.262 1167.133
5	53.705 1365.164
6	56.230 1503.970
7	57.607 1616.461
8	59.213 1689.493];
data.tLW(:,1) = 365 * (0.6 + data.tLW(:,1)); % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(27.3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'KavaOlne2006'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'data Wwp and Wwi ignored due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.02570*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Massachusetts (USA), Bermuda, and northern Gulf of Mexico to South America. Eastern Atlantic: St. Paul''s Rocks, Ascension, Cape Verde and St. Helena; Sao Tome Island';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'QN8Q'; % Cat of Life
metaData.links.id_ITIS = '173170'; % ITIS
metaData.links.id_EoL = '46570664'; % Ency of Life
metaData.links.id_Wiki = 'Canthidermis_sufflamen'; % Wikipedia
metaData.links.id_ADW = 'Canthidermis_sufflamen'; % ADW
metaData.links.id_Taxo = '165350'; % Taxonomicon
metaData.links.id_WoRMS = '127399'; % WoRMS
metaData.links.id_fishbase = 'Canthidermis-sufflamen'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canthidermis_sufflamen}}';
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
bibkey = 'AlarAsla2017'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-006-9044-1}, ' ...
'author = {Mayra Alarc\''{o}n and Nora Eslava and Leo Walter Gonz\''{a}lez and Francisco Guevara}, ' ... 
'year = {2017}, ' ...
'title = {Crecimiento y mortalidad del pez \emph{Canthidermis sufflamen} ({P}erciformes: {B}alistidae) de los archipi\''{e}lagos {L}os {F}railes y {L}os {T}estigos, {V}enezuela}, ' ...
'journal = {Rev. Biol. Trop. (Int. J. Trop. Biol.)}, ' ...
'volume = {65(3)}, ' ...
'pages = {858-867}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Canthidermis-sufflamen}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

