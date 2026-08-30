function [data, auxData, metaData, txtData, weights] = mydata_Plectropomus_oligocanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Plectropomus_oligocanthus'; 
metaData.species_en = 'Highfin coralgrouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 21];

%% set data
% zero-variate data

data.ab = 2.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Plectropomus_maculatus';

data.Lp  = 42;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'Ferr1993'; 
data.Li  = 75;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 847;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.03, see F1';
data.Wwi = 4.9e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.03, see F1; max. published weight: 1.2 kg';
 
data.Ri = 3e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(28.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1 23.3
    2 35.3
    3 41.5
    4 44.8
    5 46.4
    6 47.3];
data.tL(:,1) = (0+data.tL(:,1)) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(28.);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MudjBawo2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VQLF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Plectropomus'; % Wikipedia
metaData.links.id_ADW = 'Plectropomus_oligocanthus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '277891'; % WoRMS
metaData.links.id_fishbase = 'Plectropomus_oligocanthus-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectropomus}}';
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
bibkey = 'MudjBawo2017'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.ejar.2017.09.002}, ' ...
'author = {Mudjirahayua and Roni Bawole and Unstain N.W.J. Rembet and Arnold S. Ananta and Ferawati Runtuboi and Ridwan Sala}, ' ... 
'year = {2017}, ' ...
'title = {Growth, mortality and exploitation rate of \emph{Plectropomus maculatus} and \emph{P. oligocanthus} (Groupers, {S}erranidae) on {C}enderawasih {B}ay {N}ational {P}ark, {I}ndonesia}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {43}, '...
'pages = {213-218}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Plectropomus_oligocanthus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

