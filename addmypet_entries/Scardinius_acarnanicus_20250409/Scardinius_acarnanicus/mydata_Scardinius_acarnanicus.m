  function [data, auxData, metaData, txtData, weights] = mydata_Scardinius_acarnanicus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Scardinius_acarnanicus'; 
metaData.species_en = 'Acheloos rudd'; 

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
data.Li = 38;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Leon2004';
  comment.Wwb = 'based on egg diameter of 1.54 mm: pi/6*0.154^3';
data.Wwp = 43.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 661;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1; max. published weight: 620 g ';

data.Ri = 1.3e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'Leon2004';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1.081*Li^3.22';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  8.42  9.56
    2 12.62 13.40
    3 16.28 16.89
    4 19.41 19.88
    5 22.18 22.24
    6 24.55 24.26
    7 26.71 26.36
    8 28.68 28.14
    9 30.37 NaN
   10 31.38 NaN];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Leon2004'; treat.tL = {1 {'Lake Lysimachia','Lake Trichonis'}};

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
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic from central and western Greece';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79W72'; % Cat of Life
metaData.links.id_ITIS = '690019'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scardinius_acarnanicus'; % Wikipedia
metaData.links.id_ADW = 'Scardinius_acarnanicus'; % ADW
metaData.links.id_Taxo = '186653'; % Taxonomicon
metaData.links.id_WoRMS = '1011253'; % WoRMS
metaData.links.id_fishbase = 'Scardinius-acarnanicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scardinius_acarnanicus}}';  
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
bibkey = 'Leon2004'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1439-0426.2004.00557.x}, ' ...
'author = {Leonardos, I. D.}, ' ...
'year = {2004}, ' ...
'title = {Life history traits of \emph{Scardinius acarnanicus} ({E}conomidis, 1991) ({P}isces: {C}yprinidae) in two {G}reek lakes ({L}ysimachia and {T}richonis)}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {20(4)}, '...
'pages = {258–264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scardinius-acarnanicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

