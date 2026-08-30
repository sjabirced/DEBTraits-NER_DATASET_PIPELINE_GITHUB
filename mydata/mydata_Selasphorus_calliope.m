function [data, auxData, metaData, txtData, weights] = mydata_Selasphorus_calliope

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Selasphorus_calliope'; 
metaData.species_en = 'Calliope hummingbird'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 29];

%% set data
% zero-variate data;
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
  comment.ab = 'avibase: 15-16 d';
data.tx = 20.5;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18-23 d';
data.tp = 200;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 7.7*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'avibase'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 0.462; units.Ww0 = 'g';  label.Ww0 = 'intitial wet weight';            bibkey.Ww0 = 'avibase';
data.Wwx = 2.5; units.Wwx = 'g';  label.Wwx = 'wet weight at fledging';         bibkey.Wwx = 'guess';
data.Wwi = 2.9; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';   
data.Wwim = 2.7; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';   

data.Ri  = 2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tx = 3 * weights.tx;
weights.Ww0 = 3 * weights.Ww0;
weights.Wwx = 3 * weights.Wwx;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8K3NC'; % Cat of Life
metaData.links.id_ITIS = '1149434'; % ITIS
metaData.links.id_EoL = '45509663'; % Ency of Life
metaData.links.id_Wiki = 'Selasphorus_calliope'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '6801721'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '5816834EE9F3F70D'; % avibase
metaData.links.id_birdlife = 'calliope-hummingbird-selasphorus-calliope'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Selasphorus_calliope}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'avibase'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=5816834EE9F3F70D&sec=lifehistory}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

