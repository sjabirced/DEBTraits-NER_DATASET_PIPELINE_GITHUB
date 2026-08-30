function [data, auxData, metaData, txtData, weights] = mydata_Carasobarbus_luteus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Carasobarbus_luteus'; 
metaData.species_en = 'Yellow barbel'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 05];

%% set data
% zero-variate data

data.am = 29*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 15.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 48.5;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 46;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.06, see F1';
data.Wwi = 1544;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.06, see F1';

data.Ri = 26300/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL_f = [ ... % time (d), total length (cm)
0.968	10.198
0.977	15.091
0.978	13.538
0.979	11.363
0.991	9.266
0.992	12.684
1.023	11.985
1.024	10.820
1.025	9.578
1.048	11.753
1.958	19.463
1.959	16.201
1.970	13.716
1.982	12.862
1.991	18.454
1.992	17.289
1.993	15.581
2.002	21.251
2.003	17.989
2.004	17.212
2.005	12.319
2.015	16.824
2.016	15.115
2.039	14.339
2.926	19.331
2.970	22.050
2.971	18.244
2.972	22.982
2.984	25.701
2.993	23.915
2.994	21.352
2.995	15.371
3.006	20.342
3.007	17.313
3.018	16.381
3.030	24.382
3.041	22.673
3.053	19.178
3.929	26.500
3.963	25.879
3.975	24.481
3.985	27.433
3.986	25.103
3.987	19.045
3.998	23.161
3.999	21.220
4.009	21.841
4.021	29.298
4.031	23.706
4.032	22.619
4.033	20.133
4.931	25.669
4.964	33.126
4.965	27.378
4.976	31.184
4.977	28.233
4.986	31.961
4.987	24.505
4.988	23.806
5.000	26.447
5.012	21.787
5.023	29.710
5.024	25.049
5.968	28.644
5.979	29.654
6.037	32.374
6.970	28.823
6.971	35.192
6.993	29.600
7.016	30.999
7.028	38.222
7.984	35.371
8.007	36.459
8.030	29.236
8.998	37.569
9.021	32.366];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.5) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GokcAkyu2008'; 
%
data.tL_m = [ ... % time (d), total length (cm)
1.007	11.972
1.008	11.391
1.009	10.157
1.015	13.933
1.016	13.424
1.017	11.173
1.025	12.480
1.033	14.586
1.983	13.924
1.984	13.488
1.990	19.152
1.991	18.571
1.992	17.046
1.993	15.304
1.998	20.387
2.000	17.555
2.001	14.505
2.011	12.762
2.018	16.756
2.019	16.102
2.021	12.254
2.026	19.805
2.027	17.990
2.028	15.594
2.991	25.025
2.997	14.931
3.001	23.645
3.002	23.064
3.003	22.701
3.004	22.265
3.005	20.595
3.006	20.160
3.007	19.506
3.012	20.886
3.013	19.143
3.014	17.908
3.015	17.691
3.016	16.238
3.022	18.417
3.032	16.892
3.033	15.730
3.039	21.902
3.979	22.910
3.989	21.748
3.995	25.960
4.005	24.725
4.006	23.491
4.007	21.167
4.015	23.854
4.016	22.038
4.034	22.546
4.036	18.190
4.963	26.241
4.981	27.548
4.982	25.660
5.001	24.498
5.009	26.967
5.019	25.515
6.002	30.661
6.989	29.273];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.5) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GokcAkyu2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.01072*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to ndemic to the Mesopotamian and Orontes River';
metaData.bibkey.F2 = 'GokcAkyu2008';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'R2ZY'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '208474'; % Ency of Life
metaData.links.id_Wiki = 'Carasobarbus_luteus'; % Wikipedia
metaData.links.id_ADW = 'Carasobarbus_luteus'; % ADW
metaData.links.id_Taxo = '298617'; % Taxonomicon
metaData.links.id_WoRMS = '1012174'; % WoRMS
metaData.links.id_fishbase = 'Carasobarbus-luteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carasobarbus_luteus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Carasobarbus-luteus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GokcAkyu2008'; type = 'article'; bib = [ ...
'author = {C. Kaya G\"{o}k\c{c}ek and Ihsan Akyurt}, ' ...
'year = {2008}, ' ...
'title  = {Age and Growth Characteristics of {H}imri Barbel (\emph{Barbus luteus} {H}eckel, 1843) in {O}rontes {R}iver, {T}urkey}, ' ...
'journal = {Turk J. Zool.}, ' ...
'pages = {461-467}, ' ...
'volume = {32}'];
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

