function [data, auxData, metaData, txtData, weights] = mydata_Trochilus_scitulus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Trochilus_scitulus'; 
metaData.species_en = 'Black-billed Streamertail'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwx'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 07 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 23];

%% set data
% zero-variate data;
data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Wiki';   
  temp.ab = C2K(32);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
  comment.ab = '17-19 d; temp guessed';
data.tx = 21.5;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '19-24 d';
data.tp = 85;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'guess'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on for Archilochus_alexandri';

data.Ww0 = 0.56; units.Ww0 = 'g';  label.Ww0 = 'intitial wet weight';          bibkey.Ww0 = 'bow';
data.Wwx = 3.8; units.Wwx = 'g';  label.Wwx = 'weight at fledging';  bibkey.Wwx = 'guess';   
data.Wwi = 4.35; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';  
  comment.Wwi = '3.5 to 5.5 g';
data.Wwim = 5; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki'; 
  comment.Wwim = '4.0 to 5.8 g';

data.Ri  = 3*2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'bow';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 3 clutches per yr';
 
% uni-variate data

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = weights.Wwx * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic to Jamaica';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5976F'; % Cat of Life
metaData.links.id_ITIS = '693152'; % ITIS
metaData.links.id_EoL = '45509543'; % Ency of Life
metaData.links.id_Wiki = 'Trochilus_scitulus'; % Wikipedia
metaData.links.id_ADW = 'Trochilus_scitulus'; % ADW
metaData.links.id_Taxo = '72388'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7D8643AF6964B182'; % avibase
metaData.links.id_birdlife = 'black-billed-streamertail-trochilus-scitulus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trochilus_scitulus}},'...
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7D8643AF6964B182&sec=lifehistory}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/stream3/cur/breeding}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

