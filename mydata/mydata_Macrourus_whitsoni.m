function [data, auxData, metaData, txtData, weights] = mydata_Macrourus_whitsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Macrourus_whitsoni'; 
metaData.species_en = 'Whitson''s grenadier'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 4.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 06];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'PinkMcMi2013';   
  temp.am = C2K(4.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 46;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PinkMcMi2013'; 
data.Li  = 84;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm for Coryphaenoides rupestris: pi/6*0.26^3';
data.Wwp = 435;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'PinkMcMi2013','fishbase'};
  comment.Wwp = 'baseed on 0.00200*Lp^3.21, see F1';
data.Wwi = 3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'baseed on 0.00200*Li^3.21, see F1;max. published weight: 5.1 kg';

data.Ri  = 3.7e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(2.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Macrourus_carinatus: 79221*3000/6450';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
6.005	37.823
7.011	36.975
7.884	47.554
9.033	45.414
9.893	41.976
9.967	44.349
9.968	45.212
10.043	48.232
10.044	49.525
10.046	52.329
10.686	43.497
10.900	41.128
10.900	41.775
10.904	45.872
10.978	48.029
10.979	49.108
10.984	54.714
11.848	55.805
11.906	39.633
11.913	48.259
11.916	51.277
11.984	46.534
12.055	45.673
12.773	44.174
12.773	44.390
12.780	52.152
12.850	49.781
12.914	41.157
12.934	63.152
12.987	42.668
12.990	45.471
12.991	46.765
13.922	42.465
13.996	44.407
14.000	48.504
14.005	54.542
14.006	55.189
14.008	57.992
14.076	53.249
14.147	51.741
14.217	50.232
14.865	50.889
14.929	41.617
14.931	44.421
14.932	45.283
14.935	48.302
14.936	49.380
14.940	53.909
14.941	55.418
15.006	47.009
15.010	52.184
15.019	61.672
15.087	57.792
15.149	45.933
15.733	55.861
15.806	57.155
15.936	41.632
15.951	58.236
15.956	63.195
16.009	43.142
16.013	47.024
16.017	51.121
16.018	52.199
16.019	53.493
16.156	46.594
16.948	46.390
16.949	48.115
16.950	48.547
17.019	45.529
17.029	56.526
17.030	58.251
17.098	53.077
17.098	54.155
17.099	55.018
17.104	59.762
17.825	62.144
17.886	49.638
17.887	50.932
18.034	54.169
18.035	55.894
18.108	56.757
18.109	58.267
18.110	59.345
18.826	55.043
18.830	59.787
18.835	65.609
18.895	51.809
18.896	52.887
18.899	56.553
18.966	50.516
19.893	41.473
19.894	42.767
19.905	55.058
19.967	44.493
19.969	46.218
20.047	53.119
20.123	57.649
20.125	59.805
20.769	55.286
20.770	57.442
20.777	64.990
20.840	54.209
20.845	60.031
20.918	61.757
20.978	48.389
21.052	50.115
21.779	59.398
21.780	60.476
21.839	45.814
21.914	48.618
21.929	65.653
21.991	54.226
22.133	52.934
22.858	58.766
22.925	53.376
22.928	56.180
22.932	60.924
22.933	62.649
22.998	54.456
23.930	50.372
24.154	60.294
24.865	50.601
24.945	59.228
25.085	55.564
25.949	56.007
25.954	61.614
26.097	60.107
27.104	60.337];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(4.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PinkMcMi2013';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
6.966	34.455
10.026	45.455
10.937	43.983
11.784	43.439
11.784	44.367
11.784	48.452
12.956	48.841
12.956	44.199
12.956	43.085
13.867	44.584
13.932	46.627
14.779	44.783
14.779	43.483
14.779	42.369
15.169	48.316
15.690	47.767
15.690	46.839
15.820	50.926
16.797	53.168
16.927	50.756
17.839	49.285
17.969	50.586
18.815	45.771
18.945	47.073
19.792	48.942
19.857	44.673
20.833	59.356
21.029	47.661
22.852	58.271
22.917	45.461
23.893	44.733
24.023	46.406
24.089	53.834];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(4.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PinkMcMi2013';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
34.333	167.523
36.750	269.951
37.250	288.564
38.833	232.242
39.667	260.150
39.833	325.545
40.417	418.912
41.833	278.504
42.333	250.389
43.167	306.334
43.750	240.823
44.917	352.791
45.500	287.279
46.000	343.276
47.000	445.924
47.167	408.515
47.833	380.373
48.167	427.050
48.917	483.008
50.417	548.195
51.167	622.845
51.750	519.950
52.000	575.986
53.083	566.472
53.667	622.455
54.750	556.866
54.750	669.016
56.250	650.091
56.417	771.560
57.167	780.789
57.417	715.329
57.667	668.561
57.667	649.870
58.167	818.016
58.583	715.147
59.333	808.489
59.667	705.633
59.750	929.919
60.333	649.455
60.833	836.293
60.917	967.120
61.667	1013.733
61.750	733.346
62.833	1004.206
63.000	1237.824
65.000	1125.363];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'PinkMcMi2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;
weights.am = 3 * weights.am;

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';     
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00200*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southern Ocean: Circumpolar (generally confined inside the Convergence except in the Falkland Islands area)';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3XCWD'; % Cat of Life
metaData.links.id_ITIS = '623031'; % ITIS
metaData.links.id_EoL = '46564613'; % Ency of Life
metaData.links.id_Wiki = 'Macrourus'; % Wikipedia
metaData.links.id_ADW = 'Macrourus_whitsoni'; % ADW
metaData.links.id_Taxo = '179488'; % Taxonomicon
metaData.links.id_WoRMS = '234606'; % WoRMS
metaData.links.id_fishbase = 'Macrourus_whitsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrourus}}';
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
bibkey = 'PinkMcMi2013'; type = 'Article'; bib = [ ... 
'author = {M.H. Pinkerton and P. McMillan and J. Forman and P. Marriott and P. Horn and S. Bury and J. Brown}, ' ... 
'year = {2013}, ' ...
'title = {DistrIbutIon, morphology anD ecology of \emph{Macrourus whitsoni} anD \emph{M. caml} ({G}aDIformes, {M}acrourIDae) In the {R}oss {S}ea regIon}, ' ...
'journal = {CCAMLR Science}, ' ...
'volume = {20}, ' ...
'pages = {37–61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macrourus_whitsoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

