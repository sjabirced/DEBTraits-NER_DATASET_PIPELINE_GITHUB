function [data, auxData, metaData, txtData, weights] = mydata_Pseudaspius_leptocephalus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pseudaspius_leptocephalus'; 
metaData.species_en = 'Redfin'; 

metaData.ecoCode.climate = {'BSk','Dfb','Dwd'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
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

data.am = 20*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 27.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 68;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 134;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 2029;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1; max. published weight: 3.7 kg';

data.Ri = 36000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
 1	10.200
 2	16.943
 3	22.937
 4	28.091
 5	32.123
 6	35.313
 7	37.476
 8	39.826
 9	41.709
10	44.620
11	46.876];
data.tL(:,1) = 365 * (0.2+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Seme2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'length-weight: W in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Amur drainage, Sakhalin Island and Mongolia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4NLGT'; % Cat of Life
metaData.links.id_ITIS = '163479'; % ITIS
metaData.links.id_EoL = '49291089'; % Ency of Life
metaData.links.id_Wiki = 'Pseudaspius_leptocephalus'; % Wikipedia
metaData.links.id_ADW = 'Pseudaspius_leptocephalus'; % ADW
metaData.links.id_Taxo = '184999'; % Taxonomicon
metaData.links.id_WoRMS = '1023018'; % WoRMS
metaData.links.id_fishbase = 'Pseudaspius-leptocephalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudaspius_leptocephalus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pseudaspius-leptocephalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Seme2020'; type = 'article'; bib = [ ...
'doi = {10.26428/1606-9919-2020-200-118-130}, ' ...
'author = {N. N. Semenchenko}, ' ...
'year = {2020}, ' ...
'title  = {GROWTH OF {A}MUR FLATHEAD ASP \emph{Pseudaspius leptocephalus} ({P}ALLAS, 1776)}, ' ...
'journal = {Izvestiya TINRO :}, ' ...
'volume = {200(1)}, ' ...
'pages = {118-130}'];
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

