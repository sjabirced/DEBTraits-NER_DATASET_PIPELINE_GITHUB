function [data, auxData, metaData, txtData, weights] = mydata_Stenobrachius_nannochir
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Stenobrachius_nannochir'; 
metaData.species_en = 'Garnet lanternfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.5); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 06 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 26];

%% set data
% zero-variate data
data.am = 5.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Adam1979';  
  temp.am = C2K(2.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 20;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 5.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};  
  comment.Wwp = 'based on 0.00513*Lp^3.14, see F3';
data.Wwi = 43.8;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00513*Li^3.14, see F3';

data.Ri = 2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(2.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), standard length (cm) 
    1 3.9
    2 5.1
    3 6.3
    4 7.7];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(2.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Adam1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'North Pacific: Sea of Okhotsk, Kuril Islands, and the Pacific coast of the USA; widely distributed in subarctic waters ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4ZW3S'; % Cat of Life
metaData.links.id_ITIS = '162665'; % ITIS
metaData.links.id_EoL = '46564307'; % Ency of Life
metaData.links.id_Wiki = 'Stenobrachius_nannochir'; % Wikipedia
metaData.links.id_ADW = 'Stenobrachius_nannochir'; % ADW
metaData.links.id_Taxo = '188163'; % Taxonomicon
metaData.links.id_WoRMS = '254364'; % WoRMS
metaData.links.id_fishbase = 'Stenobrachius_nannochir'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stenobrachius_nannochir}}';
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
bibkey = 'Adam1979'; type = 'phdthesis'; bib = [ ...
'author = {Albert Edward Adams}, ' ... 
'year   = {1979}, ' ...
'title  = {The food habits, age, and growth of three midwater fishes (\emph{Stenobrachius leucopsarus}, \emph{Stenobrachius nannochir nannochir} and \emph{Leuroglossus schmidti} from the southeastern Bering Sea}, ' ...
'school = {University of Alaska, Fairbanks}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Stenobrachius_nannochir}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

