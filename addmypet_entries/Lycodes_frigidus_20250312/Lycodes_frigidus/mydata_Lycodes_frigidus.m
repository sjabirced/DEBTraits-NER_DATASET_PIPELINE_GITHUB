function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_frigidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_frigidus'; 
metaData.species_en = 'Glacial eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 12];

%% set data
% zero-variate data

data.am = 35*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'HildBerg2011';   
  temp.am = C2K(-0.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 57;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'HildBerg2011';
  
data.Wwb = 0.18;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 7 mm: pi/6*0.7^3';
data.Wwp = 70;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'HildBerg2011'; 
  comment.Wwp= 'based on LW data and Lp';
data.Wwi = 1500;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'HildBerg2011';
  comment.Wwi = 'based on LW data and Li';

data.Ri  = 500/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(-0.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
5.667	11.669
6.717	10.689
7.702	13.549
11.584	20.707
13.438	17.759
13.619	21.928
13.807	19.626
14.545	22.045
14.611	17.548
14.791	22.705
15.597	19.310
15.651	26.989
15.660	18.762
16.524	18.659
16.699	28.861
16.766	23.048
17.559	32.268
17.694	21.739
18.480	36.991
18.557	22.403
18.560	19.661
18.605	35.785
18.732	32.496
18.797	29.206
19.405	37.985
19.468	36.998
19.539	28.004
19.593	35.244
19.602	27.018
20.458	34.812
20.521	33.715
20.527	27.792
20.579	37.007
20.709	31.194
21.453	27.580
21.503	38.768
21.575	29.116
21.580	23.851
21.624	41.182
21.625	40.305
22.116	43.270
22.372	33.948
22.432	36.033
22.482	47.222
22.495	35.046
22.614	38.996
22.615	37.899
23.362	31.871
23.476	41.196
23.478	39.331
23.727	36.810
24.405	38.680
24.462	43.068
24.464	40.764
24.527	39.558
24.594	34.184
24.644	46.031
25.392	39.126
25.443	49.108
25.512	41.979
25.517	37.152
25.569	47.025
25.636	41.431
26.494	47.251
26.553	50.213
26.564	40.012
28.107	40.023
28.786	40.138
29.397	46.285
29.455	49.357
29.465	40.033
30.498	55.397
33.523	55.968];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(-0.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HildBerg2011'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.331	0.946
11.896	6.471
14.086	17.437
15.860	20.288
16.589	33.815
17.738	25.841
18.988	47.492
19.615	36.779
20.971	47.670
21.806	47.745
22.117	72.004
23.160	74.789
23.996	64.095
26.079	110.051
26.913	128.972
27.641	153.269
27.853	112.903
28.896	121.073
30.666	175.078
31.916	194.037
31.918	172.498
32.749	223.727
34.207	256.165
34.830	299.298
34.940	232.000
35.147	250.865
35.871	337.084
36.914	347.947
36.917	304.870
37.016	377.571
37.537	380.310
37.859	259.186
38.572	496.173
38.576	442.327
38.691	296.953
38.788	399.269
39.001	345.442
39.409	469.325
39.839	305.132
39.918	644.370
39.936	402.064
39.938	369.757
39.941	334.757
40.556	482.889
40.873	423.687
41.286	491.032
41.810	448.002
42.855	431.942
42.857	410.403
42.956	483.104
43.578	534.314
43.680	569.323
44.928	615.205
44.934	537.128
45.655	669.116
45.667	507.579
45.974	591.068
46.082	537.231
46.086	491.462
46.694	723.055
47.009	696.161
47.942	782.398
48.569	768.993
48.989	742.107
50.029	777.201
54.787	1340.320
55.954	1095.425];
units.LW  = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'HildBerg2011'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WKWG'; % Cat of Life
metaData.links.id_ITIS = '165288'; % ITIS
metaData.links.id_EoL = '46574864'; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_frigidus'; % ADW
metaData.links.id_Taxo = '179340'; % Taxonomicon
metaData.links.id_WoRMS = '127105'; % WoRMS
metaData.links.id_fishbase = 'Lycodes-frigidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycodes}}';
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
bibkey = 'HildBerg2011'; type = 'article'; bib = [ ... 
'doi = {10.1007/s00300-011-1011-4}, ' ...
'author = {Hildebrandt, N. and M. Bergmann and R. Knust}, ' ... 
'year = {2011}, ' ...
'title = {Longevity and growth efficiency of two deep-dwelling {A}rctic zoarcids and comparison with eight other zoarcid species from different climatic regions}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {34(10)}, ' ...
'pages = {1523-1533}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen and Michaela Aschan}, ' ...
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lycodes-frigidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
