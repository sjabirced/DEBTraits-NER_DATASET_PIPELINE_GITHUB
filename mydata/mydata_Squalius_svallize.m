  function [data, auxData, metaData, txtData, weights] = mydata_Squalius_svallize
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Squalius_svallize'; 
metaData.species_en = 'Neretva chub'; 

metaData.ecoCode.climate = {'Cfb', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 09];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'IvanTree2010';   
  temp.am = C2K(14.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 27.7;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 5.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'EconDaou1991';
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwp = 0.56;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00724*Lp^3.14, see F1';
data.Wwi = 245;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.14, see F1; max. published weight: 620 g ';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  5.6
    2 10.2
    3 14.1
    4 16.1
    5 17.5
    6 18.4];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(14.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EconDaou1991'; 
%
data.tL1 = [ ... % time since birth (yr), fork length (cm)
    1 11.6
    2 14.6
    3 17.5
    4 20.4
    5 22.9
    6 25.1
    7 25.7];
data.tL1(:,1) = 365 * (0.3 + data.tL1(:,1)); % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'fork length'};  
temp.tL1 = C2K(14.7);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'IvanTree2010'; 

% length-fecundity
data.LN = [ ... std length (mm), \fecundity (#)
12.5  2663
13.5  3505
14.5  4406
15.5  8353
16.5 11670
17.5 13762
18.5 18165
19.5 20241];
units.LN = {'cm', '#'}; label.LN = {'std length','fecundity'};  
temp.LN = C2K(14.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'EconDaou1991'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL', 'tL1'}; subtitle1 = {'Data of EconDaou1991, IvanTree2010'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males and triploid females are assumed to differ from diploid females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00794*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Neretva, Trebisnjica and Ljuta drainages (Croatia and Bosnia Herzegovina)';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6ZDV5'; % Cat of Life
metaData.links.id_ITIS = '1200144'; % ITIS
metaData.links.id_EoL = '618060'; % Ency of Life
metaData.links.id_Wiki = 'Squalius_svallize'; % Wikipedia
metaData.links.id_ADW = 'Squalius_svallize'; % ADW
metaData.links.id_Taxo = '592201'; % Taxonomicon
metaData.links.id_WoRMS = '1383075'; % WoRMS
metaData.links.id_fishbase = 'Squalius-svallize'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Squalius_svallize}}';  
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
bibkey = 'IvanTree2010'; type = 'Article'; bib = [ ...
'doi = {10.25225/fozo.v59.i1.a8.2010}, ' ...
'author = {Ivankovic, P. and T. Treer and M. Piria and Z. Knezovic}, ' ...
'year = {2010}, ' ...
'title = {Diet and growth of the endemic {N}eretva chub, \emph{Squalius svallize} from the {N}eretva river area, {B}osnia and {H}erzegovina}, ' ... 
'journal = {Folia Zool.}, ' ...
'volume = {59(1)}, '...
'pages = {51-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EconDaou1991'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf00014996}, ' ...
'author = {Economou, A. N. and Daoulas, C. and Economidis, P.}, ' ...
'year = {1991}, ' ...
'title = {Observations on the biology of \emph{Leuciscus svallize} in the {K}remasta reservoir ({G}reece)}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {213(2)}, '...
'pages = {99–111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalius-svallize.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

