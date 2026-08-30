function [data, auxData, metaData, txtData, weights] = mydata_Heterodontus_francisci
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Heterodontiformes'; 
metaData.family     = 'Heterodontidae';
metaData.species    = 'Heterodontus_francisci'; 
metaData.species_en = 'Horn shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {};

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2025 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 10 21];

%% set data
% zero-variate data;
data.ab = 9*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'fishbase';    
  temp.ab = C2K(21.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(21.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Heterodontus_portusjacksoni';
data.Lp = 59;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase';
data.Li  = 122;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 

data.Wwb  = 54.8;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on 0.00437*Lb^3.15, see F1';
data.Wwp = 1654;   units.Wwp  = 'g';  label.Wwp  = 'weightat puberty for females'; bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^3.15, see F1';
data.Wwi  = 16312;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight';   bibkey.Wwi  = 'fishbase'; 

data.Ri  = 24/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(21.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JOi  = 60*2.10; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'PrinBigm2023';   
  temp.JOi = C2K(18.2);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 6310; units.weight.JOi = 'g'; label.weight.JOi = 'weight';       	

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1;
units.psd.k = '-'; label.psd.k = 'maintenance rate coef.';

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouping
% set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
% set2 = {'LW_f','LW_m'}; subtitle2 = 'Data for females, males';
% set3 = {'LL_f','LL_m'}; subtitle3 = 'Data for females, males';
% metaData.grp.sets = {set1,set2,set3};
% metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00437 * (TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6M53J'; % Cat of Life
metaData.links.id_ITIS = '159791'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Heterodontus_francisci'; % Wikipedia
metaData.links.id_ADW = 'Heterodontus_francisci'; % ADW
metaData.links.id_Taxo = '41860'; % Taxonomicon
metaData.links.id_WoRMS = '276694'; % WoRMS
metaData.links.id_fishbase = 'Heterodontus_francisci'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterodontus_francisci}}'; 
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Heterodontus_francisci.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinBigm2023'; type = 'article'; bib = [ ...
'author = {Prinzing, T. S. and Bigman, J. S. and Skelton, Z. R. and Dulvy, N. K. and Wegner, N. C.}, '...
'title = {The allometric scaling of oxygen supply and demand in the {C}alifornia horn shark, \emph{Heterodontus francisci}}, '...
'journal = {Journal of Experimental Biology}, ' ...
'year = {2023}, ' ...
'volume = {226(15)}, '...
'pages = {jeb246054}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

