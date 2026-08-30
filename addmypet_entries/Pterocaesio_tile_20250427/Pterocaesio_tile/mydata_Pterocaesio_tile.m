function [data, auxData, metaData, txtData, weights] = mydata_Pterocaesio_tile
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Caesionidae';
metaData.species    = 'Pterocaesio_tile'; 
metaData.species_en = 'Dark-banded fusilier';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
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

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ErnaAgus2021';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'ApriTupa2023'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 65.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01288*Lp^3.15, see F1';
data.Wwi = 579; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.15, see F1';

data.GSI = 0.02; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'ApriTupa2023';
  temp.GSI = C2K(28.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    1 11.6
    2 18.0
    3 21.6
    4 23.5
    5 24.5
    6 25.1];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ErnaAgus2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01288*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: East Africa, not including the Red Sea or the Arabian (Persian) Gulf, to the Tuamoto Archipelago, as far north as southern Japan and south to Mauritius and the Austral Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3BKML'; % Cat of Life
metaData.links.id_ITIS = '550918'; % ITIS
metaData.links.id_EoL = '46580718'; % Ency of Life
metaData.links.id_Wiki = 'Etelis'; % Wikipedia
metaData.links.id_ADW = 'Etelis_radiosus'; % ADW
metaData.links.id_Taxo = '174057'; % Taxonomicon
metaData.links.id_WoRMS = '276518'; % WoRMS
metaData.links.id_fishbase = 'Etelis_radiosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etelis}}';
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
bibkey = 'ErnaAgus2021'; type = 'article'; bib = [ ...
'author = {Tri Ernawati and Siska Agustina and Duranta D. Kembaren and Irfan Yulianto and Fayakun Satria }, ' ...
'year = {2021}, ' ...
'title = {Life history parameters and spawning potential ratio of some reef fish species in Fisheries Management Area 715 of {I}ndonesia}, ' ... 
'journal = {AACL Bioflux}, ' ...
'volume = {14(5)}, '...
'pages = {3093-3103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ApriTupa2023'; type = 'article'; bib = [ ...
'doi = {10.52046/agrikan.v16i1.28-34 }, ' ...
'author = {Reskyta M. Aprillia and Agustinus Tupamahu and Friesland Tuapete and dan Haruna}, ' ...
'year = {2023}, ' ...
'title = {Biologi Reproduksi \emph{Pterocaesio tile} ({C}uvier, 1830) dalam Menunjang Perikanan Jaring Insang Lingkar Bertanggungjawab}, ' ... 
'journal = {AGRIKAN - Jurnal Agribisnis Perikanan}, ' ...
'volume = {16(1)}, '...
'pages = {28-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Etelis_radiosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
