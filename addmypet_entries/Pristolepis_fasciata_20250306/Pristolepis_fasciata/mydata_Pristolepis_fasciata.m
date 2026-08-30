function [data, auxData, metaData, txtData, weights] = mydata_Pristolepis_fasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Pristolepididae';
metaData.species    = 'Pristolepis_fasciata'; 
metaData.species_en = 'Malayan leaffish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 06];

%% set data
% zero-variate data

data.ab = 6.5; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 31;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'EmawAida2017';
  comment.Wwb = 'based on egg diameter of 0.91 mm: pi/6*0.091^3';
data.Wwp = 6.7; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01549*Lp^3.01, see F1';
data.Wwi = 477.6; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.01, see F1';
 
data.Ri = 2301/365;   units.Ri = '#/d';  label.Ri = 'reproduction rate at TL 14.5 cm';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time  (d), total length (cm)
289.449	6.665
365+14.882	7.819
365+105.733	8.862
365+196.241	13.532
365+289.638	15.676
730+15.058	16.170
730+105.075	17.543
730+197.225	20.346
730+289.761	21.501
1095+198.158	24.742];
data.tL(:,1) = data.tL(:,1) - 80; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SaweSuba2018'; 
    
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

%% Discussion points
D1 = 'maels are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MK6F'; % Cat of Life
metaData.links.id_ITIS = '645952'; % ITIS
metaData.links.id_EoL = '211389'; % Ency of Life
metaData.links.id_Wiki = 'Pristolepis_fasciata'; % Wikipedia
metaData.links.id_ADW = 'Pristolepis_fasciata'; % ADW
metaData.links.id_Taxo = '184770'; % Taxonomicon
metaData.links.id_WoRMS = '1418663'; % WoRMS
metaData.links.id_fishbase = 'Pristolepis-fasciata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristolepis_fasciata}}';
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
bibkey = 'MoreSric1999'; type = 'Article'; bib = [ ... 
'doi = {10.33997/j.afs.1999.12.3.008}, ' ...
'author = {Moreau, J. and B. Sricharoendham}, ' ... 
'year = {1999}, ' ...
'title = {Growth, mortality and recruitment of fish populations in an {A}sian man made Lake {R}ajjaprabha {R}eservoir ({T}hailand) as assessed by length frequency analysis}, ' ...
'journal = {Asian Fish. Sci.}, ' ...
'volume = {12(3)}, ' ...
'pages = {277-288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pristolepis-fasciata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

