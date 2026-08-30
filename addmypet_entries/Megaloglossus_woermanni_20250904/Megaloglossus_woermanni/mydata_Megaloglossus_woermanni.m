function [data, auxData, metaData, txtData, weights] = mydata_Megaloglossus_woermanni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Megaloglossus_woermanni'; 
metaData.species_en = 'Woermann''s bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 09 04];

%% set data
% zero-variate data

data.tg = 120;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Macroglossus_minimus';
data.tx = 65;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Macroglossus_minimus';
data.tp = 305 ;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Macroglossus_minimus';
data.am = 21.8*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'typical values for the group';

data.Wwb = 1.8; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Dobsonia_moluccensis: 55*16/480';
data.Wwx = 9;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
  comment.Wwx = 'based on Macroglossus_minimus';
data.Wwi = 16;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '8.4-20 g';

data.Ri  = 1.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2-3 litters per yr';

data.JOi  = 21.7;   units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'WhitSeym2003';   
  temp.JOi = C2K(36.2);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 12.4; units.weight.JOi = 'g'; label.weight.JOi = 'weight';
  comment.JOi = 'corrected PNAS table is used';                                                        																				
		
%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 5 * weights.Wwi;
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.weight = weight;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QVRH'; % Cat of Life
metaData.links.id_ITIS = '631684'; % ITIS
metaData.links.id_EoL = '328742'; % Ency of Life
metaData.links.id_Wiki = 'Megaloglossus_woermanni'; % Wikipedia
metaData.links.id_ADW = 'Megaloglossus_woermanni'; % ADW
metaData.links.id_Taxo = '63942'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800159'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megaloglossus_woermanni}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Megaloglossus_woermanni/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitSeym2003';type = 'article'; bib = [ ...
'doi = {0.1073/pnas.0436428100}, ' ...
'author = {Craig R. White and Roger S. Seymour}, '...
'title = {Mammalian basal metabolic rate is proportionalto body mass 2/3}, ' ...
'journal = {PNAS}, ' ...
'year = {2003}, ' ...
'volume = {100(7)}, '...
'pages = {4046 – 4049}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
