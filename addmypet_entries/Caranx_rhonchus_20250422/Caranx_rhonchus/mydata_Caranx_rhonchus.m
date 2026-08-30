  function [data, auxData, metaData, txtData, weights] = mydata_Caranx_rhonchus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Caranx_rhonchus'; 
metaData.species_en = 'False scad'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 22];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(19.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 104;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.95, see F1';
data.Wwi = 2665;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.95, see F1; max. published weight: 1.0 kg';

data.Ri  = 990000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(19.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL_fm = [ ... % time since brth (yr), total length (cm)
    1 17.3 17.3
    2 19.7 20.1
    3 22.6 23.3
    4 28.5 28.0];
data.tL_fm(:,1) = (data.tL_fm(:,1)+ 0.9)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(19.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = 'AltaIlha2022'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.95'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic: Morocco to Angola, including the Mediterranean along the African coast. Range reported to extend south to Namibia';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'R2SR'; % Cat of Life
metaData.links.id_ITIS = '641982'; % ITIS
metaData.links.id_EoL = '46577970'; % Ency of Life
metaData.links.id_Wiki = 'Caranx_rhonchus'; % Wikipedia
metaData.links.id_ADW = 'Caranx_rhonchus'; % ADW
metaData.links.id_Taxo = '165431'; % Taxonomicon
metaData.links.id_WoRMS = '126806'; % WoRMS
metaData.links.id_fishbase = 'Caranx-rhonchus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Caranx_rhonchus}}';  
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
bibkey = 'AltaIlha2022'; type = 'article'; bib = [ ... 
'doi = {10.12714/egejfas.39.2.03}, ' ...
'author = {Burak Altay and Dilek Ilhan}, ' ...
'year = {2022}, ' ...
'title = {Age, growth and maturity of false scad \emph{Caranx rhonchus} in the {C}entral {A}egean {S}ea ({T}eleostei: {C}arangidae)}, ' ... 
'journal = {Ege Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {39(2)}, '...
'pages = {104-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Caranx-rhonchus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  