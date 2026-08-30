function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_costae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_costae'; 
metaData.species_en = 'Goldblotch grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
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
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 32.5;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 140;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'RichDaha2018';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 296; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.01, see F1';
data.Wwi = 2.4e4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'RichDaha2018','fishbase'};
  comment.Wwi = 'based on 0.00832*Li^3.01, see F1';

data.Ri  = 1e6/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_bleekeri: 4.4e5*2.4e4/1e4';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
  0	18.852
127	21.505
193	21.730
240	22.228];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GlamTutm2003';

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
F1 = 'length-weight: W in g = 0.00832*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic and Mediterranean Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6G5N5'; % Cat of Life
metaData.links.id_ITIS = '551051'; % ITIS
metaData.links.id_EoL = '46579612'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_costae'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_costae'; % ADW
metaData.links.id_Taxo = '173893'; % Taxonomicon
metaData.links.id_WoRMS = '127034'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus_costae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_costae}}';
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
bibkey = 'GlamTutm2003'; type = 'Article'; bib = [ ... 
'author = {B. Glamuzina and P. Tutman and A. J. Conides and V. Kozul and N. Glavic and J. Bolotin and D. Lucic and V. Onofri and B. Skaramuca1}, ' ... 
'year = {2003}, ' ...
'title = {Preliminary results on growth and feeding of wild-caught young goldblotch grouper, \emph{Epinephelus costae}, in captivity}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {19}, ' ...
'pages = {209–214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus_costae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

