function [data, auxData, metaData, txtData, weights] = mydata_Macrodon_ancylodon

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Macrodon_ancylodon'; 
metaData.species_en = 'King weakfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7 ); % K, body temp
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

data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(20.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.2;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 46;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';
data.Wwp = 90.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00708*Lp^3.05, see F1';
data.Wwi = 835; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.05, see F1';

data.Ri = 225700/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), total length (cm)
    1  7.79
    2 12.66
    3 16.68
    4 22.09
    5 27.35];
data.tL(:,1) = (.1 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: east coast of Africa (South Africa and Mozambique), Mauritius, Madagascar, and Reunion';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3X4WJ'; % Cat of Life
metaData.links.id_ITIS = '169334'; % ITIS
metaData.links.id_EoL = '46579150'; % Ency of Life
metaData.links.id_Wiki = 'Macrodon'; % Wikipedia
metaData.links.id_ADW = 'Macrodon_ancylodon'; % ADW
metaData.links.id_Taxo = '179439'; % Taxonomicon
metaData.links.id_WoRMS = '281477'; % WoRMS
metaData.links.id_fishbase = 'Macrodon-ancylodon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrodon}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Macrodon-ancylodon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

