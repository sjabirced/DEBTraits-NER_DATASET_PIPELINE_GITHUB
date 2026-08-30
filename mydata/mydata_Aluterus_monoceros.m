function [data, auxData, metaData, txtData, weights] = mydata_Aluterus_monoceros

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Aluterus_monoceros'; 
metaData.species_en = 'Unicorn leatherjacket filefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 19];

%% set data
% zero-variate data

data.am = 9 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MillStew2010';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 40.85;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'GhosHosh2021'; 
data.Li  = 76.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.37e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GhosHosh2021';
  comment.Wwb = 'based on egg diameter of 0.64 mm: pi/6*0.064^3';
data.Wwp = 863;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'GhosHosh2021','fishbase'};
  comment.Wwp = 'based on 0.01905*Lp^2.89, see F1';
data.Wwi = 5233;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01905*Li^2.89, see F1; max. published weight: 2.7 kg';

data.Ri = 1239202/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'GhosHosh2021';
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
45.557	29.844
196.284	39.688
226.935	46.563
256.526	47.813
287.501	50.469
318.474	52.969
348.750	53.438];
data.tL(:,1) = data.tL(:,1) + 200; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GhosHosh2021'; 

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

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01905*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Circumtropical. Western Atlantic: Massachusetts, USA to Argentina. Eastern Atlantic: west coast of tropical Africa. Eastern Pacific: Guatemala to Chile; probably in Mexico. Western Indian Ocean: Mozambique and South Africa. Recorded from La Reunion';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CB8N'; % Cat of Life
metaData.links.id_ITIS = '173133'; % ITIS
metaData.links.id_EoL = '46570748'; % Ency of Life
metaData.links.id_Wiki = 'Aluterus_monoceros'; % Wikipedia
metaData.links.id_ADW = 'Aluterus_monoceros'; % ADW
metaData.links.id_Taxo = '160489'; % Taxonomicon
metaData.links.id_WoRMS = '127407'; % WoRMS
metaData.links.id_fishbase = 'Aluterus-monoceros'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aluterus_monoceros}}';
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
bibkey = 'GhosHosh2021'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315421000758}, ' ...
'author = {Ghosh, S. and Hoshalli, M.M. and Mamidi, S. and Rohit, P. and Achamveetil, G.}, ' ... 
'year = {2021}, ' ...
'title = {Reproductive and feeding biology of unicorn leatherjacket, \emph{Aluterus monoceros} from the {B}ay of {B}engal, {N}orthern {I}ndian {O}cean}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {101}, ' ...
'pages = {839–851}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Aluterus-monoceros.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
