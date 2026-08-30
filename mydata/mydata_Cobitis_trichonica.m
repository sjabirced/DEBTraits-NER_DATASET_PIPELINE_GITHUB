  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_trichonica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_trichonica'; 
metaData.species_en = 'Acheloos loach'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Cobitis_paludica';

data.Lp = 5;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 10.2;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Cobitis_paludica: pi/6*0.11^3';
data.Wwp = 0.72;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 6.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 1986/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL 9 cm';      bibkey.Ri = 'guess';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cobitis_paludica';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 3.7
2 6.1
3 7.7
4 8.7
5 9.3];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetrDoul2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe: Endemic to Acheloos drainage in Greece';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WK4J'; % Cat of Life
metaData.links.id_ITIS = '687878'; % ITIS
metaData.links.id_EoL = '1157706'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_trichonica'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_trichonica'; % ADW
metaData.links.id_Taxo = '171528'; % Taxonomicon
metaData.links.id_WoRMS = '1012880'; % WoRMS
metaData.links.id_fishbase = 'Cobitis_trichonica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_trichonica}}';  
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
bibkey = 'PetrDoul2024'; type = 'Article'; bib = [ ...
'doi = {10.71424/azb76.3.002733}, ' ...
'author = {Olga Petriki and Alexandra S. Douligeri and Ioanna Tsionki and Roberta Barbieri and Dimitrios K. Moutopoulos and Maria T. Stoumboudi}, ' ...
'year = {2024}, ' ...
'title = {Life-history Traits for Eight Fish Species of the Largest {G}reek Lake ({L}ake {T}richonis)}, ' ...
'journal = {Acta Zool. Bulg.}, ' ...
'volume = {76(3)}, '...
'pages = {375-382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis_trichonica}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
