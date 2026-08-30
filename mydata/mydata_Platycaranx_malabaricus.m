  function [data, auxData, metaData, txtData, weights] = mydata_Platycaranx_malabaricus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Platycaranx_malabaricus'; 
metaData.species_en = 'Malabar trevally'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 31];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 440;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02291*Lp^2.90, see F1';
data.Wwi = 3.3e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02291*Li^2.90, see F1';

data.GSI = 0.045;   units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Caranx caballus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
358.579	19.871
482.130	23.758
511.677	23.986
543.238	25.259
365+207.748	26.291
365+237.284	26.761
365+270.246	27.470
365+294.974	27.862
365+329.322	28.329
365+541.594	31.131];
data.tL(:,1) = 60 + data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'BamKamr2022'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
13.906	60.708
16.988	101.789
17.281	116.753
17.905	120.477
17.988	106.749
17.989	131.704
18.572	127.942
18.654	114.214
18.988	125.434
19.905	147.865
19.989	161.588
20.031	172.817
20.698	184.026
21.949	220.172
21.950	246.375
21.988	178.995
21.989	195.216
22.156	202.697
22.866	240.108
22.906	213.904
22.906	226.381
22.991	255.077
23.741	268.779
23.784	289.990
23.824	256.299
23.907	248.810
23.993	303.709
24.365	250.043
24.405	237.564
24.701	304.935
25.158	298.682
25.824	296.165
25.874	427.180
25.909	329.853
25.914	414.701
25.991	309.886
25.996	381.009
26.036	353.556
26.118	339.828
26.370	377.254
26.787	387.223
26.826	347.293
26.874	458.343
26.949	311.104
26.952	370.997
26.991	324.828
26.996	412.172
27.286	380.968
27.331	444.603
27.371	403.426
27.450	333.548
27.458	482.032
27.488	272.406
27.704	410.902
27.786	387.192
27.868	374.711
27.914	438.346
27.917	494.496
27.998	459.556
27.999	474.529
28.413	429.596
28.827	403.380
28.872	447.051
28.916	489.474
29.161	418.343
29.414	474.485
29.536	423.322
29.788	460.748
29.915	490.690
29.915	501.920
29.956	475.716
30.000	516.891
30.455	471.957
30.872	496.899
30.873	508.129
30.916	526.844
30.996	478.179
31.456	514.350
31.580	498.125
31.832	525.568
32.038	503.102
32.497	509.326
32.539	523.050
33.871	528.000];    
units.LW = {'cm','g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'BamKamr2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwi = weights.Wwi * 3;
%weights.Wwp = weights.Wwp * 0;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02291*(TL in cm)^2.90'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2JG'; % Cat of Life
metaData.links.id_ITIS = '1228376'; % ITIS
metaData.links.id_EoL = '46578080'; % Ency of Life
metaData.links.id_Wiki = 'Carangoides_malabaricus'; % Wikipedia
metaData.links.id_ADW = 'Carangoides_malabaricus'; % ADW
metaData.links.id_Taxo = '165419'; % Taxonomicon
metaData.links.id_WoRMS = '1802012'; % WoRMS
metaData.links.id_fishbase = 'Platycaranx-malabaricus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Carangoides_malabaricus}}';  
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
bibkey = 'BamKamr2022'; type = 'article'; bib = [ ... 
'doi = {10.22092/ijfs.2022.126511}, ' ...
'author = {Bam, Gh.R. and Kamrani, E. and Kaymaram F. and Jamili, Sh.and Fatemi, M.R.}, ' ...
'year = {2022}, ' ...
'title = {Population dynamic parameters of the {M}alabar trevally \emph{Carangoides malabaricus} ({B}loch and {S}chneider, 1801) in the {P}ersian {G}ulf and {O}man {S}ea}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {21(2)}, '...
'pages = {516-525}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Platycaranx-chrysophrys.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  