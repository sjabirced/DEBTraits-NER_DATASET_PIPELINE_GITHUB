  function [data, auxData, metaData, txtData, weights] = mydata_Barbodes_binotatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbodes_binotatus'; 
metaData.species_en = 'Spotted barb'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 11];

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 20;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AbduAlZa2022';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 12;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00912*Lp^3.12, see F1';
data.Wwi = 104; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.12, see F1';
    
data.GSI = 0.16; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'PutrPert2022';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
217.864	4.207
365+68.147	7.392
365+100.672	7.662
365+125.453	7.813
365+157.977	8.023
365+257.100	8.984
365+282.397	9.225
365+349.512	9.766
730+217.864	10.938
730+351.061	11.418
1095+38.720	11.599
1095+99.639	11.659];
data.tL(:,1) = 0 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BatuNur2019';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

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
F1 = 'Length-weight: Ww (in g) = 0.00912*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Myanmar and from Mekong of Thailand through Indonesia ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KMKH'; % Cat of Life
metaData.links.id_ITIS = '690304'; % ITIS
metaData.links.id_EoL = '217587'; % Ency of Life
metaData.links.id_Wiki = 'Barbodes_binotatus'; % Wikipedia
metaData.links.id_ADW = 'Barbodes_binotatus'; % ADW
metaData.links.id_Taxo = '1803312'; % Taxonomicon
metaData.links.id_WoRMS = '1026351'; % WoRMS
metaData.links.id_fishbase = 'Barbodes-binotatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbodes_binotatus}}';  
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
bibkey = 'BatuNur2019'; type = 'Article'; bib = [ ...  
'doi = {10.1088/1755-1315/348/1/012038}, ' ...
'author = {A. S. Batubara and F. M. Nur and I. Zulfahmi and S. Rizal and D. Efizon and R. Elvyra and Z. A. Muchlisin}, ' ...
'year = {2019}, ' ...
'title = {Population dynamics of the Groe fish \emph{Barbodes binotatus} ({P}isces: {C}yprinidae) in the {N}agan {R}iver, {A}ceh {P}rovince, {I}ndonesia}, ' ...
'journal = {IOP Conf. Series: Earth and Environmental Science}, ' ...
'volume = {348}, '...
'pages = {012038}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PutrPert2022'; type = 'Article'; bib = [ ...  
'doi = {10.22146/jfs.6941}, ' ...
'author = {Ni Made Sita Aditya Putri and Nyoman Dati Pertami and I Nyoman Yoga Parawangsa}, ' ...
'year = {2022}, ' ...
'title = {Some Biological Aspects of Spotted Barb \emph{Barbodes binotatus} ({V}alenciennes, 1842) in {T}amblingan {L}ake}, ' ...
'journal = {Jurnal Perikanan}, ' ...
'volume = {24}, '...
'pages = {37-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbodes-binotatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

