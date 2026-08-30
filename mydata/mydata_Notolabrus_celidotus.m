function [data, auxData, metaData, txtData, weights] = mydata_Notolabrus_celidotus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Notolabrus_celidotus'; 
metaData.species_en = 'Spotty'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 03 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 26];

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(14.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 23.9;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 16.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
    comment.Wwp = 'based on 0.00794*Lp^3.07, see F1';
data.Wwi = 135.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
    comment.Wwi = 'based on 0.00794*Li^3.07, see F1;  max. published weight: 5 kg ';

data.GSI = 0.1;  units.GSI = 'g/g';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'guess';   
  temp.GSI = C2K(14.3);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% univariate data
% time-length
data.tL_Lfm = [ ... % time since birth (yr), total length (cm) 
    1 10.30 10.36
    2 13.20 13.44
    3 15.16 15.47
    4 16.83 17.26
    5 NaN   18.58
    6 NaN   19.77
    7 NaN   21.09];
data.tL_Lfm(:,1) = 365 * (.9 + data.tL_Lfm(:,1)); % convert yr to d
units.tL_Lfm   = {'d', 'cm'};  label.tL_Lfm = {'time since birth', 'total length'};  
temp.tL_Lfm    = C2K(14.3);  units.temp.tL_Lfm = 'K'; label.temp.tL_Lfm = 'temperature';
bibkey.tL_Lfm = 'Jone1980'; treat.tL_Lfm = {1 {'females','males'}};
comment.tL_Lfm = 'Data from Leigh'; title.tL_Lfm = 'Leigh';
%
data.tL_Wfm = [ ... % time since birth (yr), total length (cm) 
    1  5.48  5.79
    2  8.67  9.21
    3 11.03 11.13
    4 12.61 13.01
    5 14.13 14.73
    6 NaN   15.29];
data.tL_Wfm(:,1) = 365 * (.2 + data.tL_Wfm(:,1)); % convert yr to d
units.tL_Wfm   = {'d', 'cm'};  label.tL_Wfm = {'time since birth', 'total length'};  
temp.tL_Wfm    = C2K(14.3);  units.temp.tL_Wfm = 'K'; label.temp.tL_Wfm = 'temperature';
bibkey.tL_Wfm = 'Jone1980'; treat.tL_Wfm = {1 {'females','males'}};
comment.tL_Wfm = 'Data from Wellington'; title.tL_Wfm = 'Wellington';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Lfm = 5 * weights.tL_Lfm;
weights.tL_Wfm = 5 * weights.tL_Wfm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
D2 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length weight: Ww in g = 0.00794*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47WH5'; % Cat of Life
metaData.links.id_ITIS = '614004'; % ITIS
metaData.links.id_EoL = '49993972'; % Ency of Life
metaData.links.id_Wiki = 'Notolabrus_celidotus'; % Wikipedia
metaData.links.id_ADW = 'Notolabrus_celidotus'; % ADW
metaData.links.id_Taxo = '181429'; % Taxonomicon
metaData.links.id_WoRMS = '281786'; % WoRMS
metaData.links.id_fishbase = 'Notolabrus-celidotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notolabrus_celidotus}}';
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
bibkey = 'Jone1980'; type = 'Article'; bib = [ ... 
'author = {Jones, G.P.}, ' ... 
'year = {1980}, ' ...
'title = {Growth and reproduction in the protogynous hermaphrodite, \emph{Pseudolabrus celidotus} ({P}isces: {L}abridae) in {N}ew {Z}ealand}, ' ...
'journal = {Copeia 1980(4):}, ' ...
'volume = {1980(4)}, ' ...
'pages = {660-675}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Notolabrus-celidotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

