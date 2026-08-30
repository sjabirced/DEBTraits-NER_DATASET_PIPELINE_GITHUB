function [data, auxData, metaData, txtData, weights] = mydata_Cherublemma_emmelas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Cherublemma_emmelas'; 
metaData.species_en = 'Black brotula'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data

data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoraLope2018';   
  temp.am = C2K(11.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MoraLope2018';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 3.35e-5;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'Based on egg diameter of 0.4 mm: pi/6*0.04^3';
data.Wwp = 28;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00257*Lp^3.17, see F1';
data.Wwi = 69.4;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00257*Li^3.17, see F1';
 
data.GSI  = 0.05; units.GSI  = 'g/g'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(11.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0	4.873
1	17.479
2	24.616
3	28.220
4	30.562
5	31.726
6	32.216];
data.tL(:,1) = (0.4+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(11.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraLope2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_fN','tL_mN'}; subtitle1 = {'Data for females, males, north austral zone'};
% set2 = {'tL_fS','tL_mS'}; subtitle2 = {'Data for females, males, south austral zone'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';  
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00257*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Pacific: Baja California to northern Chile';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5XQQF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46565546'; % Ency of Life
metaData.links.id_Wiki = 'Cherublemma_emmelas'; % Wikipedia
metaData.links.id_ADW = 'Cherublemma_emmelas'; % ADW
metaData.links.id_Taxo = '170758'; % Taxonomicon
metaData.links.id_WoRMS = '280144'; % WoRMS
metaData.links.id_fishbase = 'Cherublemma-emmelas'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cherublemma_emmelas}}';
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
bibkey = 'MoraLope2018'; type = 'Article'; bib = [ ... 
'doi = {10.3856/vol46-issue5-fulltext-22}, ' ...
'author = {Rufino Morales-Azpeitia and Juana L\''{o}pez-Mart\''{i}nez and El''{i}sa Herrera-Valdivia and Alejandro Acevedo-Cervantes}, ' ... 
'year = {2018}, ' ...
'title = {Population dynamics of black brotula (\emph{Cherublemma emmelas}) in deep waters of the {G}ulf of {C}alifornia}, ' ...
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {46(5)}, ' ...
'pages = {1103-1109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cherublemma-emmelas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

