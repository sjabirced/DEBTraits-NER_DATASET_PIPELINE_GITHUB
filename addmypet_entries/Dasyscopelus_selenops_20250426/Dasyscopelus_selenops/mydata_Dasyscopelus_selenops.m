function [data, auxData, metaData, txtData, weights] = mydata_Dasyscopelus_selenops
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Dasyscopelus_selenops'; 
metaData.species_en = 'Wisner''s lanternfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 26];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 7.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 1.2; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.08, see F1';
data.Wwi = 4.2; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.08, see F1';
  
data.Ri = 2.3e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
13.284	0.484
13.287	0.516
14.311	0.469
16.366	0.455
16.886	0.520
18.686	0.520
19.460	0.559
19.847	0.570
21.390	0.581
22.553	0.646
22.678	0.610
23.205	0.743
23.580	0.631
24.478	0.606
25.136	0.779
25.390	0.747
26.421	0.776
26.675	0.736];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ConlGart2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50*weights.tL;
weights.Li = 3*weights.Li;
weights.Wwi = 3*weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic: Morocco to Mauritania and also in Angola; west of the Cape Peninsula, South Africa. Northwest Atlantic: Canada. Western Atlantic: USA to Argentina but with lower abundance in the South Sargasso Sea and absent in the minimum region off Brazil. Also known in the equatorial waters of the Indian and Pacific Oceans. Tropical regions of the Atlantic up to 38S';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '44ZXL'; % Cat of Life
metaData.links.id_ITIS = '162724'; % ITIS
metaData.links.id_EoL = '46564196'; % Ency of Life
metaData.links.id_Wiki = 'Dasyscopelus_selenops'; % Wikipedia
metaData.links.id_ADW = 'Myctophum_selenops'; % ADW
metaData.links.id_Taxo = '180526'; % Taxonomicon
metaData.links.id_WoRMS = '1525496'; % WoRMS
metaData.links.id_fishbase = 'Dasyscopelus_selenops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasyscopelus_selenops}}';
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
bibkey = 'ConlGart2009'; type = 'article'; bib = [ ...
'author = {Walter J. Conley and John V. Gartner}, ' ... 
'year   = {2009}, ' ...
'title  = {GROWTH AMONG LARVAE OF LANTERNFISHES ({T}ELEOSTEI: {M}YCTOPHIDAE) FROM THE EASTERN {G}ULF OF {M}EXICO}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'page = {123–135}, ' ...
'volume = {84(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dasyscopelus_selenops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

