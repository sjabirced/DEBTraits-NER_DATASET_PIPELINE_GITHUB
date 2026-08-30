function [data, auxData, metaData, txtData, weights] = mydata_Pentaceros_wheeleri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pentacerotidae';
metaData.species    = 'Pentaceros_wheeleri'; 
metaData.species_en = 'Slender armourhead'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 10];

%% set data
% zero-variate data

data.ab = 3.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(7.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 44;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 453;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 1765;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1; max. published weight: 1.2 kg';

data.GSI = 0.098; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(7.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Pentaceropsis_recurvirostris';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), total length (cm)
    0 mean([7.2 12.4])
    1 mean([17.4 22.2])
    2 mean([23.3 27.9])];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(7.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KiyoNish2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 3 * weights.GSI;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Pacific: Gulf of Alaska to North Pacific Ocean off central California and south of Japan, with center of abundance at the seamounts of the southern Emperor-northern Hawaiian Ridge';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '76MG9'; % Cat of Life
metaData.links.id_ITIS = '645441'; % ITIS
metaData.links.id_EoL = '219907'; % Ency of Life
metaData.links.id_Wiki = 'Pentaceros_wheeleri'; % Wikipedia
metaData.links.id_ADW = 'Pentaceros_wheeleri'; % ADW
metaData.links.id_Taxo = '515713'; % Taxonomicon
metaData.links.id_WoRMS = '313241'; % WoRMS
metaData.links.id_fishbase = 'Pentaceros_wheeleri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pentaceros_wheeleri}}';
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
bibkey = 'KiyoNish2016'; type = 'Article'; bib = [ ... 
'doi = {10.2984/70.1.1}, ' ...
'author = {Masashi Kiyota and Kazuya Nishida and Chisato Murakami and Shiroh Yonezaki}, ' ... 
'year = {2016}, ' ...
'title = {History, Biology, and Conservation of {P}acific Endemics 2. {T}he {N}orth {P}acific Armorhead, \emph{Pentaceros wheeleri} ({H}ardy, 1983) ({P}erciformes, {P}entacerotidae)}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {70(1)}, ' ...
'pages = {1-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pentaceros_wheeleri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

