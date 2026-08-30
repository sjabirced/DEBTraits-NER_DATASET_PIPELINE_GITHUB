  function [data, auxData, metaData, txtData, weights] = mydata_Chondrostoma_holmwoodii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chondrostoma_holmwoodii'; 
metaData.species_en = 'Izmir nase'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 03];

%% set data
% zero-variate data
data.ab = 7;      units.ab = 'd';  label.ab = 'age at birth';    bibkey.ab = 'guess';
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 28.2;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1.5 mm of C.nasus: 4/3*pi*0.075^3';
data.Wwp = 37.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00891*Lp^3.08, see F1';
data.Wwi = 261;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.08, see F1';

data.Ri = 41700/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm= [ ... % time since birth (yr), fork length (cm)
    1 15.49 15.45
    2 17.81 17.34
    3 19.64 19.61
    4 21.37 20.83
    5 22.48 21.85];
data.tL_fm(:,1) = 365 * (0.5+data.tL_fm(:,1)); % covert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'IlhSari2010'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm= [ ... % time since birth (yr), weight (g)
    1  59.48  52.98
    2  93.11  80.04
    3 128.82 123.03
    4 170.63 147.61
    5 195.63 166.81];
data.tW_fm(:,1) = 365 * (0.5+data.tW_fm(:,1)); % covert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'IlhSari2010'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Belgium, South Germany, Germany'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69ZCZ'; % Cat of Life
metaData.links.id_ITIS = '688874'; % ITIS
metaData.links.id_EoL = '356698'; % Ency of Life
metaData.links.id_Wiki = 'Chondrostoma_holmwoodii'; % Wikipedia
metaData.links.id_ADW = 'Chondrostoma_holmwoodii'; % ADW
metaData.links.id_Taxo = '170970'; % Taxonomicon
metaData.links.id_WoRMS = '1019278'; % WoRMS
metaData.links.id_fishbase = 'Chondrostoma-holmwoodii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chondrostoma_holmwoodii}}';  
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
bibkey = 'IlhSari2010'; type = 'article'; bib = [ ...  
'doi = {10.3750/AIP2010.40.2.08}, ' ...
'author = {Ilhan, A. and H.M. Sari and S. Balık}, ' ...
'year = {2010}, ' ...
'title = {Growth features of an endemic population of \emph{Chondrostoma holmwoodii} ({A}ctinopterygii: {C}ypriniformes: {C}yprinidae) in western {A}natolia}, ' ... 
'journal = { Acta Ichthyol. Piscat.}, ' ...
'pages = {155-159}, ' ...
'volume = {40(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Chondrostoma-holmwoodii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
