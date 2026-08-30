  function [data, auxData, metaData, txtData, weights] = mydata_Amblypharyngodon_mola
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Danionidae';
metaData.species    = 'Amblypharyngodon_mola'; 
metaData.species_en = 'Mola carplet'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFc', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'AhamAhme2017';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.4;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 20;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00955*Lp^3.07, see F1';
data.Wwi = 94; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.07, see F1';

% univariate data
data.Ri = 15985/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'AhamAhme2017';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% time-length
data.tL = [ ... % time (mnth), std length (cm), weight (g)
 0	2.546
 1	2.963
 2	3.226
 3	3.465
 4	3.609
 5	3.813
 6	4.040
 7	4.208
 8	4.260
 9	4.393
10	4.586
11	4.683
12	4.661];
data.tL(:,1) = (data.tL(:,1) + 6) * 30.5; % convert mnth to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AhamAhme2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00955*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CMY5'; % Cat of Life
metaData.links.id_ITIS = '639530'; % ITIS
metaData.links.id_EoL = '225879'; % Ency of Life
metaData.links.id_Wiki = 'Amblypharyngodon_mola'; % Wikipedia
metaData.links.id_ADW = 'Amblypharyngodon_mola'; % ADW
metaData.links.id_Taxo = '160609'; % Taxonomicon
metaData.links.id_WoRMS = '1012854'; % WoRMS
metaData.links.id_fishbase = 'Amblypharyngodon-mola'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amblypharyngodon_mola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WatsBalc1985'; type = 'Article'; bib = [ ...  
'doi = {10.1007/bf00004856}, ' ...
'author = {Watson, D. J. and Balon, E. K.}, ' ...
'year = {1985}, ' ...
'title = {Determination of age and growth in stream fishes of northern {B}orneo}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {13(1)}, '...
'pages = {59–70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AhamAhme2017'; type = 'Article'; bib = [ ...  
'doi = {10.1016/j.ejar.2017.11.002}, ' ...
'author = {Ferdous Ahameda and Zoarder Faruque Ahmedb and Md. Yeamin Hossainc and Jun Ohtomi}, ' ...
'year = {2017}, ' ...
'title = {Growth and longevity of the mola carplet \emph{Amblypharyngodon mola} ({C}yprinidae) in the {P}ayra {R}iver, southern {B}angladesh}, ' ... 
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {43}, '...
'pages = {291–295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amblypharyngodon-mola}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

