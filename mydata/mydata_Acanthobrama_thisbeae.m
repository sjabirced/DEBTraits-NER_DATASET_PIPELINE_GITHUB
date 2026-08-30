  function [data, auxData, metaData, txtData, weights] = mydata_Acanthobrama_thisbeae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Acanthobrama_thisbeae'; 
metaData.species_en = 'Antolia bream'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fs', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 11];

%% set data
% zero-variate data
data.ab = 13;        units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'guess'; 
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;  units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase'; 
data.Li = 26.1;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'Kara2022';
  comment.Wwb = 'Based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 22.5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty\';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.18, see F1';
data.Wwi = 107; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.18, see F1; max. published weight: 203.89 g ';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    2 14.0 14.2
    3 15.1 15.2
    4 16.6 15.9
    5 17.4 16.0
    6 18.2 18.5
    7 22.0 NaN
    8 26.1 NaN];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kara2022'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    2 24.35 26.28
    3 31.17 30.67
    4 47.23 42.13
    5 62.88 42.06
    6 70.87 65.90
    7 136.9 NaN
    8 160.2 NaN];
data.tW_fm(:,1) = 365 * (0.5 + data.tW_fm(:,1));  % convert yr to d
units.tW_fm = {'d', 'cm'}; label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm = C2K(22);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Kara2022'; treat.tW_fm = {1 {'females','males'}};
    
% length-weight
data.LW = [ ... %  total length (cm), weight (g)
13.105	24.161
13.121	19.128
13.336	22.148
13.382	24.161
13.382	18.121
13.489	26.678
13.566	27.685
13.598	16.611
13.613	21.644
13.674	22.651
13.797	29.195
13.843	22.148
13.859	13.087
13.874	26.678
13.904	30.705
13.966	21.141
14.058	36.242
14.058	27.685
14.104	25.168
14.104	21.141
14.228	18.121
14.273	26.678
14.289	23.154
14.289	23.154
14.565	32.718
14.581	28.188
14.627	22.148
14.765	30.705
14.857	30.705
14.873	25.671
14.965	29.698
14.995	33.221
15.026	37.752
15.041	33.725
15.102	44.799
15.149	29.195
15.149	25.168
15.257	25.671
15.395	33.725
15.411	25.168
15.441	28.691
15.610	37.752
15.656	33.725
15.702	34.732
15.779	38.255
15.841	30.201
15.871	34.228
15.963	49.832
15.963	43.792
16.009	36.242
16.024	47.315
16.039	55.369
16.054	63.926
16.085	51.846
16.086	40.772
16.102	27.685
16.117	32.215
16.117	30.705
16.132	39.765
16.578	42.785
16.686	38.758
16.824	33.221
16.855	29.698
16.901	36.745
16.930	61.409
16.977	51.846
16.992	58.389
17.007	63.926
17.023	45.302
17.038	49.832
17.039	41.275
17.084	68.960
17.084	53.859
17.099	59.899
17.929	61.409
17.944	81.040
18.006	72.483
18.006	54.362
18.052	66.946
18.067	62.416
18.082	76.510
18.098	58.389
18.543	71.980
18.973	79.530
18.989	68.456
19.003	103.691
19.019	83.557
19.020	63.423
19.049	94.631
19.051	73.490
19.051	67.450
19.127	75.503
19.987	87.584
19.988	81.040
20.018	90.101
20.079	103.691
20.094	97.651
20.939	118.289
24.040	179.698
24.041	169.128
25.007	205.369];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'Kara2022'; 

% length-fecundity
data.LN = [ ... % total length (cmm), fecundity (#)
13.259	4120.617
13.271	2356.055
13.319	2662.496
13.332	1980.296
13.345	1768.689
13.548	2359.309
13.556	3512.339
13.690	3160.983
13.792	3726.883
13.804	1938.792
13.839	3445.084
13.872	2151.352
13.953	2458.190
13.960	3070.038
13.995	5235.158
14.048	3682.839
14.141	2201.586
14.156	3825.287
14.216	2602.462
14.244	3614.552
14.310	2274.158
14.331	2980.285
14.364	2557.149
14.413	5169.489
14.515	5500.094
14.547	3806.360
14.560	3335.927
14.607	2912.949
14.616	5430.696
14.647	2136.949
14.783	3244.428
14.823	2444.897
14.854	8892.324
14.857	2939.415
14.884	3551.502
14.898	4304.609
15.006	3411.753
15.013	3835.365
15.013	4282.427
15.066	2353.635
15.066	3224.230
15.229	4096.731
15.236	4402.695
15.243	5273.369
15.255	3485.278
15.324	5297.851
15.417	3887.186
15.572	3065.475
15.598	2077.550
15.740	2620.397
15.768	3138.365
15.836	3821.518
16.092	3518.648
16.113	5236.547
16.767	4867.771
16.823	6915.481
16.923	5199.010
16.942	4634.538];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Kara2022'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tW_fm = 10 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00646*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64CST'; % Cat of Life
metaData.links.id_ITIS = '1200158'; % ITIS
metaData.links.id_EoL = '45238423'; % Ency of Life
metaData.links.id_Wiki = 'Acanthobrama_thisbeae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5223075'; % Taxonomicon
metaData.links.id_WoRMS = '1007095'; % WoRMS
metaData.links.id_fishbase = 'Acanthobrama-thisbeae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthobrama_thisbeae}}';  
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
bibkey = 'Kara2022'; type = 'Article'; bib = [ ...  
'author = {Cemil Kara}, ' ...
'year = {2022}, ' ...
'title = {Growth and Reproductive Biology of  Bream, \emph{Acanthobrama thisbeae} ({F}reyhof \& \"{O}zulu\v{g}, 2014) a New Endemic Species in Sir Reservoir, {K}ahramanmara\c{s}, {T}urkey }, ' ... 
'journal = {Journal of Limnology and Freshwater Fisheries Research}, ' ...
'volume = {8(2)}, '...
'pages = {168-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthobrama-thisbeae.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

