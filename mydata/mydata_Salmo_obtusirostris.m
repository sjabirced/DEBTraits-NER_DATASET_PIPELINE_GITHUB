  function [data, auxData, metaData, txtData, weights] = mydata_Salmo_obtusirostris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_obtusirostris'; 
metaData.species_en = 'Adriatic trout'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Lw'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 03];

%% set data
% zero-variate data
data.ab = 70; units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'guess'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;         units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'guess'; 
data.Li = 70;        units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0335;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 3600;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'TreeAniv2003';
  comment.Wwi = 'based on tL, tW and Li: 8*450 g';


data.Ri = 2e3/365;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
1  7.5  7.5
2 13.1 12.3 
3 17.7 16.5
4 21.4 18.8
5 24.4 21.4
6 28.2 NaN
7 32.7 NaN
8 35.9 NaN];
data.tL_fm(:,1) =  365 * (0.9+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(14.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TreeAniv2003'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
1 NaN   NaN
2  49  40
3  74  74
4 210 113
5 290 165
6 315 NaN
7 NaN NaN
8 450 NaN];
data.tW_fm(:,1) = 365 * (0.9+data.tW_fm(:,1)); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(14.9);  units.temp.tW_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tW_fm = 'TreeAniv2003'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.ab = 0 * weights.ab;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;

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

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '79D99'; % Cat of Life
metaData.links.id_ITIS = '623504'; % ITIS
metaData.links.id_EoL = '990373'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_obtusirostris'; % Wikipedia
metaData.links.id_ADW = 'Salmo_obtusirostris'; % ADW
metaData.links.id_Taxo = '658706'; % Taxonomicon
metaData.links.id_WoRMS = '994325'; % WoRMS
metaData.links.id_fishbase = 'Salmo-obtusirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salmo_obtusirostris}}';  
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
bibkey = 'TreeAniv2003'; type = 'article'; bib = [ ... 
'author = {Treer, T. and I. Ani\v{c}i\''{c} and R. Safner and T. Odak and N. Piria}, ' ... 
'year = {2003}, ' ...
'title = {Note on the growth of endemic soft-muzzled trout \emph{Salmothymus obtusirostris} translocated into a {D}almatian river}, ' ...
'journal = {Biologia Bratislava}, ' ...
'volume = {58}, ' ...
'pages = {999-1001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Salmo-obtusirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
