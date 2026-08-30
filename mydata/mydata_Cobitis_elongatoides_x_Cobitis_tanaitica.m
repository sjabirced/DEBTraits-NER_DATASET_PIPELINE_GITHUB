  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_elongatoides_x_Cobitis_tanaitica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_elongatoides_x_Cobitis_tanaitica'; 
metaData.species_en = 'Danubian x  Don River Spined loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 25];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
data.Li = 14.6;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 0.0026;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'FedoKosc2017';
  comment.Wwb = 'Based on egg diameter of 1.7 mm of Cobitis_elongatoides: pi/6*0.17^3';
data.Wwp = 1.3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Robo1981';
  comment.Wwp = 'Based on 0.00525*Lp^3.07, see F1';
data.Wwi = 19.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'Robo1981';
  comment.Wwi = 'Based on 0.00525*Li^3.07, see F1';

data.Ri = 933/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';  bibkey.Ri = 'FedoKosc2017';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 5.30 5.30 6.13
    2 8.17 6.80 6.57
    3 9.17 7.83 6.85
    4 8.90 9.24 NaN ];
data.tL(:,1) = (.2 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FedoKosc2017'; treat.tL = {1 {'female 2n','female 3n','male 2n'}}; 
comment.tL = 'data from Okna River, Solvakia';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f1970', 'tL_m1970'}; subtitle1 = {'Data for 1970-cohort females, males'};
% metaData.grp.sets = {set1,set2,set3,set4,set5,set6};
% metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6};

%% Discussion points
D1 = 'Males and triploid females are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe: Danube basin, upper Elbe and Odra drainages. Argeşel River in Romania';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WK47'; % Cat of Life
metaData.links.id_ITIS = '163981'; % ITIS
metaData.links.id_EoL = '212556'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_elongatoides'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_elongatoides'; % ADW
metaData.links.id_Taxo = '43977'; % Taxonomicon
metaData.links.id_WoRMS = '154373'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-elongatoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_elongatoides}}';  
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
bibkey = 'FedoKosc2017'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIEP/02059}, ' ...
'author = {Jakub Fedor\v{c}\''{a}k and J\''{a}n Ko\v{s}\v{c}o and Karel Hala\v{c}ka and Peter Manko}, ' ...
'year = {2017}, ' ...
'title = {GROWTH DIFFERENCES IN DIFFERENT BIOTYPES OF THE HYBRID COMPLEX OF \emph{Cobitis_elongatoides} $\times$ \emph{Cobitis_tanaitica} ({A}CTINOPTERYGII: {C}YPRINIFORMES: {C}OBITIDAE) IN THE {O}KNA {R}IVER ({D}ANUBE {R}IVER {B}ASIN), {S}LOVAKIA}, ' ... 
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {47(2)}, '...
'pages = {125–132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FedoKosc2017'; type = 'Article'; bib = [ ... 
'doi = {10.3750/AIEP/02059}, ' ...
'author = {Karel Hala\v{c}ka and V\v{e}ra Luskov\''{a} and Stanlislav Lusk}, ' ...
'year = {2000}, ' ...
'title = {Fecundity of \emph{Cobitis elongatoides} in the Nov\''{a} \v{R}í\v{s}e {R}eservoir}, ' ... 
'journal = {Folia Zoologica}, ' ...
'volume = {49(Suppl 1)}, '...
'pages = {141-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cobitis-elongatoides}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
