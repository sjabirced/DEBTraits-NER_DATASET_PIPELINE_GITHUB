function [data, auxData, metaData, txtData, weights] = mydata_Epiplatys_bifasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Nothobranchiidae';
metaData.species    = 'Epiplatys_bifasciatus'; 
metaData.species_en = 'Two-banded panchax'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 19];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on own obserations for Epiplatys dageti';

data.Lp  = 2.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'OlaoLama2009';
data.Li  = 4.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'OlaoLama2009';
  comment.Li = 'questionable data in view of LN data; possibly applies to Monai Stream only';
data.Lim  = 5.3;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'OlaoLama2009';

data.Wwb = 1.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'OlaoLama2009';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp  = 0.14; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on .00676*Lp^3.06, see F1';
data.Wwi = 0.77;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.06, see F1';
data.Wwim = 1.11;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on  0.00676*Lim^3.06, see F1';
 
data.Ri = 159/365;    units.Ri = '#/d'; label.Ri = 'mas reproduction rate'; bibkey.Ri = 'OlaoLama2009';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

   
% uni-variate data
% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
    2 2.59
    4 4.17
    6 5.13
    8 5.72
   10 6.08
   12 6.29
   14 6.43
   16 6.51
   18 6.56
   20 6.59
   22 6.61
   24 6.62];
data.tL(:,1) = 30.5 * (data.tL(:,1) + 0); % conver mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OlaoLama2009'; 

% length-weight
data.LW = [ ... % log10 total length (mm), log10 weight (mg)
1.320	2.179
1.379	1.882
1.396	1.936
1.397	2.044
1.398	2.017
1.414	2.067
1.415	2.059
1.415	2.098
1.415	2.163
1.415	1.997
1.415	2.028
1.416	1.959
1.429	2.152
1.430	1.951
1.430	2.059
1.430	1.994
1.431	2.028
1.431	2.048
1.431	2.240
1.432	2.113
1.445	2.225
1.448	1.982
1.448	2.009
1.448	2.051
1.448	2.086
1.448	2.136
1.448	2.113
1.461	2.144
1.461	2.217
1.462	2.063
1.462	2.082
1.463	2.005
1.463	2.036
1.464	2.113
1.476	2.082
1.477	2.206
1.477	2.105
1.477	2.256
1.477	2.279
1.478	2.152
1.478	2.175
1.480	2.233
1.491	2.117
1.491	2.152
1.491	2.175
1.492	2.202
1.493	2.267
1.493	2.240
1.494	2.290
1.503	2.321
1.505	2.152
1.505	2.194
1.505	2.229
1.505	2.256
1.506	2.360
1.507	2.283
1.517	2.225
1.519	2.202
1.519	2.368
1.520	2.310
1.520	2.344
1.521	2.267
1.531	2.279
1.532	2.233
1.532	2.395
1.532	2.422
1.532	2.456
1.532	2.329
1.533	2.364
1.533	2.310
1.543	2.364
1.544	2.429
1.544	2.545
1.544	2.210
1.545	2.314
1.546	2.395
1.546	2.468
1.558	2.329
1.558	2.379
1.558	2.414
1.558	2.449
1.558	2.483
1.569	2.410
1.569	2.460
1.569	2.553
1.569	2.495
1.570	2.383
1.570	2.518
1.570	2.626
1.571	2.437
1.580	2.452
1.582	2.391
1.582	2.560
1.583	2.410
1.583	2.425
1.583	2.533
1.584	2.495
1.590	2.429
1.591	2.476
1.592	2.560
1.592	2.676
1.592	2.591
1.593	2.514
1.593	2.630
1.602	2.653
1.602	2.668
1.603	2.618
1.604	2.487
1.604	2.545
1.605	2.526
1.605	2.580
1.612	2.611
1.612	2.645
1.612	2.553
1.613	2.684
1.623	2.587
1.624	2.614
1.624	2.688
1.624	2.726
1.625	2.653
1.636	2.630
1.636	2.688
1.643	2.580
1.644	2.649
1.645	2.765
1.645	2.680
1.647	2.719
1.654	2.780
1.654	2.680
1.655	2.711
1.665	2.761
1.665	2.823
1.671	2.923
1.673	2.730
1.674	2.765
1.675	2.792
1.681	2.780
1.682	2.730
1.684	2.826
1.707	2.884
1.726	2.842];
data.LW = 10.^data.LW; % remove log transform
data.LW(:,1) =  data.LW(:,1)/10;  data.LW(:,2) =  data.LW(:,2)/1000; % convert mm to cm, mg to g
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'OlaoLama2009'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww = 0.00676*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Africa: Senegal, Gambia, Guinea, Mali, Burkina Faso (Upper Volta), Niger, Ghana, Togo, Benin, Nigeria, Cameroon, Chad and Central African Republic; also Bahr el Jebel and White Nile drainage. Reported from Cote d''Ivoire';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FV2H'; % Cat of Life
metaData.links.id_ITIS = '646985'; % ITIS
metaData.links.id_EoL = '216582'; % Ency of Life
metaData.links.id_Wiki = 'Epiplatys'; % Wikipedia
metaData.links.id_ADW = 'Epiplatys_bifasciatus'; % ADW
metaData.links.id_Taxo = '387240'; % Taxonomicon
metaData.links.id_WoRMS = '1013634'; % WoRMS
metaData.links.id_fishbase = 'Epiplatys-bifasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epiplatys}}';
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
bibkey = 'OlaoLama2009'; type = 'Article'; bib = [ ... 
'author = {B.D. Olaosebikan and S.L. Lamai and T. Musschoot}, ' ... 
'year = {2009}, ' ...
'title = {Population dynamics, life-history traits of and habitat use by two sympatricnothobranchiid fishes in a tropical stream, {K}ainji {L}ake {B}asin, {N}igeria}, ' ...
'journal = {African Journal of Aquatic Science}, ' ...
'volume = {34(1)}, ' ...
'pages = {45–56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epiplatys-bifasciatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

