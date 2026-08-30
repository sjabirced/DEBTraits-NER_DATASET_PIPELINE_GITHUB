function [data, auxData, metaData, txtData, weights] = mydata_Parupeneus_chrysopleuron

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Parupeneus_chrysopleuron'; 
metaData.species_en = 'Yellowband goatfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0pMp', 'piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 09];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(25.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 55;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 273;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^3.08, see F1';
data.Wwi = 3093;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.08, see F1';

data.Ri  = 2.9e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Parupeneus_barberinus: 26432*3093/285.5';

% uni-variate data
% time-length
data.tL = [... % time (d), fork length (cm)
0.964	12.590
0.974	11.783
0.974	12.007
0.974	12.007
0.983	11.962
1.948	16.129
1.966	16.935
1.966	16.443
1.976	16.039
1.985	20.654
1.985	20.027
1.985	19.489
1.985	17.518
1.985	15.547
1.994	15.681
1.994	15.591
1.994	15.726
1.994	14.382
2.004	18.324
2.004	16.532
2.004	16.443
2.004	13.978
2.013	19.086
2.013	18.952
2.013	18.817
2.013	15.771
2.013	14.651
2.013	13.486
2.022	17.652
2.032	12.769
2.987	18.638
2.987	19.220
2.996	18.145
2.996	18.907
2.996	19.176
2.996	19.668
2.996	19.758
2.996	20.027
3.015	18.414
3.034	19.400
3.989	23.029
4.007	19.937
4.017	20.654]; 
data.tL(:,1) = 365*(data.tL(:,1) + 0.8); % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JuZou2025';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set2,set1};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01349*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: disjunct distribution: Japan to coast of Aomori Prefecture, Honshu, the Izu Peninsula, Kochi Pref., Ogasawara Islands and southeastern Taiwan; in the south from the Arafura Sea, the NW shelf and Kimberly region of Western Australia; from Geographe Bay northwards';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '75ST8'; % Cat of Life
metaData.links.id_ITIS = '620948'; % ITIS
metaData.links.id_EoL = '46578786'; % Ency of Life
metaData.links.id_Wiki = 'Parupeneus'; % Wikipedia
metaData.links.id_ADW = 'Parupeneus_chrysopleuron'; % ADW
metaData.links.id_Taxo = '183289'; % Taxonomicon
metaData.links.id_WoRMS = '277813'; % WoRMS
metaData.links.id_fishbase = 'Parupeneus_chrysopleuron'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parupeneus}}';
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
bibkey = 'JuZou2025'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.rsma.2025.104086}, ' ...
'author = {Peilong Ju and Xintai Zou and Mingru Chen and Zhenbin Lu}, ' ... 
'year = {2025}, ' ...
'title = {Data-limited stock assessment of yellow striped goatfish (\emph{Parupeneus chrysopleuron}) from the southern {T}aiwan {S}trait}, ' ...
'journal = {Regional Studies in Marine Science}, ' ...
'volume = {83}, ' ...
'pages = {104086}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Parupeneus_chrysopleuron}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
