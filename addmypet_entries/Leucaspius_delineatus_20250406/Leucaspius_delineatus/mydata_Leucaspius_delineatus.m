function [data, auxData, metaData, txtData, weights] = mydata_Telestes_montenigrinus
%% set metadataLeucaspius_delineatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leucaspius_delineatus'; 
metaData.species_en = 'Belica'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

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

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'GozlPind2003';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 3 yrs';
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Brit2011'; 
data.Li = 9;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 9.5e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.22 mm of Telestes_karsticus: pi/6*0.122^3';
data.Wwp = 0.61;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'Brit2011','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.13, see F1';

data.Ri = 5e3/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'Brit2011';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fishbase gives a fecundity of 2300 and 3500 eggs';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), fork length (cm)
1	3.502
2	4.189
3	4.935
4	5.212
5	5.782];
data.tL(:,1) = (1.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GozlPind2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic in River Moraca, western Balkans';
metaData.bibkey.F2 = 'Kriv1998';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '723YJ'; % Cat of Life
metaData.links.id_ITIS = '163738'; % ITIS
metaData.links.id_EoL = '208728'; % Ency of Life
metaData.links.id_Wiki = 'Leucaspius_delineatus'; % Wikipedia
metaData.links.id_ADW = 'Leucaspius_delineatus'; % ADW
metaData.links.id_Taxo = '43634'; % Taxonomicon
metaData.links.id_WoRMS = '154321'; % WoRMS
metaData.links.id_fishbase = 'Leucaspius-delineatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leucaspius_delineatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leucaspius-delineatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Brit2011'; type = 'Misc'; bib = [ ...
'author = {Rob Britton}, ' ...
'year = {2011}, ' ...
'howpublished = {\url{https://www.cabidigitallibrary.org/doi/10.1079/cabicompendium.77347}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GozlPind2003'; type = 'article'; bib = [ ...
'author = {Rodolphe E. Gozlan and Adrian C. Pinder and Sarah Durand and Jonathan Bass}, ' ...
'year = {2003}, ' ...
'title  = {Could the small size of sunbleak, \emph{Leucaspius delineatus} ({P}isces, {C}yprinidae) be an ecological advantage in invading {B}ritish waterbodies?}, ' ...
'journal = {Folia Zool.}, ' ...
'pages = {99–108}, ' ...
'volume = {52(1)}'];
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

