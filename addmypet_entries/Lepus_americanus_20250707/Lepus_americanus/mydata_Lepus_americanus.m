function [data, auxData, metaData, txtData, weights] = mydata_Lepus_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Lepus_americanus'; 
metaData.species_en = 'Snowshoe hare'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 07 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 07 07];

%% set data
% zero-variate data

data.tg = 36;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 308;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18*365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(39.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 61.03;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 362;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 1603.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'AnAge';

data.Ri  = 5*3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-8 pups per litter; 3 litters per yr';
   
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Due to milk being extremely nutritious in lagomorphs, the growth rate, and therefore [p_M], is probably over-estimated with this data ';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6PPXC'; % Cat of Life
metaData.links.id_ITIS = '180112'; % ITIS
metaData.links.id_EoL = '133023'; % Ency of Life
metaData.links.id_Wiki = 'Lepus_americanus'; % Wikipedia
metaData.links.id_ADW = '61497'; % ADW
metaData.links.id_Taxo = '61497'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500112'; % MSW3
metaData.links.id_AnAge = 'Lepus_americanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepus_americanus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lepus_americanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

