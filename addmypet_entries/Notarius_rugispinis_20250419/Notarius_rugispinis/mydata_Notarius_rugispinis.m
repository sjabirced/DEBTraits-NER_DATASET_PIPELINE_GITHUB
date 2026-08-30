function [data, auxData, metaData, txtData, weights] = mydata_Notarius_rugispinis
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Notarius_rugispinis'; 
metaData.species_en = 'Softhead sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 19];

%% set data
% zero-variate data;

data.am = 10*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 58.5;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'MendLima2013'; 

data.Wwb = 2.14; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 14.5 mm: pi/6*1.45^3';
data.Wwp  = 122; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.00603*Lp^3.08, see F1';
data.Wwi  = 1672; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'MendLima2013','fishbase'}; 
  comment.Wwi = 'based on 0.00603*Li^3.08, see F1';

data.Ri  = 35/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 12.0
    2 21.6
    3 29.1
    4 35.1
    5 39.9
    6 43.7
    7 46.8
    8 49.2
    9 51.1
   10 52.6];
data.tL(:,1) = 365 * (data.tL(:,1) - 0.5); % conver yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MendLima2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: W in g = 0.00603*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Guyana to Maranhao, Brazil';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'CZ32'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46582022'; % Ency of Life
metaData.links.id_Wiki = 'Notarius_(fish)'; % Wikipedia
metaData.links.id_ADW = 'Amphiarius_rugispinis'; % ADW
metaData.links.id_Taxo = '3417975'; % Taxonomicon
metaData.links.id_WoRMS = '279587'; % WoRMS
metaData.links.id_fishbase = 'Notarius-rugispinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notarius_(fish)}}';
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
bibkey = 'MendLima2013'; type = 'Article'; bib = [ ... 
'author = {Nayara Cristina Barbosa Mendes and Wellington Matheus Gomes de Lima and Camila de Nazar\''{e} Ara\''{u}jo Cardoso and Mayra Souza do Nascimento and Pablo Ant\^{o}nio Pinheiro da Cruz and Bianca Bentes Silva},'...
'title = {Estimation of the growth parameters of softhead sea catfish, \emph{Amphiarius rugispinis} ({S}iluriformes: {A}riidae), on a coastal  {A}mazon area, {B}ragan\c{c}a, Par\''{A} State, Brazil},'...
'journal = {Arquivos de Ci\^[e}ncias do Mar  Fortaleza}, '...
'volume = {46(1)}, '...
'year = {2013}, '...
'pages = {39-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Notarius-rugispinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

