function [data, auxData, metaData, txtData, weights] = mydata_Urophycis_brasiliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Urophycis_brasiliensis'; 
metaData.species_en = 'Brazilian codling'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 30];

%% set data
% zero-variate data

data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(24.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'CavoCard2018'; 
data.Lpm  = 25.5; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'CavoCard2018'; 
data.Li  = 58.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = {'CavoCard2018','fishbase'};
data.Lim  = 37;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male'; bibkey.Lim  = 'CavoCard2018';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CavoCard2018';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3'; 
data.Wwp = 493; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.16, see F1'; 
data.Wwi = 1648; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.16, see F1'; 

data.Ri  = 1.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Urophycis_tenuis: 15e6*1648/21e3';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
49.010	4.729
57.921	6.121
62.376	7.387
69.802	7.008
74.257	8.274
78.713	5.239
81.683	9.033
87.624	6.800
88.366	8.023
89.109	11.775
93.564	9.583
100.990	14.601
103.960	11.693
108.416	11.862
112.871	13.422
115.842	9.375
118.069	10.219
121.782	13.508
130.693	13.593
132.178	16.503
141.089	16.335
152.228	15.831
152.970	17.349
152.971	14.903
155.198	18.656
156.683	16.843
162.624	17.013
175.248	18.996
175.249	15.412
178.218	18.490
181.931	18.702
181.932	18.322
190.842	19.251
194.554	17.397
196.782	22.372
196.783	19.884
201.238	17.482
204.208	19.253
205.693	17.314
211.634	17.357
219.058	23.134
219.059	17.695
226.485	22.797
230.198	22.081
236.138	22.504
236.139	23.094
255.446	21.663
259.158	21.369
286.634	21.162];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CavoCard2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 5 * weights.Lp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%eights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Florida (USA), Gulf of Mexico, northern coasts of South America to the Orinoco, perhaps to Rio de Janeiro, Brazil';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DY4C'; % Cat of Life
metaData.links.id_ITIS = '164738'; % ITIS
metaData.links.id_EoL = '46565104'; % Ency of Life
metaData.links.id_Wiki = 'Urophycis'; % Wikipedia
metaData.links.id_ADW = 'Urophycis_brasiliensis'; % ADW
metaData.links.id_Taxo = '44361'; % Taxonomicon
metaData.links.id_WoRMS = '272519'; % WoRMS
metaData.links.id_fishbase = 'Urophycis_brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urophycis}}';
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
bibkey = 'CavoCard2018'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.13586}, ' ...
'author = {Cavole, L.M. and Cardoso, L.G. and Almeida, M.S. and Haimovici, M.}, ' ... 
'year = {2018}, ' ...      
'title = {Unravelling growth trajectories from complicated otoliths – the case of {B}razilian codling \emph{Urophycis brasiliensis}}, ' ...
'journal = {J Fish Biol}, ' ...
'volume = {92}, ' ...
'pages = {1290-1311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Urophycis_brasiliensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
