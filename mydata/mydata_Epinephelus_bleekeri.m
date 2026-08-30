function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_bleekeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_bleekeri'; 
metaData.species_en = 'Duskytail grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 27];

%% set data
% zero-variate data

data.am = 21 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 87;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'RichDaha2018';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 728; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Li^3.06, see F1';
data.Wwi = 1e4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'RichDaha2018','fishbase'};
  comment.Wwi = 'based on 0.01259*Li^3.06, see F1';

data.Ri  = 440129/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 24.5
    2 42.5
    3 55.6
    4 65.3
    5 72.4
    6 77.6
    7 81.4
    8 84.2
    9 86.2
   10 87.7];
data.tL(:,1) = (0+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Crai2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01259*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: Persian Gulf to Taiwan, Indonesia and the northern coast of Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FTLJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579665'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_bleekeri'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_bleekeri'; % ADW
metaData.links.id_Taxo = '173886'; % Taxonomicon
metaData.links.id_WoRMS = '273838'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus_bleekeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_bleekeri}}';
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
bibkey = 'RichDaha2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13762 }, ' ...
'author = {Richu, A. and Dahanukar, N. and Ali, A. and Ranjeet, K. and Raghavan, R.}, ' ... 
'year = {2018}, ' ...
'title = {Population dynamics of a poorly known serranid, the duskytail grouper \emph{Epinephelus bleekeri} in the {A}rabian {S}ea}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {54}, ' ...
'pages = {81–84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus_bleekeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

