function [data, auxData, metaData, txtData, weights] = mydata_Planiliza_abu
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Planiliza_abu'; 
metaData.species_en = 'Abu mullet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 30];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'MohaAboo2020';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Mugil_cephalus: pi/6*0.07^3';
data.Wwp = 15.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^2.93, see F1';
data.Wwi = 63.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^2.93, see F1';

data.Ri = 56400/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % yr class (d), std length (cm)
303.324	8.959
365+149.201	10.042
365+181.830	10.611
365+211.195	11.179
365+228.812	11.557
365+269.920	12.409
730+211.073	14.917
1095+271.06 17.456];
data.tL(:,1) = data.tL(:,1) + 50; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MohaAboo2020';

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VQFT'; % Cat of Life
metaData.links.id_ITIS = '630320'; % ITIS
metaData.links.id_EoL = '46571498'; % Ency of Life
metaData.links.id_Wiki = 'Planiliza'; % Wikipedia
metaData.links.id_ADW = 'Liza_klunzingeri'; % ADW
metaData.links.id_Taxo = '5595541'; % Taxonomicon
metaData.links.id_WoRMS = '1418558'; % WoRMS
metaData.links.id_fishbase = 'Planiliza-abu'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planiliza}}';
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
bibkey = 'MohaAboo2020'; type = 'article'; bib = [ ... 
'doi = {10.9790/2380-1309022231}, ' ...
'author = {Mohamed, A.R.M. and A.N. Abood}, ' ... 
'year = {2020}, ' ...
'title = {Population dynamics of three mullets species ({M}ugilidae) from the {S}hatt {A}l-{A}rab {R}iver, {I}raq}, ' ...
'journal = {Journal of Agriculture and Veterinary Science}, ' ...
'volume = {13(9)}, ' ...
'pages = {22-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Planiliza-abu.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

