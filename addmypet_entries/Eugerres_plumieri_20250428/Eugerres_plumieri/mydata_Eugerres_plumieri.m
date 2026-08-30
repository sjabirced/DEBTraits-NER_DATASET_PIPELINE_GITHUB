function [data, auxData, metaData, txtData, weights] = mydata_Eugerres_plumieri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Eugerres_plumieri'; 
metaData.species_en = 'Striped mojarra'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 28];

%% set data
% zero-variate data

data.am = 8.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'RuedSant1999';   
  temp.am = C2K(26.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.54e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based guessed egg diameter of 0.5 mm of Gerres oyena: pi/6*0.05^3'; 
data.Wwp = 173; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^3.03, see F1';
data.Wwi = 1057; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.03, see F1';

data.Ri  = 953870/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(26.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL = [  ... % time since birth (d), total length (cm)
73.745	14.247
104.764	15.306
134.193	15.439
195.600	16.632
288.038	17.729
318.413	19.133
365+14.182	20.094
365+45.201	21.152
365+73.023	21.978
365+104.365	22.690
365+134.754	22.824
365+165.140	23.190
365+256.303	23.824
365+349.702	24.807
730+73.611	26.824
730+165.086	28.267
730+225.864	28.421
730+288.554	29.268
1095+13.114	30.248
1095+45.097	30.845
1095+73.890	30.632
1095+103.634	31.228
1095+134.980	31.594
1095+165.049	31.728
1095+224.866	31.997
1095+256.855	32.017
1095+286.919	32.613
1095+319.551	32.403
1095+349.618	32.653
1460+225.480	34.420];
data.tL(:,1) = 420 + data.tL(:,1); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuedSant1999';

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Assumed: 2 batches per yr with partial early spawning';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01479*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: South Carolina to western Florida, USA and the entire Gulf of Mexico to Brazil; absent from Bahamas and smaller islands in West Indies';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3C73X'; % Cat of Life
metaData.links.id_ITIS = '645433'; % ITIS
metaData.links.id_EoL = '46580923'; % Ency of Life
metaData.links.id_Wiki = 'Eugerres_plumieri'; % Wikipedia
metaData.links.id_ADW = 'Eugerres_plumieri'; % ADW
metaData.links.id_Taxo = '174235'; % Taxonomicon
metaData.links.id_WoRMS = '280743'; % WoRMS
metaData.links.id_fishbase = 'Eugerres_plumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eugerres_plumieri}}';
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
bibkey = 'RuedSant1999'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s0165-7836(99)00033-8}, ' ...
'author = {Rueda, M. and Santos-Mart{\i}nez, A.}, ' ... 
'year = {1999}, ' ...
'title = {Population dynamics of the striped mojarra \emph{Eugerres plumieri} from the {C}i\''{e}naga {G}rande de {S}anta {M}arta, {C}olombia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {42(1-2)}, ' ...
'pages = {155–166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Eugerres_plumieri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

