function [data, auxData, metaData, txtData, weights] = mydata_Rhinella_marina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Rhinella_marina'; 
metaData.species_en = 'Cane toad'; 

metaData.ecoCode.climate = {'A','B','Cfa'};
metaData.ecoCode.ecozone = {'TN','TA','THn'};
metaData.ecoCode.habitat = {'0jFm', 'jiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 11 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 11 30];

%% set data
% zero-variate data

data.ab = 2+9;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 2-6 d; birth guessed to be 9 d later';
data.tj = 29;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'AnAge';   
  temp.tj = C2K(22);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.8*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 1500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'nas';

data.Ri  = 5*25000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '25000 eggs in the night of copulation; 5 such days assumed'; 

data.JOi  = 0.1848; units.JOi  = 'ml O2/h'; label.JOi  = 'max BMR';  bibkey.JOi  = 'NespSola2017';   
  temp.JOi = C2K(22);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 252; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;

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

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7NY'; % Cat of Life
metaData.links.id_ITIS = '773729'; % ITIS
metaData.links.id_EoL = '64603366'; % Ency of Life
metaData.links.id_Wiki = 'Rhinella_marina'; % Wikipedia
metaData.links.id_ADW = 'Rhinella_marina'; % ADW
metaData.links.id_Taxo = '1395877'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhinella+marina'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rhinella_marina'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinella_marina}}';
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
bibkey = 'NespSola2017'; type = 'Article'; bib = [ ... 
'author = {R. F. Nespolo and J. J. Solano-Iguaran and F. Bozinovic}, '...
'title = {Phylogenetic Analysis Supports the Aerobic-Capacity Model for the Evolution of Endothermy}, '...
'journal = {Am. Nat.}, '....
'year = {2017}, '...
'volume = {189}, '...
'pages = {13-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rhinella+marina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Rhinella_marina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nas'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nas.er.usgs.gov/queries/factsheet.aspx?SpeciesID=48}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
