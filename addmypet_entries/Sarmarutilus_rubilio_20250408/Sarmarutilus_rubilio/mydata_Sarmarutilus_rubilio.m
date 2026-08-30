  function [data, auxData, metaData, txtData, weights] = mydata_Sarmarutilus_rubilio
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Sarmarutilus_rubilio'; 
metaData.species_en = 'Adriatic roach'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 08];

%% set data
% zero-variate data
data.ab = 19;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Rutilus rutilus';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'CrivDupo1987';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'DaouKatt1985'; 
data.Li = 26;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'CrivDupo1987';

data.Wwb = 1.4e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DaouKatt1985';
  comment.Wwb = 'Based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 10.8;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'DaouKatt1985','fishbase'};
  comment.Wwp = 'Based on 0.00912*Lp^3.22, see F1';
data.Wwi = 328; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'DaouKatt1985','fishbase'};
  comment.Wwi = 'Based on 0.00912*Li^3.22, see F1; max. published weight: 8.0 kg ';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
 3	7.495
 4	9.596
 5	11.726
 6	13.829
 7	15.876
 8	17.370
 9	18.643
10	20.251];
data.tL(:,1) = 365 * (data.tL(:,1)-0.9);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CrivDupo1987';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    9.5  1391
   10.5  1771
   11.5  2167  
   12.5  2588
   13.5  3316 
   14.5  5243 
   15.5  7173
   16.5  8901
   17.5  9969
   18.5 13857
   19.5 13300
   20.5 18300
   21.5 10491
   23.5 18648
   25.5 18877];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DaouKatt1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Sierakowo, Blotno, Wickie Lake'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00912*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Black and Azov Sea basins';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6XNYV'; % Cat of Life
metaData.links.id_ITIS = '1199825'; % ITIS
metaData.links.id_EoL = '212829'; % Ency of Life
metaData.links.id_Wiki = 'Sarmarutilus_rubilio'; % Wikipedia
metaData.links.id_ADW = 'Rutilus_rubilio'; % ADW
metaData.links.id_Taxo = '5653018'; % Taxonomicon
metaData.links.id_WoRMS = '1418252'; % WoRMS
metaData.links.id_fishbase = 'Sarmarutilus-rubilio'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sarmarutilus_rubilio}}';  
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
bibkey = 'CrivDupo1987'; type = 'Article'; bib = [ ... 
'author = {A. J. Crivelli and F. Dupont}, ' ...
'year = {1987}, ' ...
'title = {Biometrical and biological features of \emph{Alburnus alburnus} x \emph{Rutilus rubilio natural} hybrids from {L}ake {M}ikri {P}respa, northern {G}reece}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {31}, '...
'pages = {721-733}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaouKatt1985'; type = 'Article'; bib = [ ... 
'author = {Ch. Daoulas and M. Kattoulas}, ' ...
'year = {1985}, ' ...
'title = {Reproductive biology of \emph{Rutilus rubilio} ({B}onaparte, 1837) in {L}ake {T}richonis}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {124}, '...
'pages = {49-S}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sarmarutilus-rubilio.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

