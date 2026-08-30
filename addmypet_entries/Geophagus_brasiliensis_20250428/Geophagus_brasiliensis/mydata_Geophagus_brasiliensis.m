function [data, auxData, metaData, txtData, weights] = mydata_Geophagus_brasiliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Geophagus_brasiliensis'; 
metaData.species_en = 'Pearl cichlid'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};  
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 28];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 28;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7-2.6 mm : pi/6*0.25^3';
data.Wwp = 15.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01950*Lp^3.02, see F1';
data.Wwi = 458;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01950*Li^3.02, see F1';

data.Ri  = 800/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
    1  7.25  7.20
    2 10.80 11.15
    3 13.95 14.94
    4 16.75 18.60];
data.tL_fm(:,1) = 365 * (0.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time','total length'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BeatMorg2013'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01950*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'South America: Coastal drainages of eastern and southern Brazil and Uruguay';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6KBPL'; % Cat of Life
metaData.links.id_ITIS = '169915'; % ITIS
metaData.links.id_EoL = '46572743'; % Ency of Life
metaData.links.id_Wiki = 'Geophagus_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Geophagus_brasiliensis'; % ADW
metaData.links.id_Taxo = '174845'; % Taxonomicon
metaData.links.id_WoRMS = '280831'; % WoRMS
metaData.links.id_fishbase = 'Geophagus_brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geophagus_brasiliensis}}';
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
bibkey = 'AmarNett2011'; type = 'Article'; bib = [ ... 
'author = {Hilton Amaral Junior and Jos\''{e} Roberto Argento Netto and Silvano Garcia and Giovanni Lemos de Mello}, ' ... 
'year = {2011}, ' ...
'title = {Research to compare the growth rate between the Acara \emph{Geophagus brasiliensis} and Tilapia \emph{Oreochromis nioticus} in conditions of intensive monoculture utilizing ration and live food}, ' ...
'journal = {Revista electr\''{o}nica de Veterinaria}, ' ...
'volume = {12(9)}, ' ...
'pages = {605-612}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeatMorg2013'; type = 'Article'; bib = [ ... 
'doi = {10.3391/ai.2013.8.1.03}, ' ...
'author = {Stephen J. Beatty and David L. Morgan and James Keleher and Mark G. Allen and Gavin A. Sarre}, ' ... 
'year = {2013}, ' ...
'title = {The tropical South American cichlid, \emph{Geophagus brasiliensis} in {M}editerranean climatic south-western {A}ustralia}, ' ...
'journal = {Aquatic Invasions}, ' ...
'volume = {8(1)}, ' ...
'pages = {21-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Geophagus_brasiliensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

