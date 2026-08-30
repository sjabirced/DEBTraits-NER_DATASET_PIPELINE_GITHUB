function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_analis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_analis'; 
metaData.species_en = 'Peruvian weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.2 ); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 25];

%% set data
% zero-variate data

data.am = 23*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(20.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Cynoscion_guatucupa';

data.Lp  = 23.6;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 47;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 133;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00813*Lp^3.07, see F1';
data.Wwi = 1105;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.07, see F1';

data.GSI  = 0.03; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(20.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cynoscion_guatucupa';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    0   7.8  6.5
    1  17.0 15.0
    2  21.7 22.3
    3  25.1 26.7
    4  28.8 30.1
    5  32.6 33.0
    6  35.3 36.7
    7  37.0 NaN];
data.tL_fm(:,1) = 365 * (0.9+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(20.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ArriGoic2010'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    0    5.7  3.2
    1   35.9 35.5
    2   91.0 101.6
    3  163.1 187.8
    4  243.2 280.5
    5  324.7 370.1
    6  474.4 521.9
    7  538.6 581.4];
data.tW_fm(:,1) = 365 * (0.9+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(20.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ArriGoic2010'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;

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
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Pacific: Santa Elena, Ecuador to Coquimbo, Chile';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6C7LD'; % Cat of Life
metaData.links.id_ITIS = '169242'; % ITIS
metaData.links.id_EoL = '46578978'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion_acoupa'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_acoupa'; % ADW
metaData.links.id_Taxo = '172623'; % Taxonomicon
metaData.links.id_WoRMS = '276074'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-acoupa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion_acoupa}}';
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
bibkey = 'ArriGoic2010'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.fishres.2023.106826}, ' ...
'author = {Sonia B. Arrieta and Carlos E. Goicochea and Patricia I. Moquillaza and Jorge A. Mostacero}, ' ... 
'year = {2010}, ' ...
'title = {AGE AND GROWTH OF THE {P}ERUVIAN WEAKFISH, \emph{Cynoscion_analis} {J}ENYNS), STUDIED IN {P}AITA (5 S), PER\''{u}. 1979}, ' ...
'journal = {Informe}, ' ...
'volume = {37(3-4)}, ' ...
'pages = {59-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-acoupa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

