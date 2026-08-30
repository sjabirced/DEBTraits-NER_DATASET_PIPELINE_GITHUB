function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_peru
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_peru'; 
metaData.species_en = 'Pacific red snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 15];

%% set data
% zero-variate data

data.ab = 6.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(26.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Ramo2001';   
  temp.am = C2K(26.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 38; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 95;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.78 mm: pi/6*0.078^3'; 
data.Wwp = 728;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwi = 11061; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1';

data.GSI  = 0.058;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(26.2);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (d), total length (cm), weight (g)
 1	 2.994    0.240
 2	11.497   21.407
 3	18.839   89.575
 4	24.923  216.804
 5	30.136  365.163
 6	34.671  543.082
 7	38.529  733.686
 8	41.806  936.975
 9	44.600 1123.310
10	46.717 1309.707
11	49.026 1487.611
12	50.755 1652.877
13	52.194 1788.567
14	53.632 1920.034
15	54.685 2051.516
16	55.736 2144.976];
data.tLW(:,1) = (data.tLW(:,1) - 0.5)*365;  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(26.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Ramo2001'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW =  50 * weights.tLW;
weights.ab =  0 * weights.ab;
weights.GSI =  3 * weights.GSI;
weights.Lp =  3 * weights.Lp;
weights.Wwp =  0 * weights.Wwp;
weights.Wwi =  0 * weights.Wwi;
weights.Li =  3 * weights.Li;

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '168897'; % ITIS
metaData.links.id_EoL = '46580781'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_peru'; % ADW
metaData.links.id_Taxo = '179233'; % Taxonomicon
metaData.links.id_WoRMS = '276546'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-peru'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus}}';
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
bibkey = 'Ramo2001'; type = 'Article'; bib = [ ... 
'author = {Ramos-Cruz, Sebasti\''{a}n}, ' ... 
'year = {2001}, ' ...
'title = {Evaluaci\''{o}n de la pesquer\''{i}a de huachinango \emph{Lutjanus peru} en la zona costera de Salina Cruz, Oaxaca, M\''{e}xico, durante 1995}, ' ...
'journal = {Ciencia Pesquera}, ' ...
'volume = {14}, ' ...
'pages = {151-157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-peru.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
