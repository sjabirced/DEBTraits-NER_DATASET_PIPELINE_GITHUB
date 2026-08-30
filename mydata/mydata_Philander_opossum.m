function [data, auxData, metaData, txtData, weights] = mydata_Philander_opossum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Philander_opossum'; 
metaData.species_en = 'Gray four-eyed opossum'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwt'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 08 15];

%% set data
% zero-variate data

data.tg = 13.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Wiki';   
  temp.tg = C2K(35.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 82;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 450;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.2;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 110;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'CastZarz2000';
  comment.Wwx = '100-120 g in captivity';
data.Ww1 = 740;  units.Ww1 = 'g';   label.Ww1 = 'wet weight at 1 yr';   bibkey.Ww1 = 'CastZarz2000';
  comment.Ww1 = '673-800 g in capticity';
data.Wwi = 1200;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
data.Wwim = 1500;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'AnAge';

data.Ri  = 3*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter, 3 litters per yr';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

% %% Group plots
% set1 = {'tW2_f','tW2_m','tW3_f','tW3_m'}; subtitle1 = {'Data for female, male of litter 2, 3'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4G4WJ'; % Cat of Life
metaData.links.id_ITIS = '552584'; % ITIS
metaData.links.id_EoL = '129539'; % Ency of Life
metaData.links.id_Wiki = 'Philander_opossum'; % Wikipedia
metaData.links.id_ADW = 'Philander_opossum'; % ADW
metaData.links.id_Taxo = '59802'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10400156'; % MSW3
metaData.links.id_AnAge = 'Philander_opossuma'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Philander_opossum}}';
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
bibkey = 'CastZarz2000'; type = 'article'; bib = [ ...  
'author = {Castro-Arellano, I. and H. Zarza and R. Medellin}, ' ...
'year = {2000}, ' ...
'title  = {Philander opossum}, ' ...
'journal = {Mammalian Species}, ' ...
'volume = {638}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Philander_opossum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

