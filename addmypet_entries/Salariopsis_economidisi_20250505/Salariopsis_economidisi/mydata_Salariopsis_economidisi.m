function [data, auxData, metaData, txtData, weights] = mydata_Salariopsis_economidisi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Blenniidae';
metaData.species    = 'Salariopsis_economidisi'; 
metaData.species_en = 'Trichonis blenny'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 05 05];

%% set data
% zero-variate data

data.ab = 15;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 7.3;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width 0.6 mm: 4/3*pi*0.03^2*0.055';
data.Wwi = 4.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.10, see F1; max. published weight: 4.80 g';

data.GSI  = 0.06; units.GSI  = 'g/g'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(18); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    1 3.7
    2 5.7
    3 6.8
    4 7.4
    5 7.8
    6 8.0
    7 8.1];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'PetrDoul2024'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_1994','tL_1993'}; subtitle1 = {'data for cohorts 1994, 1993'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.10';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Europe: endemic to Lake Trichonis in Greece';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '79BLB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Salariopsis_economidisi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '46463'; % Taxonomicon
metaData.links.id_WoRMS = '1800055'; % WoRMS
metaData.links.id_fishbase = 'Salariopsis_economidisi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salariopsis_economidisi}}';
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
bibkey = 'PetrDoul2024'; type = 'Article'; bib = [ ...
'doi = {10.71424/azb76.3.002733}, ' ...
'author = {Olga Petriki and Alexandra S. Douligeri and Ioanna Tsionki and Roberta Barbieri and Dimitrios K. Moutopoulos and Maria T. Stoumboudi}, ' ...
'year = {2024}, ' ...
'title = {Life-history Traits for Eight Fish Species of the Largest {G}reek Lake ({L}ake {T}richonis)}, ' ...
'journal = {Acta Zool. Bulg.}, ' ...
'volume = {76(3)}, '...
'pages = {375-382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Salariopsis_economidisi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

