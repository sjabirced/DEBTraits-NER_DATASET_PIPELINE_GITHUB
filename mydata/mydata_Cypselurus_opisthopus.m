function [data, auxData, metaData, txtData, weights] = mydata_Cypselurus_opisthopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Cypselurus_opisthopus'; 
metaData.species_en = 'Black-finned flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 24];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';
data.Wwp = 5.1; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00631*Lp^3.05, see F1';
data.Wwi = 42.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00631*Li^3.05, see F1';

data.Ri = 2e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hirundichthys_affinis: 1.5e4*42.5/324';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
169.055	7.850
228.755	14.493
262.811	16.908
321.328	20.652];
data.tL(:,1) = data.tL(:,1) - 95; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dalz1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Ri = 3 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouped plots
% set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Pacific: Bay of Bengal to Okinawa, Japan and the Solomon Islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '33JCN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cypselurus'; % Wikipedia
metaData.links.id_ADW = 'Cypselurus_opisthopus'; % ADW
metaData.links.id_Taxo = '172806'; % Taxonomicon
metaData.links.id_WoRMS = '278734'; % WoRMS
metaData.links.id_fishbase = 'Cypselurus-opisthopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cypselurus}}'];
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
bibkey = 'Dalz1993'; type = 'article'; bib = [ ... 
'author = {P. Dalzell}, ' ...
'year = {1993}, ' ...
'title = {The fisheries biology of fyling fishes (familie: {E}xocoetidae and {H}emiramphidae) from the {C}amotes {S}ea, central {P}hilippines}, ' ... 
'journal = {J. Fish Biol}, ' ...
'volume = {43}, ' ...
'pages = {19-32},' ...
'howpublished = {\url{https://digitalarchive.worldfishcenter.org/server/api/core/bitstreams/9211bb8d-9bb9-4343-966b-649ff18d9b5b/content}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Cypselurus-opisthopus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

