function [data, auxData, metaData, txtData, weights] = mydata_Chirostoma_grandocule
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Chirostoma_grandocule'; 
metaData.species_en = 'Bigeye silverside'; 

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

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.6;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 12.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.6 mm of  Leuresthes_tenuis : pi/6*0.16^3';
data.Wwp = 2.9; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00550*Lp^3.09, see F1';
data.Wwi = 12.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.09, see F1';
  
data.GSI = 0.139; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Chirostoma_attenuatum';

% uni-variate data
% time-length
data.tL = [ ... time since birth (mnth), total length (cm)
    1 3.90
    5 4.40
    6 4.32
    8 4.42
    9 4.42
   10 4.63
   11 5.24
   12 5.50
   13 6.94
   14 7.06
   15 6.97
   16 7.11
   19 7.87
   20 8.14
   21 8.74];
data.tL(:,1) = 30.5*(9+data.tL(:,1)); % convert mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RojaJime1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.GSI = weights.GSI * 3;

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
metaData.links.id_CoL = '5Y64W'; % Cat of Life
metaData.links.id_ITIS = '630720'; % ITIS
metaData.links.id_EoL = '214653'; % Ency of Life
metaData.links.id_Wiki = 'Chirostoma'; % Wikipedia
metaData.links.id_ADW = 'Chirostoma_grandocule'; % ADW
metaData.links.id_Taxo = '170869'; % Taxonomicon
metaData.links.id_WoRMS = '1019386'; % WoRMS
metaData.links.id_fishbase = 'Chirostoma-grandocule'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chirostoma}}'];
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
bibkey = 'RojaJime1993'; type = 'article'; bib = [ ...
'author = {Rojas, C.P.M. and M.de L.B. Jim\''{e}nez and D.M.P. Toledo and B.L. Mares}, ' ... 
'year = {1993}, ' ...
'title = {Estimacion de los parametros de crecimiento y ciclo de madurez gonadica del charal blanco \emph{Chirostoma grandocule}, {S}teindachner 1894 ({P}isces: {A}therinidae) del lago de {P}atzcuaro, {M}ich.}, ' ...
'journal = {Ciencia Pesquera}, ' ...
'volume = {10}, ' ...
'pages = {69-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Chirostoma-grandocule.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

