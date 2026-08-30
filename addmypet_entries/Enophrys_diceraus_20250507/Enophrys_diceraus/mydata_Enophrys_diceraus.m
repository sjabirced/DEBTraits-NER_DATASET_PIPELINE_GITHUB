function [data, auxData, metaData, txtData, weights] = mydata_Enophrys_diceraus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Enophrys_diceraus'; 
metaData.species_en = 'Antlered sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 07];

%% set data
% zero-variate data

data.am = 14 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'JohTaka2019';   
  temp.am = C2K(2.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 32;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 7.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.4 mm of Myoxocephalus_scorpius: pi/6*0.24^3';
data.Wwp = 30;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00589*Lp^3.15, see F1';
data.Wwi = 760;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on max. published weight; 0.00589*Li^3.15, see F1, gives 325 g';

data.Ri = 66*760/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(2.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity 66 eggs/g of Myoxocephalus_joak: ';

% uni-variate data
% time-length
data.tL_f = [ ... % age (yr), total length (cm) 
2.711	19.675
3.318	19.382
3.319	17.822
3.722	20.795
4.180	23.057
4.311	19.793
4.767	26.736
5.155	23.113
5.174	22.191
5.265	23.537
5.324	18.572
5.341	19.848
5.397	18.925
5.706	24.736
5.782	21.260
6.224	20.473
6.314	23.096
6.351	23.521
6.407	21.392
6.445	20.328
6.719	22.948
6.794	20.535
6.811	23.088
7.086	24.148
7.087	22.445
7.327	21.165
7.363	22.725
7.401	21.802
7.438	20.454
7.510	23.645
7.730	23.925
7.787	21.300
8.096	26.898
8.134	24.983
8.135	24.628
8.135	23.990
8.135	23.564
8.230	19.946
8.265	22.073
8.283	23.349
8.321	20.654
8.339	20.866
8.375	23.348
8.394	21.645
8.411	24.766
8.505	21.289
8.577	23.061
8.578	22.210
8.578	21.643
8.613	23.983
8.744	21.002
9.147	23.549
9.148	22.698
9.148	22.343
9.148	22.272
9.201	25.676
9.330	25.390
9.386	24.467
9.423	23.970
9.442	23.474
9.699	23.115
9.772	24.107
9.773	23.468
11.190	21.745
11.374	22.948
11.757	27.197
11.759	24.006];
data.tL_f(:,1) =  365 * (0.1 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(2.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JohTaka2019';
%
data.tL_m = [ ... % age (yr), total length (cm) 
2.196	19.045
3.686	18.596
3.687	18.100
3.720	23.135
3.758	21.149
4.678	22.127
4.734	20.921
4.750	23.332
5.542	21.831
5.597	23.390
5.597	22.326
5.726	23.034
5.744	23.388
5.761	24.806
5.800	22.323
6.112	22.886
6.130	24.233
6.204	23.665
6.682	24.225
6.700	23.728
6.701	21.955
6.736	25.075
6.738	22.876
6.738	22.167
7.124	23.154
7.178	24.997
7.362	24.073
7.381	23.363
7.381	23.150
7.400	22.157
7.474	21.659
7.493	21.092
7.529	22.297
7.565	23.147
7.711	25.273
7.712	23.287
7.713	22.507
7.731	23.641
8.211	20.726
8.265	22.640
8.301	23.775
8.412	22.000
8.448	22.850
8.523	21.360
8.542	19.657
8.724	23.839
8.724	22.846
8.725	22.350
8.725	21.995
9.128	24.613
9.183	25.038
9.534	23.401
9.552	24.039
9.626	22.052
9.662	24.747
9.773	22.617
9.791	23.823
9.882	24.460
10.600	23.598
11.650	22.518];
data.tL_m(:,1) =  365 * (0.1 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(2.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JohTaka2019';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
17.624	255.070
17.926	216.849
18.293	315.133
18.552	193.916
18.789	293.292
19.112	223.401
19.436	268.175
19.436	217.941
19.522	346.802
19.716	328.237
19.911	358.814
19.911	276.911
20.277	344.618
20.342	359.906
20.428	324.961
20.493	252.886
20.515	382.839
20.622	260.530
20.644	269.267
20.773	401.404
20.881	413.417
20.989	405.772
21.011	258.346
21.097	304.212
21.162	366.459
21.183	284.555
21.205	358.814
21.270	270.359
21.313	293.292
21.334	497.504
21.421	382.839
21.507	367.551
21.550	431.981
21.680	385.023
21.787	335.881
21.852	477.847
22.003	322.777
22.046	352.262
22.068	401.404
22.068	344.618
22.154	492.044
22.154	376.287
22.262	394.852
22.413	376.287
22.478	402.496
22.478	316.225
22.542	388.300
22.564	480.031
22.607	360.998
22.715	410.140
22.801	508.424
22.931	394.852
22.952	442.902
22.952	352.262
22.974	495.320
23.082	381.747
23.103	463.651
23.103	482.215
23.125	366.459
23.211	387.207
23.211	419.969
23.233	434.165
23.254	400.312
23.276	463.651
23.297	413.417
23.405	345.710
23.470	386.115
23.513	442.902
23.513	493.136
23.621	371.919
23.621	342.434
23.643	477.847
23.664	427.613
23.707	525.897
23.729	395.944
23.772	484.399
23.945	451.638
23.966	497.504
23.988	513.885
24.009	534.633
24.009	379.563
24.031	404.680
24.031	406.864
24.052	439.626
24.139	456.006
24.290	548.830
24.311	448.362
24.354	460.374
24.398	522.621
24.441	496.412
24.786	529.173
24.786	389.392
24.829	513.885
24.872	483.307
24.958	403.588
25.002	464.743
25.088	665.679
25.174	462.559
25.217	490.952
25.282	463.651
25.368	545.554
25.433	496.412
25.757	536.817
26.533	619.813
26.619	689.704
27.267	631.825];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'JohTaka2019';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Wwp = weights.Wwp * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Data Wwp ignored due to inconsistency';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.15'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Pacific: Sea of Japan to Point Hope, Alaska in the Chukchi Sea to Amchitka Island in the Aleutian chain and southeastern Alaska';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '39WK5'; % Cat of Life
metaData.links.id_ITIS = '167268'; % ITIS
metaData.links.id_EoL = '46569014'; % Ency of Life
metaData.links.id_Wiki = 'Enophrys_diceraus'; % Wikipedia
metaData.links.id_ADW = 'Enophrys_diceraus'; % ADW
metaData.links.id_Taxo = '173801'; % Taxonomicon
metaData.links.id_WoRMS = '154784'; % WoRMS
metaData.links.id_fishbase = 'Enophrys_diceraus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enophrys_diceraus}}';
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
bibkey = 'JohTaka2019'; type = 'Article'; bib = [ ...
'doi = {10.1007/s12562-019-01391-3}, ' ...
'author = {Joh, M. and Takayama, T. and Mihara, Y.}, ' ... 
'year = {2019}, ' ...
'title = {Age and growth of three marine sculpins, \emph{Myoxocephalus jaok}, \emph{Enophrys diceraus}, and \emph{Gymnocanthus herzensteini}, and age composition of fishery-bycatch sculpins in the western coastal Pacific around {H}okkaido {I}sland, {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {86(3)}, ' ...
'pages = {427–436}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Enophrys_diceraus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

