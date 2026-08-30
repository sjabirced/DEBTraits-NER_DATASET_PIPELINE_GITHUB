function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_variegatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_variegatus'; 
metaData.species_en = 'Slender emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 10; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 14;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01479*Lp^2.98, see F1';
data.Wwi = 111.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.98, see F1; max. published weight: 14 kg';

data.GSI  = 0.12;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 13.8
    2 20.0
    3 24.0
    4 27.2
    4.001 25.4
    4.002 26.1
    5 26.8
    5.001 26.7
    5.002 26.8
    6 28.5
    7 28.8
    8 29.3];
data.tL(:,1) = 365 * (0+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Loub1980'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 5 * weights.GSI;

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

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01479*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72325'; % Cat of Life
metaData.links.id_ITIS = '169152'; % ITIS
metaData.links.id_EoL = '46580949'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_variegatus'; % ADW
metaData.links.id_Taxo = '178753'; % Taxonomicon
metaData.links.id_WoRMS = '212076'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-variegatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_variegatus}}';
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
bibkey = 'Loub1980'; type = 'Article'; bib = [ ... 
'author = {Loubens, G.}, ' ... 
'year = {1980}, ' ...
'title = {Biologie de quelques esp\`{e}ces de poissons du lagon N\''{e}o-Cal\''{e}donien. {III}. Croissance}, ' ...
'journal = {Cah. Indo-Pac.}, ' ...
'volume = {2}, ' ...
'pages = {101-153}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-variegatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
