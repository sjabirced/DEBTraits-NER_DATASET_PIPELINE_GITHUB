  function [data, auxData, metaData, txtData, weights] = mydata_Alburnoides_qanati

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Alburnoides_qanati'; 
metaData.species_en = 'Kor River chub'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 01];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'TahaEsma2015';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;  units.Lp = 'cm'; label.Lp = 'total length at puberty';        bibkey.Lp = 'guess'; 
data.Li = 11.9; units.Li = 'cm'; label.Li = 'ultimate total length';        bibkey.Li = 'TahaEsma2018';

data.Wwb = 1.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TahaEsma2018';
  comment.Wwb = 'Based on egg diameter of 0.69 mm: pi/6*0.069^3';
data.Wwp = 0.25;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00794*Lp^3.14,  see F1';
data.Wwi = 24.26; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'TahaEsma2018';
  comment.Wwi = 'fishbase: based on 0.00794*Li^3.14, see F1, gives 4.1';

data.Ri = 2368/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size'; bibkey.Ri = 'TahaEsma2018';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
380.842	3.382
491.242	4.118
365+190.980	4.657
365+221.443	4.902
365+354.665	5.686
365+375.605	5.833
365+400.328	5.882
365+434.574	6.029
730+218.023	6.912
730+250.388	7.157
730+273.200	7.157
730+307.475	7.451
730+349.316	7.549
730+377.841	7.598
730+434.901	7.745
730+461.552	7.941
1095+115.572	7.990
1095+189.769	8.284
1095+248.748	8.529
1095+279.211	8.775
1095+313.411	8.676
1095+353.324	8.627
1095+437.053	9.069
1095+465.587	9.167
1460+167.152	9.314
1460+193.785	9.412];
data.tL_f(:,1) = 0 + data.tL_f(:,1); % set origin at birth
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TahaEsma2015'; 
%
data.tL_m = [ ... % time since birth (d), total length (cm)
123.568	2.993
254.740	3.732
287.057	3.842
365+19.010	4.840
365+83.646	5.320
365+121.667	5.505
365+153.984	5.542
365+209.115	5.690
365+365.000	6.244
730+22.813	6.724
730+83.646	6.798
730+121.667	6.983
730+157.786	7.094
730+209.115	7.057
730+235.729	7.204
730+294.661	7.167
730+368.802	7.426
730+420.130	7.463];
data.tL_m(:,1) = 100 + data.tL_m(:,1);  % set origin at birth
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TahaEsma2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00794*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic from Kor River basin, Iran';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGVL'; % Cat of Life
metaData.links.id_ITIS = '1200063'; % ITIS
metaData.links.id_EoL = '10224451'; % Ency of Life
metaData.links.id_Wiki = 'Alburnoides_qanati'; % Wikipedia
metaData.links.id_ADW = 'Alburnoides_qanati'; % ADW
metaData.links.id_Taxo = '2702173'; % Taxonomicon
metaData.links.id_WoRMS = '1008254'; % WoRMS
metaData.links.id_fishbase = 'Alburnoides-qanati'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alburnoides_qanati}}';  
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
bibkey = 'TahaEsma2015'; type = 'Article'; bib = [ ...  
'author = {Tahami, M.S. and H.R. Esmaeili and M. Safaie}, ' ...
'year = {2015}, ' ...
'title = {Population dynamic parameters of the highly endemic fish, \emph{Alburnoides qanati} {C}oad and {B}ogustkaya 2009, ({T}eleostei: {C}yprinidae) in the {K}or {R}iver {B}asin, {I}ran.}, ' ... 
'journal = {Int. J. Aquat. Biol.}, ' ...
'volume = {3(2)}, '...
'pages = {119-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TahaEsma2018'; type = 'Article'; bib = [ ...  
'doi = {10.22124/cjes.2018.2956}, ' ...
'author = {Tahami, M.S. and H.R. Esmaeili and M. Monsefi}, ' ...
'year = {2018}, ' ...
'title = {Reproductive biology of an endemic fish, \emph{Alburnoides qanati} {C}oad and {B}ogustkaya, 2009 ({T}eleostei: {C}yprinidae) from {S}outhern {I}ran}, ' ... 
'journal = {Caspian J. Environ. Sci.}, ' ...
'volume = {16(2)}, '...
'pages = {135~148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alburnoides-qanati.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

