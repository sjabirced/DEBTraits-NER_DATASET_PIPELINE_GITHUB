  function [data, auxData, metaData, txtData, weights] = mydata_Rasbora_daniconius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Danionidae';
metaData.species    = 'Rasbora_daniconius'; 
metaData.species_en = 'Slender rasbora'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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
data.am = 6.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 7;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00871*Lp^3.01, see F1';
data.Wwi = 30.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.01, see F1';

% univariate data
data.Ri = 11040/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
25.919	4.562
58.981	5.034
90.916	6.528
114.805	7.315
152.002	8.730
183.596	8.416
245.615	8.573];
data.tL(:,1) = data.tL(:,1) + 90; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetGeve1996'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
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
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00871*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6X563'; % Cat of Life
metaData.links.id_ITIS = '689899'; % ITIS
metaData.links.id_EoL = '46581572'; % Ency of Life
metaData.links.id_Wiki = 'Rasbora_daniconius'; % Wikipedia
metaData.links.id_ADW = 'Rasbora_daniconius'; % ADW
metaData.links.id_Taxo = '43561'; % Taxonomicon
metaData.links.id_WoRMS = '282550'; % WoRMS
metaData.links.id_fishbase = 'Rasbora-daniconius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rasbora_daniconius}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Rasbora-daniconius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

