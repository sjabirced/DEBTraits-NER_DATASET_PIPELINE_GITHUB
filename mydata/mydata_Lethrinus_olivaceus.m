function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_olivaceus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_olivaceus'; 
metaData.species_en = 'Longface emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Shim2021';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 50; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 1791;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01549*Lp^2.98, see F1';
data.Wwi = 14127;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^2.98, see F1; max. published weight: 14 kg';

data.GSI  = 0.12;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.059	29.365
1.233	30.263
1.546	26.680
1.548	30.938
1.581	28.697
1.616	27.801
1.619	34.076
1.760	37.663
1.792	31.612
1.863	34.526
1.964	26.460
1.965	27.804
2.037	34.976
2.178	37.890
2.317	36.323
2.354	41.253
2.386	34.083
2.419	31.170
2.494	43.047
2.496	45.960
2.526	35.877
2.841	39.465
2.878	42.603
2.881	50.446
2.910	37.673
2.944	34.088
2.944	35.432
2.948	44.620
2.950	47.757
3.156	41.485
3.193	47.311
3.295	39.693
3.331	43.727
3.614	52.693
3.715	44.403
4.000	57.178
4.167	41.270
4.169	46.424
4.205	47.544
4.487	54.270
4.588	47.324
4.657	45.532
4.835	52.928
4.974	51.585
5.184	54.276
5.325	57.414
5.848	58.315
5.881	53.610
6.094	62.799
6.685	59.219
7.071	63.256
7.071	64.825
8.049	68.643
8.082	63.714
8.113	55.647
8.120	71.109
8.428	56.770
9.861	64.626
10.419	66.200
10.909	69.565
11.084	71.584
12.062	74.730
16.281	76.336
16.349	71.855
16.735	78.133
18.478	75.684];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(27.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shim2021'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.283	38.564
2.459	41.926
2.492	38.790
2.563	40.807
2.597	37.670
2.808	43.050
2.879	45.964
3.085	39.019
3.650	54.710
3.718	50.677
4.449	48.667
4.662	57.857
4.837	58.979
6.860	60.117
7.073	67.738
7.805	67.521
7.907	62.367
7.941	61.023
9.061	69.773
9.199	67.309
9.757	67.314
9.967	67.540
10.699	67.995
11.012	65.981
11.188	70.912
12.130	71.817
12.303	67.785
12.685	64.875
13.037	72.722
13.139	67.344
13.280	69.587
13.317	73.845
14.150	65.785
14.253	62.424
15.963	66.697
16.035	71.180
17.289	67.382
19.068	70.087
20.046	73.009
21.650	73.247
21.962	70.113
22.208	73.924];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(27.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shim2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 5 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01549*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72326'; % Cat of Life
metaData.links.id_ITIS = '550908'; % ITIS
metaData.links.id_EoL = '46580943'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_olivaceus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_olivaceus'; % ADW
metaData.links.id_Taxo = '178747'; % Taxonomicon
metaData.links.id_WoRMS = '212069'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-olivaceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_olivaceus}}';
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
bibkey = 'Shim2021'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-021-01069-9}, ' ...
'author = {Shimose, T.}, ' ... 
'year = {2021}, ' ...
'title = {Age, growth, and reproductive traits of two large emperor fishes, \emph{Lethrinus olivaceus} and \emph{L. xanthochilus}, around {Y}aeyama {I}slands, {O}kinawa, southern {Ja}pan}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {104(2)}, ' ...
'pages = {181–194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-olivaceus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
