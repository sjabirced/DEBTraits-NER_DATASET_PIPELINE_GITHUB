function [data, auxData, metaData, txtData, weights] = mydata_Equulites_klunzingeri
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes '; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Equulites_klunzingeri'; 
metaData.species_en = 'Klunzinger''s ponyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MIr','MAm'};
metaData.ecoCode.habitat = {'0iMc','0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 27];

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.5; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Wiki';
data.Li = 13.4;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Leiognathus_equula: pi/6*0.08^3';
data.Wwp = 2.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01122*Lp^3.09, see F1';
data.Wwi = 34; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.09, see F1';

data.Ri  = 6.4e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Leiognathus_bindus: 1e4*34/53';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
    1 3.80 3.05
    2 5.09 5.09
    3 6.58 6.52
    4 7.58 7.75
    5 8.16 8.15
    6 9.14 8.90];
data.tL_fm(:,1) = 365 * (0.1 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm = C2K(26.5); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'OzutAvsa2004'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
    1 0.65 0.32
    2 1.59 1.60
    3 3.62 3.36
    4 5.49 5.69
    5 6.94 6.81
    6 8.94 8.35];
data.tW_fm(:,1) = 365 * (0.1 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'}; 
temp.tW_fm = C2K(26.5); units.temp.tW_fm = 'K'; label.temp.WL_fm = 'temperature';
bibkey.tW_fm = 'OzutAvsa2004'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: endemic to northern Red Sea. Lessepsian migrant to Mediterranean Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FYMF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578691'; % Ency of Life
metaData.links.id_Wiki = 'Equulites_klunzingeri'; % Wikipedia
metaData.links.id_ADW = 'Equulites_klunzingeri'; % ADW
metaData.links.id_Taxo = '3415321'; % Taxonomicon
metaData.links.id_WoRMS = '398518'; % WoRMS
metaData.links.id_fishbase = 'Equulites_klunzingeris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Equulites_klunzingeri}}';  
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
bibkey = 'OzutAvsa2004'; type = 'article'; bib = [ ... 
'author = {Meltem \"{O}z\"{u}tok and Dursun Av\c{s}ar}, ' ... 
'year = {2004}, ' ...
'title = {Preliminary Estimation of Growth, Mortality and the Exploitation rates of the Silverbelly (\emph{Leiognathus klunzingeri} {S}teindachner, 1898) Population from the {Y}umurtal{\i}k {B}ight, {N}ortheastern {M}editerranean coast of {T}urkey}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {4}, '...
'pages = {59-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Equulites_klunzingeri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
