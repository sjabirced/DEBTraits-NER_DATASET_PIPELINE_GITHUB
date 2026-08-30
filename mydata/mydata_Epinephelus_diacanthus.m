function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_diacanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_diacanthus'; 
metaData.species_en = 'Goldblotch grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 39.2;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 55;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 737; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.03, see F1';
data.Wwi = 2e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.03, see F1';

data.Ri  = 24765/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1	13.335
2	22.797
3	34.118
4	40.792
5	44.215
6	48.877
7	52.918
8	54.327
9	56.820];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RamaRama2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: W in g = 0.01096*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indian Ocean: continental shelf of the northern Indian Ocean from the Gulf of Aden to Sri Lanka and Madras, India';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FTN7'; % Cat of Life
metaData.links.id_ITIS = '551054'; % ITIS
metaData.links.id_EoL = '46579647'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_diacanthus'; % ADW
metaData.links.id_Taxo = '173895'; % Taxonomicon
metaData.links.id_WoRMS = '218236'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus_diacanthus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus}}';
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
bibkey = 'RamaRama2020'; type = 'Article'; bib = [ ... 
'doi = {10.22271/fish.2020.v8.i5d.2337}, ' ...
'author = {S. Ramachandran and L. Ramalingam}, ' ... 
'year = {2020}, ' ...
'title = {Population dynamics of spinycheek grouper \emph{Epinephelus diacanthus} ({V}alenciennes, 1828) from the southwest coast of {I}ndia}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {8(5)}, ' ...
'pages = {299-307}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus_diacanthus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

