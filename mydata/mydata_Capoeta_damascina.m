function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_damascina
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_damascina'; 
metaData.species_en = 'Mesopotamian barb'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 07];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'AlpKara2005';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 15.1;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Kalk2008'; 
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 5.9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Kalk2008';
  comment.Wwb = 'based on egg diameter of 1.04 mm: pi/6*0.104^3';
data.Wwp = 34.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'Kalk2008','fishbase'};
  comment.Wwp = 'based on 0.01122*Lp^2.96, see F1';
data.Wwi = 1199;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ZulfGund2013';
  comment.Wwi = 'based on 0.01122*Li^2.96, see F1';

data.Ri = 51773/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), fork length (cm)
    0  5.0  5.0
    1 10.6 10.3 
    2 14.7 14.9
    3 17.9 17.3
    4 22.7 22.2
    5 25.6 25.0
    6 28.6 27.8
    7 34.8 31.5
    8 36.7 NaN
    9 39.5 NaN
   10 41.5 NaN];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(21);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AlpKara2005'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (yr), weight (g)
    0   1.6   1.6
    1  20.1  17.4
    2  48.7  50.8
    3  90.2  81.5
    4 137.2 132.3
    5 206.3 201.6
    6 292.9 311.3
    7 491.5 401.0
    8 568.0 NaN
    9 643.0 NaN
   10 832.0 NaN];
data.tW_fm(:,1) = 365 * (0.8+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(21);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'AlpKara2005'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01122*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Jordan River drainage basin, the entire Levant, Mesopotamia and parts of southern Turkey';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '699M3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '357124'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_damascina'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_damascina'; % ADW
metaData.links.id_Taxo = '165382'; % Taxonomicon
metaData.links.id_WoRMS = '862540'; % WoRMS
metaData.links.id_fishbase = 'Capoeta-damascina'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_damascina}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Capoeta-damascina.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'AlpKara2005'; type = 'article'; bib = [ ...
'author = {Ahmet Alp and Cemil Kara and H. Murat B\"{u}y\"{U}k\c{c}apar and Orhan B\"{u}lb\"{u}l}, ' ...
'year = {2005}, ' ...
'title  = {Age, Growth and Condition of \emph{Capoeta capoeta angorae} {H}anko 1924 from the Upper Water Systems of the {R}iver {C}eyhan, {T}urkey}, ' ...
'journal = {Turk. J. Vet. Anim. Sci.}, ' ...
'volume = {29}, ' ...
'pages = {665-676}'];
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

