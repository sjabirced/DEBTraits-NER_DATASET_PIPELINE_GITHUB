function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_comes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_comes'; 
metaData.species_en = 'Tiger tail seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 29];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(28.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.0;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'JobBuu2006'; 
  comment.Lb = 'based on tL data';
data.Lp  = 8.1;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 18.7;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 0.0045; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'JobBuu2006';
  comment.Wwb = 'based on 0.00447*Lb^3.00, see F1; egg diameter 2 mm';
data.Wwp = 2.37;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^2.99, see F1';
data.Wwi = 29.2;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^2.99, see F1';

data.Ri  = 350/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since release (d), std length (cm)
 0.842	1.069
13.911	3.368
20.868	4.006
27.963	4.255
34.717	4.615
41.920	4.892
48.788	5.211
55.444	5.377
62.630	5.917];
units.tL   = {'d', 'cm'};  label.tL = {'time since release', 'standard length'};  
temp.tL    = C2K(28.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JobBuu2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 3 * weights.ab;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Indo-West Pacific: India (Andaman Islands), Indonesia, Malaysia, Philippines, Singapore, Thailand, Viet Nam';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3LZL3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS166493
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_comes'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_comes'; % ADW
metaData.links.id_Taxo = '176690'; % Taxonomicon
metaData.links.id_WoRMS = '275191'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus_comes'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_comes}}';
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
bibkey = 'JobBuu2006'; type = 'Article'; bib = [ ... 
'author = {Suresh Job and Dien Buu and Amanda Vincent}, ' ... 
'year = {2006}, ' ...
'title = {Growth and Survival of the Tiger Tail Seahorse, \emph{Hippocampus comes}}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {37(3)}, ' ...
'pages = {237-344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus_comes.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

