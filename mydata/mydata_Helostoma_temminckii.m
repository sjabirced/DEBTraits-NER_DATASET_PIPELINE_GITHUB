
function [data, auxData, metaData, txtData, weights] = mydata_Helostoma_temminckii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Helostomatidae';
metaData.species    = 'Helostoma_temminckii'; 
metaData.species_en = 'Kissing gourami'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

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
data.am = 6*365;     units.am = 'd';  label.am = 'life span';  bibkey.am = 'Graa2003';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 15;    units.Lp = 'cm'; label.Lp = 'length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 30;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';
  
data.Wwb = 4.6e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HelmSuwi2021';
  comment.Wwb = 'based on egg diameter of 0.956 mm: pi/6*0.0956^3';
data.Wwp = 69;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 557;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';

data.Ri = 144104/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'HelmSuwi2021';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
    0 49.5
    4 52.4
    8 55.8
   12 59.6
   16 63.5
   20 68.0
   24 72.6
   28 77.5
   32 83.1];
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TripTrip2024';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

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
D2 = 'temperature (C) in tL data is assumed to vary as T(t)=20+10*sin(2*pi(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Asia: Thailand to Indonesia';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KJ3D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '217882'; % Ency of Life
metaData.links.id_Wiki = 'Helostoma_temminckii'; % Wikipedia
metaData.links.id_ADW = 'Helostoma_temminckii'; % ADW
metaData.links.id_Taxo = '1683132'; % Taxonomicon
metaData.links.id_WoRMS = '315877'; % WoRMS
metaData.links.id_fishbase = 'Helostoma_temminckii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Helostoma_temminckii}}';  
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
bibkey = 'TripTrip2024'; type = 'article'; bib = [ ... 
'doi = {10.33545/26174693.2024.v8.i3Sj.876}, ' ...
'author = {Girish Tripathi and Gaurav Shankar Tripathi and Rishabh Singh and Paramveer Singh}, ' ...
'year = {2024}, ' ...
'title = {Survivability and growth performance of kissing gourami (\emph{Helostoma temminckii}) under bottle aquaponic system with artificial feed}, ' ... 
'journal = {International Journal of Advanced Biochemistry Research}, ' ...
'volume = {SP-8(3)}, '...
'pages = {747-752}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Helostoma_temminckii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HelmSuwi2021'; type = 'article'; bib = [ ...
'author = {Helmizuryani and Rujito A. Suwignyo and Zazili Hanafiah and Muhammad Faizal}, ' ...
'year = {2021}, ' ...
'journal = {AACL Bioflux}, ' ...
'volume = {14(4)}, ' ...
'pages = {2583-2598}, ' ...
'howpublished = {\url{https://bioflux.com.ro/docs/2021.2583-2600.pdf}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

