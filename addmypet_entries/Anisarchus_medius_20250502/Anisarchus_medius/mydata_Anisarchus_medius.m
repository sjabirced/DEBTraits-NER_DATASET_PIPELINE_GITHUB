function [data, auxData, metaData, txtData, weights] = mydata_Anisarchus_medius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lumpenidae';
metaData.species    = 'Anisarchus_medius'; 
metaData.species_en = 'Stout eelblenny'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MPN','MAN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 02];

%% set data
% zero-variate data

data.ab = 170;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(-0.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(-0.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'baed on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 2.5;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AunePrim2014','fishbase'};
  comment.Wwp = 'based on 0.00324*Lp^2.95, see F1';
data.Wwi = 74;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00324*Li^2.95, see F1';

data.Ri = 700/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(-0.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.263	8.489
0.351	8.048
0.439	6.193
0.439	6.759
0.614	7.167
1.316	8.047
1.404	6.443
1.404	9.116
1.491	9.367
1.579	7.638
1.754	7.166
2.018	8.234
2.018	11.002
2.193	13.045
2.368	8.894
2.368	9.775
2.368	11.567
2.368	12.196
2.544	10.623
2.544	12.825
2.807	8.076
2.807	9.302
3.158	11.534
3.158	13.987
3.333	12.415
3.509	10.559
3.509	11.031
3.596	13.515
3.684	11.345
3.947	12.319
4.211	8.168
4.211	8.577
4.298	11.155
4.386	12.948
5.175	8.795
5.263	13.072
5.526	9.581
5.526	15.084
6.140	9.926
6.316	12.410
6.404	10.995
6.491	5.460
7.281	11.559
7.368	14.515
7.456	13.131
7.982	11.999
8.070	13.791
8.246	13.099
8.333	13.287
8.947	12.311
10.000	13.190
10.088	12.247
10.351	13.473
11.404	13.911
12.281	12.809];
data.tL(:,1) = 365*(2+data.tL(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end;
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(-0.6);  units.temp.tL = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL = 'ForsNorc2020'; 
comment.tL_fm = 'data from Chukchi Sea';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Lp = weights.Lp * 5;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 5;
weights.Wwb = weights.Wwb * 3;
weights.Wwp = weights.Wwp * 0;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00324*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
F2 = 'North Pacific: Bering Sea to Japan and southeastern Alaska. Northwest Atlantic: Arctic to western Greenland and Labrador, Canada. Northeast Atlantic: Norway, Russia and Spitsbergen';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5V426'; % Cat of Life
metaData.links.id_ITIS = '171620'; % ITIS
metaData.links.id_EoL = '46574690'; % Ency of Life
metaData.links.id_Wiki = 'Anisarchus'; % Wikipedia
metaData.links.id_ADW = 'Anisarchus_medius'; % ADW
metaData.links.id_Taxo = '160974'; % Taxonomicon
metaData.links.id_WoRMS = '127070'; % WoRMS
metaData.links.id_fishbase = 'Anisarchus_medius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anisarchus}}';
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
bibkey = 'ForsNorc2020'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.dsr2.2020.104779}, ' ...
'author = {Caitlin E. Forster and Brenda L. Norcross and Ingrid Spies}, ' ... 
'year = {2020}, ' ...
'title = {Documenting growth parameters and age in {A}rctic fish species in the {C}hukchi and {B}eaufort seas}, ' ...
'journal = {Deep–Sea Research II}, ' ...
'volume = {177}, ' ...
'pages = {104779}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AunePrim2014'; type = 'Misc'; bib = [ ...
'author = {Magnus Aune and Raul Primicerio and Andrey V. Dolgov and C. A. Meyer Ottesen}, ' ... 
'year = {2014}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/294948269_Appendix_S1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Anisarchus_medius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
