function [data, auxData, metaData, txtData, weights] = mydata_Hemitriakis_indroyonoi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Hemitriakis_indroyonoi'; 
metaData.species_en = 'Indonesian houndshark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 6.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 29;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
  comment.Lb = '28 to 30  cm';
data.Lp  = 90;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 120;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 110; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'guess';

data.Wwb = 44.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00417*Lb^3.07, see F3';
data.Wwp = 2.6e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00363*Lp^3.00, see F3';
data.Wwi = 6.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00363*Li^3.00, see F3';
data.Wwim = 4.8e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = {'guess','fishbase'};
  comment.Wwim = 'based on 0.00363*Lim^3.00, see F3';
 
data.Ri  = 9/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 11 pups per litter, one litter per yr';

% uni-variate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  29.4
    2  74.1 
    4 100.1
    6 115.3
    8 124.2
   10 129.3
   12 132.3
   14 134.1
   16 135.1
   18 135.7
   20 136.0];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SentChod2020';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00363*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indian Ocean: eastern Indonesia and India';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KTLX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46559980'; % Ency of Life
metaData.links.id_Wiki = 'Hemitriakis_indroyonoi'; % Wikipedia
metaData.links.id_ADW = 'Hemitriakis_indroyonoi'; % ADW
metaData.links.id_Taxo = '3416184'; % Taxonomicon
metaData.links.id_WoRMS = '712377'; % WoRMS
metaData.links.id_fishbase = 'Hemitriakis_indroyonoi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemitriakis_indroyonoi}}';
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
bibkey = 'SentChod2020'; type = 'Article'; bib = [ ... 
'author = {Agus Arifin Sentosa and Umi Chodrijah}, ' ... 
'year = {2020}, ' ...
'title = {Length-weight relationship and growth parameters of {I}ndonesian houndshark (\emph{Hemitriakis indroyonoi} {W}hite, {C}ompagno \& {D}harmadi, 2009) caught from artisanal fisheries in Southern West {N}usa {T}enggara {W}aters}, ' ...
'journal = {AACL Bioflux}, ' ...
'volume = {13(3)}, ' ...
'pages = {1211-1220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemitriakis_indroyonoi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

