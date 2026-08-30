  function [data, auxData, metaData, txtData, weights] = mydata_Barbonymus_gonionotus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbonymus_gonionotus'; 
metaData.species_en = 'Silver barb'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'t-Ww'}; 

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
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 43;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 45.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^2.99, see F1';
data.Wwi = 879; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^2.99, see F1';
    
data.Ri = 98325/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishebase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (d), total length (cm), weight (g)
0	11.749  21.199
1	18.002  83.470
2	16.791  66.896
3	17.536  93.909
4	20.093 133.102
5	22.070 170.373
6	21.874 141.618
7	22.619 168.633];
data.tLW(:,1) = 30.5*(2 + data.tLW(:,1)); % set origin at birth
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(25);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'AliMond2022'; treat.tLW = {1 {'length','weight'}}; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 10;
weights.Wwi = weights.Wwi * 0;
weights.Lp = weights.Lp * 5;
weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Wwp and Wwi data are ignored due to inconsistency with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00631*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Mekong and Chao Phraya basins, Malay Peninsula, Sumatra and Java. Occurs throughout the whole stretch on the Mekong, from the delta around the saline intrusion zone to Chiang Khong in Thailand';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KMNM'; % Cat of Life
metaData.links.id_ITIS = '688444'; % ITIS
metaData.links.id_EoL = '222223'; % Ency of Life
metaData.links.id_Wiki = 'Barbonymus_gonionotus'; % Wikipedia
metaData.links.id_ADW = 'Barbonymus_gonionotus'; % ADW
metaData.links.id_Taxo = '162931'; % Taxonomicon
metaData.links.id_WoRMS = '1026316'; % WoRMS
metaData.links.id_fishbase = 'Barbonymus-gonionotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbonymus_gonionotus}}';  
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
bibkey = 'AliMond2022'; type = 'Article'; bib = [ ...  
'doi = {10.3329/jbs.v30i1.63105}, ' ...
'author = {M.R. Ali and M.R.M/ Mondol}, ' ...
'year = {2022}, ' ...
'title = {GROWTH AND REPRODUCTION OF THAI SHARPUNTI (\emph{Barbonymus gonionotus}) IN THE LENTIC WATER HABITAT OF NORTHWEST {B}ANGLADESH }, ' ...
'journal = {J. Bio-Sci.}, ' ...
'volume = {30(1)}, '...
'pages = {101-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbonymus-gonionotus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

