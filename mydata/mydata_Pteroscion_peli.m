function [data, auxData, metaData, txtData, weights] = mydata_Pteroscion_peli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Pteroscion_peli'; 
metaData.species_en = 'Boe drum'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 04];

%% set data
% zero-variate data

data.am = 7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 32;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 33;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00891*Lp^3.08, see F1';
data.Wwi = 385; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.08, see F1';

data.GSI  = 0.05; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'FontBaro1976';   
  temp.GSI = C2K(28.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
115.264	6.608
175.031	7.472
176.454	7.754
179.300	7.051
182.146	7.427
210.607	7.577
223.414	9.505
233.375	8.147
240.490	8.900
251.874	10.876
256.143	10.032
286.026	11.309
287.449	9.666
290.295	10.230
293.142	11.686
303.103	9.812
304.526	11.267
305.949	10.939
325.871	11.697
337.255	10.198
348.639	13.347
351.485	11.658
352.908	10.015
354.331	10.344
371.407	13.166
385.638	12.372
385.639	12.091
401.291	14.349
401.292	12.565
406.983	15.243
415.521	13.743
416.944	15.011
431.174	16.048
432.597	12.715
436.866	12.435
459.635	16.339
461.058	16.903
463.904	15.166
473.865	14.747
506.594	16.729
506.595	15.884
508.017	15.274
520.824	15.043
543.593	17.632
550.708	16.461
554.977	17.307
554.978	17.917
556.400	15.852
569.207	16.185
579.168	16.563
584.860	18.208
584.861	17.927
586.283	18.725
594.821	18.681
631.820	18.645
634.666	18.130
677.356	19.833
677.357	19.223
683.048	18.708
694.432	19.791
710.086	19.420
715.778	19.047
761.314	20.375
804.005	20.999
804.006	20.107];
data.tL(:,1) = data.tL(:,1) + 0; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FontBaro1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Q385'; % Cat of Life
metaData.links.id_ITIS = '646697'; % ITIS
metaData.links.id_EoL = '46579238'; % Ency of Life
metaData.links.id_Wiki = 'Pteroscion_peli'; % Wikipedia
metaData.links.id_ADW = 'Pteroscion_peli'; % ADW
metaData.links.id_Taxo = '185488'; % Taxonomicon
metaData.links.id_WoRMS = '282503'; % WoRMS
metaData.links.id_fishbase = 'Pteroscion-peli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteroscion_peli}}';
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
bibkey = 'FontBaro1976'; type = 'Article'; bib = [ ... 
'author = {Fontana, A. and J. Baron}, ' ... 
'year = {1976}, ' ...
'title = {Croissance de \emph{Pentanemus quiquarius} ({B}arbillon) et \emph{Pteroscion peli} ({M}adongo) au {C}ongo}, ' ...
'journal = {Oc\''{e}anographes biologistes Centre ORSTOM Pointe-Noire (Congo)}, ' ...
'volume = {31}, ' ...
'pages = {1-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pteroscion-peli.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

