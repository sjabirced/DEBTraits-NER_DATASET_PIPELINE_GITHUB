  function [data, auxData, metaData, txtData, weights] = mydata_Puntius_dorsalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Puntius_dorsalis'; 
metaData.species_en = 'Long snouted barb'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 30];

%% set data
% zero-variate data
data.am = 6.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 12;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 17.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.01000*Lp^3.01, see F1';
data.Wwi = 161.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.01, see F1';

% univariate data
data.Ri = 23053/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Puntius_sophore';

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
-2.957	 4.955  4.184
26.657	 7.619  7.521
60.146	10.489  9.405
88.587	11.623 10.043
119.606	12.963 10.371
149.369	13.792 10.799
180.470	14.113 11.439
210.274	14.433 12.079];
data.tL_fm(:,1) = data.tL_fm(:,1) + 90; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'PetGeve1996'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
% weights.Wwp = 0 * weights.Wwp;
% weights.Wwi = 0 * weights.Wwi;
% weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;
% weights.Ri = 0 * weights.Ri;
% weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.01000*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4QJ3M'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '206103'; % Ency of Life
metaData.links.id_Wiki = 'Puntius_dorsalis'; % Wikipedia
metaData.links.id_ADW = 'Puntius_dorsalis'; % ADW
metaData.links.id_Taxo = '185570'; % Taxonomicon
metaData.links.id_WoRMS = '1021852'; % WoRMS
metaData.links.id_fishbase = 'Puntius-dorsalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Puntius_dorsalis}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Puntius-dorsalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

