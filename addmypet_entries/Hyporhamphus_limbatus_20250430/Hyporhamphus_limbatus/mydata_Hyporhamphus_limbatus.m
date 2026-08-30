function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_limbatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_limbatus'; 
metaData.species_en = 'Congaturi halfbeak'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA', 'TO'};
metaData.ecoCode.habitat = {'0jFr', '0iMm'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data

data.am = 9*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 35;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm of Hyporhamphus_regularis: pi/6*0.2^3';
data.Wwp = 3.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^3.05, see F1';
data.Wwi = 224;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^3.05, see F1';

data.Ri = 4e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
160  6.657
341	11.107];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'StewHugh2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'wet weight (g) = 0.00437*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: Persian Gulf to China along the mainland coast of Asia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6MQVX'; % Cat of Life
metaData.links.id_ITIS = '645145'; % ITIS
metaData.links.id_EoL = '46567015'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus_limbatus'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_limbatus'; % ADW
metaData.links.id_Taxo = '177183'; % Taxonomicon
metaData.links.id_WoRMS = '272185'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus_limbatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus_limbatus}}'];
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
bibkey = 'KumaAmar2008'; type = 'Article'; bib = [ ... 
'author = {P.A.D.  Ajith Kumara and U.S.  Amarsinghe}, ' ... 
'year = {2008}, ' ...
'title = {Population dynamics of \emph{Hyporhamphus limbatus} ({B}eloniformes, {H}emiramphidae) in two lowland reservoirs of {S}ri {L}anka}, ' ...
'journal = {Sri Lanka J. Aquat. Sci.}, ' ...
'volume = {13}, ' ...
'pages = {23-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus_limbatus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

