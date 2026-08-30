function [data, auxData, metaData, txtData, weights] = mydata_Leucos_basak
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leucos_basak'; 
metaData.species_en = 'Albanian roach'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 05];

%% set data
% zero-variate data

data.am = 16*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 11;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 23.3;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 15.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00759*Lp^3.18, see F1';
data.Wwi = 169;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.18, see F1';

data.Ri = 27000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leuciscus_leuciscus';

%% univariate data
 
% time-length
data.tLW = [ ... % time (d), total length (cm), weight (g)
    0  7.6   3.9
    1 10.0   9.6
    2 12.1  19.7
    3 14.3  34.0
    4 15.2  39.4
    5 16.1  45.5
    6 17.2  52.4
    7 18.3  66.8
    8 19.3  87.4
    9 20.4 100.8
   10 21.7 131.9];
data.tLW(:,1) = (1.9 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(19);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'MatiTutm2011'; treat.tLW = {1 {'length','weight'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

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

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'I had to add 1 yr to age estimates in tL data to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase';
F2 = 'lakes and mostly still water of rivers of the Adriatic drainages, from Croatia to Montenegro and Albania';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '725Z3'; % Cat of Life
metaData.links.id_ITIS = '1199696'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Leucos_basak'; % Wikipedia
metaData.links.id_ADW = 'Leucos_basak'; % ADW
metaData.links.id_Taxo = '442360'; % Taxonomicon
metaData.links.id_WoRMS = '1015903'; % WoRMS
metaData.links.id_fishbase = 'Leucos-basak'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leucos_basak}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leucos-basak.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MatiTutm2011'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1439-0426.2010.01593.x}, ' ...
'author = {Mati\''{a}-Skoko, S. and P. Tutman and J. Dul\v{c}i\''{c} and I. Prusina and Z. Đođo and J. Pavli\v{c}evi\''{c} and B. Glamuzina}, ' ...
'year = {2011}, ' ...
'title  = {Growth pattern of the endemic {N}eretvan roach, \emph{Rutilus basak} ({H}eckel, 1843) in the {H}utovo {B}lato wetlands.}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'pages = {813-819}, ' ...
'volume = {27(3)}'];
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

