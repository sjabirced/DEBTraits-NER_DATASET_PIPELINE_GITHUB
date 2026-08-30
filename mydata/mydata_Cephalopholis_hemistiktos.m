function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_hemistiktos

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_hemistiktos'; 
metaData.species_en = 'Yellowfin hind'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 23];

%% set data
% zero-variate data

data.ab = 12; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 35;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 69;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.04, see F1';
data.Wwi = 622;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.04, see F1';

data.GSI = 0.03; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cephalopholis_cyanostigma';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 16.60
    2 22.84
    3 27.73
    4 31.73
    5 34.07
    6 36.14
    7 38.05];
data.tL(:,1) = (0.4+data.tL(:,1)) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'FarrAly2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Western Indian Ocean: only from the northern end of the Red Sea to the Persian Gulf and coast of Pakistan';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'SDN4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579779'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_hemistiktos'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_hemistiktos'; % ADW
metaData.links.id_Taxo = '105864'; % Taxonomicon
metaData.links.id_WoRMS = '218188'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis-hemistiktos'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalopholis_hemistiktos}}';
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
bibkey = 'FarrAly2021'; type = 'article'; bib = [ ... 
'doi = {10.22034/ijab.v9i2.1089}, ' ...
'author = {Elsayed Farrag and Walid Aly and Ahmed El-Zaabi}, ' ... 
'year = {2021}, ' ...
'title = {Life history parameters of Yellowfin hind, \emph{Cephalopholis hemistiktos} ({R}\"{u}ppell, 1830) in the coast of {U}nited {A}rab {E}mirates}, ' ...
'journal = {Int. J. Aquat. Biol.}, ' ...
'volume = {9(2)}, '...
'pages = {105-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cephalopholis-hemistiktos.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

