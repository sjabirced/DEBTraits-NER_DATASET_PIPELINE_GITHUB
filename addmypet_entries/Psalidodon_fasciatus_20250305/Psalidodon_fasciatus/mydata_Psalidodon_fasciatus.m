  function [data, auxData, metaData, txtData, weights] = mydata_Psalidodon_fasciatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Psalidodon_fasciatus'; 
metaData.species_en = 'Banded astyanax'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 05];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Astyanax_mexicanus';

data.Lp = 8.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 17.1;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01318*Lp^3.07, see F1';
data.Wwi = 109.1;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published value, based on 0.01318*Li^3.07 gives 80.4, see F1';

data.Ri = 6.5e3/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Astyanax_mexicanus. Fecundity 1e3*109/16.8';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.5	 2.411
1.0	 5.583
1.5	 7.091
2.0	 8.926
2.5	 9.748
3.0	10.823
3.5	11.357];
data.tL(:,1) = (data.tL(:,1) + 0) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilvAran2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'J5RN'; % Cat of Life
metaData.links.id_ITIS = '162854'; % ITIS
metaData.links.id_EoL = '203947'; % Ency of Life
metaData.links.id_Wiki = 'Psalidodon_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Psalidodon_fasciatus'; % ADW
metaData.links.id_Taxo = '43148'; % Taxonomicon
metaData.links.id_WoRMS = '1023047'; % WoRMS
metaData.links.id_fishbase = 'Psalidodon-fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Psalidodon_fasciatus}}';  
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
bibkey = 'SilvAran2020'; type = 'Article'; bib = [ ...
'doi = {10.1071/mf19100}, ' ...
'author = {Silveira, E. L. and Aranha, J. M. R. and Menezes, M. S. and Vaz-dos-Santos, A. M.}, ' ...
'year = {2020}, ' ...
'title = {Reproductive dynamics, age and growth of \emph{Astyanax aff. fasciatus} in a {N}eotropical basin}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'volume = {71}, '...
'pages = {670-683}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Psalidodon-fasciatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

