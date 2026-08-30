function [data, auxData, metaData, txtData, weights] = mydata_Pristolepis_grootii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Pristolepididae';
metaData.species    = 'Pristolepis_grootii'; 
metaData.species_en = 'Indonesian leaffish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 06];

%% set data
% zero-variate data

data.ab = 6.5; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 18.4;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'EmawAida2017';
  comment.Wwb = 'based on egg diameter of 0.91 mm: pi/6*0.091^3';
data.Wwp = 13.9; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01820*Lp^3.02, see F1';
data.Wwi = 120.2; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01820*Li^3.02, see F1';
 
data.Ri = 2301/365;   units.Ri = '#/d';  label.Ri = 'reproduction rate at TL 14.5 cm';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time  (d), total length (cm)
213.233	8.329
244.345	9.499
275.078	10.296
305.811	10.766
365+91.060	13.676
365+213.992	14.998
365+246.242	15.515
365+305.431	15.896];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SaweSuba2018'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
6.005	4.662
6.703	7.514
6.833	18.456
7.003	24.147
7.190	9.051
7.299	24.807
7.444	10.148
7.486	7.960
7.910	15.623
7.930	11.028
7.993	8.841
8.143	16.939
8.206	12.782
8.311	10.157
8.354	14.753
8.396	12.128
8.545	16.068
8.713	13.663
8.714	17.383
8.861	13.883
8.862	18.697
8.925	16.072
8.989	20.012
9.115	14.324
9.158	15.418
9.158	17.606
9.180	21.327
9.222	18.264
9.242	13.887
9.306	17.389
9.412	20.016
9.413	21.986
9.431	10.607
9.432	15.202
9.520	29.864
9.538	16.516
9.582	22.425
9.623	18.706
9.666	21.332
9.688	24.177
9.689	28.334
9.771	18.051
9.772	22.427
9.811	8.204
9.814	19.583
9.942	27.243
9.943	32.495
9.962	21.116
9.963	24.180
10.025	18.272
10.044	10.395
10.110	19.149
10.174	22.431
10.176	32.060
10.176	34.029
10.195	24.182
10.217	28.121
10.299	12.586
10.364	20.902
10.385	22.871
10.407	25.279
10.429	29.874
10.469	19.371
10.492	27.249
10.557	33.814
10.639	23.093
10.640	28.782
10.641	31.627
10.681	21.124
10.703	26.595
10.829	23.533
10.851	25.940
10.917	37.757
10.936	28.348
10.958	30.099
10.979	33.162
10.981	41.915
10.998	21.128
10.999	25.066
11.043	34.257
11.126	24.192
11.147	27.256
11.167	20.254
11.169	28.132
11.190	30.320
11.212	32.071
11.212	33.384
11.231	24.631
11.277	40.387
11.338	27.915
11.358	22.226
11.423	30.760
11.424	34.043
11.449	54.174
11.463	21.133
11.467	37.106
11.485	23.540
11.507	28.135
11.571	32.950
11.593	35.795
11.655	27.262
11.656	32.732
11.696	23.980
11.719	30.326
11.784	39.517
11.785	43.674
11.868	36.017
11.868	37.986
11.973	33.830
11.996	41.270
12.018	46.959
12.080	37.988
12.098	22.890
12.122	34.925
12.186	40.178
12.187	43.898
12.207	37.990
12.315	48.275
12.334	39.961
12.377	42.149
12.378	46.088
12.504	44.558
12.567	40.838
12.568	47.622
12.588	39.526
12.714	36.901
12.715	43.685
12.777	34.714
12.799	39.966
12.800	46.311
12.842	44.561
12.843	47.844
12.950	53.534
12.972	57.035
13.033	44.563
13.184	59.445
13.225	52.443
13.308	49.380
13.395	56.821
13.438	62.073
13.500	54.853
13.542	52.228
13.543	59.230
13.669	53.542
13.691	58.794
13.776	61.858
13.838	55.076
13.863	70.831
13.881	57.264
13.897	34.288
13.964	51.138
14.009	64.268
14.221	63.395
14.242	65.802
14.327	67.116
14.496	64.930
14.498	76.527
14.729	69.090
15.041	42.178
15.175	78.066
15.260	81.568
15.302	79.599
15.495	90.980
15.549	48.748
15.663	87.262
15.982	94.049];
units.LW   = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'SaweSuba2018'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'maels are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01820*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MK6G'; % Cat of Life
metaData.links.id_ITIS = '645953'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pristolepis_grootii'; % Wikipedia
metaData.links.id_ADW = 'Pristolepis_grootii'; % ADW
metaData.links.id_Taxo = '184771'; % Taxonomicon
metaData.links.id_WoRMS = '1418689'; % WoRMS
metaData.links.id_fishbase = 'Pristolepis-grootii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristolepis_grootii}}';
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
bibkey = 'SaweSuba2018'; type = 'Article'; bib = [ ... 
'doi = {10.15578/ifrj.23.2.2017.125-131}, ' ...
'author = {Sevi Sawestri and Subagdja and Dina Muthmainnah}, ' ... 
'year = {2018}, ' ...
'title = {POPULATION DYNAMICS OF {M}ALAYAN  \emph{(Pristolepis grooti} {B}lkr.) IN {R}ANAU {L}AKE, SOUTH {S}UMATERA}, ' ...
'journal = {Indonesian Fisheries Research Journal (IFRJ)}, ' ...
'volume = {24(2)}, ' ...
'pages = {125-131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EmawAida2017'; type = 'Article'; bib = [ ... 
'doi = {10.32491/jii.v9i1.196}, ' ...
'author = {Emawati, Y. and Aida, S. and Juwaini, H}, ' ... 
'year = {2017}, ' ...
'title = {Reproductive biology of {I}ndonesian leaffish, \emph{Pristolepis grootii}, {B}lkr. 1852 ({N}andidae) in {M}usi {R}iver}, ' ...
'journal = {Jurnal Iktiologi Indonesia}, ' ...
'volume = {9(1)}, ' ...
'pages = {13-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pristolepis-grootii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

