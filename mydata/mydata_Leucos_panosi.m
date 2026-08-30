function [data, auxData, metaData, txtData, weights] = mydata_Leucos_panosi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Leucos_panosi'; 
metaData.species_en = 'Acheloos roach'; 

metaData.ecoCode.climate = {'Csa','Cfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl','0iFp','0iFr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 14;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
data.Li = 29.1;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 27.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.14, see F1';
data.Wwi = 273;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.14, see F1; max. published weight: 355.70 g';

data.Ri = 27000/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leuciscus_leuciscus';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), total length (cm)
    1  3.3
    2  6.3
    3  8.9
    4 11.3
    5 13.4
    6 15.2
    7 16.8
    8 18.3
    9 19.6
   10 20.7];
data.tL(:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetrDoul2024'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

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
F1 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe: Acheloos and Louros river systems in Greece; lakes Trichonis and Ambrakia. Introduced in Lake Joannina';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '725YM'; % Cat of Life
metaData.links.id_ITIS = '1200021'; % ITIS
metaData.links.id_EoL = '47064934'; % Ency of Life
metaData.links.id_Wiki = 'Leucos_panosi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5472542'; % Taxonomicon
metaData.links.id_WoRMS = '1009050'; % WoRMS
metaData.links.id_fishbase = 'Leucos_panosi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leucos_panosi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Leucos_panosi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PetrDoul2024'; type = 'Article'; bib = [ ...
'doi = {10.71424/azb76.3.002733}, ' ...
'author = {Olga Petriki and Alexandra S. Douligeri and Ioanna Tsionki and Roberta Barbieri and Dimitrios K. Moutopoulos and Maria T. Stoumboudi}, ' ...
'year = {2024}, ' ...
'title = {Life-history Traits for Eight Fish Species of the Largest {G}reek Lake ({L}ake {T}richonis)}, ' ...
'journal = {Acta Zool. Bulg.}, ' ...
'volume = {76(3)}, '...
'pages = {375-382}'];
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

