function [data, auxData, metaData, txtData, weights] = mydata_Paracapoeta_erhani
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Paracapoeta_erhani'; 
metaData.species_en = 'Ceyhan scraper'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 013];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 47;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 87;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00759*Lp^3.12, see F1';
data.Wwi = 1251;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.12, see F1';

data.Ri = 3.7e4/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Capoeta capoeta: 98.24*365*(47/46.7)^3';

%% univariate data
 
% time-length-weight
data.tLW = [ ... % time (yr), total length (cm), weight (g)
0	 15.2  33.5
1	 17.3  51.6
2	 23.5 131.5
3	 26.2 184.4
4	 28.5 237.0
5	 31.7 328.2];
data.tLW(:,1) = 365 * (1.2+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(22);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'AyyiEmre2014'; treat.tLW = {1 {'length','weight'}}; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
15.139	40.379
15.801	44.822
16.075	39.003
16.240	33.174
16.847	44.918
16.957	40.545
16.959	55.155
17.233	47.875
17.566	65.438
17.620	56.677
18.117	72.794
18.502	66.985
23.190	115.627
24.018	134.696
24.516	149.352
25.016	183.002
25.122	150.868
25.180	180.095
25.232	150.878
25.287	152.345
25.344	164.038
25.400	172.809
25.457	187.425
25.672	149.458
25.784	159.695
26.004	155.332
26.059	161.181
26.225	164.118
26.722	178.774
26.888	181.711
27.052	168.577
27.053	181.727
27.498	215.371
27.552	206.610
27.827	205.174
28.161	231.503
28.436	227.145
28.653	200.866
28.768	238.864
28.821	221.336
28.880	259.328
28.930	212.580
28.987	228.656
29.041	218.434
29.044	244.733
29.654	282.776
31.203	336.976
32.579	325.413
32.690	337.111
32.742	309.356
33.856	414.653];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'AyyiEmre2014'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
15.000	29.247
15.258	33.107
15.567	36.965
15.619	39.543
15.979	34.366
16.237	38.226
16.495	42.086
16.546	51.116
16.804	39.492
16.907	47.230
17.062	54.965
17.216	57.539
17.268	67.859
17.371	43.339
17.680	62.680
17.784	57.515
17.990	54.925
18.093	65.243
18.144	54.918
18.454	66.518
18.557	53.610
18.866	65.210
20.619	78.038
21.753	105.086
22.216	85.711
22.268	101.193
22.526	133.440
22.784	105.042
23.918	143.702
24.588	143.674
24.845	134.630
24.948	147.529
25.103	178.490
25.206	148.808
25.361	201.705
25.361	166.866
25.619	164.274
25.876	183.618
25.928	228.777
26.031	192.644
26.134	181.026
26.186	153.928
26.392	156.499
26.546	174.557
26.701	195.196
26.701	177.131
26.753	199.064
26.907	244.219
26.907	188.735
26.959	193.894
26.959	182.281
27.010	186.150
27.216	236.464
27.320	257.105
27.577	211.932
27.784	239.020
28.144	213.198
28.505	220.925
28.660	237.692
29.072	307.352
29.433	277.659
31.959	330.453];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'AyyiEmre2014'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00759*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Turkey';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '68XL9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '7182627'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_erhani'; % Wikipedia
metaData.links.id_ADW = 'Capoeta_erhani'; % ADW
metaData.links.id_Taxo = '1803042'; % Taxonomicon
metaData.links.id_WoRMS = '1008359'; % WoRMS
metaData.links.id_fishbase = 'Paracapoeta-erhani'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_erhani}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Paracapoeta-erhani.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'AyyiEmre2014'; type = 'article'; bib = [ ...
'author = {Ayyildiz, H. and Emre Y. and Ozen, O. and Ya\v{g}c{\i}, A.}, ' ...
'year = {2014}, ' ...
'title  = {Age and growth of \emph{Capoeta erhani} ({A}ctinopterygii: {C}ypriniformes: {C}yprinidae) from the {M}enzelet {R}eservoir, {T}urkey}, ' ...
'journal = {Acta Ichthyol. Piscat.}, ' ...
'volume = {44(2)}, ' ...
'pages = {105–110}'];
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

