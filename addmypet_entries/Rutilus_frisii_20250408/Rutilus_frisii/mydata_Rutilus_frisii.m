  function [data, auxData, metaData, txtData, weights] = mydata_Rutilus_frisii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rutilus_frisii'; 
metaData.species_en = 'Kutum'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 08];

%% set data
% zero-variate data
data.ab = 14;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Rutilus rutilus';
data.am = 12*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 33;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'FazlAfra2013'; 
data.Li = 70;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'Laak2010';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.2 mm of Rutilus rutilus: 4/3*pi*0.06^3';
data.Wwp = 409;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'FazlAfra2013','fishbase'};
  comment.Wwp = 'Based on 0.00832*Lp^3.09, see F1';
data.Wwi = 4183; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Laak2010';
  comment.Wwi = 'Based on 0.00832*Li^3.09, see F1; max. published weight: 8.0 kg ';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm assumed, mm is given)
 2	27.793
 3	35.725
 4	45.320
 5	52.100
 6	53.507
 7	55.938
 8	56.834
12	70.394];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bold2022';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
34.046	36832.690
34.128	19483.787
34.316	39243.958
34.492	31534.176
34.944	37801.957
35.130	52260.909
35.203	14189.058
35.209	28646.929
35.753	38288.754
35.924	19494.604
35.934	41663.339
36.029	53230.176
36.377	30099.747
36.741	39740.491
36.835	50343.470
36.918	35404.212
37.376	53720.219
37.733	50348.879
37.820	44566.272
38.365	58063.529
38.451	49871.277
38.717	41680.107
38.996	62404.677
39.075	38308.767
39.168	46502.101
39.174	58550.326
39.440	52286.872
39.714	61445.146
39.787	24337.153
40.061	35905.072
40.067	48917.155
40.070	55182.232
40.425	45545.815
40.614	67233.703
40.699	57595.663
41.228	34948.245
41.317	33502.999
41.326	52780.160
41.419	60491.565
41.421	64346.997
41.424	70612.074
41.588	35914.267
41.683	47481.104
41.694	73023.342
41.959	62904.455
41.963	71579.177
42.051	67242.357
42.306	36882.452
42.315	57123.470
42.319	65798.193
42.505	80257.145
42.683	75438.936
42.854	57126.716
43.026	40742.211
43.210	48936.086
43.220	72550.608
43.229	91345.839
43.407	87973.418
43.480	50865.425
43.933	60988.638
43.940	76410.367
43.945	86048.947
44.378	50870.834
44.389	75931.142
44.474	66293.103
44.477	72076.251
44.561	58100.851
44.829	55692.828
44.839	77379.634
44.917	51356.008
45.005	47501.117
45.379	81720.240
45.387	98587.756
45.459	59552.046
45.554	71118.884
45.648	80758.005
45.910	63410.183
45.992	47025.137
46.089	62929.336
46.366	79798.474
46.368	85099.693
46.372	92810.557
46.543	73534.479
46.627	61004.865
46.815	78837.320
46.818	87512.043
46.900	69681.210
46.911	93777.661
46.988	64862.461
47.093	98116.104
47.168	67273.188
47.173	76911.768
47.256	61490.580
47.270	92815.966
47.361	95708.081
47.369	113539.455
47.538	90407.944
47.612	54745.738
47.983	82699.784
48.068	70652.099
48.444	109208.584
48.612	81739.712
48.618	96679.512
48.680	33547.352
48.695	67282.383
48.780	57644.343
48.883	85596.767
48.992	129452.848
49.059	77886.984
49.167	118369.563
49.412	63913.207
49.533	134275.384
49.861	64397.840
49.959	82711.683
49.961	88012.903
50.042	67290.496
50.241	112110.976
50.332	115003.091
50.427	124642.212
50.960	113079.161
51.037	84645.890
51.041	92838.683
51.042	95730.257
51.204	57177.018
51.323	122237.976
51.392	75009.473
51.948	113085.111
51.952	123205.620
52.030	97181.994
52.047	135254.386
52.124	105375.328
52.212	101038.508
52.309	116942.706
53.094	66345.028
53.831	107313.321
54.094	94784.790
54.105	117435.453
54.281	109725.671
55.092	117923.332
56.978	117934.691
57.171	148297.300
57.333	108298.274
57.341	125647.718
58.064	136254.484
59.044	119392.918
60.301	120364.348
60.306	130966.787
60.579	139161.203
63.625	123275.935
63.643	164239.901
63.728	154119.933
66.793	181126.348
66.970	175826.211
69.829	144036.204];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'FazlAfra2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Sierakowo, Blotno, Wickie Lake'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00832*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Black and Azov Sea basins';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '639648'; % Cat of Life
metaData.links.id_ITIS = '639648'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Rutilus_frisii'; % Wikipedia
metaData.links.id_ADW = 'Rutilus_frisii'; % ADW
metaData.links.id_Taxo = '43671'; % Taxonomicon
metaData.links.id_WoRMS = '275346'; % WoRMS
metaData.links.id_fishbase = 'Rutilus-frisii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rutilus_frisii}}';  
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
bibkey = 'Bold2022'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945222030018}, ' ...
'author = {V. S. Boldyrev}, ' ...
'year = {2022}, ' ...
'title = {Life Strategies of Vyrezub \emph{Rutilus frisii} ({C}yprinidae) in the {B}lack Sea {B}asin}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {62(3)}, '...
'pages = {446–456}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FazlAfra2013'; type = 'Article'; bib = [ ... 
'doi = {10.1080/09397140.2013.795065}, ' ...
'author = {Fazli, H. and Afraei Bandpei, M. A. and Pourgholam, R. and Roohi, A.}, ' ...
'year = {2013}, ' ...
'title = {Long-term changes in fecundity of the Kutum, \emph{Rutilus frisii kutum} {K}amensky, 1901, in the {C}aspian {S}ea ({O}steichthyes: {C}yprinidae)}, ' ... 
'journal = {Zoology in the Middle East}, ' ...
'volume = {59(1)}, '...
'pages = {51–58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rutilus-frisii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

