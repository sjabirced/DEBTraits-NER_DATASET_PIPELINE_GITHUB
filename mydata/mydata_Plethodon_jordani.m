function [data, auxData, metaData, txtData, weights] = mydata_Plethodon_jordani

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Plethodon_jordani'; 
metaData.species_en = 'Appalachian Salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 08 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 01];

%% set data
% zero-variate data

data.ab = 2*30.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Hair1983';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Hair1983';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hair1983';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.7;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'Hair1983'; 
  comment.Lp = 'based on tL_f data for tp';
data.Li  = 6.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Hair1983';

data.Wwb = 4.2e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Hair1983';
  comment.Wwb = 'based on egg diameter of 4.3 mm : pi/6*0.43^3';
data.Wwi = 2.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Plethodon cinereus: (6.5/4.69)^3*0.8';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Hair1983';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-10, max 15.8 eggs per clutch, 1 clutch each yr assumed';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.982	1.686
1.145	2.430
1.309	2.861
2.029	3.112
2.127	3.725
2.356	4.052
3.010	4.107
4.025	4.671
4.974	4.805
5.988	5.018
7.003	5.126
7.984	5.247
8.966	5.394
9.948	5.515
10.929	5.609
11.976	5.679
12.958	5.760
13.874	5.816
14.921	5.885
15.936	5.941
16.983	5.971
17.997	6.066
18.946	6.095
19.928	6.138
20.975	6.220
21.859	6.197
22.840	6.266
23.822	6.335
24.804	6.351];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hair1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hm only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'found in the Great Smoky Mountains from Mt. Sterling to the mountains north of Bryson City, NC ';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'The larval stage is passed within the egg capsule; reproduction is terrestrial';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'Eric Liebgold kindly helped collecting data for this entry';

%% Links
metaData.links.id_CoL = '6VQ7W'; % Cat of Life
metaData.links.id_ITIS = '173660'; % ITIS
metaData.links.id_EoL = '1039174'; % Ency of Life
metaData.links.id_Wiki = 'Plethodon_jordani'; % Wikipedia
metaData.links.id_ADW = 'Plethodon_jordani'; % ADW
metaData.links.id_Taxo = '47449'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Plethodon+jordani'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plethodon_jordani}}';
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
bibkey = 'Hair1983'; type = 'Article'; bib = [ ... 
'author = {Nelson G. Hairston}, ' ... 
'year = {1983}, ' ...
'title = {Growth, Survival and Reproduction of \emph{Plethodon jordani}: {T}rade-Offs between Selective Pressures}, ' ...
'journal = {Copeia}, ' ...
'volume = {1983(4)}, ' ...
'pages = {1024-1035}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Plethodon+jordani}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

