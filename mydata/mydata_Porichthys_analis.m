  function [data, auxData, metaData, txtData, weights] = mydata_Porichthys_analis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Batrachoidiformes'; 
metaData.family     = 'Batrachoididae';
metaData.species    = 'Porichthys_analis'; 
metaData.species_en = 'Darkedge midshipman'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMr', '0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 03 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 08];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.7;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 36;   units.Li = 'cm';  label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 5.44e-2;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'DeMa1990';
  comment.Wwb = ' based on egg diameter of 0.47 cm of P. notatus: pi/6*0.47^3'; 
data.Wwp = 40.5;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00692*Lp^3.15, see F1';
data.Wwi = 553;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.15, see F1; max. published weight: 422.80 g';
  
data.Ri = 110/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'DeMa1990';   
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on fecundity of P. notatus';
  
% uni-variate data
% time-length
data.tL = [... % time (yr), length (cm)
0	 5.535
1	16.860
2	24.167
3	28.526
4	30.833
5	32.604
6	33.482];
data.tL(:,1) = (0.4 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};
temp.tL = C2K(18.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GonzLope2012';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;  

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '77W9M'; % Cat of Life
metaData.links.id_ITIS = '690667'; % ITIS
metaData.links.id_EoL = '46565855'; % Ency of Life
metaData.links.id_Wiki = 'Porichthys'; % Wikipedia
metaData.links.id_ADW = 'Porichthys_analis'; % ADW
metaData.links.id_Taxo = '184548'; % Taxonomicon
metaData.links.id_WoRMS = '275650'; % WoRMS
metaData.links.id_fishbase = 'Porichthys-analis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Porichthys}}';  
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
bibkey = 'DeMa1990'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1446452}, ' ...
'author = {Edward E. DeMartini}, ' ...
'year = {1990}, ' ...
'title = {Annual Variations in Fecundity, Egg Size and Condition of the Plainfin Midshipman (\emph{Porichthys notatus})}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1990(3)}, '...
'pages = {850–855}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzLope2012'; type = 'Article'; bib = [ ...  
'author = {Gonz\''{a}lez-Ochoa, O.A. and J. L\''{o}pez-Martínez and N.Y. Hern\''{a}ndez-Saavedra}, ' ...
'year = {2012}, ' ...
'title = {Darkedge midshipman \emph{Porichthys analis} ({B}atrachoidiformes: {B}atrachoididae), a common shrimp-bycatch fish from the {G}ulf of {C}alifornia}, ' ... 
'journal = {Revista de Biologia Tropical}, ' ...
'volume = {60(4)}, '...
'pages = {1795-1805}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Porichthys-analis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

