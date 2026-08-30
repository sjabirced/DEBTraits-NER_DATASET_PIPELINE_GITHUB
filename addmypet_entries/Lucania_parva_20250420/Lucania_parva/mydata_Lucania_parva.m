  function [data, auxData, metaData, txtData, weights] = mydata_Lucania_parva
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Lucania_parva'; 
metaData.species_en = 'Rainwater killifish'; 

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
data.ab = 7.17;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'CrawBalo1994';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1 d is added to first visability of embryo to ensure that L(0)=0';
data.am = 5*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'guess';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lb = 0.49; units.Lb = 'cm';     label.Lb = 'total length at birth'; bibkey.Lb = 'CrawBalo1994'; 
data.Lp = 2.5;  units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 6.2;  units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 8.17e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'CrawBalo1994';   
  comment.Wwb = 'based on egg diameter of 1.16 mm: pi/6*0.116^3';
data.Wwp  = 0.22; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.01202*Lp^3.15, see F1';
data.Wwi = 3.77;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.01202*Li^3.15, see F1';

data.Ri = 104/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % age (h), total length (cm)
23.892	0.157
24.866	0.129
26.104	0.178
27.382	0.129
28.514	0.171
29.211	0.178
31.658	0.192
34.028	0.178
36.581	0.185
38.394	0.206
39.956	0.171
41.941	0.206
44.374	0.227
46.193	0.227
46.933	0.206
49.256	0.220
51.685	0.213
53.815	0.241
55.134	0.254
57.384	0.234
60.707	0.241
63.198	0.248
65.262	0.248
67.936	0.248
69.048	0.269
71.295	0.255
76.035	0.269
79.808	0.296
83.753	0.303
88.593	0.296
91.491	0.303
95.272	0.345
99.937	0.297
103.263	0.372
107.513	0.393
110.117	0.372
118.386	0.386
126.279	0.421
135.739	0.414
142.505	0.469
149.533	0.462
159.494	0.490
168.710	0.483
172.863	0.511
182.872	0.518
191.944	0.545
204.673	0.539
213.038	0.525
223.619	0.559
236.632	0.601
248.399	0.642
262.941	0.725
271.407	0.670
289.581	0.738
303.914	0.752
309.092	0.855
318.991	0.780
340.445	0.883
348.653	0.849
354.554	0.938
384.041	0.883
406.726	1.028
430.205	1.014
448.231	1.124
466.524	1.104
501.640	1.138
540.681	1.468
557.628	1.310
585.647	1.413
603.870	1.228
624.106	1.331
660.533	1.393
671.639	1.468
699.666	1.558
727.818	1.469
756.851	1.338
771.022	1.647];
data.tL(:,1) = (data.tL(:,1)+24)/24; % convert h to d and set origin at L=0
units.tL = {'d', 'cm'}; label.tL = {'age', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CrawBalo1994'; comment.tL = 'birth at (168-20)/24=6.17 d';

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
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.15'; 	
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Massachusetts and northern Gulf of Mexico to Florida Keys in USA and northeastern Mexico. Ascends Rio Grande and Pecos River in Texas and New Mexico in USA';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6QPBT'; % Cat of Life
metaData.links.id_ITIS = '165679'; % ITIS
metaData.links.id_EoL = '46566786'; % Ency of Life
metaData.links.id_Wiki = 'Lucania_parva'; % Wikipedia
metaData.links.id_ADW = 'Lucania_parva'; % ADW
metaData.links.id_Taxo = '179161'; % Taxonomicon
metaData.links.id_WoRMS = '159310'; % WoRMS
metaData.links.id_fishbase = 'Lucania-parva'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lucania_parva}}';
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
'doi = {10.1007/bf00005280}, ' ...
'author = {Crawford, S. S. and Balon, E. K.}, ' ...
'year = {1994}, ' ...
'title  = {Alternative life histories of the genus \emph{Lucania}: 1. {E}arly ontogeny of \emph{L. parva}, the rainwater killifish}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {40(4)}, ' ...
'pages = {349–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lucania-parva.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

