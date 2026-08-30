function [data, auxData, metaData, txtData, weights] = mydata_Argyrops_filamentosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Argyrops_filamentosus'; 
metaData.species_en = 'Soldierbream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data

data.am = 22*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Argyrops spinifer';

data.Lp  = 22.2;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 202; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.02089*Lp^2.96, see F1';
data.Wwi = 6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.96, see F1';

data.Ri  = 386521/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
1	19.320
2	30.448
3	37.659
4	41.932
5	44.735
6	46.395
7	47.401];    
data.tL(:,1) = 365 * (data.tL(:,1) + 0.5);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL   = C2K(27.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlMaJaya2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: east coast of Africa (South Africa and Mozambique), Mauritius, Madagascar, and Reunion';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'GKH8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580056'; % Ency of Life
metaData.links.id_Wiki = 'Argyrops_filamentosus'; % Wikipedia
metaData.links.id_ADW = 'Argyrops_filamentosus'; % ADW
metaData.links.id_Taxo = '161629'; % Taxonomicon
metaData.links.id_WoRMS = '218591'; % WoRMS
metaData.links.id_fishbase = 'Argyrops-filamentosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrops_filamentosus}}';
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
bibkey = 'AlMaJaya2012'; type = 'Article'; bib = [ ... 
'author = {A. Al-Marzouqi and N. Jayabalan and A. Al-Nahdi and J. Al-Mamry}, ' ... 
'year = {2012}, ' ...
'title = {LENGTH-BASED STOCK ASSESSMENT OF THE SOLDIERBREAM \emph{Argyrops filamentosus} ({V}ALENCIENNES, 1830) FROM THE {A}RABIAN {S}EA OFF {O}MAN}, ' ...
'journal = {Thalassas}, ' ...
'volume = {28(1)}, ' ...
'pages = {57-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Argyrops-filamentosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
