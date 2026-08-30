  function [data, auxData, metaData, txtData, weights] = mydata_Anchovia_surinamensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Anchovia_surinamensis'; 
metaData.species_en = 'Surinam anchovy'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 20];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'DiasAmar2022';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 16.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'DiasAmar2022';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 2.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwi = 'based on 0.00631*Lp^3.13, see F1';
data.Wwi = 42.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'DiasAmar2022';
  comment.Wwi = 'based on 0.00631*Li^3.13, see F1, give 30.3 g';

data.Ri = 2000/365; units.Ri = '#/d';  label.Ri = 'reproduction rate at SL 5.8 cm';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anchoviella_guianensis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
  0.5  4.88
  1.0  8.32
  1.5 10.75
  2.0 12.45
  2.5 13.66
  3.0 14.51
  3.5 15.10
  4.0 15.52];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'DiasAmar2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00631*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Central and South America: lower parts of rivers from Trinidad and eastern Venezuela south to Para, Brazil';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'DLST'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46562683'; % Ency of Life
metaData.links.id_Wiki = 'Anchovia_surinamensis'; % Wikipedia
metaData.links.id_ADW = 'Anchovia_surinamensis'; % ADW
metaData.links.id_Taxo = '160869'; % Taxonomicon
metaData.links.id_WoRMS = '279609'; % WoRMS
metaData.links.id_fishbase = 'Anchovia-surinamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Anchovia_surinamensis}}';  
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
bibkey = 'DiasAmar2022'; type = 'Article'; bib = [ ...
'doi = {10.20950/1678-2305/bip.2022.48.e691}, ' ...
'author = {Jordy de Oliveira Dias and Rodrigo Vieira Alves Amaral and Igor Rechetnicow Alves Sant''Anna and Caroline Pereira de Campos and Severino Adriano de Oliveira Lima and Raniere Garcez Costa Sousa}, ' ...
'year = {2022}, ' ...
'title = {Reproductive pattern and population dynamics of Anchovia surinamensis in a seasonal floodplain lake of the Amazon basin}, ' ... 
'journal = {Bol. Inst. Pesc.}, ' ...
'volume = {48}, '...
'pages = {e691}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Azev2010'; type = 'Article'; bib = [ ...
'author = {Marco A. Azevedo}, ' ...
'year = {2010}, ' ...
'title = {Reproductive characteristics of characid fish species ({T}eleostei, {C}haraciformes) and their relationship with body size and phylogeny}, ' ... 
'journal = {Iheringia, S\''{e}r. Zool., Porto Alegre}, ' ...
'volume = {100(4)}, '...
'pages = {469-482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anchovia-surinamensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

