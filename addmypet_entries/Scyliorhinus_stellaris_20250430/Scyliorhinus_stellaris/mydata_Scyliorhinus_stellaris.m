function [data, auxData, metaData, txtData, weights] = mydata_Scyliorhinus_stellaris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Scyliorhinus_stellaris'; 
metaData.species_en = 'Nursehound'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 30];

%% set data
% zero-variate data;
data.ab = 11*30.5;    units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'CapaVerg2006';    
  temp.ab = C2K(10.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10-12 mnth';
data.am = 19*365; units.am = 'd';       label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';
data.Lp  = 78;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 170;   units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 12.3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00178*Lb^3.19, see F1';
data.Wwp = 1933;    units.Wwp = 'g';     label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase'; 
  comment.Wwi = 'based on 0.00178*Lp^3.19, see F1';
data.Wwi = 23203;  units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00178*Li^3.19, see F1';

data.Ri  = 109/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(10.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
  0 11.0
 31 19.0
 61 21.0
 92 22.0
122 24.0
153 25.0
184 25.5
216 26.0
247 26.5
268 28.0
396 32.0
452 37.0
497 53.0];
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CapaVerg2006';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';    
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00178*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Northeast Atlantic: southern Scandinavia to Mediterranean, Morocco, Mauritania to Senegal'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4W57R'; % Cat of Life
metaData.links.id_ITIS = '160067'; % ITIS
metaData.links.id_EoL = '46559872'; % Ency of Life
metaData.links.id_Wiki = 'Scyliorhinus_stellaris'; % Wikipedia
metaData.links.id_ADW = 'Scyliorhinus_stellaris'; % ADW
metaData.links.id_Taxo = '41940'; % Taxonomicon
metaData.links.id_WoRMS = '105815'; % WoRMS
metaData.links.id_fishbase = 'Scyliorhinus_stellaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scyliorhinus_stellaris}}';
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
bibkey = 'CapaVerg2006'; type = 'Article'; bib = [ ... 
'author = {Christian Capap\''{e} and Yvan Vergne and R\''{e}gis Vianet and Olivier Gu\''{e}lorget and Jean-Pierre Quignard}, ' ...
'year = {2006}, ' ...
'title  = {Biological observations on the nursehound, \emph{Scyliorhinus stellaris} ({L}innaeus, 1758) ({C}hondrichthyes: {S}cyliorhinidae) in captivity}, ' ...
'journal = {Acta Adriat.}, ' ...
'volume = {47(1)}, ' ...
'pages = {29-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scyliorhinus_stellaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  