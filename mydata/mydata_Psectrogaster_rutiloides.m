  function [data, auxData, metaData, txtData, weights] = mydata_Psectrogaster_rutiloides
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Curimatidae';
metaData.species    = 'Psectrogaster_rutiloides'; 
metaData.species_en = 'Chiochio'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 05];

%% set data
% zero-variate data
data.ab = 7.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Astyanax_mexicanus';

data.Lp = 9.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 17.8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.3e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GarcVarg2015';
  comment.Wwb = 'based on egg diameter of 1.34 mm: pi/6*0.134^3';
data.Wwp = 21.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02630*Lp^2.96, see F1';
data.Wwi = 147.62;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published value, based on 0.02630*Li^2.96 gives 132 g, see F1';

data.Ri = 149113/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  7.2  6.7
    2 10.1  9.4
    3 12.1 11.2
    4 13.5 12.5
    5 14.5 13.3
    6 15.2 13.9
    7 15.7 14.3
    8 16.0 14.6
    9 16.3 14.8];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'GarcVarg2015'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
14.098	59259.260
14.102	70370.373
14.194	80370.368
14.200	60370.372
14.299	85555.556
14.498	102592.594
14.500	78888.889
14.802	65555.553
15.201	149629.634
15.399	133703.707
15.504	120000.000];
units.LN = {'cm','#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GarcVarg2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 50;
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02630*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '78D37'; % Cat of Life
metaData.links.id_ITIS = '641620'; % ITIS
metaData.links.id_EoL = '1010273'; % Ency of Life
metaData.links.id_Wiki = 'Psectrogaster'; % Wikipedia
metaData.links.id_ADW = 'Psectrogaster_rutiloides'; % ADW
metaData.links.id_Taxo = '184895'; % Taxonomicon
metaData.links.id_WoRMS = '1019277'; % WoRMS
metaData.links.id_fishbase = 'Psectrogaster-rutiloides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Psectrogaster}}';  
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
bibkey = 'GarcVarg2015'; type = 'Article'; bib = [ ...
'doi = {10.1071/mf19100}, ' ...
'author = {A. Garc\''{i}a-V\''{a}squez and G. Vargas and H. S\''{a}anchez and S. Tello 1,2 and F. Duponchelle}, ' ...
'year = {2015}, ' ...
'title = {Periodic life history strategy of Psectrogaster rutiloides, Kner 1858, in theIquitos region, Peruvian Amazon}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {31 (Suppl. 4)}, '...
'pages = {31–39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Psectrogaster-rutiloides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

