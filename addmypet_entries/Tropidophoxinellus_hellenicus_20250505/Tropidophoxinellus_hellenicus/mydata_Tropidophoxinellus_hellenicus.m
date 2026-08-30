function [data, auxData, metaData, txtData, weights] = mydata_Tropidophoxinellus_hellenicus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Tropidophoxinellus_hellenicus'; 
metaData.species_en = 'Hellenic roachminnow'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data

data.ab = 31;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am= 5*365;       units.am = 'd';     label.am = 'lifespan';  bibkey.am = 'fishbase';
  temp.am = C2K(18);   units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on "short lived"';

data.Lp = 4;        units.Lp = 'cm';  label.Lp = 'Fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 9.3;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.49;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00661*Lp^3.11, see F1';
data.Wwi = 6.8;         units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00661*Li^3.11, see F1';

data.Ri = 1000/365; units.Ri  = '#/d';  label.Ri = 'max reproduction';  bibkey.Ri= 'guess';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
%% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  6.2
    2  9.3
    3 10.9
    4 11.7];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PetrDoul2024';

% %% grouped plots
% set1 = {'tLt1', 'tLt2', 'tLt3', 'tLt4'}; subtitle1 = {'MuseBorg2002'; 'total length'};
% metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.kap = 2 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
             
%% Discussion points
D1 = 'males are supposed not to differ from females'; 
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Europe: Acheloos and Pinios (Peloponnese) drainages in Greece';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7D8RR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '994598'; % Ency of Life
metaData.links.id_Wiki = 'Tropidophoxinellus_hellenicus'; % Wikipedia
metaData.links.id_ADW = 'Tropidophoxinellus_hellenicus'; % ADW
metaData.links.id_Taxo = '189631'; % Taxonomicon
metaData.links.id_WoRMS = '1475751'; % WoRMS
metaData.links.id_fishbase = 'Tropidophoxinellus_hellenicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tropidophoxinellus_hellenicus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tropidophoxinellus_hellenicus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
