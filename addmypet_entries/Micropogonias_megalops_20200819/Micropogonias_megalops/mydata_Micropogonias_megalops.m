function [data, auxData, metaData, txtData, weights] = mydata_Micropogonias_megalops
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Micropogonias_megalops'; 
metaData.species_en = 'Bigeye croaker'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 19]; 

%% set data
% zero-variate data

data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishesoftexas';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'guess'; 
data.Li  = 40;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';
data.Wwp = 47.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00575*Lp^3.12, see F1';
data.Wwi = 573;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.12, see F1';

data.GSI = 0.07 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female'; bibkey.GSI = 'guess'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Micropogonias undulatus';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
0.941	28.959
0.977	26.923
0.978	25.792
0.980	22.398
0.981	20.588
0.982	19.457
0.983	18.477
0.986	14.781
0.987	14.103
1.015	21.493
1.019	16.139
1.045	28.281
1.046	26.471
1.048	24.434
1.054	15.535
1.055	13.499
1.835	27.677
1.836	26.923
1.876	17.722
1.903	28.733
1.904	28.356
1.905	25.792
1.906	25.264
1.907	22.323
1.908	21.870
1.909	21.041
1.910	20.588
1.911	19.834
1.912	19.683
1.934	33.861
1.937	29.638
1.938	29.110
1.942	20.890
1.943	20.211
1.944	19.155
1.945	16.667
1.946	16.440
1.967	34.917
1.970	30.618
1.974	25.264
1.975	23.982
1.976	22.926
1.977	21.569
1.979	18.100
2.000	37.179
2.001	36.275
2.012	19.457
2.013	18.326
2.014	16.968
2.042	26.169
2.043	24.736
2.047	18.627
2.048	17.421
2.069	37.557
2.076	26.471
2.929	35.219
2.935	25.641
2.959	41.026
2.960	40.121
2.961	38.235
2.962	37.557
2.963	36.576
2.965	31.674
2.968	27.376
2.969	27.149
2.970	24.736
2.996	36.802
2.997	35.897
2.998	34.615
2.999	34.087
3.000	33.409
3.001	33.107
3.002	27.903
3.003	26.848
3.030	37.104
3.034	30.694
3.035	29.940
3.036	29.110
3.037	28.658
3.038	28.205
3.039	26.320
3.040	24.133
3.065	36.275
3.925	34.087
3.926	32.428
3.954	41.780
3.955	41.327
3.988	42.232
3.989	40.875
3.990	40.196
3.991	39.744
3.992	38.989
3.993	37.481
3.994	37.029
4.022	42.534
4.024	39.442
4.027	36.199
4.030	31.825
4.056	43.137
4.060	38.084
4.061	35.747
4.066	28.507
4.917	39.744
4.948	43.288
4.949	42.911
4.952	39.140
4.980	47.587
4.983	43.816
4.984	41.931
4.985	41.629
4.986	40.724
4.987	40.422
4.988	40.196
4.990	33.183
5.020	39.442
5.090	38.009
5.948	38.839
5.977	45.023
5.978	44.268
5.979	43.891
5.980	42.006
5.981	40.573
5.982	39.517
5.983	38.235
6.016	37.783
6.017	37.104
6.049	41.101
6.080	45.400
6.087	36.124
6.938	45.400
6.939	44.721
6.974	44.570
6.975	42.157
6.978	38.989
7.010	41.478
7.043	44.118
7.940	37.557
7.968	46.003
7.971	41.629
7.973	39.517
8.004	43.741
8.011	33.484
8.038	44.495
8.041	40.799
8.071	46.531
8.900	39.668
8.929	47.436
8.932	42.232
8.969	38.612
8.999	44.570
9.072	39.065
10.030	44.118
10.031	42.006
10.956	45.173
10.992	42.534
11.023	47.436
11.058	46.531
11.952	45.173
11.985	47.436
11.988	42.685
12.018	49.170
12.024	40.573
12.122	47.964
13.083	47.964
15.006	46.908
16.106	45.852];
data.tL_f(:,1) = (0.3 + data.tL_f(:,1))*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AragAlca2015';
%
data.tL_m = [ ... % time since birth (d), total length (cm)
0.937	24.085
0.970	19.397
1.054	27.665
1.950	21.607
1.951	20.630
1.952	19.328
1.953	17.570
1.954	16.594
1.955	16.138
1.977	25.773
1.980	20.304
1.983	15.747
2.010	20.890
2.011	18.742
2.012	17.179
2.034	29.419
2.035	28.833
2.036	28.182
2.037	26.554
2.039	22.453
2.041	17.830
2.063	31.111
2.064	29.093
2.066	26.163
2.067	25.252
2.069	19.653
2.070	19.067
2.071	18.221
2.131	17.439
2.896	31.434
2.951	38.139
2.952	36.251
2.953	34.689
2.954	33.256
2.960	23.751
2.979	40.873
2.982	36.902
2.983	35.470
2.985	31.824
3.010	39.050
3.011	38.529
3.013	33.777
3.018	26.160
3.041	37.488
3.044	32.540
3.048	24.922
3.071	36.576
3.101	35.990
3.902	40.284
3.930	42.041
3.931	39.828
3.932	38.526
3.934	36.507
3.962	39.437
3.965	33.968
3.966	32.210
3.990	40.999
3.992	37.874
3.994	35.726
4.021	37.419
4.022	37.288
4.023	36.116
4.024	35.140
4.025	34.163
4.055	32.731
4.082	36.963
4.885	37.741
4.886	34.616
4.913	40.214
4.914	39.628
4.943	38.912
4.944	38.066
4.945	37.089
4.946	36.634
4.970	43.600
4.972	40.735
4.973	38.456
4.974	37.415
4.975	35.982
4.977	32.988
4.978	30.644
5.000	43.014
5.002	40.995
5.005	35.527
5.006	33.964
5.032	39.172
5.034	36.177
5.924	39.689
5.925	38.713
5.926	37.085
5.952	43.661
5.953	42.098
5.954	38.192
5.955	37.606
5.956	36.695
5.957	36.369
5.958	36.043
5.959	35.653
5.983	41.252
5.984	40.015
5.985	39.885
5.986	39.038
6.013	40.601
6.018	33.048
6.874	42.029
6.875	41.118
6.906	39.620
6.907	39.034
6.935	40.206
6.966	37.472
6.967	37.081
6.968	36.039
7.026	38.057
7.027	36.430
7.861	34.017
7.886	40.463
7.887	40.072
7.888	38.705
7.916	41.765
7.917	39.486
7.944	43.392
7.945	43.067
7.947	39.030
7.948	37.077
7.950	34.603
7.972	47.168
8.004	42.611
8.007	38.249
8.008	37.728
8.929	37.854
8.930	36.096
8.955	44.625
8.956	44.169
8.957	39.091
8.958	38.635
8.959	37.594
8.986	41.695
8.987	41.305
9.877	44.100
9.908	42.733
9.909	41.236
9.936	45.012
10.917	45.398
10.949	42.078
11.868	47.087
11.899	45.524
11.958	46.110
11.960	41.944
12.882	42.461
14.931	47.140
15.944	43.620];
data.tL_m(:,1) = (0.3 + data.tL_m(:,1))*365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AragAlca2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00575*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.84*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4343H'; % Cat of Life
metaData.links.id_ITIS = '646639'; % ITIS
metaData.links.id_EoL = '46578966'; % Ency of Life
metaData.links.id_Wiki = 'Micropogonias'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '180095'; % Taxonomicon
metaData.links.id_WoRMS = '275309'; % WoRMS
metaData.links.id_fishbase = 'Micropogonias-megalops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropogonias_undulatus}}';
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
bibkey = 'AragAlca2015'; type = 'Article'; bib = [ ... 
'author = {E. Alberto Arag\''{o}n-Noriega and Edgar Alc\''{a}ntara-Razo and Wenceslao Valenzuela-Qui\~{n}\''{o}nez and Gerardo Rodríguez-Quiroz}, ' ... 
'year = {2015}, ' ...
'title = {Multi-model inference for growth parameter estimation of the Bigeye Croaker \emph{Micropogonias megalops} in the Upper {G}ulf of {C}alifornia}, ' ...
'journal = {Revista de Biología Marina y Oceanografía}, ' ...
'volume = {50(1)}, ' ...
'pages = {25-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Micropogonias-megalops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
