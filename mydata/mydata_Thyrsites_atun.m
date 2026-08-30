function [data, auxData, metaData, txtData, weights] = mydata_Thyrsites_atun
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Gempylidae';
metaData.species    = 'Thyrsites_atun'; 
metaData.species_en = 'Snoek'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MASW','MAE','MIW','MIE','MPSW','MPSE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 06 28]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 06 28]; 

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Grif2002';   
  temp.ab = C2K(11.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(11.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 73;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'Grif2002'; 
  comment.Lp = 'Grif2002: FL = 73 cm';
data.Li  = 200;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Pomatomus saltatrix: pi/6*.1^3';
data.Wwp = 437;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Grif2002','fishbase'};
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Grif2002';
  comment.Wwi = 'fishbase based on 0.00437*Li^3.07 gives 50.6 kg, see F1; max. published weight: 9.0 kg';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'Grif2002';
  temp.GSI = C2K(11.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  0.35
    1 38
    3 73];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(11.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Grif2002';

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Southwest Atlantic: Uruguay, Argentina and Tierra del Fuego. Eastern Atlantic: Tristan da Cunha and South Africa. Western Indian Ocean: South Africa and the St. Paul and Amsterdam islands. Eastern Indian Ocean: Tasmania and southern coast of Australia. Southwest Pacific: New Zealand and southern coast of Australia. Southeast Pacific: southern Peru, Chile, and Tierra del Fuego';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7BZCX'; % Cat of Life
metaData.links.id_ITIS = '172372'; % ITIS
metaData.links.id_EoL = '46577270'; % Ency of Life
metaData.links.id_Wiki = 'Thyrsites_atun'; % Wikipedia
metaData.links.id_ADW = 'Thyrsites_atun'; % ADW
metaData.links.id_Taxo = '46663'; % Taxonomicon
metaData.links.id_WoRMS = '219697'; % WoRMS
metaData.links.id_fishbase = 'Thyrsites_atun'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thyrsites_atun}}';
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
bibkey = 'Grif2002'; type = 'Article'; bib = [ ... 
'author = {Marc H. Griffiths}, ' ... 
'year = {2002}, ' ...
'title = {Life history of {S}outh {A}frican snoek, \emph{Thyrsites atun} ({P}isces: {G}empylidae): a pelagic predator of the {B}enguela ecosystem}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {100}, ' ...
'pages = {690–710}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thyrsites_atun}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
