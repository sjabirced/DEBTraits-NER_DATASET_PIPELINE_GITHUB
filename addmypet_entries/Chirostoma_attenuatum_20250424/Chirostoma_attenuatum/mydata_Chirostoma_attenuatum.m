function [data, auxData, metaData, txtData, weights] = mydata_Chirostoma_attenuatum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Chirostoma_attenuatum'; 
metaData.species_en = 'Slender silverside'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temerature is guessed';
data.am = 8*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Roja2006'; 
data.Li  = 10;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.6 mm of  Leuresthes_tenuis : pi/6*0.16^3';
data.Wwp = 2.8; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'Roja2006','fishbase'};
  comment.Wwp = 'based on 0.00550*Lp^3.09, see F1';
data.Wwi = 6.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.09, see F1';
  
data.GSI = 0.139; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Roja2006';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
    1 5.77
    2 7.61
    3 8.50
    4 8.14
    5 8.87];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Roja2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00550*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Central America: endemic to the Lerma River basin, Mexico';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5Y6CZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '214655'; % Ency of Life
metaData.links.id_Wiki = 'Chirostoma_attenuatum'; % Wikipedia
metaData.links.id_ADW = 'Chirostoma_attenuatum'; % ADW
metaData.links.id_Taxo = '192526'; % Taxonomicon
metaData.links.id_WoRMS = '1015786'; % WoRMS
metaData.links.id_fishbase = 'Chirostoma-attenuatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chirostoma_attenuatum}}'];
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
bibkey = 'Roja2006'; type = 'article'; bib = [ ...
'howpublished = {\url{https://hidrobiologica.izt.uam.mx/index.php/revHidro/article/view/998/584}}, ' ...
'author = {Rojas-Carrillo P. M.}, ' ... 
'year = {2006}, ' ...
'title = {Aspectos reproductivos del charal prieto \emph{Chirostoma attenuatum} ({M}eek, 1902) del lago de {P}\''{a}tzcuaro, {M}ichoac\''{a}n. {N}uevas l\''{i}neas de investigaci\''{o}nen atherin\''{o}psidos de {M}\''{e}xico}, ' ...
'journal = {Hidrobiol\''{o}gica}, ' ...
'volume = {16(1)}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Chirostoma-attenuatum.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

