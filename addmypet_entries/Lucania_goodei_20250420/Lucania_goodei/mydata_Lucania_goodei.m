  function [data, auxData, metaData, txtData, weights] = mydata_Lucania_goodei
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Lucania_goodei'; 
metaData.species_en = 'Bluefin killifish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','piHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 20];

%% set data
% zero-variate data
data.ab = 7.8;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'CrawBalo1994';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1 d is added to first visability of embryo to ensure that L(0)=0';
data.am = 2*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'guess';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lb = 0.6; units.Lb = 'cm';     label.Lb = 'total length at birth'; bibkey.Lb = 'CrawBalo1994'; 
data.Lp = 2.3;  units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 6.0;  units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.17e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'CrawBalo1994';   
  comment.Wwb = 'based on egg diameter of 1.16 mm: pi/6*0.116^3';
data.Wwp  = 0.09; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.00724*Lp^3.03, see F1';
data.Wwi = 1.65;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.00724*Li^3.03, see F1';

data.Ri = 210/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % age (h), total length (cm)
22.027	0.139
23.291	0.184
24.197	0.148
24.890	0.148
26.069	0.203
27.597	0.167
30.588	0.213
32.053	0.231
33.928	0.204
35.908	0.186
37.614	0.232
39.052	0.241
41.716	0.232
43.737	0.214
44.995	0.205
47.139	0.242
50.336	0.260
53.267	0.251
55.317	0.242
60.737	0.288
64.889	0.270
67.989	0.297
71.920	0.316
76.798	0.334
81.996	0.361
88.464	0.316
91.798	0.362
96.209	0.371
98.926	0.398
106.620	0.426
110.738	0.408
122.737	0.453
129.933	0.417
136.037	0.499
142.682	0.454
150.738	0.563
162.608	0.527
175.143	0.600
180.112	0.618
192.352	0.627
207.445	0.609
219.327	0.664
227.624	0.700
238.499	0.728
254.837	0.701
264.376	0.764
274.622	0.737
293.022	0.810
298.246	0.891
312.655	0.882
343.550	0.874
359.642	0.964
395.080	0.974
402.535	0.983
429.670	1.028
454.686	1.020
480.054	1.174
516.138	1.373
536.965	1.237
568.301	1.220
572.942	1.310
600.162	1.356
622.388	1.446
656.274	1.691
695.105	1.619
706.956	1.754
747.735	1.782
766.041	1.402
777.212	1.710];
data.tL(:,1) = (data.tL(:,1)+24)/24; % convert h to d and set origin at L=0
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CrawBalo1994'; comment.tL = 'birth at (183-20)/24=6.8 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.03'; 	
metaData.bibkey.F1 = 'fishbase'; 
F2 = ' throughout Florida, except in panhandle only as far west as Choctawhatchee River drainage; sporadically along Atlantic Coast as far north as central South Carolina (where possibly introduced); southeastern Alabama in Chipola River drainage';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '72PBS'; % Cat of Life
metaData.links.id_ITIS = '165679'; % ITIS
metaData.links.id_EoL = '46566786'; % Ency of Life
metaData.links.id_Wiki = 'Lucania_goodei'; % Wikipedia
metaData.links.id_ADW = 'Lucania_goodei'; % ADW
metaData.links.id_Taxo = '179159'; % Taxonomicon
metaData.links.id_WoRMS = '422558'; % WoRMS
metaData.links.id_fishbase = 'LLucania-goodei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lucania_goodei}}';
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
bibkey = 'CrawBalo1994'; type = 'article'; bib = [ ...  
'doi = {10.1007/bf00023822}, ' ...
'author = {Crawford, S. S. and Balon, E. K.}, ' ...
'year = {1994}, ' ...
'title  = {Alternative life histories of the genus \emph{Lucania}: 2. {E}arly ontogeny of \emph{L. goodei}, the bluefin killifish}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {41(1-4)}, ' ...
'pages = {331–367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lucania-goodei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

