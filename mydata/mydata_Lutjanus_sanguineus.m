function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_sanguineus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_sanguineus'; 
metaData.species_en = 'Humphead snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 13];

%% set data
% zero-variate data

data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 51.1; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.8 mm of L. stellatus: pi/6*0.08^3'; 
data.Wwi = 12019; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^2.96, see F1; max. published weight: 23 kg';

data.Ri  = 2620000/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_ST = [ ... % time since birth (yr), fork length (cm)
 1	22.120 20.017
 2	32.136 29.506
 3	41.276 38.820
 4	48.484 46.029
 5	54.816 52.711
 6	60.095 57.463
 7	66.250 62.918
 8	70.478 67.146
 9	74.002 69.969
10	76.650 73.142
11  NaN    75.264];
data.tL_ST(:,1) = 365 * (0.5+data.tL_ST(:,1));  % convert yr to d
units.tL_ST   = {'d', 'cm'}; label.tL_ST = {'time since birth', 'fork length'};  
temp.tL_ST    = C2K(26.8); units.temp.tL_ST = 'K'; label.temp.tL_ST = 'temperature';
bibkey.tL_ST = 'LaiLiu1974'; treat.tL_ST = {1 {'Northern Sunda Shelf','Gulf of Tonkin'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_ST = 10 * weights.tL_ST;

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

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WGCR'; % Cat of Life
metaData.links.id_ITIS = '168871'; % ITIS
metaData.links.id_EoL = '46580743'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_sanguineus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_sanguineus'; % ADW
metaData.links.id_Taxo = '106185'; % Taxonomicon
metaData.links.id_WoRMS = '218487'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-sanguineus'; % fishbase

%% References46580743
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_sanguineus}}';
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
bibkey = 'LaiLiu1974'; type = 'Article'; bib = [ ... 
'doi = {10.29822/JFST.197406.0005}, ' ...
'author = {Lai, H.-L. and H.-C. Liu}, ' ... 
'year = {1974}, ' ...
'title = {Age determination and growth of \emph{Lutjanus sanguineus} ({C}. \& {V}.) in the {S}outh {C}hina {S}ea}, ' ...
'journal = {J. Fish. Soc. Taiwan}, ' ...
'volume = {3(1)}, ' ...
'pages = {39-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-sanguineus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
