function [data, auxData, metaData, txtData, weights] = mydata_Macrhybopsis_aestivalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Macrhybopsis_aestivalis'; 
metaData.species_en = 'Speckled chub'; 

metaData.ecoCode.climate = {'BWh','BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 06];

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'HermPlau2008';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 12.6;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 0.13;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00457*Lp^3.06, see F1';
data.Wwi = 10.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.06, see F1';

data.Ri = 796/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
    1  2.9
    2  4.8
    3  7.3];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HermPlau2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00457*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3X2HZ'; % Cat of Life
metaData.links.id_ITIS = '163864'; % ITIS
metaData.links.id_EoL = '994823'; % Ency of Life
metaData.links.id_Wiki = 'Macrhybopsis_aestivalis'; % Wikipedia
metaData.links.id_ADW = 'Macrhybopsis_aestivalis'; % ADW
metaData.links.id_Taxo = '179433'; % Taxonomicon
metaData.links.id_WoRMS = '1021445'; % WoRMS
metaData.links.id_fishbase = 'Macrhybopsis-aestivalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrhybopsis_aestivalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Macrhybopsis-aestivalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'HermPlau2008'; type = 'techreprot'; bib = [ ...
'author = {Patricia Herman and Andrew Plauck and Nick Utrup and Tracy Hill}, ' ...
'year = {2008}, ' ...
'title  = {Three Year Summary Age and Growth Report For  Sturgeon Chub (\emph{Macrhybopsis aestivalis})  Pallid Sturgeon Population Assessment Project and Associated Fish Community Monitoring for the Missouri River }, ' ...
'institution = {United States Fish and Wildlife Service  Columbia National Fish and Wildlife Conservation Office 101 Park DeVille Dr, Suite A Columbia, MO   }, ' ...
'volume = {65203}'];
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

