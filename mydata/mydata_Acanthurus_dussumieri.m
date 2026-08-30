function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_dussumieri
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_dussumieri'; 
metaData.species_en = 'Eyestripe surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
% zero-variate data

data.am = 30*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 54;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 389; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.03020*Lp^2.94, see F1';
data.Wwi = 3743; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03020*Li^2.94, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(27.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.732	10.792
0.891	15.655
0.944	17.326
0.946	19.149
0.993	14.289
1.044	13.530
1.930	22.652
1.985	26.906
2.032	21.590
2.035	24.932
2.240	23.567
2.970	31.169
3.020	29.651
3.062	18.715
3.069	26.158
3.070	27.980
3.116	21.753
3.121	27.373
3.222	24.944
4.000	28.901
4.053	29.661
4.102	27.383
4.209	31.486
4.982	29.823
5.032	27.241
5.035	31.494
5.084	28.608
5.142	35.293
5.244	33.927
6.016	31.200
6.019	34.542
6.070	33.479
6.074	38.340
6.120	31.809
6.123	35.303
6.125	37.277
6.221	29.531
6.845	34.095
6.897	35.158
7.050	32.578
7.358	30.606
7.927	31.523
8.032	33.955
8.033	35.322
8.035	36.841
8.080	29.398
8.083	33.348
10.099	35.343
10.152	37.622
13.042	35.069
13.090	31.272
19.036	39.838
20.124	45.014
30.087	41.165];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PardWile2022'; comment.tL_f = 'Data from Oahu, Maui, Hawaii';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
1.826	21.740
1.978	19.159
1.980	20.678
1.984	25.387
2.086	24.021
2.861	24.485
2.966	26.460
3.015	23.575
3.124	30.108
3.229	32.843
4.004	33.610
4.051	27.687
4.052	29.357
4.057	34.826
4.257	26.777
4.779	33.770
4.829	31.948
4.978	25.266
5.040	36.659
5.081	24.507
5.083	26.482
5.086	30.887
5.092	37.874
5.136	28.001
5.815	36.970
5.864	33.933
5.907	24.364
5.972	39.402
6.020	35.301
6.069	32.264
6.120	31.505
6.177	38.189
6.947	32.729
7.005	40.476
7.054	36.983
7.055	38.502
7.104	35.161
7.111	43.211
7.203	30.756
7.880	36.991
7.978	30.461
7.981	34.258
7.985	38.815
9.066	35.484
10.203	35.800
13.976	40.547
18.158	40.133
22.962	42.157
28.079	48.436
28.119	35.070];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PardWile2022'; comment.tL_m = 'Data from Oahu, Maui, Hawaii';

%% set weights for all real data
weights = setweights(data, []);

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

%% Facts
F1 = 'weight-length relationship: W in g = 0.03020*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-Pacific: East Africa (including the Mascarene Islands), to the Hawaiian and Line islands, north to southern Japan, south to Rowley Shoals, southern Great Barrier Reef and Lord Howe Island. Absent from most of central Pacific';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '92MV'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46577064'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_dussumieri'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_dussumieri'; % ADW
metaData.links.id_Taxo = '159948'; % Taxonomicon
metaData.links.id_WoRMS = '219641'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-dussumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_dussumieri}}';
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
bibkey = 'PardWile2022'; type = 'Article'; bib = [ ... 
'doi = {}, 10.1007/s10641-022-01216-w' ...
'author = {Cassandra Pardee and John Wiley and Eva Schemmel and Taylor Fendrick and Joseph Giglio}, ' ...
'year = {2022}, ' ...
'title = {Comparative demography of four large‑bodied surgeonfish}, '...
 'journal = {Environ. Biol. Fish}, ' ...
'volume = {105}, ' ...
'pages = {231–245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthurus-dussumieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
