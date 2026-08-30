function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_mahogoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_mahogoni'; 
metaData.species_en = 'Mahogany snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 13];

%% set data
% zero-variate data

data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 48;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 205;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01738*Lp^2.95, see F1';
data.Wwi = 1584; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.95, see F1; max. published weight: 1.3 kg';

data.GSI  = 0.14;   units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(25.8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lutjanus_sebae';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    2 30.0
    3 27.0
    4 32.5
    5 30.8
    6 33.1
    7 33.0
    8 33.5
    9 34.2
   10 32.3
   11 35.0
   12 33.9
   13 33.7
   14 36.0
   15 34.1
   16 33.0
   18 32.2];
data.tL(:,1) = 365 * (1.9 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PottBurt2017';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
27.505	251.587
28.575	363.612
29.060	323.008
29.741	407.856
30.130	350.287
30.227	377.421
30.421	404.569
30.518	594.414
30.616	387.649
30.810	343.610
30.907	506.337
31.004	411.436
31.199	445.364
31.199	360.618
31.587	414.914
31.587	397.965
31.685	475.945
31.782	404.774
31.782	442.062
31.782	316.638
31.879	489.534
32.171	421.781
32.171	364.154
32.268	425.186
32.365	570.963
32.365	469.268
32.559	493.026
32.754	438.818
32.948	421.899
33.045	449.032
33.240	550.756
33.240	476.180
33.434	472.819
33.629	591.493
33.823	669.488
33.920	537.299
33.920	516.960
34.017	571.212
34.017	479.687
34.017	496.636
34.309	378.036
34.503	540.777
34.698	567.925
34.795	513.702
34.892	601.852
35.184	571.388
35.281	662.928
35.475	598.550
36.058	690.164
36.058	608.808
36.350	703.767
37.030	673.361
37.127	717.443
37.225	731.017
37.516	710.722
38.197	771.842
38.585	880.375
38.683	812.593
41.015	931.588];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'PottBurt2017';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.Wwi =  3 * weights.Wwi;
weights.Li =  3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01738*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72PQR'; % Cat of Life
metaData.links.id_ITIS = '168858'; % ITIS
metaData.links.id_EoL = '46580727'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_mahogoni'; % ADW
metaData.links.id_Taxo = '179228'; % Taxonomicon
metaData.links.id_WoRMS = '159799'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-mahogoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus}}';
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
bibkey = 'PottBurt2017'; type = 'Article'; bib = [ ... 
'doi = {10.7717/peerj.3167}, ' ...
'author = {J.C. Potts and M.L.Burton}, ' ... 
'year = {2017}, ' ...
'title = {Preliminary observations on the age and growth of dog snapper (\emph{Lutjanus jocu}) and mahogany snapper (\emph{Lutjanus mahogoni}) from the Southeastern {U}.{S}.}, ' ...
'journal = {PeerJ}, ' ...
'volume = {5}, ' ...
'pages = {e3167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-mahogoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
