  function [data, auxData, metaData, txtData, weights] = mydata_Thrissina_baelama
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Thrissina_baelama'; 
metaData.species_en = 'Baelama anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 17];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'SangLukm2022';
data.Li = 16;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.1e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Mari1970';
  comment.Wwb = 'based on egg diameter of 0.84 mm: pi/6*0.084^3';
data.Wwp = 13;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','SangLukm2022'};
  comment.Wwp = 'based on 0.00525*Lp^3.23, see F1';
data.Wwi = 40.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.23, see F1';

data.Ri  = 3356/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate at TL 12.7 cm';    bibkey.Ri  = 'Mari1970';   
  temp.Ri = C2K(28.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1  7.399
2  9.904
3 11.193];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'SangLukm2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 10;
weights.Wwi = weights.Wwi * 10;
weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.23'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Indo-Pacific: widespread in Indian Ocean, including Red Sea, coasts of East Africa to Madagascar and Mauritius, Sri Lanka and Andaman Islands, but no Indian specimens known (Ref. 189); and in western central Pacific, including Indonesia, the Philippines, Papua New Guinea, northern and eastern coasts of Australia, and eastward to Tonga';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '56NHP'; % Cat of Life
metaData.links.id_ITIS = '161873'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Thrissina_baelama'; % Wikipedia
metaData.links.id_ADW = 'Thrissina_baelama'; % ADW
metaData.links.id_Taxo = '612400'; % Taxonomicon
metaData.links.id_WoRMS = '212291'; % WoRMS
metaData.links.id_fishbase = 'Thrissina_baelama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Thrissina_baelama}}';  
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
bibkey = 'SangLukm2022'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF00076}, ' ...
'author = {Madehusen Sangadji and Eryka Lukman and Jahra Wasahua and Yeni Sofyan and Husain Latuconsina}, ' ...
'year = {2022}, ' ...
'title = {Population dynamics of Baelama anchovy \emph{Thryssa baelama} ({F}orsskal, 1775) on the coast of {K}abauw {V}illage, {H}aruku {I}sland, {C}entral {M}aluku, {I}ndonesia}, ' ... 
'journal = {AACL Bioflux}, ' ...
'volume = {15(4)}, '...
'pages = {1872-1881}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari1970'; type = 'article'; bib = [ ... 
'author = {R. Marichamy}, ' ...
'year = {1970}, ' ...
'title = {MATURITY AND SPAWNING OF THE ANCHOVY, \emph{Thrissina baelama} ({F}ORSKAL) FROM THE {A}NDAMAN {S}EA}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {17(1/2)}, '...
'pages = {179-187}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Thrissina_baelama}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  