function [data, auxData, metaData, txtData, weights] = mydata_Muraena_augusti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenidae';
metaData.species    = 'Muraena_augusti'; 
metaData.species_en = 'Black moray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 22];

%% set data
% zero-variate data

data.ab = 105;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(19.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(19.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'nased on Muraena_helena';

data.Lp  = 55.8;   units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 0.536;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 10 mm of Muraena_helena: pi/6*1^3';
data.Wwp = 346;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00062*Lp^3.29, see F1';
data.Wwi = 1667;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00062*Li^3.29, see F1; max. published weight: 169.80 g';
 
data.GSI = 0.125; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(19.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Muraena_helena';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm).weight (g)
    4 44.5
    5 51.8
    6 60.2
    7 69.1
    8 76.9
    9 81.1
   10 84.2
   11 87.3
   12 89.0];  
data.tL(:,1) = (data.tL(:,1)-1.4)*365; % convert to yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SallBear2016'; 
  

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00062*(TL in cm)^3.29';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44L27'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Muraena_augusti'; % Wikipedia
metaData.links.id_ADW = 'Muraena_augusti'; % ADW
metaData.links.id_Taxo = '474071'; % Taxonomicon
metaData.links.id_WoRMS = '299565'; % WoRMS
metaData.links.id_fishbase = 'Muraena-augusti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muraena_augusti}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Muraena-augusti.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JimeScho2007'; type = 'article'; bib = [ ...  
'author = {Jim\''{e}nez, S. and S. Sch\"{o}nhuth and I.J. Lozano and J.A. Gonz\''{a}lez and R.G. Sevilla and A. Diez and J.M. Bautista}, ' ...
'year = {2007}, ' ...
'title  = {Morphological, ecological, and molecular analyses separate \emph{Muraena augusti} from \emph{Mureana helena} as a valid species}, ' ...
'journal = {Copeia}, ' ...
'volume = {2007(1)}, ' ...
'pages = {101-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
