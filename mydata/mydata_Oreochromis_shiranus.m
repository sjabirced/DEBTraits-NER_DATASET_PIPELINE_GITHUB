function [data, auxData, metaData, txtData, weights] = mydata_Oreochromis_shiranus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Oreochromis_shiranus'; 
metaData.species_en = 'Shire tilapia'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 15];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(33);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 29.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^2.99, see F1';
data.Wwi = 703;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.99, see F1';

data.Ri  = 400/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(33); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
0	 0.071  0.071
1	11.059 11.743
2	16.474 18.241
3	19.210 21.775
4	20.692 23.371
5	21.148 24.055];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time', 'total length'};  
temp.tL_fm    = C2K(33);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MattKaun1997'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data from Chisombezi';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6T53B'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572777'; % Ency of Life
metaData.links.id_Wiki = 'Oreochromis'; % Wikipedia
metaData.links.id_ADW = 'Oreochromis_shiranus'; % ADW
metaData.links.id_Taxo = '499807'; % Taxonomicon
metaData.links.id_WoRMS = '293644'; % WoRMS
metaData.links.id_fishbase = 'Oreochromis-shiranus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreochromis}}';
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
bibkey = 'MattKaun1997'; type = 'article'; bib = [ ... 
'author = {N.S. Mattson and E.K.W.H. Kaunda}, ' ...
'year  = {1997}, ' ...
'title = {Population dynamics of \emph{Oreochromis shiranus} in two smallwater bodies in {M}ala\^{w}i}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {50}, ' ...
'pages = {592–607}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oreochromis-shiranus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

