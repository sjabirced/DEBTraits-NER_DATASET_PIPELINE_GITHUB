  function [data, auxData, metaData, txtData, weights] = mydata_Acanthobrama_microlepis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Acanthobrama_microlepis'; 
metaData.species_en = 'Blackbrow bleak'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'guess'; 
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'TurkErdo2001';
  comment.Wwb = 'Based on egg diameter of 1.65 mm: pi/6*0.165^3';
data.Wwp = 14.4;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty\';          bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Computed as 0.00776*Lp^3.14, see F1';
data.Wwi = 190; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.14, see F1';

data.Ri = 9705/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    1  7.73  7.81
    2 10.15 10.24
    3 12.11 11.86
    4 13.84 13.48 
    5 15.31 14.87
    6 16.81 16.27
    7 18.12 NaN];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TurkErdo2001'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1  5.61  5.82
    2 13.15 12.84 
    3 21.25 20.21 
    4 33.30 29.99
    5 46.15 41.09
    6 63.72 57.70
    7 77.85 NaN];
data.tW_fm(:,1) = 365 * (0.5 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(18);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'TurkErdo2001'; treat.tW_fm = {1 {'females','males'}};
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to the Kura-Aras basin. Probably also in Sefid of Iran.';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '64CSP'; % Cat of Life
metaData.links.id_ITIS = '1199845'; % ITIS
metaData.links.id_EoL = '42514157'; % Ency of Life
metaData.links.id_Wiki = 'Acanthobrama_microlepis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '2702189'; % Taxonomicon
metaData.links.id_WoRMS = '1020219'; % WoRMS
metaData.links.id_fishbase = 'Acanthobrama-microlepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthobrama_microlepis}}';  
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
bibkey = 'TurkErdo2001'; type = 'Article'; bib = [ ...  
'author = {Mustafa T\"{u}rkmen and Orhan Erdo\v{g}an and H. Ibrahim Hal\"{u}lo\''{u}lu and Ayhan Yildirim}, ' ...
'year = {2001}, ' ...
'title = {Age, Growth and Reproduction of \emph{Acanthalburnus microlepis}, {F}ilippi 1863 from the Ya\v{g}an Region of the {A}ras {R}iver, {T}urkey}, ' ... 
'journal = {Turk. J. Zool.}, ' ...
'volume = {25}, '...
'pages = {127-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthobrama-microlepis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

