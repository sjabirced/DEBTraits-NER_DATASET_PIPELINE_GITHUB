function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_summana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_summana'; 
metaData.species_en = 'Summan grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
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

data.ab = 3.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'OhtaAkit2017';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 52;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 209;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01175*Lp^3.04, see F1';
data.Wwi = 1935;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.04, see F1';

data.Ri  = 2319876/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Wwi = 'based on Epinephelus_howlandi';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 0	 0.200
 1	20.418
 2	25.237
 3	30.455
 4	33.873
 5	37.492
 6	41.110
 7	44.327
 8	47.346
 9	49.164
10	50.582];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.6);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'MehaOsma2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: known only from the Red Sea and Gulf of Aden. Reported from Somalia and Socotra (Yemen)';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6G62M'; % Cat of Life
metaData.links.id_ITIS = '551099'; % ITIS
metaData.links.id_EoL = '46579649'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_summana'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_summana'; % ADW
metaData.links.id_Taxo = '105880'; % Taxonomicon
metaData.links.id_WoRMS = '218238'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-summana'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_summana}}';
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
bibkey = 'MehaOsma2019'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-017-0655-5}, ' ...
'author = {Sahar F. Mehanna and Yassein A. A. Osman and Magdy T. Khalil and Arafa Hassan}, ' ... 
'year = {2019}, ' ...
'title = {Age and growth, mortality and exploitation ratio of \emph{Epinephelus summana} ({F}orsskal, 1775) and \emph{Cephalopholis argus} ({S}chneider, 1801) from the {E}gyptian {R}ed {S}ea coast, {H}urghada fishing area}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {23(4)}, '...
'pages = {65-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-summana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

