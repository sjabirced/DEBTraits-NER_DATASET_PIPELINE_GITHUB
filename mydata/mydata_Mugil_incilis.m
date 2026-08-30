function [data, auxData, metaData, txtData, weights] = mydata_Mugil_incilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Mugil_incilis'; 
metaData.species_en = 'Parassi mullet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data
% zero-variate data

data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 0.9 mm for M. cephalus: pi/6*0.09^3';
data.Wwp = 101.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^2.91, see F1';
data.Wwi = 449;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.91, see F1';
  
data.Ri  = 1e4/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Mugil bananensis';
  
% uni-variate data
% time - length
data.tL = [ ... % yr class (yr), total length (cm)
43.684	7.255
194.473	18.769
225.213	20.858
256.277	23.077
286.370	25.036
317.757	26.726
348.821	27.888
365+12.296	28.536
365+43.360	29.831
365+285.723	35.997];
data.tL(:,1) = data.tL(:,1) + 60; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  bibkey.tL = 'RamiRue1998';
temp.tL    = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44J62'; % Cat of Life
metaData.links.id_ITIS = '170344'; % ITIS
metaData.links.id_EoL = '46571523'; % Ency of Life
metaData.links.id_Wiki = 'Mugil_incilis'; % Wikipedia
metaData.links.id_ADW = 'Mugil_curema'; % ADW
metaData.links.id_Taxo = '180428'; % Taxonomicon
metaData.links.id_WoRMS = '273654'; % WoRMS
metaData.links.id_fishbase = 'Mugil-curema'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mugil}}';
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
bibkey = 'RamiRue1998'; type = 'Article'; bib = [ ... 
'author = {S\''{a}nchez Ram\''{i}rez, C. and M. Rueda and A. Santos-Martinez}, ' ... 
'year = {1998}, ' ...
'title = {Din\''{a}mica poblacional y pesquería de la lisa, \emph{Mugil incilis}, en la ci\''{e}naga grande de {S}anta {M}arta, {C}aribe {C}olombiano}, ' ...
'journal = {Rev. Acad. Colomb. Cienc.}, ' ...
'volume = {22}, ' ...
'pages = {507-517}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mugil-incilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

