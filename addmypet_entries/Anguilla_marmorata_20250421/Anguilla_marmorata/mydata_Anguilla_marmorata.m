  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_marmorata

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_marmorata'; 
metaData.species_en = 'Giant mottled eel'; 

metaData.ecoCode.climate = {'MB', 'Cfb'};
metaData.ecoCode.ecozone = {'MPW', 'THp'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'as'; 'am'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data
data.ts = 120; units.ts = 'd';    label.ts = 'time since birth at end leptocephalus stage';  bibkey.ts = 'guess';   
  temp.ts = C2K(24.5); units.temp.ts = 'K'; label.temp.ts = 'temperature';
  comment.ts = 'based on Anguilla_japonica';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ls = 6;     units.Ls = 'cm';   label.Ls = 'total length at end leptocephalus stage'; bibkey.Ls = 'guess';
  comment.Ls = 'based on Anguilla_japonica';
data.Lp = 70;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 200;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 70;    units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 5.3e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm for Anguila anguilla: pi/6*0.1^3';
data.Wwp = 451;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00102*Lp^3.06, see F1';
data.Wwi = 11.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00102*Li^3.06, see F1; max. published weight: 20.5 kg';
  
data.GSI  = 0.03; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';      bibkey.GSI  = 'KitaTach2020';   
  temp.GSI = C2K(24.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % age (d), length (cm)
5.078	71.134
5.107	43.701
5.153	57.843
6.049	39.768
6.818	55.628
7.009	67.512
7.085	45.454
7.104	74.020
7.106	64.121
8.045	76.026
8.045	73.198
8.094	68.391
8.095	62.169
8.096	58.775
8.097	50.856
8.116	82.250
8.215	71.223
8.942	48.052
9.008	89.346
9.054	99.247
9.057	83.691
9.058	74.924
9.059	72.095
9.060	67.853
9.060	65.307
9.082	77.470
9.085	61.066
9.088	44.379
9.088	41.833
10.073	67.599
10.074	63.356
10.092	97.013
10.092	94.751
10.093	91.074
10.098	60.812
10.117	89.095
10.118	82.873
10.143	81.176
10.143	79.479
10.145	70.146
11.012	80.353
11.013	73.282
11.013	72.151
11.059	86.293
11.078	113.162
11.083	87.708
11.110	67.628
11.110	66.214
11.128	106.093
11.128	101.851
11.130	94.780
11.154	93.649
11.179	91.388
12.094	97.070
12.095	95.090
12.096	87.737
12.098	74.444
12.121	84.909
12.121	82.081
12.122	77.838
12.123	70.768
13.012	89.177
13.041	64.572
13.064	72.491
13.084	95.967
13.084	91.441
13.086	83.522
13.087	78.714
13.106	107.846
13.107	101.907
13.108	94.553
13.110	80.412
13.113	66.553
13.130	104.736
13.134	85.503
14.072	101.368
14.073	94.298
14.093	120.318
14.123	82.703
14.124	78.178
14.150	70.259
14.168	105.896
15.111	89.519
15.112	84.145
15.126	143.822
15.133	103.378
15.162	74.248
16.054	79.647
16.096	117.830
16.097	109.345
16.123	100.861
16.127	75.123
17.115	79.677
17.137	96.647
17.140	74.869
17.160	100.607
19.090	102.359
19.110	124.137
19.141	87.370
20.149	117.661];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(24.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KitaTach2020';
%
data.tL_m = [ ... % age (d), length (cm)
0.023	9.052
0.023	8.486
0.023	6.789
0.963	11.907
0.963	10.210
0.964	9.078
0.987	13.887
2.000	13.067
2.891	26.103
2.917	11.113
2.962	29.499
2.963	24.973
2.988	22.429
2.988	18.186
3.012	20.732
3.876	49.605
3.899	54.697
3.929	20.758
3.952	26.415
4.001	23.871
4.888	53.028
4.938	47.655
4.987	39.455
4.989	28.142
4.990	21.071
5.013	27.011
5.037	30.971
5.830	50.792
5.854	47.681
5.856	39.479
5.877	58.712
5.877	58.147
5.879	45.985
5.929	31.562
6.866	58.740
6.869	40.357
6.889	61.569
6.890	56.478
6.893	38.943
6.894	36.963
6.915	53.368
6.917	42.903
6.940	50.258
6.940	47.146
7.855	58.203
7.855	56.789
7.880	50.567
7.881	46.890
7.881	44.910
7.882	41.517
7.903	59.901
7.927	62.730
7.952	52.832
8.847	40.695
8.868	58.797
8.892	60.777
8.893	56.818
8.895	42.394
8.915	65.021
8.916	62.758
8.917	53.990
8.919	45.505
8.942	52.011
8.942	47.486
8.963	66.153
9.810	52.319
9.835	47.228
9.881	61.088
9.903	70.705
9.930	55.999
9.930	54.585
9.931	50.342
9.933	40.726
10.869	65.359
10.895	54.895
10.896	48.673
10.919	58.855
10.919	56.592
10.942	61.401
10.944	52.351
10.945	46.977
11.787	58.880
11.907	61.428
11.908	56.337
11.908	55.772
11.909	51.812
11.959	41.632
12.921	60.609
12.945	58.347
12.946	54.670
12.947	51.276
12.948	43.640
12.969	63.438
12.972	45.903
12.995	47.883];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(24.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KitaTach2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'leptocephalus info taken from Anguilla anguilla';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00102*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: East Africa, inland Mozambique and lower Zambezi River to French Polynesia, north to southern Japan. Also rivers of Madagascar and adjacent islands';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '66R6D'; % Cat of Life
metaData.links.id_ITIS = '161135'; % ITIS
metaData.links.id_EoL = '46561253'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_marmorata'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_marmorata'; % ADW
metaData.links.id_Taxo = '160965'; % Taxonomicon
metaData.links.id_WoRMS = '217457'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-marmorata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla_marmorata}}';  
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
bibkey = 'KitaTach2020'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s10641-020-00994-5}, ' ...
'author = {Kita, T. and Tachihara, K.}, ' ...
'year = {2020}, ' ...
'title = {Age, growth, and gonadal condition of the Giant mottled eel, \emph{Anguilla marmorata}, in {O}kinawa-{J}ima {I}sland, {J}apan}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {103}, '...
'pages = {927–938}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anguilla-marmorata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


