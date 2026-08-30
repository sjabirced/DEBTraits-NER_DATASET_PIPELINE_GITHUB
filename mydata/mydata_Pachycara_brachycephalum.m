function [data, auxData, metaData, txtData, weights] = mydata_Pachycara_brachycephalum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Pachycara_brachycephalum'; 
metaData.species_en = 'Shorthead eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 25];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'BrodKnus2006';   
  temp.am = C2K(-0.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 36;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 0.27;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'BrodKnus2006';
  comment.Wwb = 'based on egg diameter of 8 mm: pi/6*0.8^3';
data.Wwp = 65.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'}; 
  comment.Wwp= 'based on 0.01000*Lp^3.04, see F1';
data.Wwi = 538;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.Ri  = 165/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'BrodKnus2006';   
  temp.Ri = C2K(-0.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.974	14.708
2.995	20.251
2.997	15.724
3.021	16.648
3.022	15.355
3.044	18.126
3.141	17.296
3.908	22.012
3.909	19.795
3.911	15.915
3.957	19.426
3.958	17.670
3.961	14.068
3.982	18.872
3.983	16.839
3.985	14.345
4.921	17.584
4.966	21.465
4.970	16.384
4.971	16.014
4.989	24.051
4.991	20.726
4.992	19.987
4.993	18.139
4.994	16.754
5.016	19.340
5.038	22.297
5.953	20.825
5.954	20.178
5.975	24.335
5.976	22.210
6.000	23.596
6.001	22.950
6.003	18.053
6.963	21.478
6.964	19.261
6.965	18.060
6.984	26.374
6.986	23.880
7.009	25.081
7.011	21.848
7.012	20.370
7.923	24.717
7.972	23.332
7.998	20.561
7.999	19.914
8.018	26.843
8.021	21.854
8.983	21.768
8.984	20.290
10.017	23.715
11.937	30.841
13.978	36.212];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(-0.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrodKnus2006'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.971	19.142
3.978	25.061
4.052	21.551
4.053	21.089
4.964	25.345
5.037	24.883
5.064	19.987
5.544	20.729
5.998	26.275
5.999	25.167
6.028	16.945
6.478	27.941
6.961	24.896
7.010	23.233
7.056	27.114
7.058	22.864
7.899	25.456
7.994	27.212
8.023	18.806
8.596	25.553
8.907	28.789
8.980	27.034
9.028	27.681
10.010	34.431
10.016	25.470
10.086	28.334];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(-0.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrodKnus2006'; 

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
3.010	28.456
3.011	20.714
3.012	12.327
3.037	10.392
3.110	6.845
3.132	16.846
3.998	17.511
4.023	11.382
4.068	28.480
4.071	8.803
4.072	7.512
4.095	14.287
4.117	24.610
4.118	19.772
4.163	34.611
4.164	30.740
4.983	22.050
5.027	47.857
5.029	34.954
5.030	31.405
5.033	15.599
5.034	12.051
5.055	26.890
5.076	41.729
5.077	38.181
5.078	36.568
5.103	24.633
5.123	49.472
5.128	19.472
5.129	14.311
5.146	56.569
5.990	43.040
5.993	24.331
6.013	46.912
6.015	36.912
6.016	32.396
6.038	45.300
6.040	34.332
6.041	29.816
6.042	20.784
6.060	53.687
6.061	49.171
6.086	38.527
6.087	35.946
6.088	32.075
6.089	26.914
6.090	23.043
6.111	40.140
6.615	47.894
6.923	72.094
6.979	27.257
7.000	46.935
7.023	52.742
7.026	31.129
7.049	38.549
7.050	35.646
7.051	28.549
7.069	63.065
7.073	39.517
7.074	32.743
7.096	44.356
7.124	25.647
8.010	47.281
8.037	28.572
8.059	39.217
8.061	30.830
8.102	73.089
8.105	55.670
9.000	27.303
9.021	42.788
9.046	39.563
9.064	74.724
10.079	44.102
12.039	118.341
14.035	119.355];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f   = C2K(-0.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BrodKnus2006'; 
%
data.tW_m = [ ... % time since birth (yr), weight (g)
3.035	22.972
3.154	30.394
4.020	26.543
4.022	18.156
4.135	58.159
5.030	29.793
5.074	53.665
5.075	45.923
5.081	15.278
5.097	58.504
5.130	11.085
5.558	34.643
6.081	72.075
6.084	55.623
6.113	28.527
6.114	19.818
6.564	64.344
6.975	48.870
6.996	70.160
7.021	60.806
7.022	55.322
7.023	51.129
7.067	76.291
7.070	58.227
8.006	70.506
8.007	62.119
8.086	26.960
8.538	52.454
9.014	80.852
9.086	83.757
10.071	89.586
10.076	61.199];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m   = C2K(-0.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BrodKnus2006'; 
    
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BQ7P'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46574933'; % Ency of Life
metaData.links.id_Wiki = 'Pachycara'; % Wikipedia
metaData.links.id_ADW = 'Pachycara_brachycephalum'; % ADW
metaData.links.id_Taxo = '182450'; % Taxonomicon
metaData.links.id_WoRMS = '234688'; % WoRMS
metaData.links.id_fishbase = 'Pachycara-brachycephalum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachycara}}';
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
bibkey = 'BrodKnus2006'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2006.02.011}, ' ...
'author = {E. Brodte and R. Knust and H.O. Portner and W.E. Arntz}, ' ... 
'year = {2006}, ' ...
'title = {Biology of the {A}ntarctic eelpout \emph{Pachycara brachycephalum}}, ' ...
'journal = {Deep-Sea Research II}, ' ...
'volume = {53}, ' ...
'pages = {1131–1140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pachycara-brachycephalum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
