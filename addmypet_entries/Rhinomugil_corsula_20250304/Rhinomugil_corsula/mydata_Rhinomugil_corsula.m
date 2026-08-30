function [data, auxData, metaData, txtData, weights] = mydata_Rhinomugil_corsula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Rhinomugil_corsula'; 
metaData.species_en = 'Corsula'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 04];

%% set data
% zero-variate data

data.am = 17*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'KendGray2009';   
  temp.am = C2K(18.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 45;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 95;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01072*Lp^2.94, see F1';
data.Wwi = 777.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.94, see F1';
  
data.Ri  = 3.5e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Chelon_saliens';
  
% uni-variate data
% time-length
data.tL = [ ... % yr class (d), total length (cm)
195.900	5.522
319.328	12.755
348.769	14.301
365+13.966	14.591
365+44.917	16.766
365+74.736	17.684
365+105.310	19.022
365+135.129	20.010
365+166.836	20.999
365+196.277	21.568
365+226.851	22.557
730+45.672	26.394
730+74.736	26.475
730+165.326	27.696
1095+46.050	29.604];
data.tL(:,1) = data.tL(:,1) - 150; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  bibkey.tL = 'AraAzad2019';
temp.tL    = C2K(18.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_LMf','tL_LMm'}; subtitle1 = {'Data for females, males from Lake Macquarie'};
% set2 = {'tL_SGBf','tL_SGBm'}; subtitle2 = {'Data for females, males from  from St Georges Basin'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S9DR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46571572'; % Ency of Life
metaData.links.id_Wiki = 'Rhinomugil_corsula'; % Wikipedia
metaData.links.id_ADW = 'Rhinomugil_corsula'; % ADW
metaData.links.id_Taxo = '186041'; % Taxonomicon
metaData.links.id_WoRMS = '282586'; % WoRMS
metaData.links.id_fishbase = 'Rhinomugil-corsula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinomugil_corsula}}';
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
bibkey = 'AraAzad2019'; type = 'Article'; bib = [ ... 
'author = {Ara, S.I. and M.A. Azadi and M. Nasiruddin and A. Hossain and M.G. Mustafa}, ' ... 
'year = {2019}, ' ...
'title = {Population dynamics of the mullet fish, \emph{Rhinomugil corsula} ({H}amilton, 1822), in the {S}itakunda coast of the {B}ay of {B}engal}, ' ...
'journal = {Bangladesh Journal of Zoology}, ' ...
'volume = {47(2)}, ' ...
'pages = {305-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Rhinomugil-corsula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

