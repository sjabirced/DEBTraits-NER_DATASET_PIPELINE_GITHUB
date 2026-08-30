function [data, auxData, metaData, txtData, weights] = mydata_Ophiomusa_lymani
%% set metaData
metaData.phylum     = 'Echinodermata';
metaData.class      = 'Ophiuroidea'; 
metaData.order      = 'Ophiurida'; 
metaData.family     = 'Ophiosphalmidae';
metaData.species    = 'Ophiomusa_lymani'; 
metaData.species_en = 'Deepsea brittlestar'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MC','MN'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biB', 'biD', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'ab', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wdp', 'Wdi', 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 01];

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(4.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Amphiura_filiformis';
data.am = 3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(4.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on tL data and Li';

data.Lj  = 0.0325;   units.Lj  = 'cm';  label.Lj  = 'disc diameter at metamorphosis';  bibkey.Lj  = 'guess';
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'disc diameter at puberty';          bibkey.Lp  = 'GageTyle1982';
  comment.Lp = 'based on tp from tL data';
data.Li  = 2.7;   units.Li  = 'cm';  label.Li  = 'ultimate disc diameter';          bibkey.Li  = 'GageTyle1982';

data.Wwb = 5e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight atb birth';         bibkey.Wwb = 'GageTyle1982';
  comment.Wwb = 'based on guessed egg diameter of 0.46 mm: pi/6*(0.046)^3';
data.Wdp = 0.21;   units.Wdp = 'g';   label.Wdp = 'ashfree dry weight at puberty';  bibkey.Wdp = {'GageTyle1982','Dahm1993'};
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 0.511;   units.Wdi = 'g';   label.Wdi = 'ultimate ash-free dry weight';   bibkey.Wdi = {'GageTyle1982','Dahm1993'};
  comment.Wdi = 'based on 0.044*(10*2.7)^2.840, see F1';

data.Ri  = 12000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GageTyle1982';   
temp.Ri = C2K(4.1);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since metam (d), disc diameter (cm)
234.124	0.850
357.998	1.109
441.820	1.524
645.423	1.853
730.900	2.088
855.008	2.110];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'disc diameter'};  
temp.tL    = C2K(4.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GageTyle1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight of O. ophiura: mass (mg AFDM) = 0.044 * (disc diam in mm)^2.840';
metaData.bibkey.F1 = 'Dahm1993'; 
F2 = 'Pacific Ocean, Arctic and Northwest Atlantic';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '49XZ2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66698282'; % Ency of Life
metaData.links.id_Wiki = 'Ophiomusium'; % Wikipedia
metaData.links.id_ADW = 'Ophiomusium_lymani'; % ADW
metaData.links.id_Taxo = '41016'; % Taxonomicon
metaData.links.id_WoRMS = '245559'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ophiomusium}}';
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
bibkey = 'GageTyle1982'; type = 'Article'; bib = [ ... 
'author = {J. D. Gage and P. A. Tyler}, ' ... 
'year = {1982}, ' ...
'title = {Growth and reproduction of the deep-sea brittlestar \emph{Ophiomusium lymani} {W}yville {T}homson}, ' ...
'journal = {Ocanologica Acta}, ' ...
'volume = {5(1)}, ' ...
'pages = {73-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dahm1993'; type = 'Article'; bib = [ ... 
'author = {C. Dahm}, ' ... 
'year = {1993}, ' ...
'title = {Growth, production and ecological significance of \emph{Ophiura albida} and \emph{O. ophiura} ({E}chinodermata: {O}phiuroidea) in the {G}erman {B}ight}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {116}, ' ...
'pages = {431--437}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.se/summary/Ophiomusium-lymani}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
