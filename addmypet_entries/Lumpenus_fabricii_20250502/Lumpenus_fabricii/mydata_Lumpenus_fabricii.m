function [data, auxData, metaData, txtData, weights] = mydata_Lumpenus_fabricii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lumpenidae';
metaData.species    = 'Lumpenus_fabricii'; 
metaData.species_en = 'Slender eelblenny'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MPN','MAN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 02];

%% set data
% zero-variate data

data.ab = 260;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(-0.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'TokrEmel2025';   
  temp.am = C2K(-0.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TokrEmel2025'; 
data.Li  = 36.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0141; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TokrEmel2025';
  comment.Wwb = 'baed on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 12;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'TokrEmel2025';
  comment.Wwp = 'based on LW and Lp data';
data.Wwi = 94;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00398*Li^2.80, see F1';

data.Ri = 250/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'TokrEmel2025';   
  temp.Ri = C2K(-0.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
    4 11.6 11.2
    5 12.5 12.6
    6 15.6 17.0
    7 19.2 19.7
    8 21.8 21.5
    9 NaN  26.8];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % set origin at birth and convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(-0.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TokrEmel2025'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data from Chukchi and Kara seas';

% time-weight
data.tW_fm = [ ... % time since hatch (yr), weight (g)
    4  4.8  4.2
    5  5.5  5.1
    6 17.0 11.8
    7 17.0 14.7
    8 17.1 20.0
    9 NaN  28.3];
data.tW_fm(:,1) = 365*(0+data.tW_fm(:,1)); % set origin at birth and convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
  temp.tW_fm = C2K(-0.3);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'TokrEmel2025'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'data from Chukchi and Kara seas';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.109	3.056
10.586	3.128
10.797	3.786
11.142	3.785
11.247	4.954
11.564	5.173
11.935	5.464
11.989	4.586
12.359	4.805
12.491	5.755
12.676	6.486
12.889	4.730
13.021	5.900
13.074	5.388
13.417	6.410
13.841	6.994
13.867	7.506
14.237	7.797
14.342	9.186
14.528	8.455
14.819	10.063
14.899	8.307
14.926	7.722
14.978	9.258
15.136	10.135
15.216	9.915
15.323	8.014
15.402	9.257
15.666	10.865
15.823	12.400
16.011	9.401
16.116	10.132
16.142	11.448
16.220	12.910
16.247	12.179
16.434	9.765
16.671	12.178
16.802	14.006
16.963	11.373
17.014	13.932
17.172	15.321
17.307	11.957
17.518	12.322
18.016	21.095
18.099	15.026
18.338	14.294
18.391	15.025
18.416	16.268
18.445	13.270
18.627	17.364
18.630	14.073
18.679	18.607
18.786	17.876
18.789	13.049
19.026	15.535
19.185	15.096
19.212	13.852
19.398	13.706
19.475	17.069
19.555	16.264
19.953	15.240
19.978	16.921
20.270	16.555
20.430	13.922
20.456	15.750
20.457	14.214
21.012	15.602
21.542	15.235
21.832	16.989
22.518	20.205
26.830	28.236];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'TokrEmel2025'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00398*(TL in cm)^2.80';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Circumpolar. Arctic, North Pacific and Northwest Atlantic: Barents Sea eastward to western Greenland; in the Pacific to southeastern Alaska and to northern Sea of Okhotsk; in western Atlantic to Nova Scotia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6QQ92'; % Cat of Life
metaData.links.id_ITIS = '171582'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lumpenus'; % Wikipedia
metaData.links.id_ADW = 'Lumpenus_fabricii'; % ADW
metaData.links.id_Taxo = '179199'; % Taxonomicon
metaData.links.id_WoRMS = '127073'; % WoRMS
metaData.links.id_fishbase = 'Lumpenus_fabricii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumpenus}}';
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
bibkey = 'ForsNorc2020'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2020.104779}, ' ...
'author = {Caitlin E. Forster and Brenda L. Norcross and Ingrid Spies}, ' ... 
'year = {2020}, ' ...
'title = {Documenting growth parameters and age in {A}rctic fish species in the {C}hukchi and {B}eaufort seas}, ' ...
'journal = {Deep–Sea Research II}, ' ...
'volume = {177}, ' ...
'pages = {104779}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TokrEmel2025'; type = 'article'; bib = [ ... 
'doi = {10.1007/s00300-024-03343-9}, ' ...
'author = {Alexey M. Tokranov and Pavel O. Emelin and Alexei M. Orlov}, ' ... 
'year = {2025}, ' ...
'title = {Distribution and biology of understudied slender eelblenny \emph{Lumpenus fabricii} ({S}tichaeidae, {T}eleostei) in two {S}iberian {A}rctic seas, with comparative data on some other ground fishes}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {48(17)}, ' ...
'pages = {104779}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lumpenus_fabricii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
