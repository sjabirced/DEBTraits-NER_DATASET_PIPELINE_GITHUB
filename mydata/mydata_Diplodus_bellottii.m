function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_bellottii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_bellottii'; 
metaData.species_en = 'Senegal seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 26];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(18.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(18.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.4;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodus sargus: pi/6*0.085^3';
data.Wwp = 23.6;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.01413*Lp^3.05, see F1';
data.Wwi = 452;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01413*Li^3.05, see F1; max. published weight: 6.5 kg';

data.GSI  = 0.05; units.GSI  = 'g/g'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
temp.GSI = C2K(18.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (cm),total length (cm)
2.212	9.154
2.423	9.736
2.456	11.411
2.881	15.638
3.198	18.877
3.447	18.489];
data.tL(:,1) = (data.tL(:,1)-1)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Menn1985';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'males as supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Southwestern Mediterranean Sea (Malaga to Gibraltar); eastern Atlantic from Cape Verde Islands north to Cadiz';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CXR6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579945'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_bellottii'; % ADW
metaData.links.id_Taxo = '173224'; % Taxonomicon
metaData.links.id_WoRMS = '127050'; % WoRMS
metaData.links.id_fishbase = 'Diplodus_bellottii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus}}';
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
bibkey = 'Menn1985'; type = 'Article'; bib = [ ... 
'author = {Mennes, F.}, ' ... 
'year = {1985}, ' ...
'title = {Multi species assessment of fish stocks off the western {S}ahara region with emphasis on the family {S}paridae}, ' ...
'journal = {Fishbyte}, ' ...
'volume = {3(3)}, ' ...
'pages = {5-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Diplodus_bellottii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

