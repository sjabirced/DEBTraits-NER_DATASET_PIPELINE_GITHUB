  function [data, auxData, metaData, txtData, weights] = mydata_Neosalanx_pseudotaihuensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Salangidae';
metaData.species    = 'Neosalanx_pseudotaihuensis'; 
metaData.species_en = 'Yangtze icefish';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', '0jFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24);
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 27];

%% set data
% zero-variate data
data.ab = 7;  units.ab = 'd';   label.ab = 'age at hatch';                bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 7;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm for Osmerus mordax: pi/6*0.075^3';
data.Wwp = 0.13;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00123*Lp^3.08, see F1';
data.Wwi = 0.493;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00123*Li^3.08, see F1';

data.Ni = 533; units.Ni = '#'; label.Ni = 'total fecundity'; bibkey.Ni = 'guess';   
  temp.Ni = C2K(24);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
  comment.Ni = 'based on fecundity of Neosalanx_taihuensis: 1250*(7/9.3)^3';
    
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
9.185	2.366
39.194	3.603
69.087	3.890
100.231	4.447
130.786	5.162
162.507	5.449
192.375	5.531
222.278	5.897
252.757	5.995
281.993	5.887
313.103	6.158
342.961	6.161
374.642	6.116];
data.tL(:,1) = 60 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(24); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LiuHerz2000'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 varying food levels'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature (in C) for tL data is assumed to vary as T(t)=16.9+6*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00123*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Naturally occurring in central and eastern China, widely introduced elsewhere';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '46S6F'; % Cat of Life
metaData.links.id_ITIS = '623675'; % ITIS
metaData.links.id_EoL = '209159'; % Ency of Life
metaData.links.id_Wiki = 'Neosalanx'; % Wikipedia
metaData.links.id_ADW = 'Neosalanx_pseudotaihuensis'; % ADW
metaData.links.id_Taxo = '181206'; % Taxonomicon
metaData.links.id_WoRMS = '1011620'; % WoRMS
metaData.links.id_fishbase = 'Neosalanx-pseudotaihuensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neosalanx}}';  
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
bibkey = 'LiuHerz2000'; type = 'Article'; bib = [ ... 
'author = {Liu, Z. and A. Herzig and F. Schiemer}, ' ...
'year = {2000}, ' ...
'title = {Growth of the icefish \emph{Neosalanx pseudotaihuensis} ({S}alangidae) in {X}ujahe {R}eservoir, central {C}hina}, ' ... 
'journal = {Environ. Biol. Fishes}, ' ...
'volume = {59}, '...
'pages = {219-227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Neosalanx-pseudotaihuensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
