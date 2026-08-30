  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_graellsii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_graellsii'; 
metaData.species_en = 'Ebro barbel'; 

metaData.ecoCode.climate = {'BSk','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 16];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'MilaOliv2000';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 80;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 55.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00759*Lp^3.11, see F1';
data.Wwi = 6293; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.11, see F1';
    
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'guess';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Luciobarbus_xanthopterus';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  5.4  7.0
    2  8.7  9.8
    3 12.2 12.8
    4 15.5 15.6
    5 18.4 18.2
    6 21.0 20.4
    7 24.1 22.5
    8 25.9 24.0
    9 27.7 25.1
   10 30.9 28.4];
data.tL_fm(:,1) = 365 * (0.2 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MilaOliv2000'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.Wwp = weights.Wwp * 0;

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

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00759*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Spain from Ebro to Ter drainages on Mediterranean slope and westward to Ason drainage on Atlantic slope. Introduced to central Italy in Fiora, Ombrone and Albegna drainages.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WCKH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '211318'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_graellsii'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_graellsii'; % ADW
metaData.links.id_Taxo = '1682766'; % Taxonomicon
metaData.links.id_WoRMS = '1020876'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus-graellsii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_graellsii}}';  
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
bibkey = 'MilaOliv2000'; type = 'Article'; bib = [ ...
'author = {P. A. Mi\~{n}ano and F. J. Oliva-Paterna and C. Fern\''{a}ndez-Delgado and M. Torralva}, ' ...
'year = {2000}, ' ...
'title = {Age and growth of \emph{Barbus graellsii} {S}teindachner, 1866 and \emph{Chondrostoma miegii} {S}teindachner, 1866 ({P}isces, {C}yprinidae) in the {C}inca {R}iver ({E}bro {R}iver basin, {NE} {S}pain)}, ' ...
'journal = {Miscellania Zoologica}, ' ...
'volume = {23(2)}, '...
'pages = {9-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Luciobarbus-graellsii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

