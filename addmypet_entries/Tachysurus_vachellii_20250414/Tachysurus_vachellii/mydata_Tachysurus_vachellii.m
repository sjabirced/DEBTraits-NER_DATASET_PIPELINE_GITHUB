function [data, auxData, metaData, txtData, weights] = mydata_Tachysurus_vachellii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Tachysurus_vachellii'; 
metaData.species_en = 'bagrid catfish'; 

metaData.ecoCode.climate = {'Am','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 14];

%% set data
% zero-variate data

data.am = 8*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'ZhonJian1999';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 15.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 42.3;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 4.1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.98 mm: pi/6*0.198^3';
data.Wwp = 30.9;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00977*Lp^2.94, see F1';
data.Wwi = 591;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.94, see F1';

data.Ri = 591*77/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 77 eggs/g: 591*77';

%% univariate data
 
% time-length
data.tL_fm = [ ... % time (yr), total length (cm)
1 10.059 10.041
2 14.802 15.842
3 18.642 20.632
4 22.053 24.557
5 24.945 27.992
6 NaN    31.398
7 NaN    34.467
8 NaN    36.894];
data.tL_fm(:,1) = 365*(0.7+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ZhonJian1999'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00977*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase';
F2 = 'China and Viet Nam';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6WBWN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Tachysurus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1683258'; % Taxonomicon
metaData.links.id_WoRMS = '1015499'; % WoRMS
metaData.links.id_fishbase = 'Tachysurus-vachellii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tachysurus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Tachysurus-vachellii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ZhonJian1999'; type = 'article'; bib = [ ...
'author = {Duan Zhonghua, Sun Jianyi}, ' ...
'year = {1999}, ' ...
'title  = {STUDIES ON THE AGE AND GROWTH OF \emph{Tachysurus vachellii} ({R}ICHARDSON)}, ' ...
'journal = {Acta Hydrobiologica Sinica}, ' ...
'volume = {23(6)}, ' ...
'pages = {617-623}'];
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

