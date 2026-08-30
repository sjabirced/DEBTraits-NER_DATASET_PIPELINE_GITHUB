  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_balcanicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_balcanicus'; 
metaData.species_en = 'Danube barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

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
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'BertPizz2019'; 
data.Li = 17.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 1.2;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BertPizz2019','fishbase'};
  comment.Wwp = 'based on 0.00631*Lp^3.08, see F1';
data.Wwi = 42.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.08, see F1';
    
data.GSI = 0.12; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'BertPizz2019';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
1	 6.39  6.70
2	 8.01  7.81
3	 9.69  9.48
4	12.70 11.34];
data.tL_fm(:,1) = 365*(0.2 + data.tL_fm(:,1)); % set origin at birth
units.tL_fm = {'d', 'cm', 'g'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BertPizz2019'; treat.tL_fm = {1 {'female','male'}}; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.Li = weights.Li * 10;
weights.Wwi = weights.Wwi * 10;

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
F1 = 'Length-weight: Ww (in g) = 0.00631*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Adriatic basin: Soca drainage (Italy, Slovenia). Danube drainage: upper Save, Archar, Krupaja, Vlasinsko and Nera systems, possibly more widespread in upper Danube drainage. Aegean basin: Gallikos, Vardar, Loudias and Aliakmon drainages';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KMYQ'; % Cat of Life
metaData.links.id_ITIS = '688478'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Barbus_balcanicus'; % Wikipedia
metaData.links.id_ADW = 'Barbus_balcanicus'; % ADW
metaData.links.id_Taxo = '194379'; % Taxonomicon
metaData.links.id_WoRMS = '1009768'; % WoRMS
metaData.links.id_fishbase = 'Barbus-balcanicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_balcanicus}}';  
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
bibkey = 'BertPizz2019'; type = 'Article'; bib = [ ...  
'doi = {10.1080/24750263.2019.1647298}, ' ...
'author = {M. Bertoli and E. Pizzul and V. Devescovi and F. Franz and P. Pastorino and P. G. Giulianina and C. Ferrari and F. Nonnis Marzano}, ' ...
'year = {2019}, ' ...
'title = {Biology and distribution of {D}anube barbel (\emph{Barbus balcanicus}) ({O}steichthyes: {C}yprinidae) at the {N}orthwestern limit of its range}, ' ...
'journal = {The European Zoological Journal}, ' ...
'volume = {86(1)}, '...
'pages = {280–293}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbus-balcanicus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

