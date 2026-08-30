function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_ehrenbergii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_ehrenbergii'; 
metaData.species_en = 'Blackspot snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
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
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20.1; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm: pi/6*0.085^3'; 
data.Wwp = 113.4;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01622*Lp^2.95, see F1';
data.Wwi = 582; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01622*Li^2.95, see F1';

data.GSI  = 0.012;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'GranAbde2011';   
  temp.GSI = C2K(28.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), fork length (cm)
0.905	16.717
0.928	12.695
0.956	14.866
0.957	15.429
0.957	15.912
0.957	16.233
0.958	17.279
0.982	14.705
0.989	21.863
1.011	17.922
1.012	18.967
1.016	23.471
1.039	19.450
1.039	20.173
1.060	13.900
1.086	13.336
1.927	16.462
1.953	15.818
1.954	16.864
1.955	17.909
1.959	23.378
1.960	23.780
1.977	13.726
1.980	17.346
1.981	18.391
1.981	18.552
1.982	18.874
1.982	19.919
1.983	20.402
1.983	20.724
2.005	15.174
2.011	22.734
2.030	14.128
2.035	19.677
2.056	14.691
2.061	19.436
2.977	18.378
3.003	18.780
3.006	22.238
3.026	15.080
3.028	17.090
3.030	19.905
3.056	19.342
3.973	19.088
3.998	17.721
3.999	18.766
4.000	19.490
4.000	20.214
4.001	20.858
4.028	21.501
4.968	18.030
4.969	18.995
4.993	17.225
4.995	19.799
4.997	21.568
4.998	22.774
5.023	20.844
5.046	17.707
5.993	22.037
6.016	18.739
6.018	20.991
6.019	21.394
6.043	19.302
6.989	22.265
7.014	20.737
7.017	24.115
7.019	26.447
7.985	22.976
9.006	22.399
9.033	22.640
10.030	24.396
10.055	22.465
11.052	23.980
12.047	23.243];
data.tL_f(:,1) = (data.tL_f(:,1) + 0)*365;  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1);data.tL_f(i,1)=data.tL_f(i-1)+1e-3;end;end 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(28.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAbde2011';
%
data.tL_m = [ ... % time since birth (d), fork length (cm)
0.956	14.947
0.961	19.853
1.931	20.885
1.957	20.563
1.976	12.842
1.983	21.045
2.036	21.769
2.055	13.484
2.979	21.032
2.980	22.239
2.981	22.882
3.029	18.136
3.978	24.879
4.000	19.973
4.025	18.284
4.996	20.120
5.021	19.235
5.023	21.729
6.046	23.082
6.991	24.517
9.087	24.972];
data.tL_m(:,1) = (data.tL_m(:,1) + 0)*365;  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1);data.tL_m(i,1)=data.tL_m(i-1)+1e-3;end;end 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(28.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'weight-length relationship: Ww in g = 0.01622*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WG9H'; % Cat of Life
metaData.links.id_ITIS = '550929'; % ITIS
metaData.links.id_EoL = '46580744'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_ehrenbergii'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_ehrenbergii'; % ADW
metaData.links.id_Taxo = '179217'; % Taxonomicon
metaData.links.id_WoRMS = '218489'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-ehrenbergii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_ehrenbergii}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-ehrenbergii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
