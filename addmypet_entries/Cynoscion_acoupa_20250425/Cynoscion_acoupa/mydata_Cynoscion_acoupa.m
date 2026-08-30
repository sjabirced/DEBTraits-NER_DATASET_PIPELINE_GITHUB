function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_acoupa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_acoupa'; 
metaData.species_en = 'Acoupa weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 25];

%% set data
% zero-variate data

data.am = 23*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Cynoscion_guatucupa';

data.Lp  = 42.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 110;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 723;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00741*Lp^3.06, see F1';
data.Wwi = 13076;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.06, see F1; max. published weight: 17.0 kg';

data.GSI  = 0.03; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cynoscion_guatucupa';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  16.19
    1  27.15
    2  40.22
    3  54.66
    4  63.70
    5  77.60
    6  84.67
    7  90.18 
    8  96.46
    9 102.80
   10 107.00];
data.tL(:,1) = 365 * (0.9+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SantOliv2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Panama to Argentina; Southwest Atlantic: Sergipe, Brazil';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6C7LD'; % Cat of Life
metaData.links.id_ITIS = '169242'; % ITIS
metaData.links.id_EoL = '46578978'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion_acoupa'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_acoupa'; % ADW
metaData.links.id_Taxo = '172623'; % Taxonomicon
metaData.links.id_WoRMS = '276074'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-acoupa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion_acoupa}}';
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
bibkey = 'SantOliv2023'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.fishres.2023.106826}, ' ...
'author = {Francisco Marcante Santana and C\''{i}cero Diogo Lins de Oliveira and Amanda Graziele Ara\''{u}jo Resende and Ant\^{o}nio Carlos Leal de Castro and Zafira da Silva Almeida and Ros\ˆ{a}ngela Lessa}, ' ... 
'year = {2023}, ' ...
'title = {Age and growth of the {A}coupa Weakfish (\emph{Cynoscion acoupa}) of the {B}razilian {A}mazonian Coast, through micro and macrostructures in otoliths}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {46(1-3)}, ' ...
'pages = {106826}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-acoupa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

