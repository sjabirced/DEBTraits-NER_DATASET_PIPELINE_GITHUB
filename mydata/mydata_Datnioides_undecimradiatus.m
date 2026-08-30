function [data, auxData, metaData, txtData, weights] = mydata_Datnioides_undecimradiatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lobotiformes'; 
metaData.family     = 'Lobotidae';
metaData.species    = 'Datnioides_undecimradiatus'; 
metaData.species_en = 'Mekong tiger perch';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 25];

%% set data
% zero-variate data

data.ab = 2;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'iucn';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mick2016';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.5 mm: 4/3*pi*0.025^3'; 
data.Wwp = 153.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'iucn';
  comment.Wwp = 'based on 0.01862*Lp^3.01, see F1';
data.Wwi = 1236; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*Li^3.01, see F1';

data.Ri = 3.7e5/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 61 cm';   bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Lobotes_surinamensis: 8e6*1236/26853';

% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (cm)
0	 0.200  0.200
1	 9.421  9.202
2	15.199 15.083
3	18.908 18.971
4	21.044 21.445
5	22.434 23.173];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kwan2016'; treat.tL = {1 {'Mekong','Mun'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W = 0.0428 * TL^2.840';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Asia: middle and lower Mekong basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01862*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Asia: middle and lower Mekong basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CG3B'; % Cat of Life
metaData.links.id_ITIS = '645666'; % ITIS
metaData.links.id_EoL = '222847'; % Ency of Life
metaData.links.id_Wiki = 'Datnioides_undecimradiatus'; % Wikipedia
metaData.links.id_ADW = 'Datnioides_undecimradiatus'; % ADW
metaData.links.id_Taxo = '172934'; % Taxonomicon
metaData.links.id_WoRMS = '1010984'; % WoRMS
metaData.links.id_fishbase = 'Datnioides-undecimradiatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Datnioides_undecimradiatus}}';
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
bibkey = 'Kwan2016'; type = 'Article'; bib = [ ... 
'author = {Kwangkhwang, W.}, ' ... 
'year = {2016}, ' ...
'title = {Estimating Age and Growth of the {M}ekong Tiger Perch, \emph{Datnioides undecimradiatus} ({R}oberts and {K}ottelat, 1994) by Using Hard Structures}, ' ...
'journal = {Journal of Fisheries and Environment}, ' ...
'volume = {40(2)}, ' ...
'pages = {29–38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Datnioides-undecimradiatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
