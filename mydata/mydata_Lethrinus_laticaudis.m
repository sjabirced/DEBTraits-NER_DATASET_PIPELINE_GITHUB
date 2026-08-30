function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_laticaudis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_laticaudis'; 
metaData.species_en = 'Grass emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 13];

%% set data
% zero-variate data

data.am = 19*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 28; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 56;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm : pi/6*0.07^3'; 
data.Wwi = 2397; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.98, see F1';

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 10.9
    1 20.3
    2 23.8
    3 28.2
    4 35.2
    5 38.7];
data.tL(:,1) = 365 * (0.5+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Blab1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q2PW'; % Cat of Life
metaData.links.id_ITIS = '550906'; % ITIS
metaData.links.id_EoL = '46580961'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_laticaudis'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_laticaudis'; % ADW
metaData.links.id_Taxo = '178741'; % Taxonomicon
metaData.links.id_WoRMS = '278635'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-laticaudis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_laticaudis}}';
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
bibkey = 'Blab1993'; type = 'techreport'; bib = [ ... 
'author = {S. J. M. Blaber}, ' ... 
'year = {1993}, ' ...
'title = {Determination of Biological Parameters required for the Rational Management and Exploitation of the Fishes of the Gulf of Carpentaria}, ' ...
'institution = {CSIRO Division of Fisheries}, ' ...
'volume = {FRDC Project 91/29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-laticaudis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
