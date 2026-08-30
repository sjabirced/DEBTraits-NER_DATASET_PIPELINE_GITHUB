function [data, auxData, metaData, txtData, weights] = mydata_Plectorhinchus_sordidus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Plectorhinchus_sordidus'; 
metaData.species_en = 'Sordid rubberlip'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 14];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 26; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm: pi/6*0.085^3'; 
data.Wwp = 238;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01445*Lp^2.98, see F1';
data.Wwi = 2876; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^2.98, see F1';

data.GSI  = 0.058;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'GranAbde2011';   
  temp.GSI = C2K(27.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), fork length (cm)
0.901	21.587
0.902	20.497
0.968	19.734
0.995	27.800
0.997	24.312
0.998	23.440
0.999	22.677
1.982	24.864
1.985	20.832
2.013	26.281
2.014	25.518
2.015	23.884
2.016	22.467
2.017	21.595
2.052	18.870
2.081	23.339
3.032	24.872
3.032	24.436
3.097	26.289
3.097	25.853
3.099	23.782
3.099	22.693
3.128	27.488
3.951	25.206
3.951	24.661
3.952	23.898
4.046	28.694
4.047	27.713
4.051	22.917
4.114	26.406
4.904	23.905
4.997	30.663
4.998	29.137
4.999	27.938
5.005	20.636
5.005	20.091
5.034	25.322
5.034	24.777
5.064	28.701
5.098	27.067
5.920	25.002
5.952	26.419
5.952	25.874
5.954	24.348
5.987	23.803
6.014	31.215
6.014	30.670
6.017	27.618
6.087	21.733
6.151	23.369
6.970	25.228
6.971	24.683
7.002	26.209
7.034	28.389
7.034	27.735
7.952	28.940
7.986	28.178
8.021	24.472
8.022	23.600
8.938	26.986
9.001	30.583
9.002	29.493
9.006	24.479
9.038	25.679
9.040	23.717
9.956	26.993
10.021	27.974
10.057	23.506];
data.tL_f(:,1) = (data.tL_f(:,1) + 0)*365;  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1);data.tL_f(i,1)=data.tL_f(i-1)+1e-3;end;end 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(27.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAbde2011';
%
data.tL_m = [ ... % time since birth (d), fork length (cm)
0.996	25.838
1.031	23.876
1.034	19.953
1.036	17.228
1.064	23.332
1.065	22.242
1.066	21.261
1.066	20.607
1.067	18.972
1.100	19.081
1.162	24.204
1.913	28.134
1.916	25.409
1.948	25.736
1.952	21.376
1.986	19.415
2.051	20.505
2.078	26.936
2.082	23.121
2.146	25.083
2.969	22.147
2.996	29.340
2.996	28.904
3.001	22.801
3.030	27.924
3.030	27.161
3.060	30.976
3.130	25.418
3.132	23.565
3.886	24.551
3.886	23.788
3.948	28.584
3.950	25.969
3.951	25.424
4.013	29.130
4.018	22.699
4.048	27.059
4.078	30.220
4.902	26.302
4.932	30.008
4.934	27.284
4.935	25.322
4.966	27.720
4.971	22.488
4.971	22.161
4.994	33.606
4.998	28.810
4.999	28.047
5.029	30.990
5.034	24.886
5.036	23.034
5.951	27.509
5.989	21.297
6.015	29.035
6.017	26.855
6.018	26.528
6.018	25.548
6.019	24.567
6.046	32.196
6.053	23.804
6.969	26.862
6.971	24.901
7.003	25.664
7.950	31.774
7.956	24.036
8.021	25.453
8.085	27.197
9.006	24.915
9.039	24.480
9.070	26.442
9.072	23.826
9.100	30.366
9.990	25.031
10.022	25.904
10.024	24.487
10.088	25.577
10.119	27.975
14.021	32.690];
data.tL_m(:,1) = (data.tL_m(:,1) + 0)*365;  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1);data.tL_m(i,1)=data.tL_m(i-1)+1e-3;end;end 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(27.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAbde2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01445*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4K3SH'; % Cat of Life
metaData.links.id_ITIS = '630204'; % ITIS
metaData.links.id_EoL = '46578561'; % Ency of Life
metaData.links.id_Wiki = 'Plectorhinchus_sordidus'; % Wikipedia
metaData.links.id_ADW = 'Plectorhinchus_sordidus'; % ADW
metaData.links.id_Taxo = '184062'; % Taxonomicon
metaData.links.id_WoRMS = '218556'; % WoRMS
metaData.links.id_fishbase = 'Plectorhinchus-sordidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectorhinchus_sordidus}}';
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
bibkey = 'GranAbde2011'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2011.01776.x}, ' ...
'author = {Grandcourt, E. and T.Z. Al Abdessalaam and F. Francis and A. Al Shamsi}, ' ... 
'year = {2011}, ' ...
'title = {Demographic parameters and status assessments of \emph{Lutjanus ehrenbergii}, \emph{Lethrinus lentjan}, \emph{Plectorhinchus sordidus} and \emph{Rhabdosargus sarba} in the southern {A}rabian {G}ulf}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {27}, ' ...
'pages = {1203-1211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Plectorhinchus-sordidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
