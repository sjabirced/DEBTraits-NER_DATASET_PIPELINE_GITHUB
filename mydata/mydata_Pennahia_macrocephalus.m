function [data, auxData, metaData, txtData, weights] = mydata_Pennahia_macrocephalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Pennahia_macrocephalus'; 
metaData.species_en = 'Big-head pennah croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.ab = 18;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(28.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 27.8;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 48.5; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.01288*Lp^3.12, see F1';
data.Wwi = 412.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.12, see F1';

data.GSI  = 0.05; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Argyrosomus regius';
 
% uni-variate data
% time-length
data.tL =	[ ... % time since birth (d), total length (cm)
-29.695	4.224
13.610	6.849
61.864	9.475
106.407	11.986
153.424	13.699];
data.tL(:,1) = data.tL(:,1) + 170; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WangLin2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weights = weights;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f22','tL_f21'}; subtitle1 = {'mesocosm'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Namibia southwards around the Cape of Good Hope and northwards at least as far as the Kei River in South Africa';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '76JMC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579224'; % Ency of Life
metaData.links.id_Wiki = 'Pennahia'; % Wikipedia
metaData.links.id_ADW = 'Pennahia_macrocephalus'; % ADW
metaData.links.id_Taxo = '183423'; % Taxonomicon
metaData.links.id_WoRMS = '282197'; % WoRMS
metaData.links.id_fishbase = 'Pennahia-macrocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pennahia}}';
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
bibkey = 'WangLin2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00343-012-1017-y}, ' ...
'author = {Wang, Xuehui and Lin, Zhaojin and Qiu, Yongsong and Sun, Dianrong and Du, Feiyan and Huang, Shuolin}, ' ... 
'year = {2012}, ' ...
'title = {Population parameters and dynamic pool models of commercial fishes in the {B}eibu {G}ulf, northern {S}outh {C}hina {S}ea}, ' ...
'journal = {Chinese Journal of Oceanology and Limnology}, ' ...
'volume = {30(1)}, ' ...
'pages = {105-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pennahia-macrocephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
