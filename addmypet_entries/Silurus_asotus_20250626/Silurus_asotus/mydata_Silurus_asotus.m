  function [data, auxData, metaData, txtData, weights] = mydata_Silurus_asotus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Silurus_asotus'; 
metaData.species_en = 'Amur catfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 26];

%% set data
% zero-variate data
data.ab = 3.5;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'fishbase';
  temp.ab = C2K(26.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = 'for females';
data.Li = 130;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 1.3 mm: pi/6*0.13^3';
data.Wwp = 285;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00589*Li^3.01, see F1';
data.Wwi = 13.6e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00589*Li^3.01, see F1; max. published weight: 30.0 kg ';
  
data.Ri = 4e5/ 365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Silurus_glanis: 114*3e4*13.6e3/114e3'; 

% univariate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
 0.000	0.478
 0.316	0.568
 0.646	0.569
 1.006	0.608
 1.336	0.654
 1.696	0.706
 2.005	0.738
 2.376	0.765
 2.634	0.804
 2.974	0.785
 3.334	0.850
 3.664	0.902
 3.994	0.909
 4.344	0.941
 4.643	1.006
 4.924	1.159
 6.356	1.305
 7.704	1.451
 9.140	1.500
10.406	1.550
11.841	1.612
13.230	1.777
14.577	1.968
15.963	2.263
17.222	2.570
18.605	2.974
20.031	3.346];
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(26.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NawaFut2020';

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
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Asia: Honshu, Shikoku and Kyushu in Japan, the Korean Peninsula, Taiwan, China, and Russia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6YQ6N'; % Cat of Life
metaData.links.id_ITIS = '164077'; % ITIS
metaData.links.id_EoL = '212830'; % Ency of Life
metaData.links.id_Wiki = 'Silurus_asotus'; % Wikipedia
metaData.links.id_ADW = 'Silurus_asotus'; % ADW
metaData.links.id_Taxo = '187675'; % Taxonomicon
metaData.links.id_WoRMS = '1018214'; % WoRMS
metaData.links.id_fishbase = 'Silurus_asotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Silurus_asotus}}';  
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
bibkey = 'NawaFut2020'; type = 'Article'; bib = [ ...    
'author = {Siti Umey Syahirah Mat Nawang and Ching Fui Fut and Shigeharu Senoo}, ' ...
'year  = {2020}, ' ...
'title = {BIOLOGICAL DEVELOPMENT AND GROWTH OF {A}MUR CATFISH, \emph{Silurus asotus} REARED UNDER CONTROLLED TROPICAL CONDITION}, ' ...  
'journal = {Malays. Appl. Biol.}, ' ...
'volume = {49(5)}, ' ...
'pages = {11–23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Silurus_asotuss}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

