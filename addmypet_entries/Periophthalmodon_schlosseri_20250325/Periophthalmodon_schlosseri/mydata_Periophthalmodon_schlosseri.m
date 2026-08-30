function [data, auxData, metaData, txtData, weights] = mydata_Periophthalmodon_schlosseri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Periophthalmodon_schlosseri'; 
metaData.species_en = 'Giant mudskipper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMm','0iMr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 2.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 27;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 53;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01738*Lp^3.04, see F1';
data.Wwi = 390;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^3.04, see F1';

data.Ri  = 3.7e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Periophthalmus_barbarus: 23933*390/25';

% uni-variate data
% time-length
data.tL = [... %  time (d), total length (cm)
334.122	12.091
365.922	13.839
365+60.372	17.399
365+90.789	18.771
365+121.206	19.580
365+153.005	21.266
365+181.117	21.637
365+212.456	22.759
365+305.088	24.184
365+333.201	24.680
365+365.461	25.363
365+396.338	25.922];
data.tL(:,1) = data.tL(:,1) - 120; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MazlRoha2008';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01738*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6V5TQ'; % Cat of Life
metaData.links.id_ITIS = '637839'; % ITIS
metaData.links.id_EoL = '46576707'; % Ency of Life
metaData.links.id_Wiki = 'Periophthalmodon_schlosseri'; % Wikipedia
metaData.links.id_ADW = 'Periophthalmodon_schlosseri'; % ADW
metaData.links.id_Taxo = '183507'; % Taxonomicon
metaData.links.id_WoRMS = '209262'; % WoRMS
metaData.links.id_fishbase = 'Periophthalmodon-schlosseri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Periophthalmodon_schlosseri}}';
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
bibkey = 'MazlRoha2008'; type = 'Article'; bib = [ ... 
 'doi = {10.1111/j.1439-0426.2007.01033.x}, ' ...
'author = {A. G. Mazlan and M. Rohaya}, ' ... 
'year = {2008}, ' ...
'title = {Size, growth and reproductive biology of the giant mudskipper, \emph{Periophthalmodon schlosseri} ({P}allas, 1770), in {M}alaysian waters}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {24}, ' ...
'pages = {290–296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Periophthalmodon-schlosseri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

