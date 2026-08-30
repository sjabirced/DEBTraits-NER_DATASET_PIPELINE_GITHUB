function [data, auxData, metaData, txtData, weights] = mydata_Boleophthalmus_boddarti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Boleophthalmus_boddarti'; 
metaData.species_en = 'Boddart''s goggle-eyed goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Boleophthalmus_pectinirostris';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Boleophthalmus_pectinirostris';
  
data.Lp  = 11.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm of Boleophthalmus_pectinirostris: pi/6*0.11*0.06^2';
data.Wwp = 10.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^2.93, see F1';
data.Wwi = 68;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^2.93, see F1; max. published weight: 30.20 g ';

data.Ri  = 33800/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  yr class (yr), standard length (mm)
    0  6.9
    1 12.4
    2 15.8];
data.tL(:,1) = 365 * (0.7+data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RaviRaja2007';

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.00794*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Indo-West Pacific: India to New Guinea and north to China. Also recorded from Sulaibikhat Bay, Persian Gulf';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'MBTN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46576717'; % Ency of Life
metaData.links.id_Wiki = 'Boleophthalmus_boddarti'; % Wikipedia
metaData.links.id_ADW = 'Boleophthalmus_boddarti'; % ADW
metaData.links.id_Taxo = '46563'; % Taxonomicon
metaData.links.id_WoRMS = '279924'; % WoRMS
metaData.links.id_fishbase = 'Boleophthalmus-boddarti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boleophthalmus_boddarti}}';
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
bibkey = 'RaviRaja2007'; type = 'Article'; bib = [ ... 
'author = {V. Ravi and S. Rajagopal}, ' ... 
'year = {2007}, ' ...
'title = {AGE AND GROWTH OF THE MUDSKIPPER, \emph{Boleophthalmus boddarti} ({P}allas, 1770)}, ' ...
'journal = {J.Aqua.Biol.}, ' ...
'volume = {22(1)}, ' ...
'pages = {123-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Boleophthalmus_boddarti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

