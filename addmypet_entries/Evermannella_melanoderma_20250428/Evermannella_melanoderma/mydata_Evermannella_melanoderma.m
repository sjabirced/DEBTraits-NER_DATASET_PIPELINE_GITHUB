function [data, auxData, metaData, txtData, weights] = mydata_Evermannella_melanoderma
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Evermannellidae';
metaData.species    = 'Evermannella_melanoderma'; 
metaData.species_en = 'Indian sabertooth'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 04 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 04 28];

%% set data
% zero-variate data
data.am = 3*365;   units.am = 'd';    label.am = 'life span';                             bibkey.am = 'guess';  
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;   units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'guess';
data.Li = 12.7;   units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: 4/3*pi*0.045^3';
data.Wwp = 1.1; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.12, see F1';
data.Wwi = 11.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.12, see F1';

data.Ri = 104/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1 3.497
    2 7.754];
data.tL(:,1) = 365*(0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Swin1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwp = 0 * weights.Wwp;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'temperatures are guessed; Wwp data is ignorned due to inconsistence';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Eastern Atlantic: widespread between 30N and 5S, excluding the Mediterranean';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'stomach is extendable, allowing to swallow larger prey than themselves';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6HLGL'; % Cat of Life
metaData.links.id_ITIS = '644780'; % ITIS
metaData.links.id_EoL = '46563751'; % Ency of Life
metaData.links.id_Wiki = 'Evermannella_melanoderma'; % Wikipedia
metaData.links.id_ADW = 'Evermannella_melanoderma'; % ADW
metaData.links.id_Taxo = '690905'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Evermannella_melanoderma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Evermannella_melanoderma}}';
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
bibkey = 'Swin1994'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1994.tb01257.x}, ' ...
'author = {Swinney, G. N.}, ' ... 
'year   = {1994}, ' ...
'title  = {Comments on the {A}tlantic species of the genus \emph{Evermannella} ({S}copelomorpha, {A}ulopiformes, {E}vermannellidae) with a re-evaluation of the status of \emph{Evermannella melanoderma}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {809–819}, ' ...
'volume = {44(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Evermannella_melanoderma}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

