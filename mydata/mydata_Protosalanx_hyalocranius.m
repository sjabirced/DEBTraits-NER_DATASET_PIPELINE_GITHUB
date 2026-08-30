  function [data, auxData, metaData, txtData, weights] = mydata_Protosalanx_hyalocranius
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Salangidae';
metaData.species    = 'Protosalanx_hyalocranius'; 
metaData.species_en = 'Clearhead icefish';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp','MPNW'};
metaData.ecoCode.habitat = {'0jFr', '0jFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18);
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 22];

%% set data
% zero-variate data
data.ab = 50;  units.ab = 'd';   label.ab = 'age at hatch';                bibkey.ab = 'TangLiu2012';   
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'TangLiu2012'; 
data.Li = 22;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm for Osmerus mordax: pi/6*0.075^3';
data.Wwp = 2.17;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'TangLiu2012','fishbase'};
  comment.Wwp = 'based on 0.00209*Lp^3.16, see F1';
data.Wwi = 36.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00209*Li^3.16, see F1';

data.Ni = 1.6e4; units.Ni = '#'; label.Ni = 'total fecundity'; bibkey.Ni = 'guess';   
  temp.Ni = C2K(18);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 
  comment.Ni = 'based on fecundity of Neosalanx_taihuensis: 1250*(22/9.3)^3';
    
% uni-variate data

% time-length-weight
data.tLW = [ ... % time since birth (d), total length (cm), weight (g)
 92	 4.252 0.335
135  7.763 2.575
163	 8.604 2.914
188	 9.498 3.861
219	10.841 5.733
250	11.629 7.765
282	11.913 8.181];
data.tLW(:,1) = 60 + data.tLW(:,1); % set origin at birth
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(18); units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'TangXie2003'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [... % log10 total length (cm), log10 weight (g)
0.382	-1.111
0.386	-1.185
0.396	-1.056
0.406	-1.080
0.415	-1.093
0.428	-1.006
0.429	-1.056
0.443	-1.173
0.443	-1.105
0.446	-1.043
0.460	-0.944
0.462	-1.012
0.474	-0.957
0.476	-0.846
0.480	-1.025
0.480	-0.981
0.481	-1.062
0.491	-0.932
0.493	-1.000
0.493	-0.790
0.502	-0.870
0.502	-0.821
0.507	-0.907
0.517	-0.926
0.518	-0.870
0.519	-0.932
0.519	-0.883
0.521	-0.809
0.528	-0.759
0.530	-0.716
0.536	-0.895
0.536	-0.809
0.538	-0.728
0.541	-0.772
0.547	-0.691
0.552	-0.735
0.556	-0.821
0.558	-0.586
0.560	-0.716
0.564	-0.679
0.568	-0.605
0.569	-0.784
0.571	-0.728
0.573	-0.580
0.573	-0.426
0.577	-0.716
0.580	-0.710
0.582	-0.543
0.583	-0.679
0.585	-0.630
0.587	-0.562
0.590	-0.691
0.593	-0.593
0.594	-0.728
0.594	-0.685
0.596	-0.500
0.599	-0.500
0.601	-0.580
0.602	-0.469
0.603	-0.654
0.604	-0.556
0.611	-0.481
0.613	-0.543
0.616	-0.617
0.620	-0.519
0.621	-0.475
0.622	-0.395
0.623	-0.611
0.627	-0.469
0.632	-0.574
0.632	-0.383
0.634	-0.481
0.636	-0.438
0.639	-0.346
0.643	-0.389
0.645	-0.500
0.648	-0.309
0.650	-0.327
0.651	-0.444
0.655	-0.407
0.665	-0.352
0.668	-0.265
0.674	-0.290
0.679	-0.340
0.686	-0.290
0.686	-0.253
0.687	-0.228
0.693	-0.278
0.696	-0.216
0.698	-0.241
0.700	-0.160
0.702	-0.302
0.707	-0.210
0.711	-0.247
0.714	-0.154
0.716	-0.142
0.725	-0.105
0.726	-0.167
0.731	-0.105
0.731	-0.037
0.733	-0.241
0.734	-0.179
0.735	-0.056
0.740	-0.142
0.742	-0.025
0.748	0.037
0.750	-0.068
0.757	-0.160
0.758	-0.198
0.763	-0.123
0.763	0.080
0.764	-0.062
0.766	0.000
0.773	0.031
0.776	-0.086
0.777	0.080
0.780	-0.043
0.781	0.272
0.782	0.000
0.783	0.006
0.783	0.037
0.791	-0.074
0.791	0.086
0.796	-0.031
0.797	0.080
0.797	0.154
0.799	-0.086
0.799	-0.043
0.801	0.179
0.805	0.068
0.805	0.148
0.809	-0.068
0.809	-0.019
0.809	0.031
0.811	0.123
0.811	0.222
0.814	0.185
0.820	0.000
0.825	0.216
0.827	0.043
0.828	0.111
0.829	0.290
0.835	0.228
0.837	0.025
0.837	0.154
0.838	0.117
0.838	0.327
0.846	0.086
0.848	0.272
0.849	0.352
0.852	0.191
0.853	0.154
0.855	0.315
0.858	0.407
0.863	0.247
0.868	0.210
0.870	0.401
0.872	0.346
0.876	0.216
0.876	0.352
0.882	0.241
0.882	0.389
0.891	0.340
0.895	0.383
0.900	0.302
0.909	0.432
0.913	0.228
0.913	0.340
0.914	0.247
0.914	0.290
0.915	0.401
0.917	0.370
0.918	0.327
0.919	0.494
0.922	0.309
0.924	0.506
0.928	0.253
0.931	0.272
0.931	0.327
0.931	0.395
0.931	0.444
0.936	0.469
0.938	0.235
0.939	0.327
0.940	0.370
0.941	0.512
0.942	0.389
0.945	0.290
0.946	0.623
0.948	0.247
0.948	0.352
0.948	0.568
0.950	0.586
0.952	0.432
0.955	0.315
0.956	0.383
0.959	0.525
0.960	0.475
0.961	0.556
0.961	0.556
0.962	0.556
0.964	0.698
0.965	0.247
0.965	0.617
0.966	0.414
0.967	0.426
0.967	0.580
0.970	0.333
0.970	0.346
0.973	0.512
0.974	0.284
0.975	0.426
0.975	0.469
0.976	0.222
0.976	0.370
0.976	0.586
0.979	0.327
0.979	0.623
0.983	0.519
0.984	0.512
0.986	0.389
0.986	0.457
0.987	0.648
0.988	0.278
0.988	0.340
0.988	0.574
0.992	0.426
0.992	0.549
0.992	0.611
0.993	0.241
0.993	0.259
0.994	0.327
0.994	0.506
0.995	0.358
0.995	0.395
0.995	0.667
1.002	0.340
1.002	0.488
1.002	0.599
1.003	0.488
1.004	0.438
1.004	0.543
1.004	0.648
1.007	0.500
1.008	0.414
1.011	0.370
1.011	0.580
1.011	0.698
1.012	0.469
1.013	0.327
1.014	0.389
1.014	0.494
1.014	0.802
1.016	0.543
1.016	0.611
1.016	0.698
1.019	0.660
1.021	0.463
1.021	0.846
1.022	0.302
1.023	0.543
1.025	0.735
1.027	0.444
1.028	0.667
1.030	0.599
1.030	0.784
1.032	0.543
1.032	0.704
1.032	1.074
1.033	0.481
1.036	0.451
1.036	1.136
1.037	0.512
1.040	0.833
1.041	0.642
1.042	0.438
1.042	0.827
1.044	0.574
1.044	0.574
1.044	1.111
1.045	0.765
1.046	0.519
1.049	0.654
1.050	0.704
1.051	1.105
1.052	0.778
1.054	0.500
1.055	0.537
1.056	0.815
1.059	0.741
1.061	0.580
1.061	0.704
1.068	0.852
1.070	0.673
1.072	0.765
1.073	0.673
1.073	0.784
1.077	0.673
1.077	0.895
1.089	0.821
1.089	0.895
1.091	0.741
1.091	0.895
1.098	0.401
1.098	0.914
1.102	0.821
1.104	0.796
1.105	0.957
1.106	0.895
1.106	0.944
1.107	0.994
1.107	1.185
1.111	1.074
1.112	0.772
1.112	0.858
1.115	0.957
1.116	0.870
1.118	0.772
1.118	0.932
1.119	1.142
1.119	1.167
1.122	1.000
1.125	1.185
1.126	1.062
1.127	0.889
1.130	1.185
1.131	1.056
1.134	1.006
1.135	1.130
1.140	1.204
1.141	0.914
1.141	1.062
1.144	0.932
1.145	0.969
1.145	1.037
1.148	1.062
1.149	1.080
1.150	1.123
1.157	1.037
1.157	1.228
1.158	1.093
1.165	1.136
1.165	1.222
1.165	1.241
1.167	1.074
1.168	1.031
1.169	0.994
1.169	1.148
1.172	1.086
1.173	1.123
1.176	1.185
1.177	1.037
1.177	1.278
1.179	1.228
1.184	1.043
1.186	1.154
1.186	1.309
1.190	1.191
1.190	1.241
1.195	1.309
1.196	1.253
1.197	1.056
1.204	1.309
1.205	1.154
1.206	1.259
1.211	1.321
1.211	1.370
1.216	1.253
1.217	1.278
1.219	1.340
1.220	1.198
1.220	1.222
1.226	1.438
1.226	1.519
1.239	1.377
1.240	1.444
1.248	1.500
1.249	1.537
1.254	1.383
1.254	1.605
1.263	1.432
1.272	1.568
1.286	1.617
1.296	1.593];
data.LW = 10.^data.LW; % remove log transform
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'TangLiu2012'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 varying food levels'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperature (in C) for tL data is assumed to vary as T(t)=20+8*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00209*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Naturally occurring in central and eastern China, widely introduced elsewhere';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '6VYHQ'; % Cat of Life
metaData.links.id_ITIS = '623680'; % ITIS
metaData.links.id_EoL = '46563089'; % Ency of Life
metaData.links.id_Wiki = 'Protosalanx'; % Wikipedia
metaData.links.id_ADW = 'Protosalanx_hyalocranius'; % ADW
metaData.links.id_Taxo = '181206'; % Taxonomicon
metaData.links.id_WoRMS = '282383'; % WoRMS
metaData.links.id_fishbase = 'Protosalanx_hyalocranius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Protosalanx}}';  
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
bibkey = 'TangXie2003'; type = 'Article'; bib = [ ... 
'doi = {10.3969/j.issn.1000-9957.2003.03.002}, ' ...
'author = {Tang, Zuo peng and Xie, Han and Xie, Yuhao and Li, Xing you}, ' ...
'year = {2003}, ' ...
'title = {Growth and population structure of \emph{Protosalanx hyalocranius} in {S}huifeng {R}eservior, {L}iaoning, {C}hina}, ' ... 
'journal = {Journal of Dalian Fisheries University}, ' ...
'volume = {18(3)}, '...
'pages = {164-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'TangLiu2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2012.01961.x}, ' ...
'author = {Tang, F. J. and Liu, W. and Wang, J. and Froese, R. and Xie, S.}, ' ...
'year = {2012}, ' ...
'title = {Growth, length-weight relationship and biological information on the clearhead icefish (\emph{Protosalanx hyalocranius} Abbott, 1901) in {L}ake {K}hanka ({X}ingkai)}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {28(5)}, '...
'pages = {842–844}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Protosalanx_hyalocranius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
