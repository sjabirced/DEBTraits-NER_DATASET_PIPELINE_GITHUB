function [data, auxData, metaData, txtData, weights] = mydata_Albula_glossodonta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Albuliformes'; 
metaData.family     = 'Albulidae';
metaData.species    = 'Albula_glossodonta'; 
metaData.species_en = 'Roundjaw bonefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'am'; 'Ls'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 18];

%% set data
% zero-variate data;
data.am = 20*365;units.am = 'd';    label.am = 'life span';                               bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Albula vulpes';

data.Ls  = 6.3;   units.Ls  = 'cm';  label.Ls  = 'standard length at metamorphosis to stage 2'; bibkey.Ls  = 'guess';
  comment.Ls = 'based on Albula vulpes';
data.Lp  = 21.6;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty';              bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Albula vulpes: 25*90/104 cm';
data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';              bibkey.Li  = 'Smithsonian';

data.Wwb = 3.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.9 mm of Albula vulpes: pi/6*0.19^3';
data.Wwp = 151;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01288*Lp^3.05, see F1';  
data.Wwi = 11759;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                   bibkey.Wwi = 'Smithsonian';
  comment.Wwi = 'based on 0.01288*Li^3.05, see F1; max. published weight: 8.6 kg';

data.Ri  = 6e5/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';           bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time-length
data.tL_fm = [ ... % times ince  birth (yr), fork length (cm)
    0  6.3  8.2
    1 19.9 23.9
    2 30.9 34.7
    3 39.8 42.1
    4 47.0 47.1
    5 52.9 50.5
    6 57.7 52.9
    7 61.5 54.5
    8 64.6 55.6
    9 67.2 56.4
   10 69.2 56.9];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.2)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth','fork length'};  
temp.tL_fm = C2K(28.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'FiloLenn2019'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.Wwp = weights.Wwp * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'end of acceleration and of metamorphosis are taken from Albula vulpes';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Indo-Pacific: Red Sea to the Hawaiian and Tuamoto Islands, north to southern Japan, south to Lord Howe Island, Australia; throughout Micronesia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'BGSN'; % Cat of Life
metaData.links.id_ITIS = '553410'; % ITIS
metaData.links.id_EoL = '46581466'; % Ency of Life
metaData.links.id_Wiki = 'Albula_glossodonta'; % Wikipedia
metaData.links.id_ADW = 'Albula_glossodonta'; % ADW
metaData.links.id_Taxo = '94359'; % Taxonomicon
metaData.links.id_WoRMS = '212255'; % WoRMS
metaData.links.id_fishbase = 'Albula-glossodonta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Albula_glossodonta}}';   
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
bibkey = 'FiloLenn2019'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.14057}, ' ...
'author = {Alexander Filous and Robert J. Lennox and Richard R. Coleman and Alan M. Friedlander and Eric E. G. Clua and Andy J. Danylchuk}, ' ... 
'year = {2019}, ' ...
'title = {Life-history characteristics of an exploited bonefish \emph{Albula glossodonta} population in a remote {S}outh {P}acific atoll}, ' ...
'journal = {Fish Biology}, ' ...
'volume = {95(2)}, ' ...
'pages = {562-574}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Albula-glossodonta}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
