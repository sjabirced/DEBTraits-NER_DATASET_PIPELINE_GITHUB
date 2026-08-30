function [data, auxData, metaData, txtData, weights] = mydata_Nibea_albiflora

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Nibea_albiflora'; 
metaData.species_en = 'Yellow drum'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'KakuNaka1980';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 43.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 120;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.01047*Li^3.07, see F1';
data.Wwi = 1122;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.07, see F1; max published weight 1.5 kg';

data.Ri = 475043/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(23.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Nibea_maculata';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	14.542 14.977 15.949
2	23.703 21.125 20.187
3	30.285 24.895 23.410
4	35.696 27.805 25.618
5	39.777 30.012 27.121];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KakuNaka1980'; treat.tL = {1 {'females Seto Inland Sea','females Ariake Sound','males Ariake Sound'}};

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
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47C9J'; % Cat of Life
metaData.links.id_ITIS = '169395'; % ITIS
metaData.links.id_EoL = '46579165'; % Ency of Life
metaData.links.id_Wiki = 'Nibea'; % Wikipedia
metaData.links.id_ADW = 'Nibea_albiflora'; % ADW
metaData.links.id_Taxo = '181324'; % Taxonomicon
metaData.links.id_WoRMS = '281747'; % WoRMS
metaData.links.id_fishbase = 'Nibea_albiflora'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nibea}}';
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
bibkey = 'KakuNaka1980'; type = 'article'; bib = [ ... 
'author = {Kakuda, S. and K. Nakai}, ' ... 
'year = {1980}, ' ...
'title = {On the age and growth of \emph{Nibea albiflora}}, ' ...
'journal = {Bull. Jap. Soc. Sci. Fish.}, ' ...
'vplume = {46(2)}, ' ...
'pages = {139-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Nibea-albiflora.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

