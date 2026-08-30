function [data, auxData, metaData, txtData, weights] = mydata_Boulengerochromis_microlepis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Boulengerochromis_microlepis'; 
metaData.species_en = 'Giant cichlid'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data

data.am = 15*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 80;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Oreochromis niloticus: pi/6*0.15^3';
data.Wwp = 891;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01445*Lp^2.99, see F1';
data.Wwi = 7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwim = 'based on 0.01445*Li^2.99, see F2; max. published weight: 4.5 kg';

data.Ri  = 10000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
319.940	10.766
348.764	11.163
365+287.554	15.003
365+349.769	15.471
730+348.930	19.127];
data.tL(:,1) = 160 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NiyoIsum2015';

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
% set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to and widely distributed in Lake Tanganyika';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'MR6R'; % Cat of Life
metaData.links.id_ITIS = '649047'; % ITIS
metaData.links.id_EoL = '208559'; % Ency of Life
metaData.links.id_Wiki = 'Boulengerochromis_microlepis'; % Wikipedia
metaData.links.id_ADW = 'Boulengerochromis_microlepis'; % ADW
metaData.links.id_Taxo = '153653'; % Taxonomicon
metaData.links.id_WoRMS = '1019102'; % WoRMS
metaData.links.id_fishbase = 'Boulengerochromis_microlepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boulengerochromis_microlepis}}';
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
bibkey = 'NiyoIsum2015'; type = 'Article'; bib = [ ... 
'author = {Charles Niyonkuru  and Pascal Isumbisho and Jacques Moreau}, ' ... 
'year = {2015}, ' ...
'title = {Growth, Mortality Rates and Exploitation of Cichlids in Anthropological Coastal Zone in the North of {L}ake {T}anganyika}, ' ...
'journal = {Journal of Agriculture and Life Sciences}, ' ...
'volume = {2(1)}, ' ...
'pages = {94-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Boulengerochromis-microlepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

