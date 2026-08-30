function [data, auxData, metaData, txtData, weights] = mydata_Limanda_sakhalinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Limanda_sakhalinensis'; 
metaData.species_en = 'Sakhalin sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data

data.am = 21*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'YusuMete2020';   
  temp.am = C2K(0.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 8 yrs';
  
data.Lp  = 15;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'nefsc';
  comment.Wwb = 'based on egg diameter 0.88 mm of Limanda_ferruginea: 4/3*pi*0.044^3';
data.Wwp = 21;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00603*Lp^3.01, see F1';
data.Wwi = 292;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.01, see F1; max. published weight: 500.00 g';
  
data.Ri  = 273750/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 51 cm';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.5';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length males, females (cm)
    1  3.9  4.2
    3 10.2 10.6
    5 15.2 15.3
    7 19.2 18.8
    9 22.5 21.4
   11 25.1 23.3
   13 27.2 24.7
   15 28.8 25.8
   17 30.2 26.6
   19 31.2 27.2
   21 32.1 27.6];
data.tL_fm(:,1) = 365 * (.5 + data.tL_fm(:,1)); 
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(0.9); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'YusuMete2020'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Ri = 0 * weights.Ri;

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
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in  cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northwest Pacific';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PZDV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570107'; % Ency of Life
metaData.links.id_Wiki = 'Limanda_sakhalinensis'; % Wikipedia
metaData.links.id_ADW = 'Limanda_sakhalinensis'; % ADW
metaData.links.id_Taxo = '178827'; % Taxonomicon
metaData.links.id_WoRMS = '274292'; % WoRMS
metaData.links.id_fishbase = 'Limanda_sakhalinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limanda_sakhalinensis}}';
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
bibkey = 'YusuMete2020'; type = 'Article'; bib = [ ... 
'doi = {10.1088/1755-1315/548/8/082088}, ' ...
'author = {R. R. Yusupov and E. A. Metelev and A. S. Sergeev and V. S. Danilov}, ' ... 
'year = {2020}, ' ...
'title = {Age, growth and maturation of the {S}akhalin flounder \emph{Limanda sakhalinensis} of the northern {S}ea of {O}khotsk }, ' ...
'journal = {IOP Conf. Ser.: Earth Environ. Sci.}, ' ...
'volume = {548}, ' ...
'pages = {082088}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Limanda_sakhalinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nefsc'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nefsc.noaa.gov/nefsc/publications/tm/tm140/tm140.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

