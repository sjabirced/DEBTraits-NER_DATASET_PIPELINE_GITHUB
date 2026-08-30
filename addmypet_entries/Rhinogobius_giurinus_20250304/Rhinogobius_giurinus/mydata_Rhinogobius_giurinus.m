function [data, auxData, metaData, txtData, weights] = mydata_Rhinogobius_giurinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Rhinogobius_giurinus'; 
metaData.species_en = 'Amur goby'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 04];

%% set data
% zero-variate data

data.ab = 8;   units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(22.420);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 730;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(22.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Pomatoschistus minutus';
  
data.Lp  = 4.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 12.1;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 0.0012; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 2.75 mm and width of 0.9 mm of Rhinogobius_brunneus: pi/6*0.275*0.09^2';
data.Wwp = 1.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.07, see F1';
data.Wwi = 19.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.07, see F1';

data.Ri  = 1700/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhinogobius_brunneus';

% uni-variate data
% time-length
data.tL = [... %  time since birth (d), total length (cm)
121.241	1.669
153.147	2.138
181.862	2.638
213.129	2.887
243.759	3.261
274.388	3.478
306.294	3.601
336.285	3.944
363.724	4.130
396.267	4.379
425.621	4.533
456.888	4.531
488.156	4.716
579.406	5.180];
data.tL(:,1) = data.tL(:,1) + 0; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GuoLiu2015';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.00933*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S8Z9'; % Cat of Life
metaData.links.id_ITIS = '637964'; % ITIS
metaData.links.id_EoL = '46576643'; % Ency of Life
metaData.links.id_Wiki = 'Rhinogobius_giurinus'; % Wikipedia
metaData.links.id_ADW = 'Rhinogobius_giurinus'; % ADW
metaData.links.id_Taxo = '186014'; % Taxonomicon
metaData.links.id_WoRMS = '282583'; % WoRMS
metaData.links.id_fishbase = 'Rhinogobius-giurinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinogobius_giurinus}}';
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
bibkey = 'GuoLiu2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10750-015-2361-7}, ' ...
'author = {Guo, Z. and Liu, J. and Lek, S. and Li, Z. and Zhu, F., Tang and J. and Cucherousset, J.}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth and population dynamics of two congeneric and invasive gobies, \emph{Rhinogobius giurinus} and \emph{R. cliffordpopei} ({A}ctinopterygii, {G}obiidae) in a plateau lake, southwestern {C}hina}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {763(1)}, ' ...
'pages = {69–79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhinogobius-giurinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

