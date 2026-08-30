function [data, auxData, metaData, txtData, weights] = mydata_Scarus_vetula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_vetula'; 
metaData.species_en = 'Queen parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'HernSher2025';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 61;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm of Calotomus_japonicus: pi/6*0.066^3'; 
data.Wwp = 432; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01445*Lp^3.03, see F1';
data.Wwi = 3.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.03, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.032	8.182
0.061	12.273
0.086	9.960
0.865	13.518
0.948	17.787
1.913	20.010
1.914	20.721
1.966	19.032
1.993	19.209
2.049	24.545
2.906	24.990
3.012	21.966
3.039	22.945
3.040	24.012
3.950	24.190
3.976	23.211
4.004	24.901
4.005	25.968
4.032	26.858
4.916	27.658
4.970	28.903
4.995	25.257
5.023	26.858
5.077	27.569
5.934	28.903
6.011	22.500
6.014	27.658
6.067	26.591
6.093	25.257
6.925	28.547
6.979	29.081
7.031	27.569
7.969	29.526
7.996	28.725
9.015	31.304
10.086	31.482
11.959	30.771
12.897	31.927];
data.tL_f(:,1) = 365*(0.5+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernSher2025'; 
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
1.027	16.719
1.106	13.962
1.994	20.810
2.962	28.370
2.986	24.457
3.011	20.721
3.014	26.324
3.016	29.259
3.039	21.966
3.043	28.903
3.069	27.391
3.900	30.237
3.927	30.949
3.954	29.792
3.955	31.838
3.977	24.723
3.978	27.302
3.979	28.014
3.980	28.547
4.033	29.081
4.036	32.994
4.037	33.883
4.996	26.413
5.025	32.372
5.026	32.905
5.027	33.617
5.028	34.239
5.029	36.640
5.050	27.480
5.055	36.107
5.078	29.970
5.079	31.571
5.104	29.259
5.105	30.860
5.108	35.040
5.937	35.128
5.938	35.840
5.939	36.996
5.940	38.508
5.961	29.792
5.962	30.415
5.963	31.215
5.964	34.328
5.987	27.747
5.988	28.903
5.989	31.660
5.991	33.883
6.017	32.283
6.071	33.261
6.899	31.038
7.007	31.749
7.008	32.816
7.009	33.528
7.037	36.818
7.038	37.708
7.063	35.484
7.974	36.907
8.000	36.107
8.002	39.753
8.024	31.482
8.052	32.727
8.053	34.506
8.054	34.684
8.991	36.462
9.069	33.261
9.099	37.441
9.122	32.549
9.124	34.951
10.004	29.526
10.005	30.415
10.035	36.729
10.036	37.352
10.037	38.686
10.038	39.397
10.039	40.020
11.024	33.528
11.052	35.484
11.054	38.330
11.080	37.619
12.043	35.751
12.149	33.706
13.033	35.306
13.061	37.085
14.052	37.796
16.193	36.551];
data.tL_m(:,1) = 365*(0.5+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HernSher2025'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01445*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V3PF'; % Cat of Life
metaData.links.id_ITIS = '170816'; % ITIS
metaData.links.id_EoL = '46572671'; % Ency of Life
metaData.links.id_Wiki = 'Scarus-vetula'; % Wikipedia
metaData.links.id_ADW = 'Scarus-vetula'; % ADW
metaData.links.id_Taxo = '186715'; % Taxonomicon
metaData.links.id_WoRMS = '276064'; % WoRMS
metaData.links.id_fishbase = 'Scarus-vetula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished170927 = {\url{http://en.wikipedia.org/wiki/Scarus-vetula}}';
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
bibkey = 'HernSher2025'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-024-01651-x}, ' ...
'author = {Jes\''{u}s M. Rivera Hern\''{e}ndez and Virginia R. Shervette}, ' ... 
'year = {2025}, ' ...
'title = {Addressing life history information gaps for {C}aribbean parrotfishes: queen parrotfish \emph{Scarus vetula} and stoplight parrotfish \emph{Sparisoma viride}}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {108}, ' ...
'pages = {179–198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-vetula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

