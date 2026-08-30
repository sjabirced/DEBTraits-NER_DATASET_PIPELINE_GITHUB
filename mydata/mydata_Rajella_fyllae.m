function [data, auxData, metaData, txtData, weights] = mydata_Rajella_fyllae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Rajella_fyllae'; 
metaData.species_en = 'Round ray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data;
data.ab = 1*365; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(3.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AunePrim2014'; 
  temp.tp = C2K(3.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'AunePrim2014';   
  temp.am = C2K(3.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on Leucoraja erinacea: 9.7*57/54';
data.Lp  = 36;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014';
data.Li  = 57;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'AunePrim2014';

data.Wwb = 5.6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'guess','fishbase'};
  comment.Wwb = 'based on 0.00302*Lb^3.24, see F1';
data.Wwp = 333;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00302*Lp^3.24, see F1';
data.Wwi = 1476;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'AunePrim2014','fishbase'};
  comment.Wwi = 'based on 0.00302*Li^3.24, see F1';

data.Ri  = 47/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(3.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

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
F1 = 'length - weight: Ww in g = 0.00302*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Atlantic and adjacent fringes of the Arctic Region: offshore of Gulf of Maine and slopes off Newfoundland banks and Labrador to southern Baffin Bay, around southern Greenland to Denmark Strait, south of Iceland, and along Faroe-Shetland ridge to the Skagerrak; west of British Isles from Porcupine Bank and Rockall Plateau to Faroe Islands; and off Norwegian coasts to western Barents Sea and Svalbard';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4RB3M'; % Cat of Life
metaData.links.id_ITIS = '564135'; % ITIS
metaData.links.id_EoL = '46560578'; % Ency of Life
metaData.links.id_Wiki = 'Rajella_fyllae'; % Wikipedia
metaData.links.id_ADW = 'Rajella_fyllae'; % ADW
metaData.links.id_Taxo = '108290'; % Taxonomicon
metaData.links.id_WoRMS = '105894'; % WoRMS
metaData.links.id_fishbase = 'Rajella_fyllae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rajella_fyllae}}';   
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
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen and Michaela Aschan}, ' ...
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rajella_fyllae}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
