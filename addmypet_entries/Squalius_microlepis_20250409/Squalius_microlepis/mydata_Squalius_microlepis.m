  function [data, auxData, metaData, txtData, weights] = mydata_Squalius_microlepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_microlepis'; 
metaData.species_en = 'Makal dace'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 34;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.54 mm: pi/6*0.154^3';
data.Wwp = 47.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 505.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1; max. published weight: 620 g ';

data.Ri = 9.2e4/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1.081*Li^3.22 for Scardinius_acarnanicus';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 12.76
    2 17.01
    3 21.26
    4 25.52
    5 28.71
    6 31.71
    7 34.02
    8 36.15
    9 38.27
   10 39.5];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IvanTree2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Bosnia-Herzegovina and Croatia in the middle and lower Neretva drainage, Stara (Old) Neretva, Lake Desne, lake basins near Imotski, Matica drainage near Vrgorac';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6ZDQW'; % Cat of Life
metaData.links.id_ITIS = '1199967'; % ITIS
metaData.links.id_EoL = '214602'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_microlepis'; % Wikipedia
metaData.links.id_ADW = 'Squalius_microlepis'; % ADW
metaData.links.id_Taxo = '592188'; % Taxonomicon
metaData.links.id_WoRMS = '1022124'; % WoRMS
metaData.links.id_fishbase = 'Squalius-microlepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Squalius_microlepis}}';  
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
bibkey = 'IvanTree2017'; type = 'Article'; bib = [ ...
'doi = {10.1111/jai.13349}, ' ...
'author = {Ivankovi\''{c}, P. and Treer, T. and Tomljanovi\''{c}, T. and Knezovi\''{c}, Z. and Salaj, S.}, ' ...
'year = {2017}, ' ...
'title = {Back-calculating growth at age from scale readings for \emph{Squalius microlepis} {H}eckel, 1843 and \emph{Scardinius plotizza} {H}eckel \& {K}ner, 1858 in the {N}eretva {R}iver basin ({B}osnia and {H}erzegovina)}, ' ... 
'journal = {Journal of Applied Ichthyology, 33(3), 546–549}, ' ...
'volume = {20(4)}, '...
'pages = {258–264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-microlepis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

