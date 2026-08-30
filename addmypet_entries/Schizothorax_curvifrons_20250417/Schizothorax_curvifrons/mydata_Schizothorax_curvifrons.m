  function [data, auxData, metaData, txtData, weights] = mydata_Schizothorax_curvifrons
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizothorax_curvifrons'; 
metaData.species_en = 'Sattar snowtrout'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPi','THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 17];

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'QuadShah2018';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 56;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.7 mm of Schizothorax richardsonii: pi/6*0.17^3';
data.Wwp = 56;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^2.94, see F1';
data.Wwi = 1348;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.94, see F1; max. published weight: 1.3 kg';
    
data.Ri  = 3e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'data 3e4 is presented as rel fecundity, but assumed to be abs fecundity';

% univariate data

% time-length
data.tL = [ ... % time since birth (mnth), std length (cm)
    1  5.1
    2  9.6
    3 13.6
    4 17.6
    5 21.3
    6 24.9
    7 25.0
    8 26.9
    9 29.3
   10 31.2
   11 34.6
   12 38.0
   13 38.9
   14 41.0
   15 42.0
   16 44.8];
data.tL(:,1) = 365 * (0+data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'QuadShah2018'; comment.tL = 'QuadShah2018 specify month as time unit, but yr is assumed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

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
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Afghanistan, Pakistan, India and China. Reported from Iran , Uzbekistan, Kazakhstan and Kyrgyzstan';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4VD8R'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '206116'; % Ency of Life
metaData.links.id_Wiki = 'Schizothorax_curvifrons'; % Wikipedia
metaData.links.id_ADW = 'Schizothorax_curvifrons'; % ADW
metaData.links.id_Taxo = '575107'; % Taxonomicon
metaData.links.id_WoRMS = '1013990'; % WoRMS
metaData.links.id_fishbase = 'Schizothorax-curvifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Schizothorax_curvifrons}}';  
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
bibkey = 'QuadShah2018'; type = 'article'; bib = [ ...  
'author = {Sauliheen Qadri and Tasaduq H. Shah and M.H. Balkhi and Bilal A. Bhat and F.A. Bhat and Iram Farooq and Syed Alia and Asifa Wali}, ' ...
'year = {2018}, ' ...
'title = {Study on the growth of \emph{Schizothorax curvifrons} ({C}yprinidae: {C}ypriniformes) in river {J}helum {K}ashmir}, ' ... 
'journal = {Journal of Pharmacognosy and Phytochemistry}, ' ...
'volume = {7(5)}, '...
'pages = {1908-1912}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Schizothorax-curvifrons.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

