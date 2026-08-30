function [data, auxData, metaData, txtData, weights] = mydata_Oxyporhamphus_micropterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae ';
metaData.species    = 'Oxyporhamphus_micropterus'; 
metaData.species_en = 'Shotwing flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 26];

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'Yaca1991';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 18.5;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';
data.Wwp = 8.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00331*Lp^3.08, see F1';
data.Wwi = 26.5;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00331*Li^3.08, see F1';

data.Ri = 3.6e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Hirundichthys_affinis: (18.6/30)^3*1.5e4';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
227.243	9.131
258.190	10.704
286.668	11.510
318.484	12.608
349.071	13.227
365+14.245	13.750
365+103.874	16.176
365+320.593	19.087
365+348.705	19.036];
data.tL(:,1) = data.tL(:,1) -80; % set origin to birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Yaca1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00331*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BJDC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '205851'; % Ency of Life
metaData.links.id_Wiki = 'Oxyporhamphus_micropterus'; % Wikipedia
metaData.links.id_ADW = 'Oxyporhamphus_micropterus'; % ADW
metaData.links.id_Taxo = '153185'; % Taxonomicon
metaData.links.id_WoRMS = '217871'; % WoRMS
metaData.links.id_fishbase = 'Oxyporhamphus-micropterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oxyporhamphus_micropterus}}'];
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
bibkey = 'Yaca1991'; type = 'Article'; bib = [ ... 
'author = {Yacapin, N.C.}, ' ... 
'year = {1991}, ' ...
'title = {Growth, mortality and recruitment of short-wing flying fish \emph{Oxyphorhamphus micropterus} in {B}ohol {S}ea, {P}hilippines}, ' ...
'journal = {Fishbyte}, '...
'volume = {9(2)}, ' ...
'pages = {10-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Oxyporhamphus-micropterus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

