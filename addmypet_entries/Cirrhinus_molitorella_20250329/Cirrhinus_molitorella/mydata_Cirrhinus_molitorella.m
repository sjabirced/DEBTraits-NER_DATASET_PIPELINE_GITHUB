  function [data, auxData, metaData, txtData, weights] = mydata_Cirrhinus_molitorella

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Cirrhinus_molitorella'; 
metaData.species_en = 'Mud carp'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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
data.ab = 10;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Wwp and F1';
data.Li = 55;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 171;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on 0.00933*Lp^3.05, see F1';
data.Wwi = 1897;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.05, see F1; max. published weight: 1.5 kg';
    
data.Ri = 204000/365; units.Ri = '#/d'; label.Ri = 'reproduction rate at 6 kg';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tLW = [ ... % time (d), total length (cm), weight (g)
    1 10.8  38.6
    2 15.1 109.0
    3 19.6 236.2
    4 24.4 455.8
    5 27.5 740.3
    6 30.7 1032.0];
data.tLW(:,1) = 365*(0.7+ data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since hatch', 'total length', 'weight'};  
temp.tLW = C2K(28.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Yie1988'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 50;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 5;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

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
D1 = 'Males are assumed not to differ from females';
D2 = 'data Wwp and Wwi are ignored due to inconsistemncy with tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: weight (in g) = 0.00933*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VGTJ'; % Cat of Life
metaData.links.id_ITIS = '688897'; % ITIS
metaData.links.id_EoL = '206617'; % Ency of Life
metaData.links.id_Wiki = 'Cirrhinus_molitorella'; % Wikipedia
metaData.links.id_ADW = 'Cirrhinus_molitorella'; % ADW
metaData.links.id_Taxo = '171290'; % Taxonomicon
metaData.links.id_WoRMS = '1026709'; % WoRMS
metaData.links.id_fishbase = 'Cirrhinus-molitorella'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cirrhinus_molitorella}}';  
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
bibkey = 'Yie1988'; type = 'article'; bib = [ ... 
'author = {Yie, F.}, ' ...
'year = {1988}, ' ...
'title  = {Study on life-history pattern of seven freshwater fishes in the {D}ongjiang {R}iver, {G}uangdong}, ' ...
'journal = {Acta. Hydrobiol. Sin. Shuisheng Shengwu Xuebao}, ' ...
'pages = {12(2)}, ' ...
'volume = {107-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cirrhinus-molitorella}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

