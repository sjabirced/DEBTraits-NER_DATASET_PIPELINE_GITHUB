  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_cyclolepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_cyclolepis'; 
metaData.species_en = 'Round-scaled barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 12];

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 7.1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00891*Lp^3.04, see F1';
data.Wwi = 275.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.04, see F1';
    
data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'VasiEcon2005';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
1	 7.025  6.835
2	10.008  9.630
3	12.462 11.733
4	14.895 13.283
5   17.018 14.672
6   18.866 NaN
7   21.324 NaN
8   22.614 NaN
9   23.629 NaN];
data.tL_fm(:,1) = 365*(0.1 + data.tL_fm(:,1)); % set origin at birth
units.tL_fm = {'d', 'cm', 'g'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'VasiEcon2005'; treat.tL_fm = {1 {'female','male'}}; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
% weights.Li = weights.Li * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;

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

%% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.01000*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic to the western Greece from Kalamas to Pamissos drainages. Introduced and established in the Isonzo River, northeastern Italy';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WC7K'; % Cat of Life
metaData.links.id_ITIS = '688534'; % ITIS
metaData.links.id_EoL = '356648'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_cyclolepis'; % Wikipedia
metaData.links.id_ADW = 'Barbus_cyclolepis'; % ADW
metaData.links.id_Taxo = '163037'; % Taxonomicon
metaData.links.id_WoRMS = '1015365'; % WoRMS
metaData.links.id_fishbase = 'Barbus_cyclolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_cyclolepis}}';  
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
bibkey = 'VasiEcon2005'; type = 'Article'; bib = [ ...  
'author = {Vasiliou, A. and P.S. Economidis}, ' ...
'year = {2005}, ' ...
'title = {On the life-history of \emph{Barbus peloponnesius} and \emph{Barbus cyclolepis} in {M}acedonia, {G}reece}, ' ...
'journal = {Folia Zoologica}, ' ...
'volume = {54(3)}, '...
'pages = {316-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbus-cyclolepis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

