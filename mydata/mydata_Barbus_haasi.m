  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_haasi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_haasi'; 
metaData.species_en = 'Catalonian barbel'; 

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
metaData.date_subm = [2025 04 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 12];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'AparSost1998';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.8;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'AparSost1998'; 
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.5e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.888 mm: pi/6*0.189^3';
data.Wwp = 9.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AparSost1998','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.02, see F1';
data.Wwi = 282.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.02, see F1';
    
data.GSI = 0.13; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'AparSost1998';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
1	 4.7  4.5
2	 7.6  7.2
3	11.0  9.4
4	14.1 11.1
5   16.4 12.3
6   18.9 14.0
7   20.8 NaN];
data.tL_fm(:,1) = 365*(0.1 + data.tL_fm(:,1)); % set origin at birth
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AparSost1998'; treat.tL_fm = {1 {'female','male'}}; 
    
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
F1 = 'Length-weight: Ww (in g) = 0.00977*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Mediterranean slope of Spain from Llobregat to Riudecanyes drainages';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'KNBQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '218766'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_haasi'; % Wikipedia
metaData.links.id_ADW = 'Barbus_haasi'; % ADW
metaData.links.id_Taxo = '275141'; % Taxonomicon
metaData.links.id_WoRMS = '1525641'; % WoRMS
metaData.links.id_fishbase = 'Barbus-haasi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_haasi}}';  
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
bibkey = 'AparSost1998'; type = 'Article'; bib = [ ...  
'author = {Aparicio, E. and A. de Sostoa}, ' ...
'year = {1998}, ' ...
'title = {Reproduction and growth of \emph{Barbus haasi} in a small stream in the northeast of the {I}berian peninsula}, ' ...
'journal = {Arch. Hydrobiol.}, ' ...
'volume = {142(1)}, '...
'pages = {95-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Barbus-haasi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

