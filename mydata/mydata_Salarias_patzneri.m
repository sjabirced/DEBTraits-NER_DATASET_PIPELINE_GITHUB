function [data, auxData, metaData, txtData, weights] = mydata_Salarias_patzneri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Blenniidae';
metaData.species    = 'Salarias_patzneri'; 
metaData.species_en = 'Patzner''s blenny'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 02];

%% set data
% zero-variate data

data.ab = 15;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'FariGil2010';   
  temp.ab = C2K(28.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 6;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wils2004';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width 0.6 mm: 4/3*pi*0.03^2*0.055';
data.Wwi = 1.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Wils2004','fishbase'};
  comment.Wwi = 'based on 0.00776*Li^3.00, see F1';

data.GSI  = 0.06; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(28.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
41.923	1.123
43.846	1.199
58.462	2.321
62.308	1.518
63.462	1.745
69.231	1.624
71.154	1.791
76.155	1.625
78.462	2.094
84.615	2.973
99.231	2.444
108.077	1.868
108.462	2.293
112.692	3.020
113.077	2.217
115.385	2.460
123.846	3.096
131.538	3.157
136.154	3.688
155.385	3.870
162.692	4.265
165.385	3.598
167.692	2.992
170.000	3.492
173.462	3.932
175.769	3.750
178.077	3.538
178.078	3.902
179.231	4.387
181.154	4.235
182.308	5.553
183.462	4.629
183.846	4.917
185.000	3.872
187.308	3.948
189.231	4.235
189.232	4.023
190.385	3.614
192.308	2.675
193.462	4.599
195.385	3.493
196.154	4.312
199.231	4.645
200.000	4.297
202.308	4.433
202.692	4.660
204.615	4.736
205.385	4.933
207.308	3.706
208.846	5.267
210.385	3.252
210.768	4.327
210.769	4.191
211.538	5.130
212.692	4.949
218.846	5.297
221.923	4.828
222.308	5.146
223.077	3.813
225.385	4.222
225.769	5.010
227.692	4.586
227.693	5.419
228.077	3.828
233.846	3.753
235.000	4.101
235.001	4.737
235.769	4.404
239.615	3.829
241.154	4.526
241.155	3.420
243.846	4.071
246.923	4.208
249.231	4.784
251.923	3.769
252.308	4.693
252.692	4.556
254.231	3.769
254.615	3.996
266.154	4.951
266.538	5.360
267.692	3.224
267.693	5.148
270.385	4.694
281.923	4.649
286.538	4.285
290.768	4.210
290.769	4.058
291.154	4.816
292.692	5.149
293.077	4.179
295.000	5.104
297.308	4.755
305.000	4.544
321.538	5.362
328.846	4.575
338.847	4.151
339.615	6.030];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Wils2004'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_1994','tL_1993'}; subtitle1 = {'data for cohorts 1994, 1993'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^3.00';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XBPW'; % Cat of Life
metaData.links.id_ITIS = '636535'; % ITIS
metaData.links.id_EoL = '46573836'; % Ency of Life
metaData.links.id_Wiki = 'Salarias_patzneri'; % Wikipedia
metaData.links.id_ADW = 'Salarias_patzneri'; % ADW
metaData.links.id_Taxo = '186400'; % Taxonomicon
metaData.links.id_WoRMS = '278375'; % WoRMS
metaData.links.id_fishbase = 'Salarias-patzneri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salarias_patzneri}}';
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
bibkey = 'Wils2004'; type = 'Article'; bib = [ ... 
'author = {Shaun K. Wilson}, ' ... 
'year = {2004}, ' ...
'title = {Growth, mortality and turnover rates of a small detritivorous fish}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {284}, ' ...
'pages = {253–259}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Salarias-patzneri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

