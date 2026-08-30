  function [data, auxData, metaData, txtData, weights] = mydata_Clupeonella_engrauliformis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Clupeonella_engrauliformis'; 
metaData.species_en = 'Anchovy sprat'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAc'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 24];

%% set data
% zero-variate data
data.ab = 10.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'KariGabr2010';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 16.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 3.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00501*Lp^2.97, see F1';
data.Wwi = 20.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^2.97, see F1; max. published weight: 26.0 g';

data.GSI = 0.123; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'AliaPara2013';
  temp.GSI = C2K(18);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Spawns throught the year: GSI peaks at 0.042. Assumed 3 spawns per yr';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), fork length (cm)
1.028	6.992
1.047	7.575
1.978	7.997
1.978	8.519
1.988	8.918
1.988	9.563
1.997	9.317
1.997	11.129
1.997	11.559
2.017	7.076
2.987	11.704
2.987	9.831
2.996	12.011
2.996	9.555
2.996	9.309
3.006	11.151
3.015	9.585
3.015	8.971
3.025	12.441
3.025	9.094
3.025	9.094
3.054	10.107
3.976	12.648
3.985	11.727
3.995	11.174
3.995	11.051
3.995	10.867
3.995	10.038
3.995	9.884
4.004	11.297
4.004	10.376
4.014	12.279
4.014	12.064
4.014	11.604
4.014	11.389
4.014	10.682
4.024	11.941
4.994	13.407
4.994	11.688
4.994	11.503
5.013	13.131
5.013	12.793
5.013	12.547
5.013	12.240
5.013	11.166
5.022	13.867
5.022	12.025
5.022	11.933
5.022	11.872
5.022	11.411
5.983	13.706
6.002	13.399
6.002	13.030
6.002	12.539
6.002	12.508
6.021	13.153
7.001	13.114
7.020	13.667];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.8);
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'JanbFazl2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed not differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00501*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Former USSR and Asia: central and southern parts of the Caspian Sea';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WCWZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46562394'; % Ency of Life
metaData.links.id_Wiki = 'Clupeonella_engrauliformis'; % Wikipedia
metaData.links.id_ADW = 'Clupeonella_engrauliformis'; % ADW
metaData.links.id_Taxo = '171480'; % Taxonomicon
metaData.links.id_WoRMS = '272258'; % WoRMS
metaData.links.id_fishbase = 'Clupeonella_engrauliformis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupeonella_engrauliformis}}';  
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
bibkey = 'JanbFazl2016'; type = 'Article'; bib = [ ... 
'author = {Janbaz, A.A. and Fazli, H. and Pourgholam, R. and Kaymaram, F. and Khedmati, K. and Parafkandeh, F. and Afraei Bandpei, M.A.}, ' ...
'year = {2016}, ' ...
'title = {Age and growth of bigeye kilka (\emph{Clupeonella grimmi} {K}essler, 1877) in {I}ranian waters of the {C}aspian {S}ea}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {15(4)}, '...
'pages = {1410-1424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KariGabr2010'; type = 'Article'; bib = [ ... 
'author = {Karimzadeh, G. and Gabrielyan, B. and Fazli,  H.}, ' ...
'year = {2010}, ' ...
'title = {Population dynamics and biological characteristics of kilka species ({P}isces: {C}lupeidae) in the southeastern coast of the {C}aspian {S}ea}, ' ... 
'journal = {Iranian Journal of  Fisheries Sciences}, ' ...
'volume = {9(3)}, '...
'pages = {422-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupeonella-engrauliformis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  