function [data, auxData, metaData, txtData, weights] = mydata_Leocottus_kesslerii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Leocottus_kesslerii'; 
metaData.species_en = 'Kessler''s sculpin'; 

metaData.ecoCode.climate = {'Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data

data.am = 10 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Weis1962';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 14;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 1.9;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.00794*Lp^3.12, see F1';
data.Wwi = 30;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.12, see F1';
  
data.Ri = 1200/365; units.Ri = '#/d'; label.Ri = 'reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length-weight
data.tLW = [ ... % age (years), total length (cm) , weight (g)
    4  8.33 10.7
    5  9.22 13.3
    6 10.15 16.8
    7 11.02 19.7
    8 11.88 22.8];
data.tLW(:,1) = 365 * (data.tLW(:,1)-0.8); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(7);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'TolmDzyu2009'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 50;
weights.Wwb = weights.Wwb * 5;
weights.Li = weights.Li * 5;
weights.Wwi = weights.Wwi * 5;
weights.Ri = weights.Ri * 0;

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
D1 = 'Males are assumed not to differ from females, but males are larger than females (no data)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Lake Baikal and small lakes in its basins; lower Selenge, Angara and Baingol rivers';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6P8WX'; % Cat of Life
metaData.links.id_ITIS = '167302'; % ITIS
metaData.links.id_EoL = '46569026'; % Ency of Life
metaData.links.id_Wiki = 'Leocottus_kesslerii'; % Wikipedia
metaData.links.id_ADW = 'Leocottus_kesslerii'; % ADW
metaData.links.id_Taxo = '178589'; % Taxonomicon
metaData.links.id_WoRMS = '254345'; % WoRMS
metaData.links.id_fishbase = 'Leocottus_kesslerii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leocottus_kesslerii}}';
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
bibkey = 'TolmDzyu2009'; type = 'incollection'; bib = [ ... 
'author = {Yu.P. Tolmacheva and E.V. Dzyuba and L.V. Zubina}, ' ... 
'year = {2009}, ' ...
'title = {GROWTH AND FEEDING PECULIARITIES OF {C}OTTOIDEI IN THE LITTORAL ZONE OF SOUTHERN {B}AIKAL ({B}EREZOVY TEST SITE)}, ' ...
'booktitle = {Index of Animal Species inhabiting Lake Baikal and its catchment area: Basins and Channels in the south of East Siberia and North Mongolia}, ' ...
'publisher = {Nauka, Novosibirsk}, ' ...
'editor = {O.A. Timoshkin and T.Ya. Sitnikova and V.I. Proviz and Z.V. Slugina and N.G. Melnik}, ' ...
'chapter = {19}, '...
'pages = {943-956}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Leocottus_kesslerii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

