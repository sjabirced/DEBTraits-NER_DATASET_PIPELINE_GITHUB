function [data, auxData, metaData, txtData, weights] = mydata_Leuciscus_aspius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leuciscus_aspius'; 
metaData.species_en = 'Asp'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 04];

%% set data
% zero-variate data

data.am = 11*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 60;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 120;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 1.8e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00468*Lp^3.14, see F1';
data.Wwi = 15.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.14, see F1; max. published weight: 9.0 kg';

data.Ri = 1e6/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), total length (cm)
1645.228	52.006
2195.747	56.466
2372.925	60.148
2385.581	56.672
2689.315	63.298
2727.282	67.147
3043.672	60.229
3056.328	64.258
3100.622	58.954
3733.403	62.325];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fred2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: W in g = 0.00468*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '6Q3Q4'; % Cat of Life
metaData.links.id_ITIS = '1199612'; % ITIS
metaData.links.id_EoL = '225105'; % Ency of Life
metaData.links.id_Wiki = 'Leuciscus_aspius'; % Wikipedia
metaData.links.id_ADW = 'Aspius_aspius'; % ADW
metaData.links.id_Taxo = '1803274'; % Taxonomicon
metaData.links.id_WoRMS = '1015724'; % WoRMS
metaData.links.id_fishbase = 'Leuciscus-aspius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuciscus_aspius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leuciscus-aspius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Fred2003'; type = 'article'; bib = [ ...
'doi = {10.1046/j.1439-0426.2003.00504.xopen_in_newISSN0175-8659}, ' ...
'author = {F. Fredrich}, ' ...
'year = {2003}, ' ...
'title  = {Long-term investigations of migratory behaviour of asp (\emph{Aspius aspius} {L}.) in the middle part of the {E}lbe {R}iver, {G}ermany}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'pages = {264-342}, ' ...
'volume = {683}'];
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

