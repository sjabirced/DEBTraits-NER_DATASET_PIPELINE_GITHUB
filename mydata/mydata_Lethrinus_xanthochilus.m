function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_xanthochilus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_xanthochilus'; 
metaData.species_en = 'Yellowlip emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Shim2021';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 563;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^2.96, see F1';
data.Wwi = 4381;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.96, see F1; max. published weight: 5.4 kg';

data.GSI  = 0.12;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(27.9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.263	27.263
1.475	32.849
1.577	27.933
1.686	39.553
1.787	32.179
2.029	27.933
2.066	34.190
2.136	35.754
2.168	29.274
2.169	30.615
2.310	35.978
2.412	30.838
2.415	37.542
2.586	29.274
2.587	31.285
2.660	39.330
2.692	33.966
2.869	40.223
2.935	32.849
2.937	36.872
2.972	38.212
3.109	33.520
3.179	35.531
3.213	31.955
3.252	41.341
3.390	39.777
3.600	42.682
3.668	40.670
4.051	41.117
4.118	35.531
4.223	35.531
4.328	38.436
4.992	46.257
5.933	50.279
6.523	48.492
7.602	50.056
8.889	52.737
11.708	57.207
12.716	58.324
16.577	60.335];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(27.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shim2021'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.298	26.816
1.474	31.508
2.309	33.296
2.587	33.520
2.797	35.754
3.390	39.106
3.493	37.095
4.224	38.883
4.540	45.810
4.645	47.374
4.747	41.788
5.339	43.352
5.339	44.916
5.654	48.492
5.859	40.894
5.933	51.173
6.139	44.022
6.211	50.279
6.698	50.503
7.115	50.950
7.322	46.034
7.568	52.961
7.570	56.760
7.741	49.832
7.913	47.374
8.122	48.268
8.125	54.525
8.299	55.642
8.367	50.279
8.577	55.196
8.818	49.609
9.795	56.760
10.769	57.207
11.047	56.983
11.742	55.642
13.064	57.430
13.306	54.078
14.107	58.101
16.125	61.229
17.131	55.419];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(27.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shim2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01514*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q2Q2'; % Cat of Life
metaData.links.id_ITIS = '169154'; % ITIS
metaData.links.id_EoL = '46580952'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_xanthochilus'; % ADW
metaData.links.id_Taxo = '178754'; % Taxonomicon
metaData.links.id_WoRMS = '212079'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-xanthochilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus}}';
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
bibkey = 'Shim2021'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-021-01069-9}, ' ...
'author = {Shimose, T.}, ' ... 
'year = {2021}, ' ...
'title = {Age, growth, and reproductive traits of two large emperor fishes, \emph{Lethrinus olivaceus} and \emph{L. xanthochilus}, around {Y}aeyama {I}slands, {O}kinawa, southern {Ja}pan}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {104(2)}, ' ...
'pages = {181–194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus_xanthochilus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
