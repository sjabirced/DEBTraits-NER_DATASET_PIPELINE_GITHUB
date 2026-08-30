function [data, auxData, metaData, txtData, weights] = mydata_Aspredo_aspredo
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Aspredinidae';
metaData.species    = 'Aspredo_aspredo'; 
metaData.species_en = 'Banjo catfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data;

data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'aquafish';
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 38.3;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 4.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp  = 6.9; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.00204*Lp^3.00, see F1';
data.Wwi  = 115; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00204*Li^3.00, see F1';

data.Ri  = 50/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 12.02
    2 19.99
    3 27.23
    4 33.67];
data.tL(:,1) = 365 * (data.tL(:,1)-0.3);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CamaIsaa1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: W in g = 0.00204*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Central and South America: lower portions of coastal rivers from Venezuela to northern Brazil';
metaData.bibkey.F2 = 'fishbase';
F3 = 'The adhesive eggs attach to the female''s underside, where she carries them until hatching';
metaData.bibkey.F3 = 'aqua-fish';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3); 

%% Links
metaData.links.id_CoL = 'GMX9'; % Cat of Life
metaData.links.id_ITIS = '680665'; % ITIS
metaData.links.id_EoL = '223038'; % Ency of Life
metaData.links.id_Wiki = 'Ariopsis_felis'; % Wikipedia
metaData.links.id_ADW = 'Ariopsis_felis'; % ADW
metaData.links.id_Taxo = '259219'; % Taxonomicon
metaData.links.id_WoRMS = '158709'; % WoRMS
metaData.links.id_fishbase = 'Ariopsis-felis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ariopsis_felis}}';
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
bibkey = 'CamaIsaa1998'; type = 'Article'; bib = [ ... 
'author = {Mauricio Camargo and Victoria J. Isaac}, ' ... 
'year = {1998}, ' ...
'title = {Population structure of fish fauna in the estuarine area of {C}aet\''{e} {R}iver, {B}ragan\c{c}a, {P}ar\''{a}, {B}razil}, ' ...
'journal = {Acta Scientiarum}, ' ...
'volume = {20(2)}, ' ...
'pages = {171-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ariopsis-felis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aquafish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.aqua-fish.net/fish/banjo}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

