function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_brevirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_brevirostris'; 
metaData.species_en = 'Mongolian grayling'; 

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 06 28]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 28]; 

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 14*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'SlynMend2010';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 33;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'SlynMend2010'; 
data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'SlynMend2010';
  comment.Li = 'fishbase gives 39 cm, but that value probably relates to non-piscivore forms';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 430; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'SlynMend2010'; 
  comment.Wwp = 'based on tLW data and Lp';
data.Wwi  = 3130; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'SlynMend2010'; 
  comment.Wwi = 'based on 0.00851*Li^3.07, see F1; max published weight 1.2 kg';

data.Ri  = 6000/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Thymallus_tugarinae';
  
% uni-variate data
% time-length-weight
data.tLW = [... %  time since birth (yr), total length (cm)
 2	16.493   67.023
 3	19.187   81.968
 4	23.666  152.391
 5	33.497  430.533
 6	39.090  473.095
 7	48.030 1194.598
 8	49.161 1223.397
 9	50.293 1307.552
10	51.425 1599.579
11	54.790 1891.606
12	56.369 2183.572
13	57.502 2115.393
14	63.986 2850.689];
data.tLW(:,1) = (0 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(9);  units.temp.tLW = 'K'; label.temp.tL_m = 'temperature';
bibkey.tLW = 'SlynMend2010'; treat.tLW = {1 {'length','weight'}};
comment.tLW = 'values for yrs 5 and 6 are means of  benthos-eating and piscivore groups';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 15 * weights.tLW;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = ' Russia and Great Lakes basin in Mongolia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '56Q82'; % Cat of Life
metaData.links.id_ITIS = '162020'; % ITIS
metaData.links.id_EoL = '211371'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Thymallus_brevirostris'; % ADW
metaData.links.id_Taxo = '189043'; % Taxonomicon
metaData.links.id_WoRMS = '1020060'; % WoRMS
metaData.links.id_fishbase = 'Thymallus_brevirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thymallus_brevirostris}}';
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
bibkey = 'SlynMend2010'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210010042}, ' ...
'author = {Yu.V. Slynko and B. Mendsaykhan and A.N. Kas''anov}, ' ... 
'year = {2010}, ' ...
'title = {On Intraspecies Forms of the {M}ongolian Grayling (\emph{Thymallus brevirostris} {K}essl.) from {H}oton {N}ur {L}ake ({W}estern {M}ongolia)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {50(1)}, ' ...
'pages = {28–37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Thymallus_brevirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

