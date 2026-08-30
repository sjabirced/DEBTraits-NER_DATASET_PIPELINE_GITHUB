  function [data, auxData, metaData, txtData, weights] = mydata_Luciobarbus_bocagei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Luciobarbus_bocagei'; 
metaData.species_en = 'Iberican barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 16];

%% set data
% zero-variate data
data.am = 11*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 80;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 71;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.01, see F1';
data.Wwi = 5349; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.01, see F1';
    
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';          bibkey.GSI = 'guess';
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Luciobarbus_xanthopterus';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  6.3
    2  8.2
    3 11.5
    4 14.6
    5 18.3
    6 22.3
    7 25.9
    8 28.7
    9 32.8
   10 34.5];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OlivFerr2002'; comment.tL = 'data from Erges';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.01000*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the Tigris-Euphrates basin';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3WCK4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '225271'; % Ency of Life
metaData.links.id_Wiki = 'Luciobarbus_bocagei'; % Wikipedia
metaData.links.id_ADW = 'Luciobarbus_bocagei'; % ADW
metaData.links.id_Taxo = '1682761'; % Taxonomicon
metaData.links.id_WoRMS = '474117'; % WoRMS
metaData.links.id_fishbase = 'Luciobarbus-bocagei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Luciobarbus_bocagei}}';  
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
bibkey = 'MohaAlJu2019'; type = 'Article'; bib = [ ...  
'author = {Abdul-Razak M. Mohamed and Mohanad O.A. Al-Jubouri}, ' ...
'year = {2019}, ' ...
'title = { Growth and Exploitation Rates of Four Cyprinids Fish  in {A}l-{D}iwaniya {R}iver, {I}raq}, ' ... 
'journal = {IOSR Journal of Agriculture and Veterinary Science (IOSR-JAVS)}, ' ...
'volume = {12(8)}, '...
'pages = {58-67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlivFerr2002'; type = 'Article'; bib = [ ...
'doi = {10.1046/j.1439-0426.2002.00333.x}, ' ...
'author = {Oliveira, J. M. and Ferreira, A. P. and Ferreira, M. T.}, ' ...
'year = {2002}, ' ...
'title = {Intrabasin variations in age and growth of \emph{Barbus bocagei} populations}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {18(3)}, '...
'pages = {134–139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Luciobarbus-bocagei}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

