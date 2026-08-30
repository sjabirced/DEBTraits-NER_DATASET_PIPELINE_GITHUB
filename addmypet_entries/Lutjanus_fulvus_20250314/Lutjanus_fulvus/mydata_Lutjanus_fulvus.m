function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_fulvus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_fulvus'; 
metaData.species_en = 'Blacktail snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 14];

%% set data
% zero-variate data

data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 34*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 124;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01549*Lp^2.97, see F1';
data.Wwi = 888; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^2.97, see F1';

data.Ri  = 94501/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), fork length (cm)
    0  7.20  7.20
    1 19.60 18.95
    2 20.64 22.05
    3 22.39 22.13
    4 22.64 22.94
    5 23.96 22.82
    6 24.64 24.44
    7 24.62 23.78
    8 25.69 24.25
    9 24.75 23.81
   10 25.57 25.01
   11 25.70 25.96
   12 26.55 24.29
   13 25.60 24.85
   14 26.35 25.23
   15 27.49 25.75
   16 27.37 26.02
   17 27.65 26.10
   18 29.35 26.10
   19 26.93 27.08
   20 27.03 27.45
   21 27.87 27.78
   22 29.57 26.65
   23 28.77 25.61
   24 28.44 25.99
   25 29.10 27.02
   26 26.53 25.60
   27 26.73 28.70
   28 29.30 25.70
   29 27.55 29.95
   30 28.80 NaN
   33 28.03 NaN 
   34 31.50 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9)*365;  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(28);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ShimNana2014'; treat.tL_fm = {1 {'female','male'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  10 * weights.tL_fm;
weights.ab =  0 * weights.ab;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01549*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72PR5'; % Cat of Life
metaData.links.id_ITIS = '168885'; % ITIS
metaData.links.id_EoL = '46580750'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_johnii'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_johnii'; % ADW
metaData.links.id_Taxo = '106197'; % Taxonomicon
metaData.links.id_WoRMS = '218496'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-johnii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_johnii}}';
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
bibkey = 'ShimNana2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-014-0401-3}, ' ...
'author = {Shimose, T. and A. Nanami}, ' ... 
'year = {2014}, ' ...
'title = {Age, growth and reproductive biology of blacktail snapper, \emph{Lutjanus fulvus}, around the {a}eyama {I}slands, {O}kinawa}, ' ...
'journal = {Japan. Ichthyol. Res. 61(4):322-331}, ' ...
'volume = {111}, ' ...
'pages = {309–324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-johnii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
