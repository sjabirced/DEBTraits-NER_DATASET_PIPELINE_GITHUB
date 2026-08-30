function [data, auxData, metaData, txtData, weights] = mydata_Cyprinion_macrostomus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Cyprinion_macrostomus'; 
metaData.species_en = 'Tigris kingfish'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'UckuGokc2015';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9.9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
data.Li = 20.4;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.3e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'UckuGokc2015';
  comment.Wwb = 'based on egg diameter of 1.34 mm: pi/6*0.134^3';
data.Wwp = 9;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^2.98, see F1';
data.Wwi = 78;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.00, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'UckuGokc2015';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

%% univariate data
 
% time-length-weight
data.tL_fm = [ ... % time (yr), total length (cm)
    0  1.37  0.96
    1  3.99  3.63
    2  6.11  5.75
    3  7.83  7.43
    4  9.21  8.76
    5 10.32  9.82
    6 11.23 10.66];
data.tL_fm(:,1) = 365 * (0.3+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm= C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'UckuGokc2015'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 10 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'GSI data ignored du to inconsistency with LN and Wwb data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00977*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to  Iran';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '33HK9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '66674360'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinion_macrostomus'; % Wikipedia
metaData.links.id_ADW = 'Cyprinion_macrostomus'; % ADW
metaData.links.id_Taxo = '172723'; % Taxonomicon
metaData.links.id_WoRMS = '1022142'; % WoRMS
metaData.links.id_fishbase = 'Cyprinion-macrostomus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cyprinion_macrostomus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Cyprinion-macrostomus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'UckuGokc2015'; type = 'article'; bib = [ ...
'doi = {10.3906/zoo-1307-5}, ' ...
'author = {U\c{c}kun, Aysel Alkan and G\"{o}k\c{c}e, Didem}, ' ...
'year = {2015}, ' ...
'title  = {Growth and reproduction of \emph{Cyprinion macrostomus} ({H}eckel, 1843) and \emph{Cyprinion kais} ({H}eckel, 1843) populations in {K}arakaya {D}am {L}ake ({E}uphrates {R}iver), {T}urkey}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {39(4)}, ' ...
'pages = {20}'];
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

