function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_squamiventer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_squamiventer'; 
metaData.species_en = 'Scalebelly eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.9); % K, body temp
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

data.am = 22*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'HildBerg2011';   
  temp.am = C2K(0.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 5 yrs, but in view of fast growth at 5 yrs, max age is probably much larger';
  
data.Lp  = 14;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 26;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'HildBerg2011';
  
data.Wwb = 0.0224;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwp = 14;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'HildBerg2011'; 
  comment.Wwp= 'based on LW data and Lp';
data.Wwi = 40;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'HildBerg2011';
  comment.Wwi = 'based on LW data and Li';

data.Ri  = 55/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(0.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
5.545	9.913
7.581	10.696
8.567	12.897
8.629	12.020
9.495	10.929
9.616	12.904
9.617	11.917
9.681	9.943
10.481	12.033
10.725	14.777
11.651	15.003
11.652	14.126
11.653	13.029
11.712	16.101
12.147	13.033
12.453	15.777
12.454	14.900
12.456	13.145
12.580	12.049
13.439	16.991
13.567	13.043
13.687	16.225
14.432	12.062
14.549	17.876
14.612	16.999
14.616	13.051
15.472	21.064
15.476	17.225
15.477	16.348
16.464	16.465
16.524	18.330
16.589	15.259
17.571	20.860
17.574	18.118
17.691	24.042
18.561	18.235
18.620	21.197
18.624	17.248
19.300	19.995
19.481	24.384
19.545	21.972
20.596	20.224
21.398	21.217
21.647	19.025];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(0.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HildBerg2011'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
8.974	3.228
10.066	4.100
10.132	2.872
10.894	7.167
10.960	5.763
11.987	7.864
11.987	6.022
11.987	4.969
12.947	9.000
13.013	6.719
13.046	8.035
13.841	10.137
14.073	11.013
14.967	10.921
15.066	15.131
15.066	12.324
15.132	10.131
15.894	16.268
15.927	12.759
15.927	16.882
15.960	14.250
15.993	15.039
16.954	14.947
16.954	13.193
16.987	23.456
16.987	16.789
17.053	20.210
17.119	15.736
17.947	18.890
17.980	15.996
17.980	19.943
18.013	21.083
18.907	26.956
18.940	18.097
18.974	24.939
19.007	25.728
19.007	22.044
19.040	23.798
19.040	21.254
19.934	28.092
20.000	28.969
20.033	26.601
20.960	35.982
20.960	32.912
21.026	38.175
21.954	29.925
21.987	33.259
21.987	31.855
22.848	29.834
24.073	40.092];
units.LW  = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'HildBerg2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

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
D1 = 'Males are assumed  not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00120*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WKYN'; % Cat of Life
metaData.links.id_ITIS = '165291'; % ITIS
metaData.links.id_EoL = '46574874'; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_squamiventer'; % ADW
metaData.links.id_Taxo = '179376'; % Taxonomicon
metaData.links.id_WoRMS = '127116'; % WoRMS
metaData.links.id_fishbase = 'Lycodes-squamiventer'; % fishbase

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
'howpublished = {\url{https://www.fishbase.se/summary/Lycodes-squamiventer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
