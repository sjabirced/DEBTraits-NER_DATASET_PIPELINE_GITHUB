  function [data, auxData, metaData, txtData, weights] = mydata_Raiamas_moorii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Danionidae';
metaData.species    = 'Raiamas_moorii'; 
metaData.species_en = 'Lake Rukwa minnow'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 29];

%% set data
% zero-variate data
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'AhamAhme2017';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 22;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 7.3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00501*Lp^3.04, see F1';
data.Wwi = 60.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.04, see F1';

% univariate data
data.Ri = 15985/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'AhamAhme2017';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% time-length
data.tL = [ ... % time (mnth), std length (cm), weight (g)
 1	 7.4
 2	10.9
 3	14.4
 4	16.4
 5	17.0
 6	17.5
 7	18.9];
data.tL(:,1) = (data.tL(:,1) + .2) * 365; % convert mnth to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RobbThys1984'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00501*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6X3J9'; % Cat of Life
metaData.links.id_ITIS = '689876'; % ITIS
metaData.links.id_EoL = '221351'; % Ency of Life
metaData.links.id_Wiki = 'Raiamas_moorii'; % Wikipedia
metaData.links.id_ADW = 'Raiamas_moorii'; % ADW
metaData.links.id_Taxo = '185708'; % Taxonomicon
metaData.links.id_WoRMS = '1018974'; % WoRMS
metaData.links.id_fishbase = 'Raiamas_moorii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Raiamas_moorii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobbThys1984'; type = 'Article'; bib = [ ...  
'author = {Robben, J. and D.F.E. Thys van de Audenaerde}, ' ...
'year = {1984}, ' ...
'title = {A preliminary study of the age and growth of the cyprinid fish \emph{Barilius moori} {B}lgr. from {L}ake {K}ivu}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {108}, '...
'pages = {153-163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Raiamas-moorii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

