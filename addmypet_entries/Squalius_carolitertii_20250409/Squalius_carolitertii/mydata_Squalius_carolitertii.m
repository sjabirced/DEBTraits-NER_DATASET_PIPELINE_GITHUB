  function [data, auxData, metaData, txtData, weights] = mydata_Squalius_carolitertii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_carolitertii'; 
metaData.species_en = 'Bordallo'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
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
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 33.5; units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'MaiaMaria2006';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.54 mm: pi/6*0.154^3';
data.Wwp = 13.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 445;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'MaiaMaria2006','fishbase'};
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1; max. published weight: 620 g ';

data.Ri = 8.8e4/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Scardinius_acarnanicus: 1.081*Li^3.22';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  4.45
    2  6.94
    3  9.49
    4 11.64 
    5 13.54];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaiaMaria2006'; treat.tL = {1 {'Lake Lysimachia','Lake Trichonis'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
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
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Iberian Peninsula in Douro, Mondego, Umia, Limia, Tagus, Mino and Lerez drainages';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Interspecific hybridization occurs between males of Squalius carolitertii and females of Squalius alburnoides';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6ZDRR'; % Cat of Life
metaData.links.id_ITIS = '1199731'; % ITIS
metaData.links.id_EoL = '340282'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_carolitertii'; % Wikipedia
metaData.links.id_ADW = 'Squalius_carolitertii'; % ADW
metaData.links.id_Taxo = '1682880'; % Taxonomicon
metaData.links.id_WoRMS = '1011808'; % WoRMS
metaData.links.id_fishbase = 'Squalius-carolitertii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Squalius_carolitertii}}';  
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
bibkey = 'MaiaMaria2006'; type = 'Article'; bib = [ ...
'doi = {10.23818/limn.25.48}, ' ...
'author = {Maia, H.M.S. and C.F.Q. Maia and D.F.C. Pires and A.C.N. Valente}, ' ...
'year = {2006}, ' ...
'title = {Biology of the iberian chub (\emph{Squalius carolitertii}) in an atlantic-type stream (river Lima basin-north Portugal). A preliminary approach}, ' ... 
'journal = {Limnetica}, ' ...
'volume = {25(3)}, '...
'pages = {713-722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-carolitertii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

