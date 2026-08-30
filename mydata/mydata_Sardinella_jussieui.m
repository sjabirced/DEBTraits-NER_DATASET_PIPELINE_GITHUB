function [data, auxData, metaData, txtData, weights] = mydata_Sardinella_jussieui
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Sardinella_jussieui'; 
metaData.species_en = 'Mauritian sardinella'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 01];

%% set data
% zero-variate data;

data.ab = 8.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7.7*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 12;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 24; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MehaElGa2003';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.85 mm for Sardinella_gibbosa: pi/6*0.085^3';
data.Wwi = 137;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.05, see F1';

data.Ri  = 23.3e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Sardinella_brasiliensis';
  
% uni-variate data

% time-length
data.tL = [ % time since birth (yr), total length (cm)
    1 14.70 
    2 19.66
    3 22.18];  
data.tL(:,1) = 365 * (data.tL(:,1)+0); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MehaElGa2003';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.045	10.515
10.113	10.509
10.280	9.660
10.389	11.320
10.558	11.026
10.629	11.855
10.799	11.840
11.070	11.537
11.105	11.813
11.249	13.470
11.351	13.460
11.481	12.057
11.593	14.552
11.698	15.099
11.754	12.311
11.834	15.087
11.870	15.641
11.975	16.188
12.111	16.176
12.181	16.726
12.384	16.430
12.454	16.980
12.492	17.812
12.594	17.802
12.730	17.790
12.799	18.062
12.937	18.607
13.077	19.429
13.249	19.970
13.428	21.903
13.458	21.065
13.573	24.116
13.805	22.704
13.810	23.817
13.846	24.370
13.981	24.080
14.150	23.786
14.191	25.452
14.325	24.884
14.433	26.266
14.473	27.654
14.495	24.869
14.606	27.085
14.614	28.754
14.707	26.798
14.716	28.745
14.741	26.795
14.751	29.020
15.059	29.549
15.238	31.482
15.254	27.306
15.392	27.850
15.465	28.957
15.478	32.017
15.723	33.665
15.814	31.152
15.892	33.371
15.953	31.696
16.016	30.577
16.057	32.244
16.194	32.510
16.364	32.494
16.436	41.115
16.458	38.330
16.566	39.712
16.636	40.262
16.704	32.464
16.706	40.813
16.721	36.359
16.845	41.357
16.850	42.470
16.864	38.016
16.990	43.570
17.126	43.558
17.333	44.097
17.410	46.316
17.422	49.098
17.498	42.969
17.503	44.081
17.528	49.923
17.622	47.967
17.703	51.021
17.755	47.398
17.783	53.797
17.783	46.004
17.813	52.959
17.923	46.827
17.961	55.729
18.006	50.437
18.101	48.759
18.151	52.372
18.208	49.863
18.210	58.211
18.266	55.423
18.289	52.917
18.356	60.425
18.382	50.682
18.441	56.521
18.574	55.953
18.598	61.516
18.612	56.784
18.696	60.394
18.704	54.550
18.837	53.703
18.840	62.330
18.850	56.763
18.862	59.545
18.880	63.718
18.883	56.482
18.896	51.749
19.000	52.019
19.012	62.871
19.080	70.657
19.151	63.415
19.210	61.462
19.255	63.962
19.264	65.910
19.274	60.343
19.276	68.692
19.438	67.007
19.481	61.159
19.486	62.272
19.550	69.224
19.570	65.882
19.631	72.278
19.713	67.539
19.810	74.210
19.834	71.981
19.898	71.141
19.916	67.243
19.940	65.015
19.992	76.977
20.003	63.896
20.011	73.635
20.035	79.199
20.139	79.746
20.149	81.972
20.151	74.458
20.196	69.166
20.213	73.061
20.247	81.128
20.327	75.834
20.338	78.337
20.348	72.771
20.366	76.943
20.498	76.097
20.528	83.051
20.543	86.668
20.712	78.304
20.737	84.146
20.766	83.030
20.780	78.298
20.792	81.080
20.916	86.356
20.957	79.952
21.095	88.288
21.112	84.391
21.136	82.162
21.157	86.891
21.244	91.336
21.253	85.491
21.340	89.936
21.371	89.377
21.447	91.040
21.679	89.628
21.726	92.685
21.763	93.516
21.831	93.510
21.916	97.399
22.123	97.937
22.203	100.713
22.373	100.698
22.578	100.958
22.717	101.780
22.723	103.171
22.899	104.547];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'MehaElGa2003';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g =  0.00851*(TL in mm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: off Madagascar and Mauritius. Outside distribution probably referring to another species';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79MLR'; % Cat of Life
metaData.links.id_ITIS = '551451'; % ITIS
metaData.links.id_EoL = '51263586'; % Ency of Life
metaData.links.id_Wiki = 'Sardinella'; % Wikipedia
metaData.links.id_ADW = 'Sardinella_jussieui'; % ADW
metaData.links.id_Taxo = '186545'; % Taxonomicon
metaData.links.id_WoRMS = '272272'; % WoRMS
metaData.links.id_fishbase = 'Sardinella_jussieui'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinella}}';
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
bibkey = 'MehaElGa2003'; type = 'Article'; bib = [ ... 
'author = {Sahar F. Mehanna and Azza A. El-Ganainy}, ' ... 
'year = {2003}, ' ...
'title = {Population dynamics of \emph{Sardinella jussieui} ({V}alenciennes, 1847) in the {G}ulf of {S}uez, {E}gypt}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {50(1)}, ' ...
'pages = {67-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sardinella_jussieui}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
