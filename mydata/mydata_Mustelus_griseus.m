function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_griseus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_griseus'; 
metaData.species_en = 'Spotless smooth-hound'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 10*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';   
  temp.ab = C2K(18.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 28;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
data.Lp  = 72;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 101;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 87; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 78.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00224*Lb^3.14, see F3';
data.Wwp = 1.5e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00224*Lp^3.14, see F3';
data.Wwi = 4.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00224*Li^3.14, see F3';
data.Wwim = 2.8e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00224*Lim^3.14, see F3';
 
data.Ri  = 10/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 till 16 pups per litter, one litter per yr';

% uni-variate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 29.0
    1 52.6
    2 67.3
    3 76.3
    4 81.9
    5 85.4
    6 87.5
    7 88.8
    8 89.7
    9 90.2];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL    = C2K(18.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Fran1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 3 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00224*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northwest Pacific: Japan, Korea, China, Taiwan, and Viet Nam. Possibly occurring in the Philippines';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '44R26'; % Cat of Life
metaData.links.id_ITIS = '160255'; % ITIS
metaData.links.id_EoL = '46559994'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_griseus'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_griseus'; % ADW
metaData.links.id_Taxo = '106425'; % Taxonomicon
metaData.links.id_WoRMS = '271384'; % WoRMS
metaData.links.id_fishbase = 'Mustela_griseus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_griseus}}';
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
bibkey = 'Fran1981'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1444053}, ' ...
'author = {Francis, M. P.}, ' ... 
'year = {1981}, ' ...
'title = {Von Bertalanffy Growth Rates in Species of \emph{Mustelus} ({E}lasmobranchii: {T}riakidae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {1981(1)}, ' ...
'pages = {189-192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus_griseus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

