function [data, auxData, metaData, txtData, weights] = mydata_Aspidophoroides_olrikii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Agonidae';
metaData.species    = 'Aspidophoroides_olrikii'; 
metaData.species_en = 'Arctic alligatorfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MANW','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 05 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 02];

%% set data
% zero-variate data
data.ab = 54; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(-0.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'AunePrim2014';   
  temp.am = C2K(-0.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'AunePrim2014';
data.Li = 8.6;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 7.5e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ArboAven2010';
  comment.Wwb = 'based on egg diameter of 1.125 mm: pi/6*0.1125^3';
data.Wwp = 1.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00363*Lp^3.19, see F1';
data.Wwi = 3.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00363*Li^3.19, see F1';
 
data.Ri  = 180/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'AunePrim2014';   
  temp.Ri = C2K(-0.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.159	3.698
0.201	3.381
0.474	4.518
0.557	3.554
1.045	4.504
1.181	5.094
1.254	4.935
1.335	4.144
1.608	5.209
2.110	5.079
2.256	4.806
2.318	5.612
2.388	5.683
2.394	5.180
2.405	4.317
2.464	5.353
3.243	5.914
3.248	5.468
3.389	5.655
3.464	5.295
3.674	5.727
3.739	6.216
4.319	5.496
4.382	6.173
4.461	5.612
4.592	6.576
4.594	6.417
4.595	6.331
4.671	5.971
5.386	5.871
5.455	6.058
5.463	5.396
5.524	6.259
5.950	6.518
6.022	6.446
6.453	6.259
7.450	6.518
8.446	6.849
8.947	6.748
9.231	6.935];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
for i = 2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(-0.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ForsNorc2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 5;
weights.Ri = weights.Ri * 5;

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
F1 = 'length-weight: Ww in g = 0.00363*(TL in cm)^3.19'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HHCC'; % Cat of Life
metaData.links.id_ITIS = '692156'; % ITIS
metaData.links.id_EoL = '46568876'; % Ency of Life
metaData.links.id_Wiki = 'Aspidophoroides_olrikii'; % Wikipedia
metaData.links.id_ADW = 'Aspidophoroides_olrikii'; % ADW
metaData.links.id_Taxo = '262945'; % Taxonomicon
metaData.links.id_WoRMS = '309268'; % WoRMS
metaData.links.id_fishbase = 'Aspidophoroides_olrikii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Aspidophoroides_olrikii}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Aspidophoroides_olrikii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

