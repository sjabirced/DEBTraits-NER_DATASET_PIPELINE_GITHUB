function [data, auxData, metaData, txtData, weights] = mydata_Trachylepis_capensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Scincidae';
metaData.species    = 'Trachylepis_capensis'; 
metaData.species_en = 'Cape skink'; 

metaData.ecoCode.climate = {'BS','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biTg','biFm', 'biTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'JOi'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 12 05];

%% set data
% zero-variate data

data.ab = 90;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Chalcides_chalcides';

data.Wwb = 1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Chalcides_chalcides';
data.Wwi = 57.92;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EoL';

data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12 young per litter, 1 litter per season';

data.JOi  = 0.0031; units.JOi  = 'ml O2/min'; label.JOi  = 'max BMR';  bibkey.JOi  = 'With1981';   
  temp.JOi = C2K(15);  units.temp.JOi = 'K'; label.temp.JOi = 'temperature';
  weight.JOi = 10.2; units.weight.JOi = 'g'; label.weight.JOi = 'weight';

%% set weights for all real data
weights = setweights(data, []);
weights.JOi = 3 * weights.JOi;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
metaData.links.id_CoL = '57RDQ'; % Cat of Life
metaData.links.id_ITIS = '1182426'; % ITIS
metaData.links.id_EoL = '962983'; % Ency of Life
metaData.links.id_Wiki = 'Trachylepis_capensis'; % Wikipedia
metaData.links.id_ADW = 'Trachylepis_capensis'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'Trachylepis/capensis'; % ReptileWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachylepis_capensis}}';
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
bibkey = 'With1981'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1444055}, ' ...
'author = {P.C. Withers}, ' ...
'title = {Physiological Correlates of Limblessness and Fossoriality in Scincid Lizards}, ' ...
'journal = {Copeia}, ' ...
'volume = {1981}, ' ...
'year = {1981}, ' ...
'pages = {197-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/962983}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

