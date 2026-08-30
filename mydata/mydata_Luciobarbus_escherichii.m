  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_escherichii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_escherichii'; 
metaData.species_en = 'Ankara barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 12];

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'YildErdo2001';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 23;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 11;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AparSost1998','fishbase'};
  comment.Wwp = 'based on 0.01096*Lp^3.00, see F1';
data.Wwi = 133.3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.00, see F1';
    
data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'YildErdo2001';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (d), fork length (cm)
 1	 9.01  9.00
 2	11.39 11.45
 3	13.65 13.76
 4	15.95 15.96
 5  18.01 17.72
 6  19.36 19.15
 7  20.73 20.35
 8  21.45 21.50
 9  22.67 NaN
10  24.50 NaN];
data.tL_fm(:,1) = 365*(0.9 + data.tL_fm(:,1)); % set origin at birth
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'YildErdo2001'; treat.tL_fm = {1 {'female','male'}}; 

% time-weight
data.tW_fm = [ ... % time since birth (d), fork length (cm)
 1	  9.85   9.84
 2   18.49  19.44
 3   30.78  32.25
 4   46.05  51.19
 5   76.01  65.92
 6   92.15  90.12
 7  107.00  97.12
 8  127.49 107.50
 9  160.08 NaN
10  195.00 NaN];
data.tW_fm(:,1) = 365*(0.9 + data.tW_fm(:,1)); % set origin at birth
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'YildErdo2001'; treat.tW_fm = {1 {'female','male'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.tW_fm = weights.tW_fm * 10;
% weights.Li = weights.Li * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;

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
F1 = 'Length-weight: Ww (in g) = 0.01096*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to Turkey in northern Anatolian Black Sea watersheds, Anatolian Aegen Sea and western Lakes watersheds.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KNR4'; % Cat of Life
metaData.links.id_ITIS = '688700'; % ITIS
metaData.links.id_EoL = '356687'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_plebejus'; % Wikipedia
metaData.links.id_ADW = 'Barbus_plebejus'; % ADW
metaData.links.id_Taxo = '163204'; % Taxonomicon
metaData.links.id_WoRMS = '1022195'; % WoRMS
metaData.links.id_fishbase = 'Barbus-plebejus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_plebejus}}';  
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
bibkey = 'YildErdo2001'; type = 'Article'; bib = [ ...  
'author = {Ayhan Yildirim and Orhan Erdo\v{g}an and Mustafa T\"{u}rkmen}, ' ...
'year = {2001}, ' ...
'title = {On the Age, Growth and Reproduction of the Barbel, \emph{Barbus plebejus escherichi} ({S}teindachner, 1897) in the {O}ltu {S}tream of \c{C}oruh {R}iver ({A}rtvin-{T}urkey)}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {25}, '...
'pages = {163-168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbus-plebejus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

