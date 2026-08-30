function [data, auxData, metaData, txtData, weights] = mydata_Lycodes_polaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Lycodes_polaris'; 
metaData.species_en = 'Canadian eelpout'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MPN'};
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

data.ab = 235;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(-0.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(-0.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AunePrim2014'; 
data.Li  = 30.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'AunePrim2014';

data.Wwb = 0.0477; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AunePrim2014';
  comment.Wwb = 'baed on egg diameter of 4.5 mm: pi/6*0.45^3';
data.Wwp = 17.6;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00269*Lp^3.17, see F1';
data.Wwi = 136.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.17, see F1';

data.Ri = 150/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(-0.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.058	3.021
0.080	4.416
0.093	5.812
0.158	3.716
0.947	7.818
1.053	5.334
1.105	9.213
1.211	8.281
1.263	4.322
1.263	7.038
2.053	11.684
2.105	5.630
2.158	13.235
2.158	8.501
2.211	11.139
2.211	10.363
2.211	9.975
2.211	9.587
2.211	6.172
2.263	8.034
2.316	7.413
2.316	7.102
3.105	13.145
3.105	12.835
3.105	12.369
3.158	14.464
3.211	10.971
3.211	10.195
3.316	8.331
3.368	9.494
3.421	7.243
4.000	9.331
4.000	7.080
4.105	13.365
4.105	10.882
4.105	10.106
4.158	12.278
4.158	8.863
4.158	7.932
5.000	8.309
5.053	12.732
5.053	9.007
5.053	8.697
5.158	12.343
5.158	11.256
5.158	10.480
5.211	14.981
5.211	14.360
5.211	13.661
5.211	9.781
6.053	13.495
6.105	10.778
6.158	12.485
6.158	16.676
6.158	15.589
6.316	15.975
7.053	19.846
7.053	17.440
7.105	16.198
7.158	16.895
7.211	16.507
8.000	13.237
9.053	19.587
9.053	15.940];
data.tL(:,1) = 365*(1+data.tL(:,1)); % set origin at birth and convert yr to d
for i = 2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end;
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(-0.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ForsNorc2020'; 
comment.tL = 'data from Chukchi Sea';
    
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
F1 = 'length-weight: weight in g = 0.00269*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Nearly circumpolar along Arctic coasts of Asia and North America. North Pacific: northern part of Bering Sea';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WKY4'; % Cat of Life
metaData.links.id_ITIS = '165266'; % ITIS
metaData.links.id_EoL = '46574869'; % Ency of Life
metaData.links.id_Wiki = 'Lycodes'; % Wikipedia
metaData.links.id_ADW = 'Lycodes_polaris'; % ADW
metaData.links.id_Taxo = '179365'; % Taxonomicon
metaData.links.id_WoRMS = '127111'; % WoRMS
metaData.links.id_fishbase = 'Lycodes_polaris'; % fishbase

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
'howpublished = {\url{http://www.fishbase.org/summary/Lycodes_polaris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
