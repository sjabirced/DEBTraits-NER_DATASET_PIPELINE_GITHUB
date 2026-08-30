function [data, auxData, metaData, txtData, weights] = mydata_Priacanthus_arenatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Priacanthiformes'; 
metaData.family     = 'Priacanthidae';
metaData.species    = 'Priacanthus_arenatus'; 
metaData.species_en = 'Atlantic bigeye'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 21];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 7.4e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.52 mm: 4/3*pi*0.026^3'; 
data.Wwp = 35.8; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on .016980*Lp^2.90, see F1';
data.Wwi = 1435; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.016980*Li^2.90, see F1; max. published weight: 2.9 kg';

data.GSI  = 0.07;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(24.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0.5  5.4
    1.5 14.9
    2.5 22.9
    3.5 29.6
    4.5 35.4
    5.5 40.2
    6.5 44.3
    7.5 47.7
    8.5 50.6
    9.5 53.1
   10.5 55.1
   11.5 56.9
   12.5 58.4
   13.5 59.6
   14.5 60.7
   15.5 61.6
   16.5 62.3
   17.5 63.0
   18.5 63.5
   19.5 63.9
   20.5 64.3];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(24.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'XimeFont2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;


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
D1 = 'males are assumed to differ from females by {p_Am}  only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.016980*(TL in cm)^2.90';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; oceanodromous; depth range 12 - 400 m. Preferred 28 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4MBVY'; % Cat of Life
metaData.links.id_ITIS = '168178'; % ITIS
metaData.links.id_EoL = '46578897'; % Ency of Life
metaData.links.id_Wiki = 'Priacanthus_arenatus'; % Wikipedia
metaData.links.id_ADW = 'Priacanthus_arenatus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '127005'; % WoRMS
metaData.links.id_fishbase = 'Priacanthus_arenatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Priacanthus_arenatus}}';
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
bibkey = 'XimeFont2009'; type = 'Article'; bib = [ ... 
'author = {Maria Odete Ximenes-Carvalho and Antonio Adauto Fonteles-Filho and Melquíades Pinto Paiva}, ' ... 
'year = {2009}, ' ...
'title = {Growth and mortality parameters of the {A}tlantic big-eye, \emph{Priacanthus arenatus} ({T}eleostei: {P}riacanthidae), off southeastern {B}razil}, ' ...
'journal = { Arq. Ci\^{e}n. Mar, Fortaleza}, ' ...
'volume = {42(1)}, ' ...
'pages = {5-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuHung2001'; type = 'Article'; bib = [ ... 
'author = {K.-M. Liu and K.-Y. Hung and C.-T. Chen}, ' ... 
'year = {2001}, ' ...
'title = {Reproductive biology of the big eye \emph{Priacanthus macracanthus} in the north-eastern waters off {T}aiwan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {67}, ' ...
'pages = {1008--1014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Priacanthus_arenatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
