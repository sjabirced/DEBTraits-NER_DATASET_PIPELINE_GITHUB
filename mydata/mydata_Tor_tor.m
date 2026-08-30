  function [data, auxData, metaData, txtData, weights] = mydata_Tor_tor
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Tor_tor'; 
metaData.species_en = 'Tor barb'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 04 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 17];

%% set data
% zero-variate data
data.ab = 11;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'JohaNeg2003'; 
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'fishbase also gives TL 275 cm';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'JohaNeg2003';
  comment.Wwb = 'Based on egg diameter of 2-2.5 mm: pi/6*0.225^3';
data.Wwp = 479;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00955*Lp^3.02, see F1';
data.Wwi = 35.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.02, see F1;max. published weight: 68 kg';

data.Ri  = 17200/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 22.8
    2 35.3
    3 43.7
    4 51.2
    5 58.6
    6 65.3];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NautDwiv2021'; comment.tL = 'data from Paisuni river';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00955*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57FBW'; % Cat of Life
metaData.links.id_ITIS = '925851'; % ITIS
metaData.links.id_EoL = '203961'; % Ency of Life
metaData.links.id_Wiki = 'Tor_tor'; % Wikipedia
metaData.links.id_ADW = 'Tor_tor'; % ADW
metaData.links.id_Taxo = '43881'; % Taxonomicon
metaData.links.id_WoRMS = '1026602'; % WoRMS
metaData.links.id_fishbase = 'Tor-tor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tor_tor}}';  
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
bibkey = 'NautDwiv2021'; type = 'article'; bib = [ ...  
'author = {Prakash Nautiyal and Amitabh Chandra Dwivedi}, ' ...
'year = {2021}, ' ...
'title = {Growth rate determination of the endangered mahseer, \emph{Tor tor} ({H}amilton 1822) from the {B}undelkhand region, central {I}ndia}, ' ... 
'journal = {J. Fish. Res.}, ' ...
'volume = {5(3)}, ' ...
'pages = {1-4}, ' ...
'howpublished = {url{https://aquadocs.org/handle/1834/33381}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tor-tor}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

