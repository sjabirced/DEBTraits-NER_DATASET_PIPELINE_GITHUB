  function [data, auxData, metaData, txtData, weights] = mydata_Salmo_ferox

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_ferox'; 
metaData.species_en = 'Ferox trout'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Lw_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data
data.ab = 61; units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'guess'; 
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;         units.Lp = 'cm';   label.Lp = 'fork length at puberty';bibkey.Lp = 'guess'; 
data.Li = 80;        units.Li = 'cm';   label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0335;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 6.1e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.03, see F1; ';

data.Ri = 2e4/365;    units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1  6.031  5.085  5.252
2 15.564 12.312 13.092
3 24.514 18.759 18.599
4 33.268 24.042 23.708
5 41.245 29.517 26.685
6 49.222 34.019 29.851];
data.tL(:,1) =  365 * (0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HughHook2018'; treat.tL = {1 {'Loch Awe','Loch Rannoch','Loch na Sealga'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'British Isles in Loughs Melvin, Erne, Corrib, and Mask (Ireland), Lochs Awe, Laggan and others (Scotland), apparently also Lakes Ullswater and Bassenthwaite (Cubmria) and Llyns Padarn and Peris (Wales)';
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '6XD7Q'; % Cat of Life
metaData.links.id_ITIS = '623496'; % ITIS
metaData.links.id_EoL = '1156808'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_ferox'; % Wikipedia
metaData.links.id_ADW = 'Salmo_ferox'; % ADW
metaData.links.id_Taxo = '186413'; % Taxonomicon
metaData.links.id_WoRMS = '1021730'; % WoRMS
metaData.links.id_fishbase = 'Salmo_ferox'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Salmo_ferox}}';  
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
bibkey = 'HughHook2018'; type = 'article'; bib = [ ...
'doi = {10.1111/eff.12421}, ' ...
'author = {Hughes, M. R. and Hooker, O. E. and Van Leeuwen, T. E. and Kettle-White, A. and Thorne, A. and Prod\"{o}hl, P. and Adams, C. E.}, ' ... 
'year = {2018}, ' ...
'title = {Alternative routes to piscivory: Contrasting growth trajectories in brown trout (\emph{Salmo trutta}) ecotypes exhibiting contrasting life history strategies}, ' ...
'journal = {Ecology of Freshwater Fish.}, ' ...
'pages = {1–7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Salmo_ferox.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
