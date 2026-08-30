function [data, auxData, metaData, txtData, weights] = mydata_Rondeletia_loricata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beryciformes'; 
metaData.family     = 'Rondeletiidae';
metaData.species    = 'Rondeletia_loricata'; 
metaData.species_en = 'Redmouth whalefish'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.6); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data

data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'History';   
  temp.tp = C2K(4.6); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 7*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'History';   
  temp.am = C2K(4.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'LeisCars2000';
  comment.Wwb = 'based on egg diameter of 1.1 mm of Beryx_splendens: pi/6*0.11^3';
data.Wwp = 10.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 42.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1';

data.Ri = 6.6e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(4.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Beryx_splendens: 675e3*(15/70)^3';
  
% univariate data

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01122*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.16 * FL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4TBGW'; % Cat of Life
metaData.links.id_ITIS = '162800'; % ITIS
metaData.links.id_EoL = '46567435'; % Ency of Life
metaData.links.id_Wiki = 'Rondeletia_loricata'; % Wikipedia
metaData.links.id_ADW = 'Rondeletia_loricata'; % ADW
metaData.links.id_Taxo = '153378'; % Taxonomicon
metaData.links.id_WoRMS = '126412'; % WoRMS
metaData.links.id_fishbase = 'Rondeletia_loricata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rondeletia_loricata}}';
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
bibkey = 'History'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/popdyn/KeyfactsSummary_1.php?ID=4317&GenusName=Rondeletia&SpeciesName=loricata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Rondeletia_loricata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

