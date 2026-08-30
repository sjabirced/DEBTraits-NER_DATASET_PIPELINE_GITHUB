function [data, auxData, metaData, txtData, weights] = mydata_Varanus_gouldii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_gouldii'; 
metaData.species_en = 'Sand goanna'; 

metaData.ecoCode.climate = {'A','BWh','BSh','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'jiTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 04];

%% set data
% zero-variate data

data.ab = 11*30.5;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.tp = 'ADW: based on Varanus_rosenbergi';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'ADW: based on Varanus bengalensis';
data.am = 18.3*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 26; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'ADW: based on Varanus_niloticus';
data.Wwi = 6000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15 eggs per clutch; 1 clutch per yr';

data.JOi  = 1.9; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'ChriConl1994';   
  temp.JOi = C2K(35);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 1086; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'lay their eggs in termite mounds';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FG7M'; % Cat of Life
metaData.links.id_ITIS = '716517'; % ITIS
metaData.links.id_EoL = '790184'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_gouldii'; % Wikipedia
metaData.links.id_ADW = 'Varanus_gouldii'; % ADW
metaData.links.id_Taxo = '49773'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Varanus/gouldii'; % ReptileWeb
metaData.links.id_AnAge = 'Varanus_gouldii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_gouldii}}';
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
bibkey = 'NespSola2017'; type = 'Article'; bib = [ ... 
'author = {R. F. Nespolo and J. J. Solano-Iguaran and F. Bozinovic}, '...
'title = {Phylogenetic Analysis Supports the Aerobic-Capacity Model for the Evolution of Endothermy}, '...
'journal = {Am. Nat.}, '....
'year = {2017}, '...
'volume = {189}, '...
'pages = {13-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChriConl1994'; type = 'Article'; bib = [ ... 
'doi = {10.1071/zo9940185}, ' ...
'title = {Activity and Resting Metabolism of Varanid Lizards Compared With Typical Lizards}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {42(2)}, '...
'year = {1994}, '...
'pages = {185-193}, ' ...
'author = {Christian, K. A. and Conley, K. E.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

