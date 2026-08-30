  function [data, auxData, metaData, txtData, weights] = mydata_Amblypharyngodon_melettinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Danionidae';
metaData.species    = 'Amblypharyngodon_melettinus'; 
metaData.species_en = 'Attentive carplet'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFc', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'PetGeve1996';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.8;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'DomiInas2023';
data.Li = 10.8;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 2.9;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00871*Lp^3.03, see F1';
data.Wwi = 11.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.03, see F1';

% univariate data
data.Ri = 810/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Amblypharyngodon_mola: 15985*4.75/94';

% time-length
data.tL = [ ... % time (d), std length (cm), weight (g)
0.401	2.932
26.771	3.523
59.706	4.115
88.647	4.414
117.551	4.519
151.763	4.917
182.062	5.460
209.599	5.273
239.908	5.864
271.466	6.116
299.094	6.415
335.922	6.765
363.505	6.821];
data.tL(:,1) = data.tL(:,1) + 150; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetGeve1996'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

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
F1 = 'length-weight: Ww (in g) = 0.00871*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CMY2'; % Cat of Life
metaData.links.id_ITIS = '639531'; % ITIS
metaData.links.id_EoL = '206216'; % Ency of Life
metaData.links.id_Wiki = 'Amblypharyngodon_melettinus'; % Wikipedia
metaData.links.id_ADW = 'Amblypharyngodon_melettinus'; % ADW
metaData.links.id_Taxo = '160607'; % Taxonomicon
metaData.links.id_WoRMS = '1012593'; % WoRMS
metaData.links.id_fishbase = 'Amblypharyngodon-melettinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amblypharyngodon_melettinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PetGeve1996'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1600-0633.1996.tb00032.x}, ' ...
'author = {Pet, J. S. and Gevers, G. J. M.and Densen, W. L. T. and Vijverberg, J.}, ' ...
'year = {1996}, ' ...
'title = {Management options for a more complete utilization of the biological fish production in {S}ri {L}ankan reservoirs}, ' ... 
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = {5(1)}, '...
'pages = {59–701–14}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DomiInas2023'; type = 'Article'; bib = [ ...  
'author = {Dalie Dominic and N.D. Inasu and Swapana Johny}, ' ...
'year = {2023}, ' ...
'title = {Reproductive biology of \emph{Amblypharyngodon melletinus muriyadensis} – an ornamental fish of the {W}estern {G}hats of {I}ndia}, ' ... 
'journal = {Journal of Survey in Fisheries Sciences}, ' ...
'volume = {10(1S)}, '...
'pages = {3464-3468}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amblypharyngodon-melettinus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

