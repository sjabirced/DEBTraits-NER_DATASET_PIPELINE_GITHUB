function [data, auxData, metaData, txtData, weights] = mydata_Petrogale_assimilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Petrogale_assimilis'; 
metaData.species_en = 'Allied rock-wallaby';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 16];

%% set data
% zero-variate data

data.tg = 31;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 296;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 525;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = .484;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwx = 1700;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4300;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter;, 1 litter per yr'; 

% univariate data
% time-length
data.tL = [ ... % time since birth (d), head length (cm)
    45.5 2.5
    58.9 3.0
    72.8 3.5
    87.2 4.0
   102.2 4.5
   117.8 5.0
   143.0 5.5
   150.9 6.0
   168.5 6.5
   186.9 7.0
   206.4 7.5
   226.7 8.0];
units.tL = {'d', 'cm'};     label.tL = {'time', 'head length'};  
temp.tL = C2K(36.1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoneTagg2004';

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
93.285	69.767
111.897	7.752
116.609	93.023
137.624	155.039
144.549	38.760
144.594	116.279
146.984	217.054
163.202	46.512
163.355	310.078
166.161	1124.031
167.936	170.543
172.743	418.605
177.283	209.302
182.008	317.829
193.690	364.341
200.855	658.915
207.649	317.829
212.392	457.364
212.397	465.116
219.670	945.736
228.813	635.659
233.629	899.225
245.148	666.667
247.597	868.217
250.072	1116.279
263.882	813.953
264.103	1193.798
278.424	1767.442
282.959	1550.388
289.713	1139.535
298.901	906.977
301.395	1186.047
313.316	1643.411
336.306	1093.023
343.769	1899.225
348.625	2232.558
352.862	1503.876
362.028	1232.558
369.437	1945.736
387.791	1441.860
387.967	1744.186
388.207	2155.039
409.046	1914.729
418.162	1558.140
432.613	2356.589
439.511	2193.798
441.779	2085.271
442.023	2503.876
451.392	2581.395
469.742	2069.767
474.806	2759.690
483.850	2279.070
490.920	2410.853
504.906	2410.853
512.120	2790.698
528.148	2294.574
528.234	2441.860
537.703	2689.922
556.631	3170.543
558.605	2558.140
563.240	2511.628
563.384	2759.690
579.602	2589.147
602.934	2627.907
603.242	3155.039
623.999	2775.194
626.674	3364.341
628.553	2589.147
640.646	3341.085
650.047	3472.868
654.339	2837.209
656.737	2953.488
656.900	3232.558
675.629	3372.093
686.860	2643.411
695.967	2271.318
703.665	3480.620
712.763	3093.023
719.869	3286.822
735.991	2953.488
750.090	3147.287
752.349	3023.256
757.043	3077.519
761.768	3186.047
780.416	3186.047
799.059	3178.295
810.710	3170.543
815.440	3286.822
843.421	3302.326
852.691	3209.302
876.019	3240.310
885.528	3558.140
899.550	3620.155
929.749	3441.860
932.229	3697.674
941.345	3341.085
950.769	3511.628
962.365	3410.853
983.403	3511.628
992.623	3333.333
1006.704	3496.124
1006.754	3581.395
1025.433	3635.659
1044.063	3604.651
1055.650	3488.372
1060.353	3558.140
1060.416	3666.667
1074.276	3449.612
1092.983	3550.388
1125.571	3472.868];
units.tW = {'d', 'g'};     label.tW = {'time', 'weight'};  
temp.tW = C2K(36.1); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Dela1993';

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

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '77728'; % Cat of Life
metaData.links.id_ITIS = '552744'; % ITIS
metaData.links.id_EoL = '128432'; % Ency of Life
metaData.links.id_Wiki = 'Petrogale_assimilis'; % Wikipedia
metaData.links.id_ADW = 'Petrogale_assimilis'; % ADW
metaData.links.id_Taxo = '60364'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000278'; % MSW3
metaData.links.id_AnAge = 'Petrogale_assimilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petrogale_assimilis}}';
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
bibkey = 'JoneTagg2004'; type = 'article'; bib = [ ... 
'doi = {10.1071/zo03033}, ' ...
'author = {Jones, M. and Taggart, D. and Temple-Smith, P.}, ' ... 
'year = {2004}, ' ...
'title = {Age determination and growth in wild \emph{Petrogale lateralis pearsoni} and captive \emph{Petrogale lateralis} “MacDonnell Ranges race”}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {52(4)}, ' ...
'pages = {447–461}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dela1993'; type = 'phdthesis'; bib = [ ... 
'author = {Delaney, Robyn Margaret}, ' ... 
'year = {1993}, ' ...
'title = {Life history and reproductive biology of a tropical rock wallaby, \emph{Petrogala addimilis}}, ' ...
'school = {James Cook University}, ' ...
'howpublished = {\url{http://eprints.jcu.edu.au/27176}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Petrogale_assimilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

