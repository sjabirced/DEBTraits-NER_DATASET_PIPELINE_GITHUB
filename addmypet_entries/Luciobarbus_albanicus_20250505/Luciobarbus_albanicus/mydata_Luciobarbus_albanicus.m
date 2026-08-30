  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_albanicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_albanicus'; 
metaData.species_en = 'Albanian barbel'; 

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 86.3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00776*Lp^3.06, see F1';
data.Wwi = 2143; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^3.06, see F1; max. published weight: 3.0 kg';
    
data.GSI = 0.10; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'guess';
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Luciobarbus_xanthopterus';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  9.5
    2 17.2
    3 23.5
    4 28.6
    5 32.7
    6 36.0];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BasiSari2012'; 
comment.tL = 'data from Lake Trichonis)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Europe: Greece from Kalamas to Mornos (except Acheron) and Pinios drainages (Pelopennese), including Lakes Trichonis, Amvrakia and Pamvotis. Despite its scientific name, this species is not found in Albania';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WCJZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49803121'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_albanicus'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_albanicus'; % ADW
metaData.links.id_Taxo = '1682760'; % Taxonomicon
metaData.links.id_WoRMS = '1020634'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus_albanicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_albanicus}}';  
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
'howpublished = {\url{http://www.fishbase.org/summary/Luciobarbus_albanicus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

