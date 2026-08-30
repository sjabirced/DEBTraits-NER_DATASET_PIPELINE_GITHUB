function [data, auxData, metaData, txtData, weights] = mydata_Neogobius_fluvialitis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Neogobius_fluvialitis'; 
metaData.species_en = 'Monkey goby'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'jiFr', 'jiFm'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'PlacBalz2010';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 10.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.11, see F1';
data.Wwi = 87.5; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00724*Li^3.11, see F1';

data.Ri  = 3888/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [... %  time since birth (yr), total length (cm)
    1 3.724  4.873
    2 4.831  6.131
    3 5.953  7.830
    4 6.854  9.144
    5 NaN   10.440];
data.tL_fm(:,1) = (0.5 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PlacBalz2010'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length=weight: Ww in  g = 0.00724*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eurasia: Azov and Black Sea basins. Invasive in rivers of northern Black Sea basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6RW9X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Neogobius'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '46592'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Neogobius-fluvialitis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neogobius}}';
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
bibkey = 'PlacBalz2010'; type = 'Article'; bib = [ ... 
'author = {M\''{a}ria Plach\''{a} and M\''{a}ria Bal\''{a}\v{z}ov\''{a} and Vladimír Kov\''{a}\v{c} and Stanislav Katina}, ' ... 
'year = {2010}, ' ...
'title = {Age and growth of non-native monkey goby \emph{Neogobius fluviatilis} ({T}eleostei, {G}obiidae) in the River {I}pel'', {S}lovakia}, ' ...
'journal = {Folia Zool.}, ' ...
'volume = {59(4)}, ' ...
'pages = {332–340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Neogobius-fluvialitis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

