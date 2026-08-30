  function [data, auxData, metaData, txtData, weights] = mydata_Acrossocheilus_fasciatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Acrossocheilus_fasciatus'; 
metaData.species_en = 'Huangshan barbel'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 06 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 23];

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'YanGuo2010';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 19.2;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 9.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00912*Lp^3.02, see F1';
data.Wwi = 68.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.02, see F1';
    
data.GSI = 0.13; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 1	 2.573
 2	 6.097
 3	 9.214
 4	11.656
 5	13.691
 6	16.134
 7	17.901
 8	18.991
 9	20.487
10	21.713
11	22.533
12	23.354
13	24.715
14	25.806
15	26.086];
data.tL(:,1) = 365*(0 + data.tL(:,1)); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YanGuo2010'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
% weights.Li = weights.Li * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Wwb = weights.Wwb * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00912*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'China';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '9PQB'; % Cat of Life
metaData.links.id_ITIS = '639468'; % ITIS
metaData.links.id_EoL = '210102'; % Ency of Life
metaData.links.id_Wiki = 'Acrossocheilus_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Acrossocheilus_fasciatus'; % ADW
metaData.links.id_Taxo = '160130'; % Taxonomicon
metaData.links.id_WoRMS = '1016057'; % WoRMS
metaData.links.id_fishbase = 'Acrossocheilus_fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acrossocheilus_fasciatus}}';  
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
bibkey = 'YanGuo2010'; type = 'Article'; bib = [ ...  
'doi = {10.1080/02705060.2010.9664360}, ' ...
'author = {Yunzhi Yan and Lili Guo and Xiuying Xiang and Juan Tao and Yifeng Chen}, ' ...
'year = {2010}, ' ...
'title = {Age and Growth of \emph{Acrossocheilus fasciatus} ({B}arbinae, {C}yprinidae) from the {P}uxi {S}tream in the {H}uangshan {M}ountain, {C}hina}, ' ...
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {25(1)}, '...
'pages = {79-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acrossocheilus_fasciatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

