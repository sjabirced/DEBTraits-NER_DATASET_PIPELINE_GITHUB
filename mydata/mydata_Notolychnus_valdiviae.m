function [data, auxData, metaData, txtData, weights] = mydata_Notolychnus_valdiviae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Notolychnus_valdiviae'; 
metaData.species_en = 'Topside lanternfish'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

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
  temp.am = C2K(15.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 1.7;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 6.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.02; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 1.2; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';
  
data.Ri = 106/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'fishbase';
  temp.Ri = C2K(15.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
30.026	0.566
32.216	0.573
33.376	0.573
34.149	0.577
35.180	0.515
35.696	0.526
35.825	0.688
37.758	0.623
39.304	0.626
39.820	0.712
41.237	0.719
42.397	0.712
43.170	0.705
43.299	0.611
44.716	0.733
44.974	0.665
46.392	0.733
47.294	0.808
48.325	0.808
48.840	0.743];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(15.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Worldwide distribution in tropical, subtropical and temperate waters. Eastern Atlantic: west of British Isles and Bay of Biscay to South Africa. Western Atlantic: Canada to Argentina. Western Pacific: between 0 and 32S. Eastern Pacific: between 32N and 30S, but with 20S southern limit in Peruvian Transitional Zone. Eastern Indian Ocean: between 9-32S';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '47WPR'; % Cat of Life
metaData.links.id_ITIS = '162729'; % ITIS
metaData.links.id_EoL = '46564213'; % Ency of Life
metaData.links.id_Wiki = 'Notolychnus_valdiviae'; % Wikipedia
metaData.links.id_ADW = 'Notolychnus_valdiviae'; % ADW
metaData.links.id_Taxo = '181441'; % Taxonomicon
metaData.links.id_WoRMS = '126629'; % WoRMS
metaData.links.id_fishbase = 'Notolychnus_valdiviae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notolychnus_valdiviae}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Notolychnus_valdiviae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

