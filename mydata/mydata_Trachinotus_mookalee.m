function [data, auxData, metaData, txtData, weights] = mydata_Trachinotus_mookalee
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachinotus_mookalee'; 
metaData.species_en = 'Indian pompano'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 29];

%% set data
% zero-variate data
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CrabHood2002';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 45; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess';
data.Li = 90;   units.Li = 'cm'; label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 8.3e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*Li^2.87, see F1; max. published weight: 8.1 kg';

data.GSI  = 0.06; units.GSI  = 'g/g'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28.3);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Trachinotus falcatus';

% uni-variate data

% time-weight
data.tW = [ ... % time (d), weight (g)
0.000	6.420
28.765	33.390
59.274	52.517
89.782	95.220
119.419	144.202
149.056	196.327
180.872	235.897
209.637	291.158
239.709	407.727
270.218	502.296
298.547	555.982
329.927	619.124
359.564	693.253];
data.tW(:,1) = data.tW(:,1) + 60; % set origin at birth
units.tW = {'d', 'cm'};  label.tW = {'time since birth', 'fork length'}; 
temp.tW = C2K(28.3); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SekaRanj2021'; comment.tW = 'cage culture';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lp = 5 * weights.Lp;

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
F1 = 'length-weight: Ww in g = 0.02042*(TL in cm)^2.87';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PCX'; % Cat of Life
metaData.links.id_ITIS = '642005'; % ITIS
metaData.links.id_EoL = '46578045'; % Ency of Life
metaData.links.id_Wiki = 'Trachinotus'; % Wikipedia
metaData.links.id_ADW = 'Trachinotus_mookalee'; % ADW
metaData.links.id_Taxo = '189223'; % Taxonomicon
metaData.links.id_WoRMS = '273295'; % WoRMS
metaData.links.id_fishbase = 'Trachinotus_mookalee'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Trachinotus}}';  
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
bibkey = 'SekaRanj2021'; type = 'article'; bib = [ ...
'doi = {10.1016/j.aquaculture.2021.737212}, ' ...
'author = {Sekar, M. and Ranjan, R. and Xavier, B. and Ghosh, S. and Pankyamma, V. and Ignatius, B. and Joseph, I. and Achamveeti, G.}, ' ...
'year = {2021}, ' ...
'title = {Species validation, growth, reproduction and nutritional perspective of {I}ndian pompano, Trachinotus mookalee–A candidate species for diversification in coastal mariculture}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {545}, ' ...
'pages = {737212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Trachinotus_mookalee}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
