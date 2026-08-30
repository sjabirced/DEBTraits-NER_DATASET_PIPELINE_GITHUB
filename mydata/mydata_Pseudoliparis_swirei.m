function [data, auxData, metaData, txtData, weights] = mydata_Pseudoliparis_swirei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Pseudoliparis_swirei'; 
metaData.species_en = 'Mariana snailfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.ab = 285;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(2.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'GerrAndr2018';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 22.6; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0224; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Glub2010';
  comment.Wwb = 'based on egg diameter of 3.5 mm of C. furcellus: pi/6*0.35^3';
data.Wwp = 13;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00468*Lp^3.23, see F1';
data.Wwi = 97;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.15, see F1';
 
data.Ri  = 55/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Glub2010';   
  temp.Ri = C2K(2.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Careproctus furcellus: 1129*97/2000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
5.069	10.828
5.966	12.534
7.034	14.746
7.034	13.733
7.034	11.985
7.034	11.571
7.069	12.997
7.103	11.065
7.931	14.150
7.966	17.141
8.000	14.794
8.034	17.785
8.069	15.255
9.069	17.651
9.103	16.224
10.000	18.436
10.034	23.037
10.069	23.405
11.138	18.531
11.931	22.030
11.931	18.948
12.000	22.767];	
data.tL(:,1) = (data.tL(:,1)+0.5)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','std length'};  
  temp.tL = C2K(2.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GerrAndr2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
%weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
weights.Ri = weights.Ri * 3;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00525*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Western Central Pacific: Mariana Trench';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4NZRR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52229649'; % Ency of Life
metaData.links.id_Wiki = 'Pseudoliparis_swirei'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5621751'; % Taxonomicon
metaData.links.id_WoRMS = '1047485'; % WoRMS
metaData.links.id_fishbase = 'Pseudoliparis-swirei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudoliparis_swirei}}';
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
bibkey = 'GerrAndr2018'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr.2017.12.002}, ' ...
'author = {M.E. Gerringer and A.H. Andrews and G.R. Huss and K. Nagashima and B.N. Popp and T.D. Linley and N.D. Gallo and M.R. Clark and A.J. Jamieson and J.C. Drazen}, ' ... 
'year = {2018}, ' ...
'title = {Life history of abyssal and hadal fishes from otolith growth zones and oxygen isotopic compositions}, ' ...
'journal = {Deep Sea Research Part I: Oceanographic Research Papers}, ' ...
'volume = {132}, ' ...
'pages = {37-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Glub2010'; type = 'article'; bib = [ ... 
'doi = {10.1134/s0032945210010078}, ' ...
'author = {Glubokov, A. I.}, ' ... 
'year = {2010}, ' ...
'title = {The data on \emph{Careproctus furcellus} and \emph{C. rastrinus} ({L}iparidae) from the {O}lyutorskii {G}ulf of the {B}ering {S}ea: {S}ize composition, indices of organs, and diet}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {50(1)}, ' ...
'pages = {52–64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Pseudoliparis-swirei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
