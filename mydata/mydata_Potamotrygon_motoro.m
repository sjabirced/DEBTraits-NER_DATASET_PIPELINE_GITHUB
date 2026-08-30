function [data, auxData, metaData, txtData, weights] = mydata_Potamotrygon_motoro
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Potamotrygonidae';
metaData.species    = 'Potamotrygon_motoro'; 
metaData.species_en = 'South American freshwater stingray'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 07];

%% set data
% zero-variate data;
data.ab = 5.5*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb  = 41;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase'; 
data.Wwp  = 4e3;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';   bibkey.Wwp  = 'guess'; 
data.Wwi  = 34.2e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase'; 

data.Ri  = 16/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
   0   40.96
  30   77.75
  60  184.46
  90  263.50
 120  345.17
 150  429.20
 180  520.01
 210  615.40
 240  695.68
 270  880.52
 300 1075.31
 330 1297.50
 360 1401.12];
units.tW  = {'d','g'}; label.tW  = {'time since birth','weight'}; 
temp.tW = C2K(26.7); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'CharSant2018';  

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4M4R9'; % Cat of Life
metaData.links.id_ITIS = '564439'; % ITIS
metaData.links.id_EoL = '205366'; % Ency of Life
metaData.links.id_Wiki = 'Potamotrygon_motoro'; % Wikipedia
metaData.links.id_ADW = 'Potamotrygon_motoro'; % ADW
metaData.links.id_Taxo = '184648'; % Taxonomicon
metaData.links.id_WoRMS = '882142'; % WoRMS
metaData.links.id_fishbase = 'Potamotrygon-motoro'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Potamotrygon_motoro}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Potamotrygon-motoro}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChaoLiu2014'; type = 'article'; bib = [ ...  
'author = {Liu Chao and Liu, Yi and Lai, Ming-xin and Qiu, Bao-jun and Luo, Jian-ren and Hu, Yin-chang}, ' ...
'title = { Artificial propagation and growth characteristics of \emph{Potamotrygon motoro}}, ' ...
'year = {2014}, ' ...
'journal = {Guangdong Agricultural Sciences}, '...
'volume = {9}, ' ...
'pages = {135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

