  function [data, auxData, metaData, txtData, weights] = mydata_Rhodeus_meridionalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Acheilognathidae';
metaData.species    = 'Rhodeus_meridionalis'; 
metaData.species_en = 'Vardar bitterling'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.tp = 365;     units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';bibkey.Lp = 'guess'; 
data.Li = 9.5;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 0.002;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.6 mm of Rhodeus_amarus: pi/6*0.16^3';
data.Wwp = 0.9;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.01259*Lp^3.05, see F1';
data.Wwi = 12;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.05, see F1';
  
data.Ri = 136/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at 4 cm';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhodeus_amarus';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 4.7
2 6.7
3 7.5
4 7.9
5 8.0];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetrDoul2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe: Aegean Sea from Vardar south to Pinios drainages';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '796LX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '7253759'; % Ency of Life
metaData.links.id_Wiki = 'Rhodeus_meridionalis'; % Wikipedia
metaData.links.id_ADW = 'Rhodeus_meridionalis'; % ADW
metaData.links.id_Taxo = '1682840'; % Taxonomicon
metaData.links.id_WoRMS = '1016496'; % WoRMS
metaData.links.id_fishbase = 'Rhodeus_meridionalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhodeus_meridionalis}}';  
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
bibkey = 'PetrDoul2024'; type = 'Article'; bib = [ ...
'doi = {10.71424/azb76.3.002733}, ' ...
'author = {Olga Petriki and Alexandra S. Douligeri and Ioanna Tsionki and Roberta Barbieri and Dimitrios K. Moutopoulos and Maria T. Stoumboudi}, ' ...
'year = {2024}, ' ...
'title = {Life-history Traits for Eight Fish Species of the Largest {G}reek Lake ({L}ake {T}richonis)}, ' ...
'journal = {Acta Zool. Bulg.}, ' ...
'volume = {76(3)}, '...
'pages = {375-382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhodeus_meridionalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

