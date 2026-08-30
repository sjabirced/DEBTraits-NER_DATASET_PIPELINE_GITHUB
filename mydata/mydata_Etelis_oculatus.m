function [data, auxData, metaData, txtData, weights] = mydata_Etelis_oculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Etelis_oculatus'; 
metaData.species_en = 'Queen snapper';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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

data.ab = 12;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(18.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 63*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Over2022';   
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 31; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 398; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01698*Lp^2.93, see F1';
data.Wwi = 12.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*Li^2.93, see F1; max. published weight: 6.3 kg';

data.GSI = 0.027; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Etelis_carbunculus';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    4  NaN 18.4
    5  NaN 23.0
    6 23.3 25.7
    7 24.8 27.1
    8 31.7 28.8
    9 38.6 32.0
   10 38.7 34.3
   11 44.9 36.1
   12 44.0 39.4
   13 46.4 42.6
   14 49.8 45.4
   15 52.6 49.5
   16 55.4 52.6
   17 61.1 53.3
   18 60.9 56.8
   19 60.9 60.6
   20 62.0 62.7
   21 68.6 59.0
   22 66.3 60.7
   23 75.4 68.0
   24 72.3 62.9
   25 77.0 63.3
   26 72.2 74.1
   27 71.0 50.6
   28 75.6 72.5
   29 67.6 NaN
   30 73.0 73.7
   31 75.8 68.5
   32 77.7 71.0
   33 79.5 NaN
   34 79.8 78.0
   35 83.8 NaN
   36 71.1 76.2
   37 72.9 NaN
   39 76.0 NaN
   41 96.8 NaN
   42 88.7 NaN
   43 82.5 80.0
   44 90.0 NaN
   45 94.5 70.8
   46 88.0 NaN
   47 71.0 NaN
   48 92.0 NaN
   49 57.0 NaN
   58 93.0 NaN
   63 99.0 NaN];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(18.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Over2022'; treat.tL = {1 {'Gulf of Mexico','Puerto Rico'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01698*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Bermuda and North Carolina, USA, Gulf of Mexico southward through the Caribbean to Sau Paulo, Brazil, including the Fernando do Noronha and Atol das Rocas Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3BKMK'; % Cat of Life
metaData.links.id_ITIS = '168902'; % ITIS
metaData.links.id_EoL = '46580715'; % Ency of Life
metaData.links.id_Wiki = 'Etelis_oculatus'; % Wikipedia
metaData.links.id_ADW = 'Etelis_oculatus'; % ADW
metaData.links.id_Taxo = '174056'; % Taxonomicon
metaData.links.id_WoRMS = '159789'; % WoRMS
metaData.links.id_fishbase = 'Etelis_oculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etelis_oculatus}}';
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
bibkey = 'Over2022'; type = 'phdthesis'; bib = [ ...
'author = {Katherine E. Overly}, ' ...
'year = {2022}, ' ...
'title = {Age, growth and mortality estimates for queen sapper \emph{Etelis_oculatus} in the US Caribbean and Gulf of Mexico}, ' ... 
'institution = {University of Florida}, ' ...
'volume = {NOAA-TM-NMFS-SWFC-113}, '...
'pages = {1-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Etelis_oculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
