function [data, auxData, metaData, txtData, weights] = mydata_Stellifer_naso
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Stellifer_naso'; 
metaData.species_en = 'Brasilian stardrum'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 21];

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(23.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'base on Stellifer_brasiliensis';

data.Lp  = 10.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 20.0;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.3e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 9.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00794*Lp^3.00, see F1';
data.Wwi = 63.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.00, see F1';

data.Ri = 25171/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(23.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Stellifer_brasiliensis';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
 1	 3.83
 2	 6.04
 3	 9.07];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CamaIsaa1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Atlantic: Venezuela to Brazil';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4ZS5X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579077'; % Ency of Life
metaData.links.id_Wiki = 'Stellifer'; % Wikipedia
metaData.links.id_ADW = 'Stellifer_naso'; % ADW
metaData.links.id_Taxo = '188143'; % Taxonomicon
metaData.links.id_WoRMS = '276165'; % WoRMS
metaData.links.id_fishbase = 'Stellifer-naso'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stellifer}}';
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
bibkey = 'CamaIsaa1998'; type = 'Article'; bib = [ ... 
'author = {Mauricio Camargo and Victoria J. Isaac}, ' ... 
'year = {1998}, ' ...
'title = {Population structure of fish fauna in the estuarine area of {C}aet\''{e} {R}iver, {B}ragan\c{c}a, {P}ar\''{a}, {B}razil}, ' ...
'journal = {Acta Scientiarum}, ' ...
'volume = {20(2)}, ' ...
'pages = {171-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Stellifer-naso.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

