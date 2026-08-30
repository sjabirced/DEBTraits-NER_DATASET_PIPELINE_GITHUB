function [data, auxData, metaData, txtData, weights] = mydata_Chelon_dumerili
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Chelon_dumerili'; 
metaData.species_en = 'Grooved mullet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 24];

%% set data
% zero-variate data

data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'FayeDien2023';   
  temp.am = C2K(26.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm for Mugil cephalus: pi/6*0.09^3';
data.Wwp = 34.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^2.99, see F1';
data.Wwi = 794;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^2.99, see F1';
  
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(26.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Chelon_auratus';
  
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
    1 10.4
    2 17.9
    3 23.3
    4 27.1
    5 29.9
    6 31.9
    7 33.3
    8 34.4
    9 35.1];
data.tL(:,1) = (data.tL(:,1) + 0) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(26.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FayeDien2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {'\'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Eastern Atlantic: Mauritania to South Africa. Western Indian Ocean: Delagoa Bay, Mozambique to Mossel Bay, South Africa'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TVBS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Chelon_dumerili'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5310854'; % Taxonomicon
metaData.links.id_WoRMS = '1042829'; % WoRMS
metaData.links.id_fishbase = 'Chelon-dumerili'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelon_dumerili}}';
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
bibkey = 'FayeDien2023'; type = 'Article'; bib = [ ... 
'doi = {10.24941/ijcr.45151.06.2023}, ' ...
'author = {Alioune Faye and Coumba Dieng and Alassane Sarr and Waly Ndiaye and Malick Diouf and Abiboulaye Mbodj}, ' ... 
'year = {2023}, ' ...
'title = {AGE, GROWTH AND EXPLOITATION PARAMETERS OF \emph{Chelon dumerili} ({S}teindachner, 1870) FROM {S}ALOUM {E}STUARY, {S}ENEGAL}, ' ...
'journal = {International Journal of Current Research}, ' ...
'volume = {15(6)}, ' ...
'pages = {24878-24882}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chelon-dumerili.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
