function [data, auxData, metaData, txtData, weights] = mydata_Careproctus_cypselurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Careproctus_cypselurus'; 
metaData.species_en = 'Falcate snailfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.ab = 76;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(3.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'OrloTokr2011';   
  temp.am = C2K(3.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 35; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'OrloTokr2011';

data.Wwb = 0.0224; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Glub2010';
  comment.Wwb = 'based on egg diameter of 3.5 mm of C. furcellus: pi/6*0.35^3';
data.Wwp = 62;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 650;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'OrloTokr2011';
 
data.Ri  = 367/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Glub2010';   
  temp.Ri = C2K(3.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Careproctus furcellus: 1129*650/2000';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    6 24.5 270
    7 27.0 260
    8 30.1 342
    9 32.1 456
   10 34.0 577];	
data.tLW(:,1) = (data.tLW(:,1)-2.4)*365; % convert yr to d
units.tLW = {'d', 'cm','g'};  label.tLW = {'time since birth','total length','weight'};  
  temp.tLW = C2K(3.1);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'OrloTokr2011'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
weights.ab = weights.ab * 0;
%weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.Ri = weights.Ri * 3;
weights.Wwb = weights.Wwb * 3;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00457*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Pacific: off Japan, and from the Sea of Okhotsk to off Washington, USA';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '69BGM'; % Cat of Life
metaData.links.id_ITIS = '167498'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Careproctus'; % Wikipedia
metaData.links.id_ADW = 'Careproctus_cypselurus'; % ADW
metaData.links.id_Taxo = '165480'; % Taxonomicon
metaData.links.id_WoRMS = '274421'; % WoRMS
metaData.links.id_fishbase = 'Careproctus-cypselurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Careproctus_cypselurus}}';
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
bibkey = 'OrloTokr2011'; type = 'article'; bib = [ ... 
'doi = {10.5402/2011/341640}, ' ...
'author = {A. M. Orlov and A. M. Tokranov}, ' ... 
'year = {2011}, ' ...
'title = {Some Rare and Insufficiently Studied Snailfish ({L}iparidae, {S}corpaeniformes, {P}isces) in the {P}acific Waters off the {N}orthern {K}uril {I}slands and {S}outheastern {K}amchatka, {R}ussia}, ' ...
'journal = {International Scholarly Research Network}, ' ...
'volume = {2011(1)}, ' ...
'pages = {341640}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Glub2010'; type = 'article'; bib = [ ... 
'doi = {10.1134/s0032945210010078}, ' ...
'author = {Glubokov, A. I.}, ' ... 
'year = {2010}, ' ...
'title = {The data on \emph{Careproctus furcellus} and \emph{C. rastrinus} ({L}iparidae) from the {O}lyutorskii {G}ulf of the {B}ering {S}ea: {S}ize composition, indices of organs, and diet}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {50(1)}, ' ...
'pages = {52–64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Careproctus-cypselurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
