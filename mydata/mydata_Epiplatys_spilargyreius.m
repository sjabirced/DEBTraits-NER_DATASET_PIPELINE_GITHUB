function [data, auxData, metaData, txtData, weights] = mydata_Epiplatys_spilargyreius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Nothobranchiidae';
metaData.species    = 'Epiplatys_spilargyreius'; 
metaData.species_en = 'Green panchax'; 

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
data.Li  = 4.9;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'OlaoLama2009';
  comment.Li = 'questionable data in view of LN data; possibly applies to Monai Stream only';
data.Lim  = 5.2;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'OlaoLama2009';

data.Wwb = 1.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'OlaoLama2009';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp  = 0.14; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'guess','fishbase'}; 
  comment.Wwp = 'based on 0.00708*Lp^3.21, see F1';
data.Wwi = 0.77;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.21, see F1';
data.Wwim = 1.11;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on  0.00708*Lim^3.21, see F1';
 
data.Ri = 196/365;    units.Ri = '#/d'; label.Ri = 'mas reproduction rate';  bibkey.Ri = 'OlaoLama2009';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

   
% uni-variate data
% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
    2 2.63
    4 4.28
    6 5.34
    8 6.00
   10 6.42
   12 6.68
   14 6.85
   16 6.95
   18 7.02
   20 7.06
   22 7.09
   24 7.10];
data.tL(:,1) = 30.5 * (data.tL(:,1) + 0); % conver mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OlaoLama2009'; 

% length-weight
data.LW = [ ... % log10 total length (mm), log10 weight (mg)
1.376	2.064
1.393	2.001
1.394	2.077
1.396	1.815
1.397	2.026
1.412	2.094
1.413	2.140
1.415	2.051
1.428	2.153
1.429	2.203
1.429	2.055
1.431	2.106
1.445	2.220
1.446	2.258
1.446	2.085
1.446	2.178
1.447	2.131
1.447	2.152
1.458	2.245
1.459	2.186
1.460	2.220
1.462	2.135
1.475	2.253
1.475	2.283
1.476	2.160
1.476	2.304
1.476	2.410
1.491	2.325
1.491	2.397
1.504	2.376
1.506	2.325
1.506	2.426
1.507	2.295
1.516	2.346
1.519	2.384
1.519	2.426
1.519	2.464
1.521	2.299
1.529	2.287
1.531	2.342
1.531	2.481
1.531	2.380
1.532	2.177
1.533	2.396
1.533	2.435
1.543	2.468
1.545	2.430
1.545	2.616
1.546	2.498
1.546	2.578
1.556	2.295
1.556	2.502
1.556	2.544
1.558	2.472
1.566	2.692
1.567	2.557
1.568	2.510
1.568	2.582
1.568	2.620
1.578	2.531
1.579	2.599
1.579	2.683
1.581	2.578
1.589	2.573
1.590	2.641
1.603	2.713
1.603	2.637
1.604	2.675
1.612	2.729
1.612	2.662
1.612	2.700
1.622	2.738
1.623	2.704
1.634	2.649
1.634	2.793
1.635	2.480
1.637	2.725
1.642	2.809
1.645	2.742
1.653	2.843
1.654	2.775
1.655	2.826
1.665	2.957
1.675	2.856
1.683	2.919
1.691	2.995
1.693	2.619
1.693	2.771
1.719	3.075];
data.LW = 10.^data.LW; % remove log transform
data.LW(:,1) =  data.LW(:,1)/10;  data.LW(:,2) =  data.LW(:,2)/1000; % convert mm to cm, mg to g
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'OlaoLama2009'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
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
F1 = 'length-weight: Ww = 0.00708*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Africa: Senegal, Gambia, Guinea, Mali, Burkina Faso (Upper Volta), Niger, Ghana, Togo, Benin, Nigeria, Cameroon, Chad and Central African Republic; also Bahr el Jebel and White Nile drainage. Reported from Cote d''Ivoire';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6G73D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '994789'; % Ency of Life
metaData.links.id_Wiki = 'Epiplatys'; % Wikipedia
metaData.links.id_ADW = 'Epiplatys_spilargyreius'; % ADW
metaData.links.id_Taxo = '173972'; % Taxonomicon
metaData.links.id_WoRMS = '1017206'; % WoRMS
metaData.links.id_fishbase = 'piplatys-spilargyreius'; % fishbase

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
'howpublished = {\url{http://www.fishbase.org/summary/piplatys-spilargyreius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

