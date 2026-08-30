function [data, auxData, metaData, txtData, weights] = mydata_Coelorinchus_fasciatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coelorinchus_fasciatus'; 
metaData.species_en = 'Banded whiptail'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAS','MIS','MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 08];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(6.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length as Nezumia_sclerorhynchus';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.6 mm of Coryphaenoides rupestris: 4/3*pi*0.13^3';
data.Wwp = 35;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00245*Lp^3.19, see F1';
data.Wwi = 644;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00245*Li^3.19, see F1';

data.Ri  = 6.5e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(6.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on same weight-specific rate, compared to Coryphaenoides rupestris: (50/110)^3*68780 per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), pre-anal length (cm)
 1  2.4
 2  2.9
 3  4.1
 4  4.9
 5  5.9
 6  7.0
 7  7.9
 8  9.2
 9 10.3
10 11.4
11 11.6
13 13.0
14 13.0];
data.tL(:,1) = 365*data.tL(:,1); % convert yr to d
data.tL(:,2) = 3.15*data.tL(:,2); % convert pre-anal length to total length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LombMora1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Pre-anal length PL of tL-data has been converted to total length TL = 3.15 * PL based on picture';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00245*(TL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length: TL = 3.15 * PAL';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Southern Atlantic, Indian and Pacific: southern Africa, southern tip of South America, southern Australia, Tasmania, New Zealand';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'WSS7'; % Cat of Life
metaData.links.id_ITIS = '550605'; % ITIS
metaData.links.id_EoL = '46564798'; % Ency of Life
metaData.links.id_Wiki = 'Coelorinchus_fasciatus'; % Wikipedia
metaData.links.id_ADW = 'Coelorinchus_fasciatus'; % ADW
metaData.links.id_Taxo = '325217'; % Taxonomicon
metaData.links.id_WoRMS = '280277'; % WoRMS
metaData.links.id_fishbase = 'Coelorinchus_fasciatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coelorinchus_fasciatus}}';
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
bibkey = 'LombMora1989'; type = 'Article'; bib = [ ... 
'author = {Lombarte, Antoni and Morales-Nin, Beatriz}, ' ... 
'year = {1989}, ' ...
'title = {Crecimiento de \emph{Nezumia aequalis} y \emph{Coelorhynchus fasciatus} ({P}isces: {M}acruridae) en aguas de {N}amibia}, ' ...
'journal = {Collection of Scientific Papers of the International Commission for the Southeast Atlantic Fisheries}, ' ...
'volume = {16(1)}, ' ...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Coelorinchus_fasciatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

