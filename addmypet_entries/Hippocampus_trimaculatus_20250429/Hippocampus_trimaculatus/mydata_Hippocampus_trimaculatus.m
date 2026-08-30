function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_trimaculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_trimaculatus'; 
metaData.species_en = 'Longnose seahorse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.78;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'MuruDhan2009'; 
  comment.Lb = 'based on tL data';
data.Lp  = 14;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 22;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MuruDhan2009';
  comment.Wwb = 'based on 0.00447*Lb^2.99, see F1; egg diameter 1.6 mm';
data.Wwp = 12;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^2.99, see F1';
data.Wwi = 46;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^2.99, see F1';

data.Ri  = 1783/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since release (d), std length (cm), weight (g)
  0	 0.780 0.076
 15	 2.042 0.355
 30	 4.542 0.784
 45	 6.374 1.314
 60	 7.608 1.894
 75	 8.666 2.549
 90	 9.443 3.104
105	10.114 3.533
120	10.575 4.038
135	11.000 4.844
150	11.354 5.826
165	11.780 6.305
180	12.064 6.936];
units.tLW   = {'d', 'cm'};  label.tLW = {'time since release', 'standard length', 'weight'};  
temp.tLW    = C2K(30);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'MuruDhan2009'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;
% weights.ab = 3 * weights.ab;
% weights.Wwi = 3 * weights.Wwi;
% weights.Wwb = 3 * weights.Wwb;
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

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: India to Tahiti; north to Japan, south to Indonesia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3LZPM'; % Cat of Life
metaData.links.id_ITIS = '166508'; % ITIS166493
metaData.links.id_EoL = '62690735'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_trimaculatus'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_trimaculatus'; % ADW
metaData.links.id_Taxo = '176712'; % Taxonomicon
metaData.links.id_WoRMS = '212232'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus_trimaculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_trimaculatus}}';
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
bibkey = 'MuruDhan2009'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.aquaculture.2009.01.033}, ' ...
'author = {A. Murugan and S. Dhanya and R.A. Sreepada and S. Rajagopal and T. Balasubramanian}, ' ... 
'year = {2009}, ' ...
'title = {Breeding and mass-scale rearing of three spotted seahorse, \emph{Hippocampus trimaculatus} {L}each under captive conditions}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {290(1/2)}, ' ...
'pages = {475-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus_trimaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

