function [data, auxData, metaData, txtData, weights] = mydata_Planiliza_haematocheilus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Planiliza_haematocheilus'; 
metaData.species_en = 'So-iuy mullet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW','MAbl','MAm'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 03 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 03 30];

%% set data
% zero-variate data

data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'OkumBagp1997';   
  temp.am = C2K(22.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 48;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 80;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Mugil_cephalus: pi/6*0.07^3';
data.Wwp = 850;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^2.95, see F1';
data.Wwi = 3837;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^2.95, see F1; max. published weight: 5.0 kg';

data.Ri = 2366574/365;  units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(22.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (d), total length (cm)
    1 25.60 29.40
    2 35.75 36.48
    3 42.15 42.78
    4 48.06 46.03
    5 56.12 54.01
    6 61.15 55.17];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)+0.7); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(22.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OkumBagp1997'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % yr class (d), weight (g)
    1  167.0  150.0
    2  405.0  433.8
    3  696.5  691.2
    4 1037.4  980.6
    5 1775.2 1680.0
    6 2343.5 2086.7];
data.tW_fm(:,1) = 365 * (data.tW_fm(:,1)+0.8); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'total length'};  
temp.tW_fm    = C2K(22.4);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'OkumBagp1997'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JJZC'; % Cat of Life
metaData.links.id_ITIS = '630341'; % ITIS
metaData.links.id_EoL = '55633243'; % Ency of Life
metaData.links.id_Wiki = 'Planiliza'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1287612'; % Taxonomicon
metaData.links.id_WoRMS = '1509599'; % WoRMS
metaData.links.id_fishbase = 'Planiliza-haematocheilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planiliza}}';
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
bibkey = 'OkumBagp1997'; type = 'article'; bib = [ ... 
'doi = {10.1007/s13131-015-0625-8}, ' ...
'author = {Ibrahim Okumug and Nadir Bagpnar}, ' ... 
'year = {1997}, ' ...
'title = {Population structure, growth and reproduction of introduced {P}acific mullet, \emph{Mugil so-iuy}, in the {B}lack {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {33}, ' ...
'pages = {45–54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Planiliza-haematocheilus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

