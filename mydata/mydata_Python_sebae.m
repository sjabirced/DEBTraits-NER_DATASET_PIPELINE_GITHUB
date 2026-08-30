function [data, auxData, metaData, txtData, weights] = mydata_Python_sebae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Python_sebae'; 
metaData.species_en = 'African rock python'; 

metaData.ecoCode.climate = {'BSh', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1      = [2025 07 16];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 16];

%% set data
% zero-variate data

data.ab = 82;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BougBuch2007';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW: 65 till 80 d';
data.ap = 4*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'ADW';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: over 12 yr';
  
data.Lb  = 40;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ADW';
  comment.Lb = '35 till 45';
data.Li  = 550;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Whit1974';
  comment.Li = 'Wiki: max 480 cm; ';
  
data.Wwb = 161; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on Wwi * (Lb/Lm)^3; consistent with ADW: eggs weigh 130 till 170 g';
data.Wwi = 89e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Whit1974';
  comment.Wwi = 'based on length-weight of P. molurus: (550/460)^3*52';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: 20 till 50 per clutch';
 
% uni-variate data

% time-length
data.tL = [ ... time (d), length (cm)
   0  53
 302 168
 482 213
1371 411 
1530 465
1765 488
2007 518];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Whit1974';

% time-length-weight for embryo
data.tLWe = [ ... % dpo (d), SVL (cm), weight (g)
 3.3	 5.538  0.482
11.3	11.064  1.441
18.3	14.637  1.752
33.3	19.171  5.136
44.3	21.921  9.504
54.3	25.814  8.671
61.3	36.887 25.892
75.0	47.945 50.255];
data.tLWe(:,1) = 7 + data.tLWe(:,1); % set L=0 at origin
units.tLWe   = {'d', 'cm'};  label.tLWe = {'days post oviposition', 'SVL'};  
temp.tLWe    = C2K(27);  units.temp.tLWe = 'K'; label.temp.tLWe = 'temperature';
bibkey.tLWe = 'BougBuch2007'; treat.tLWe = {1, {'SVL','weight'}};
comment.tLWe = 'day temperature about 30C, night temperature about 25C)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tLWe = 5 * weights.tLWe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'ab is ignored, since, Like all pythons, this species is probably partially ovoviviparous: eggs start to develop, while still in the mother';
D2 = 'mod_1: tLe and tWe data added; I had to add 7 d to dpo; the eggs possibly start to develop already in the mother';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4QY54'; % Cat of Life
metaData.links.id_ITIS = '634785'; % ITIS
metaData.links.id_EoL = '1055462'; % Ency of Life
metaData.links.id_Wiki = 'Python_sebae'; % Wikipedia
metaData.links.id_ADW = 'Python_sebae'; % ADW
metaData.links.id_Taxo = '49853'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Python&species=sebae'; % ReptileDB
metaData.links.id_AnAge = 'Python_sebae'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Python_sebae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Python_sebae/}}';
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
bibkey = 'Whit1974'; type = 'Article'; bib = [ ... 
'author = {Whitworth, J.}, ' ... 
'doi = {10.1111/j.1748-1090.1974.tb00801.x}, ' ...
'year = {1974}, ' ...
'title = {Notes on the growth of an {A}frican python: \emph{Python sebae}: and an {I}ndian python: \emph{Python molurus}: at the {C}annon {A}quarium and {V}ivarium, {M}anchester {M}useum}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {14}, ' ...
'pages = {140-141}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BougBuch2007'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.zool.2007.01.005}, ' ...
'author = {Julia C. Boughnera and Marcela Buchtova and Katherine Fua and Virginia Diewert and Benedikt Hallgr\''{i}mssonc and Joy M. Richman}, ' ... 
'doi = {10.1111/j.1748-1090.1974.tb00801.x}, ' ...
'year = {2007}, ' ...
'title = {Embryonic development of \emph{Python sebae}– {I}: {S}taging criteria and macroscopic skeletal morphogenesis of the head and limbs}, ' ...
'journal = {Zoology}, ' ...
'volume = {110}, ' ...
'pages = {212–230}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

