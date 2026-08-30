function [data, auxData, metaData, txtData, weights] = mydata_Neochelon_falcipinnis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Neochelon_falcipinnis'; 
metaData.species_en = 'Sicklefin mullet';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 28];

%% set data
% zero-variate data

data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17.9;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 41;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 54.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwim = 'based on 0.01096*Lp^2.95, see F1';
data.Wwi = 627;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^2.95, see F1; max. published weight: 262.00 g';
  
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'DiedSarr2022';
  temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
90.115	15.060
120.469	15.136
150.827	15.460
181.566	15.950
213.435	15.777
365+30.957	17.559
365+60.554	17.718
365+91.669	17.960
365+121.647	18.284
365+212.334	18.761
365+245.722	18.671
365+274.180	18.830
730+31.748	20.128
730+90.943	20.529
730+120.537	20.522
730+151.270	20.515
730+213.122	21.081
730+274.970	21.316
1095+0.662	22.207
1095+58.717	22.525
1095+243.885	23.478
1460+31.420	24.189
1460+212.789	24.728];
data.tL(:,1) = data.tL(:,1) + 900; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  bibkey.tL = 'OlopDien2019';
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46CRQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '49673542'; % Ency of Life
metaData.links.id_Wiki = 'Neochelon_falcipinnis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5526683'; % Taxonomicon
metaData.links.id_WoRMS = '1042873'; % WoRMS
metaData.links.id_fishbase = 'Neochelon-falcipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neochelon_falcipinnis}}';
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
bibkey = 'DiedSarr2022'; type = 'Article'; bib = [ ... 
'author = {Patrick Diedhiou and Alassane Sarr and Ousseynou Samba and Modou Sene and Mar\`{e}me Tall}, ' ... 
'year = {2022}, ' ...
'title = {Biology of the Reproduction of {M}ugilidae \emph{Neochelon falcipinnis} ({V}alenciennes, 1836) in the Protected Marine Area of {N}iamone-{K}alounayes ({C}asamance {E}stuary)}, ' ...
'journal = {Annual Research \& Review in Biology}, ' ...
'volume = {37(10)}, ' ...
'pages = {57-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlopDien2019'; type = 'Article'; bib = [ ... 
'author = {Olaniyi Alaba Olopade and Henry Eyina Dienye and Samuel Kweku Konney Amponsah}, ' ... 
'year = {2019}, ' ...
'title = {A Preliminary Study of Growth Pattern, Condition Factor and Population Structure of Sicklefin Mullet, \emph{Liza falcipinnis} ({V}alenciennes, 1836) in the {N}ew {C}alabar {R}iver, {N}igeria}, ' ...
'journal = {Turkish Journal of Science \& Technology}, ' ...
'volume = {14(1)}, ' ...
'pages = {15-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Neochelon-falcipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

