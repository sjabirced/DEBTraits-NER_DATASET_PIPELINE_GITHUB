function [data, auxData, metaData, txtData, weights] = mydata_Telestes_montenigrinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Telestes_montenigrinus'; 
metaData.species_en = 'Moraca dace'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
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

data.am = 7*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 6;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 9.5e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.22 mm of Telestes_karsticus: pi/6*0.122^3';
data.Wwp = 4.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','Kriv1998'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 46;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Kriv1998';
  comment.Wwi = 'based on 0.00813*Li^3.10, see F1';

data.Ri = 3188/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Telestes_karsticus';

%% univariate data
 
% time-length
data.tLW = [ ... % time (d), std length (cm), weight (g)
    0  4.03  1.3
    1  6.89  6.9
    2  9.47 18.4
    3 10.43 21.8
    4 12.24 43.0
    5 12.87 46.0
    6 13.05 45.7];
data.tLW(:,1) = (1.3 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm','g'}; label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(10);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Kriv1998'; treat.tLW = {1 {'length','weight'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic in River Moraca, western Balkans';
metaData.bibkey.F2 = 'Kriv1998';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '556DQ'; % Cat of Life
metaData.links.id_ITIS = '1199978'; % ITIS
metaData.links.id_EoL = '214603'; % Ency of Life
metaData.links.id_Wiki = 'Telestes_montenigrinus'; % Wikipedia
metaData.links.id_ADW = 'Telestes_montenigrinus'; % ADW
metaData.links.id_Taxo = '1682908'; % Taxonomicon
metaData.links.id_WoRMS = '1516700'; % WoRMS
metaData.links.id_fishbase = 'Telestes-montenigrinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Telestes_montenigrinus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Telestes-montenigrinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Kriv1998'; type = 'article'; bib = [ ...
'doi = {10.1080/11250009809386824}, ' ...
'author = {Marijana Krivokapic}, ' ...
'year = {1998}, ' ...
'title  = {Growth of \emph{Telestes montenegrinus} from {R}iver {M}oraca, {M}ontenegro ({C}yprinidae)}, ' ...
'journal = {Italian Journal of Zoology}, ' ...
'pages = {241-242}, ' ...
'volume = {65}'];
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

